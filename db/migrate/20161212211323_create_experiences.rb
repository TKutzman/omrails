class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.references :user, foreign_key: true
      t.string :topic
      t.text :content

      t.timestamps
    end
  end
end
