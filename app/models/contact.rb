class Contact < ActiveRecord::Base
	has_and_belongs_to_many :users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :notify_by_email

  def generate_password
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    self.password = (0...8).map { o[rand(o.length)] }.join
  end

  private

  def notify_by_email
    ContactMailer.new_register(self).deliver_now
  end
end
