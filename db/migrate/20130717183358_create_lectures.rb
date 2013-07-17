class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
    	t.string :title
      t.string :topics
      t.datetime :starttime
      t.datetime :endtime
      t.integer :num_students
      t.boolean :active 
      
      t.timestamps
    end
  end
end
