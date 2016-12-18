# This module keeps logic required to present a demo
# of a timeline. It should be replaced later on with
# real methods.

module Demo
  class Seeds
    def self.run
      demo_current_user = User.create!(name: 'John Doe')
      followed_by_current_user = User.create!(name: 'Johny Ive')

      # John with follow Johny
      Relationship.create(
        follower: demo_current_user,
        followed: followed_by_current_user
      )

      Message.create!(
        content: 'Hello, this is my first message ever!',
        user: demo_current_user
      )

      Message.create!(
        content: 'I think all those dongles look wonderful!',
        user: followed_by_current_user
      )

      Message.create!(
        content: "I'm so excited to be here! Yay, bloggin' in style!",
        user: demo_current_user
      )
    end
  end
end
