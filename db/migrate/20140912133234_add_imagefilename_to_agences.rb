class AddImagefilenameToAgences < ActiveRecord::Migration
  def change
    add_column :agences, :image_file_name, :string
  end
end
