class Contact < ActiveRecord::Base
	belongs_to :users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :notify_by_email

  private
  def notify_by_email
    ContactMailer.new_register(self).deliver_now
  end
end
