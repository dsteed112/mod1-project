class CreateCompaniesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :user_name
      t.string :company_name
    end
  end
end
