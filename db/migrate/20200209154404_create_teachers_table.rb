class CreateTeachersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name 
      t.integer :grade_level
      t.string :username
      t.string :password_digest
    end
  end
end
