class CreateQuestions < ActiveRecord::Migration[5.0]
	def change
		create_table :questions do |t|
			t.references :user, index: true, foreign_key: true
			t.string :question
			t.string :category
			t.timestamps 	
		end
	end
end
