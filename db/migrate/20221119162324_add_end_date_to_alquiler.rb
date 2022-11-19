class AddEndDateToAlquiler < ActiveRecord::Migration[7.0]
  def change
    add_column :alquilers, :end_date, :datetime
  end
end
