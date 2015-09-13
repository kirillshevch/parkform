class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.datetime :start_at
      t.datetime :finish_at
      t.string :title
      t.text :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
