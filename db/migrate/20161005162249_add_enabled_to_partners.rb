class AddEnabledToPartners < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :enabled, :boolean
  end
end
