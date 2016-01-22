class AddColumnToInfosups < ActiveRecord::Migration
  def change
  	t.integer :user_id, index: true
  	t.integer :contact_id, index: true
  end
end
