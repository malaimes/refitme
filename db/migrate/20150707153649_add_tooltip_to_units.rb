class AddTooltipToUnits < ActiveRecord::Migration
  def change
    add_column :units, :tooltip, :string
  end
end
