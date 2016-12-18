class MessagesController < ApplicationController
  def create
    message = current_user.messages.build(message_params)

    if message.save
      flash[:success] = 'Thanks! Message was posted to your feed!'
      redirect_to root_url
    else
      render :index, locals: {
        messages: web_ready_messages,
        new_message: message
      }
    end
  end

  def destroy
    current_user.messages.find(params[:id]).destroy

    flash[:success] = 'Message destroyed successfully!'

    redirect_to root_url
  end

  def index
    render :index, locals: {
      messages: web_ready_messages,
      new_message: current_user.messages.build
    }
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def web_ready_messages
    Message.stream_for(current_user).map do |msg|
      WebMessage.new(msg)
    end
  end
end
