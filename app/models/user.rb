class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :nick_name
    validates :birthday
    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Input full-width characters."} do
      validates :first_name
      validates :last_name
    end
    with_options format: {with: /\A[ァ-ヶー]+\z/, message: "Input full-width katakana characters."} do
      validates :first_name_rubi
      validates :last_name_rubi
    end
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
end
