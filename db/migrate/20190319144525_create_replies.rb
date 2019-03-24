class CreateReplies < ActiveRecord::Migration[5.2]
  # def up
  #   execute("CREATE TABLE replies () INHERITS (posts);")
  #   add_reference :replies, :admin_user, foreign_key: true, index: true
  #   add_reference :replies, :plain_user, foreign_key: true, index: true
  #   add_reference :replies, :post, foreign_key: true, index: true
  # end

  # def down
  #   drop_table :replies
  # end

  def change
    create_table :replies do |t|
      t.text       :content
      t.belongs_to :question, foreign_key: true, index: true
      t.belongs_to :user, polymorphic: true
      t.string     :user_type
      t.timestamps null: false
    end
    add_index :replies, [:user_id, :user_type]

  end
end
