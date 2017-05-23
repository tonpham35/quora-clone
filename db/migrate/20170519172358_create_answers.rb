class CreateAnswers < ActiveRecord::Migration[5.0]
	def change
		create_table :answers do |t|
			t.references :user, index: true, foreign_key: true
			t.references :question, index: true, foreign_key: true
			t.string :answer
			t.timestamps
		end
	end
end
