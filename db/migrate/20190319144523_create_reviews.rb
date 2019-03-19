class CreateReviews < ActiveRecord::Migration[5.2]
  def up
    execute("CREATE TABLE reviews () INHERITS (posts);")
  end

  def down
    drop_table :reviews
  end
end
