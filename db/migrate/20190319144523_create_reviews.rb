class CreateReviews < ActiveRecord::Migration[5.2]
  # def up
  #   execute("CREATE TABLE reviews () INHERITS (posts);")
  # end

  # def down
  #   drop_table :reviews
  # end

  def change
    create_table :reviews do |t|
      t.string :title
      t.text   :content
      t.timestamps null: false
    end
  end

end
