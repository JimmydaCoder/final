class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         after_create :send_admin_mail
         def send_admin_mail
          byebug
         # UserMailer.send_new_user_message(self).deliver
         end
end
