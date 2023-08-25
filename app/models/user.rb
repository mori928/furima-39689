class User < ApplicationRecord
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: "must include both letters and numbers" }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday true
  has_many :items