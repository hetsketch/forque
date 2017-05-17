class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github]
  
  validates :email, presence: true, length: {in: 5..100}
  validates :username, presence: true, uniqueness: true, length: {in: 3..20}
  validates :first_name, length: {in: 3..30, message: 'First name should be between 3 and 30 characters'}, allow_nil: true, allow_blank: true
  validates :last_name, length: {in: 3..30, message: 'First name should be between 3 and 30 characters'}, allow_nil: true, allow_blank: true
  validates :position, length: {in: 10..50, message: 'First name should be between 10 and 50 characters'}, allow_nil: true, allow_blank: true
  validates :city, length: {in: 10..50, message: 'First name should be between 10 and 50 characters'}, allow_nil: true, allow_blank: true
  validates :bio, length: {in: 10..300, message: 'First name should be between 10 and 300 characters'}, allow_nil: true, allow_blank: true
  
  mount_uploader :avatar, AvatarUploader

  def self.create_with_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.provider = auth.info
      user.username = auth.info.name
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  has_one :company
  has_many :topics
end
