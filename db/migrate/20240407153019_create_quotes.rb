class CreateQuotes < ActiveRecord::Migration[7.1]
  def change
    create_table :quotes do |t|
      t.float :value_to_be_insured
      t.float :annual_premium
      t.float :monthly_premium

      t.timestamps
    end
  end
end
