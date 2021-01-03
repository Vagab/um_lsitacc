class ChatsController < ApplicationController
  before_action :find_chat, only: %i[show]
  before_action :authenticate_user!

  def show
    @users = @chat.users
    @messages = @chat.messages
    @errors = session[:errors]
  end

  def new
  end

  def retreive_keys
    @public_keys = Chat.find(params[:chat_id]).users.where.not(id: current_user.id).map(&:public_key)
  end

  def create
    chat = Chat.new().tap do |ch|
      ch.users << current_user << (User.where(id: chat_params[:user_ids]).first || User.where(chat_params[:user_idds]).first)
    end
    chat.save!
    redirect_to chat_path(chat)
  end

  private

  def find_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:user_ids)
  end
end
