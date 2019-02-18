class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    enable_extension "plpgsql"
    enable_extension "pgcrypto"

    create_table :experiences, id: :uuid do |t|
      t.string :name, default: nil, null: false
      t.string :tagline, default: nil, null: false
      t.string :overview, default: nil, null: false
      t.timestamps
    end
  end
end
