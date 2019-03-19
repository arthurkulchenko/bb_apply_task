class CreateQuestions < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
    CREATE TABLE questions (
      require_help boolean default false
    ) INHERITS(posts);
    SQL
    add_reference :questions, :user, foreign_key: true, index: true
  end

  def down
    drop_table :questions
  end
end
