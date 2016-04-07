class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer_body, null: false
      t.timestamps null: false
      t.belongs_to :question, null: false
    end
  end
end
