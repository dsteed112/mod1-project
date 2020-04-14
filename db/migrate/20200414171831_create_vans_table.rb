class CreateVansTable < ActiveRecord::Migration[6.0]
  def change
    create_table :vans do |t|
      t.string :nick_name
      t.integer :year
      t.string :make
      t.string :model
      t.integer :mileage
      t.references :company, foreign_key: true
    end
  end
end
