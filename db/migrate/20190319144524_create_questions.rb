class CreateQuestions < ActiveRecord::Migration[5.2]
  # def up
  #   execute <<-SQL
  #   CREATE TABLE questions (
  #     require_help boolean default false
  #   ) INHERITS(posts);
  #   SQL
  #   add_reference :questions, :plain_user, foreign_key: true, index: true
  # end

  # def down
  #   drop_table :questions
  # end

  def change
    create_table :questions do |t|
      t.belongs_to :plain_user
      t.string     :title
      t.text       :content
      t.integer    :reply_amount, default: 0
      t.belongs_to :admin_user
      t.timestamps null: false
    end

  end
end
