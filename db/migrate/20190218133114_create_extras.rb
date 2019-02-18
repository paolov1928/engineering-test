class CreateExtras < ActiveRecord::Migration[5.2]
  def change
    create_table :extras, id: :uuid do |t|
      t.belongs_to :product,
        type: :uuid,
        default: nil,
        null: false,
        polymorphic: true,
        foreign_key: false

      t.string :name, default: nil, null: false
      t.string :tagline
      t.integer :price_fractional
      t.boolean :sold_out, default: false

      t.timestamps
    end
  end
end
