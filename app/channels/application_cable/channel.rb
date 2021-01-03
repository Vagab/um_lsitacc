module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def subscribed
      stream_from "current_user_#{current_user.id}"
    end

    def unsubscribed
      
    end
  end
end
