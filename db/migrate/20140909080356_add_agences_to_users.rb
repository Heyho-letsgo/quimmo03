class AddAgencesToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :agence, index: true
  end
end
