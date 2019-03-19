class CreateUser < ActiveRecord::Migration[5.2]

  def up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
  end

  def down
    execute <<-SQL
    DROP TABLE users CASCADE;
    SQL
  end

end
