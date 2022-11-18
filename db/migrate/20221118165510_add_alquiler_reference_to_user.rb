class AddAlquilerReferenceToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :alquilers, :user
  end
end
