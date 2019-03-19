class CreateReplies < ActiveRecord::Migration[5.2]
  def up
    execute("CREATE TABLE replies () INHERITS (posts);")
    add_reference :replies, :user, foreign_key: true, index: true
    add_reference :replies, :post, foreign_key: true, index: true
  end

  def down
    drop_table :replies
  end
end
