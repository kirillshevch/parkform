class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :form, index: true, foreign_key: true
      t.text :data
      t.string :email
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
