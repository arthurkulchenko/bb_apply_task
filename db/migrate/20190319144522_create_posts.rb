class CreatePosts < ActiveRecord::Migration[5.2]
  def up
    create_table :posts do |t|
      t.text       :content
      t.string     :title
      t.timestamps
    end
  end
  def down
    execute <<-SQL
    DROP TABLE posts CASCADE;
    SQL
  end
end