class CreatePlainUsers < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
    CREATE TABLE plain_users (
      interests  text
    ) INHERITS (users);
    SQL
  end

  def down
    drop_table :plain_users
  end
end

# CREATE RULE redirect_insert_to_plain_users AS
# ON INSERT TO users WHERE
#   (type='plain_users')
# DO INSTEAD
#   INSERT INTO plain_users VALUES (NEW.*);
# LANGUAGE plpgsql;
