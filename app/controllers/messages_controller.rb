class MessagesController < ApplicationController
  def create
    message = current_user.messages.build(message_params)

    if message.save
      flash[:success] = 'Thanks! Messages was posted to your feed!'
    end

    redirect_to root_url
  end

  def destroy
  end

  def index
    render :index, locals: {
      messages: current_user.messages.desc,
      new_message: current_user.messages.build
    }
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
