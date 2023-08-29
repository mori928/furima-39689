class User < ApplicationRecord
       # Include default devise modules. Others available are:
       # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

       validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'には英字と数字の両方を含めて設定してください' 
       validates_format_of :family_name, with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角文字（漢字・ひらがな・カタカナ）で入力してください'
       validates_format_of :family_name_kana, with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください'
       validates_format_of :first_name, with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角文字（漢字・ひらがな・カタカナ）で入力してください'
       validates_format_of :first_name_kana, with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください'  
      


       validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, presence: true
  
  
end