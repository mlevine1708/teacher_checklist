class CreateStudentsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name 
      t.integer :grade_level
      t,integer :user_id 
    end
  end
end
