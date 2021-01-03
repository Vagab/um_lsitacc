class MessagesController < ApplicationController

  def create
    content = message_params[:content]
    session[:errors] = nil
    if content.include?('ADD') || content.include?('SUB')
      case send_request_to_central_organization(content)
      when 'no permission'
        session[:errors] = 'NO PERMISSION'
      when 'not enough balance'
        session[:errors] = 'NOT ENOUGH BALANCE'
      end
    end
    unless session[:errors]
      message = Message.new(message_params)
      message.user = current_user
      message.chat = Chat.find(params[:chat_id])
      message.save!
    end
    redirect_to chat_path(Chat.find(params[:chat_id]))
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def send_request_to_central_organization(content)
    CentralOrganization.first.process_request(content)
  end

end
