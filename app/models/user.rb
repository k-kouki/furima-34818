class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, message: "Include both letters and numbers"}

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "Full-width characters"} do
      validates :first_name
      validates :last_name
    end
    with_options format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "Full-width katakana characters"} do
      validates :first_name_reading
      validates :last_name_reading
    end
    validates :birthday
  end

end
