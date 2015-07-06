class AlterColumnUnitsPrice < ActiveRecord::Migration
  def self.up
    change_table :units do |t|
      t.change :price, :string
    end
  end
  def self.down
    change_table :units do |t|
      t.change :price, :integer
    end
  end
end
