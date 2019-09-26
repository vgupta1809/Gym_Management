class AddDescriptionToTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :types, :description, :string
  end
end
