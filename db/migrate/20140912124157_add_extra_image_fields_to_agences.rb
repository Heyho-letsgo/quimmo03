class AddExtraImageFieldsToAgences < ActiveRecord::Migration
  def change
    add_column :agences, :image_content_type, :string
    add_column :agences, :image_file_size, :integer
    add_column :agences, :image_updated_at, :datetime
  end
end