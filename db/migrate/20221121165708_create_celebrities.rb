class CreateCelebrities < ActiveRecord::Migration[7.0]
  def change
    create_table :celebrities do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.integer :age
      t.string :category
      t.text :bio

      t.timestamps
    end
  end
end
