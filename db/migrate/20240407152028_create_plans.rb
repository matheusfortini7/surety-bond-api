class CreatePlans < ActiveRecord::Migration[7.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.float :rate
      t.text :coverage

      t.timestamps
    end
  end
end
