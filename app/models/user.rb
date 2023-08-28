class User < ApplicationRecord
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: "must include both letters and numbers" }
  # has_secure_password
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, presence: true
  has_many :items
end