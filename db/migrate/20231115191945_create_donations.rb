class CreateDonations < ActiveRecord::Migration[7.1]
  def change
    create_table :donations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :amount

      t.timestamps
    end
  end
end
