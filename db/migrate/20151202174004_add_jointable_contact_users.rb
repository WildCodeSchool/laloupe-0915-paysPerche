class AddJointableContactUsers < ActiveRecord::Migration
  def change
  	create_join_table :contacts, :users do |t|
      t.index :user_id
      t.index :contact_id
    end
  end
end
