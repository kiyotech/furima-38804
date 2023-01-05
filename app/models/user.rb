class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
    validates :first_name, presence: true
    validates :last_name, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ヴー]+\z/u, message: 'is invalid. Input full-width katakana characters' } do
    validates :first_name_kana, presence: true
    validates :last_name_kana, presence: true
  end
  validates :birth_date, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' }
end
