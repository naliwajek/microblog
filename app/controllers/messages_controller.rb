class MessagesController < ApplicationController
  def create
    message = current_user.messages.build(message_params)

    if message.save
      flash[:success] = 'Thanks! Messages was posted to your feed!'
    end

    redirect_to root_url
  end

  def destroy
    current_user.messages.find(params[:id]).destroy

    flash[:success] = 'Message destroyed successfully!'

    redirect_to root_url
  end

  def index
    render :index, locals: {
      messages: Message.stream_for(current_user),
      new_message: current_user.messages.build
    }
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
