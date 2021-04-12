class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Full-width characters' }
    validates :name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'Full-width katakana characters' }
  end
end
