class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :data, array: true, default: []
      t.integer :question_type, default: 0
      t.references :form, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
