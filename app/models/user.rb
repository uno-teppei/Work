class User < ApplicationRecord
  has_many :posts
  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  validates :full_name, presence: true, length: { maximum: 15 }

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.full_name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
    end
  end

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    return user if user

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name # ユーザーモデルに名前があると仮定
      user.image = auth.info.image # ユーザーモデルに画像があると仮定
      user.uid = auth.uid
      user.provider = auth.provider
    end
  end
end
