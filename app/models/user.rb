class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\Z/ }
  VALID_NAME = /\A[ぁ-んァ-ヶ一-龥々ー]+\Z/
  validates :last_name, presence: true, format: { with: VALID_NAME }
  validates :first_name, presence: true, format: { with: VALID_NAME }
  VALID_NAME_FURIGANA = /\A[ァ-ヶー]+\Z/
  validates :last_name_furigana, presence: true, format:{with: VALID_NAME_FURIGANA }
  validates :first_name_furigana, presence: true, format:{with: VALID_NAME_FURIGANA }
  validates :birthday, presence: true

end
