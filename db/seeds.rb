demo_current_user = User.create!(name: "John Doe")

Message.create!(
  content: "Hello, this is my first message ever!",
  user: demo_current_user
)

Message.create!(
  content: "I'm so excited to be here! Yay, bloggin' in style!",
  user: demo_current_user
)
