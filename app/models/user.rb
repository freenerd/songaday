class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates :email, email_format: { message: "doesn't look like a valid email address" }
  validates :other_email, email_format: { message: "doesn't look like a valid email address" }
  validates :phone, :phony_plausible => true
  validates :other_phone, :phony_plausible => true
end
