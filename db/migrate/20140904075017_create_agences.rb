class CreateAgences < ActiveRecord::Migration
  def change
    create_table :agences do |t|
      t.string :raison_sociale
      t.string :siret
      t.string :num_rue
      t.string :adresse01l01
      t.string :adresse01l02
      t.string :adresse01l03
      t.string :code_postal
      t.string :ville
      t.string :region
      t.string :pays
      t.string :telephone
      t.string :fax
      t.string :email

      t.timestamps
    end
  end
end
