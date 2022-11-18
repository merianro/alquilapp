class AddSistemaReportesReferenceToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :sistema_reportes, :user

  end
end
