class MessagesController < ApplicationController
  def create
  end

  def destroy
  end

  def index
    render :index, locals: { messages: current_user.messages }
  end
end
