class CreateUser < ActiveRecord::Migration[5.2]

  # def change
  #   create_table :users do |t|
  #     t.string :name
  #     t.string :email
  #     t.timestamps
  #   end
  # end

  # def up
  #   execute <<-SQL
  #   CREATE TABLE users (

  #     email      varchar(255),
  #     name       varchar(255),
  #     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  #     updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL
  #   )
  #   SQL

  # end

  # def down
  #   execute <<-SQL
  #   DROP TABLE users CASCADE;
  #   SQL
  # end

end
