class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end

    add_index :microposts, [:user_id, :created_at]
  end
end
