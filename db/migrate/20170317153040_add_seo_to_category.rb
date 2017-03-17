class AddSeoToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :seo_title, :string
    add_column :categories, :seo_keywords, :string
    add_column :categories, :seo_description, :text
  end
end
