class CreateInfosups < ActiveRecord::Migration
  def change
    create_table :infosups do |t|
      t.string :adresse
      t.text :note

      t.timestamps null: false
    end
  end
end
