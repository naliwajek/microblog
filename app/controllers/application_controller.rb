class ApplicationController < ActionController::Base
  include ::Demo::CurrentUser

  protect_from_forgery with: :exception
end
