class CreateCachedAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :cached_answers do |t|
      t.text :question
      t.text :answer

      t.timestamps
    end
  end
end
