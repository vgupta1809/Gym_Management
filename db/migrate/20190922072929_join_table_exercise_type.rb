class JoinTableExerciseType < ActiveRecord::Migration[6.0]
  def change
    create_join_table :exercises, :types do |t|
    	t.index [:exercise_id, :type_id]
  		t.index [:type_id, :exercise_id]
    end
  end
end
