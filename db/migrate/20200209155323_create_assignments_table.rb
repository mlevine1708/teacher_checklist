class CreateAssignmentsTable < ActiveRecord::Migration[5.2]
  def change
    create_table assignments do |t|
      t.string :title 
      t.string :subject 
      t.integer :user_id
    end
  end
end
