class CreateExperienceTicketTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :experience_ticket_types, id: :uuid do |t|
      t.belongs_to :experience,
        type: :uuid,
        default: nil,
        null: false,
        foreign_key: { on_delete: :cascade }

      t.string :name, default: nil, null: false
      t.string :tagline
      t.integer :price_fractional
      t.boolean :sold_out, default: false

      t.timestamps
    end
  end
end
