class AddOrganisationToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :organisation, :string
  end
end
