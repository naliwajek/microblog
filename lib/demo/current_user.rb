# This module keeps logic required to present a demo
# of a timeline. It should be replaced later on with
# real methods.

module Demo
  module CurrentUser
    # Because demo does not require aunthentication,
    # the first user is used everywhere as a currently
    # logged in user - to be replacted by Devise#current_user
    def current_user
      User.first
    end
  end
end
