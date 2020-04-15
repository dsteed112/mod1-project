class CreateVanServicesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :van_services do |t|
      t.references :van, foreign_key: true
      t.references :service, foreign_key: true
    end
  end
end
