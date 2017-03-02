class AddTypeToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :type, index: true, foreign_key: true
  end
end
