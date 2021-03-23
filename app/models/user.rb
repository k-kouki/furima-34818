class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, message: "Include both letters and numbers"}

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "Full-width characters"}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "Full-width characters"} 
    validates :first_name_reading, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "Full-width katakana characters"}
    validates :last_name_reading, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "Full-width katakana characters"}
    validates :birthday
  end

end
