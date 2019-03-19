class AdminUser < User
  self.table_name = "admin_users"
  devise :database_authenticatable,
    :recoverable, :rememberable, :validatable
end
