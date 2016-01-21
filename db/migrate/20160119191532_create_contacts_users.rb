class CreateContactsUsers < ActiveRecord::Migration
  def change
    create_table :contacts_users do |t|
      t.belongs_to :contact
      t.belongs_to :user
    end
  end
end