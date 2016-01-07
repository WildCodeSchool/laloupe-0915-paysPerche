class User < ActiveRecord::Base
	has_and_belongs_to_many :contacts

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
  def self.group_to_send(params)
    tab = []
    params[:person].each do |k, v|
      if !!k.match(/^.+@.+$/) && v.include?("1")  
        tab << k
      end  
    end
    tab
  end

  def self.message_to_send(params)
    message = ""
    params[:person].each do |k, v|
      if k == "body"
        message = v
      end
    end
    message
  end
  private
    def notify_by_email
      ContactMailer.new_register(self).deliver_now
    end
end
