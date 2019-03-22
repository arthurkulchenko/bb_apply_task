class DeviseCreateAdminUsers < ActiveRecord::Migration[5.2]

  # def up
  #   execute <<-SQL
  #   CREATE TABLE admin_users (
  #     id                     serial PRIMARY KEY,
  #     encrypted_password     varchar(255),
  #     reset_password_token   varchar(255),
  #     reset_password_sent_at timestamp with time zone,
  #     remember_created_at    timestamp with time zone
  #   ) INHERITS (users);


  #   SQL

  #   add_index :admin_users, :email,                unique: true
  #   add_index :admin_users, :reset_password_token, unique: true
  # end

  # def down
  #   drop_table :admin_users
  # end

  # CREATE TRIGGER check_uniquiness_admin_users
  #   BEFORE INSERT ON admin_users
  #   FOR EACH ROW EXECUTE PROCEDURE check_for_user_dups();

  def change
    create_table :admin_users do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      #     ## Rememberable
      #     t.datetime :remember_created_at

      #     ## Trackable
      #     # t.integer  :sign_in_count, default: 0, null: false
      #     # t.datetime :current_sign_in_at
      #     # t.datetime :last_sign_in_at
      #     # t.inet     :current_sign_in_ip
      #     # t.inet     :last_sign_in_ip

      #     ## Confirmable
      #     # t.string   :confirmation_token
      #     # t.datetime :confirmed_at
      #     # t.datetime :confirmation_sent_at
      #     # t.string   :unconfirmed_email # Only if using reconfirmable

      #     ## Lockable
      #     # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      #     # t.string   :unlock_token # Only if unlock strategy is :email or :both
      #     # t.datetime :locked_at


      t.timestamps null: false
    end

    # add_index :admin_users, :confirmation_token,   unique: true
    # add_index :admin_users, :unlock_token,         unique: true

  end
end
