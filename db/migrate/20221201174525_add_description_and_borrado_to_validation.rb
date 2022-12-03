class AddDescriptionAndBorradoToValidation < ActiveRecord::Migration[7.0]
  def change
    add_column :validations, :description, :string
    add_column :validations, :borrado, :boolean, default: false
  end
end
