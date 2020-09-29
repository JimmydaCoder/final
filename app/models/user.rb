class User < ApplicationRecord


has_many :posts, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :comments, dependent: :destroy


# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
:recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  def self.new_with_session(params, session)
super.tap do |user|
if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
user.email = data["email"] if user.email.blank?
end
end
end


  def self.from_omniauth(auth)
where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  user.email = auth.info.email
  user.password = Devise.friendly_token[0, 20]
  # If you are using confirmable and the provider(s) you use validate emails, 
  # uncomment the line below to skip the confirmation emails.
  # user.skip_confirmation!
end
end

#after_create :welcome_email
#def welcome_email
#UserMailer.welcome_email(self).deliver_now
#end



end
