class User < ActiveRecord::Base
  has_and_belongs_to_many :contacts, -> { uniq }

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
   end

   show do
       field :first_name
       field :last_name
       field :email
       field :function
       field :contacts

   end
  end

  private
    def notify_by_email
      ContactMailer.new_register(self).deliver_now
    end
end