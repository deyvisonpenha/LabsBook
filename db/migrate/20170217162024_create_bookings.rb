class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :disciplina
      t.date :inicio
      t.date :fim
      t.integer :lab
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
