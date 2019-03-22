class CreatePlainUsers < ActiveRecord::Migration[5.2]
  # def up
  #   execute <<-SQL
  #   CREATE TABLE plain_users (
  #     id         serial PRIMARY KEY,
  #     interests  text
  #   ) INHERITS (users);
  #   SQL
  # end

  # def down
  #   drop_table :plain_users
  # end

  def change
    create_table :plain_users do |t|
      t.string :email
      t.string :title
      t.timestamps null: false
    end
  end

end

# CREATE RULE redirect_insert_to_plain_users AS
# ON INSERT TO users WHERE
#   (type='plain_users')
# DO INSTEAD
#   INSERT INTO plain_users VALUES (NEW.*);
# LANGUAGE plpgsql;
