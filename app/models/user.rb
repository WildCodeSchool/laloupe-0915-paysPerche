class User < ActiveRecord::Base
  has_and_belongs_to_many :contacts, -> { uniq }
  has_many :infosup

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  after_create :notify_by_email

  rails_admin do
   list do
       field :first_name
       field :last_name
       field :email
       field :function
   end
   edit do
       field :email
       field :password
       field :password_confirmation
       field :first_name
       field :last_name
       field :phone
       field :function
   end

   show do
       field :first_name
       field :last_name
       field :email
       field :function
       field :contacts

   end
  end

  def generate_password
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    self.password = (0...8).map { o[rand(o.length)] }.join
    self.notify_by_email(self.password)
  end

  private

    def notify_by_email
      Confirmation.new_confirm(self, password).deliver_now
    end
end
