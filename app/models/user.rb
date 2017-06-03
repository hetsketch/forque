# frozen_string_literal: true

class User < ApplicationRecord
  has_one :company
  has_many :topics
  has_many :events, through: :participants

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable,
         omniauth_providers: %i[github google_oauth2 vkontakte]

  validates :email, presence: true, uniqueness: true, length: { in: 5..100 }
  validates :username, presence: true, length: { in: 2..30 }
  validates :first_name, :last_name, :position, :city,
            length: { in: 10..50 }, allow_nil: true, allow_blank: true
  validates :bio, length: { in: 10..300 }, allow_nil: true, allow_blank: true

  mount_uploader :avatar, AvatarUploader

  class << self
    def create_with_omniauth(auth)
      # first_or_create find first user in the table if it exists and return it
      # block will be executed only when create method is being invoked
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.provider = auth.provider
        case auth.provider
        when 'google_oauth2'
          with_google(user, auth)
        when 'vkontakte'
          with_vk(user, auth)
        when 'github'
          with_github(user, auth)
        end
      end
    end

    def with_google(user, auth)
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.username = user.first_name[0].upcase + user.last_name[0].upcase
    end

    def with_vk(user, auth)
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      if auth.extra.screen_name
        user.username = auth.extra.screen_name
      else
        user.username = user.first_name[0].upcase + user.last_name[0].upcase
      end
    end

    def with_github(user, auth)
      user.username = auth.info.nickname
      user.first_name = auth.info.name
    end
  end
end
