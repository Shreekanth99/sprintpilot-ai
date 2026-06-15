class User < ApplicationRecord
  belongs_to :organization, optional: true

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  enum :role, {
    super_admin: 0,
    admin: 1,
    manager: 2,
    developer: 3
  }

  enum :theme, {
    light: 0,
    dark: 1
  }
end
