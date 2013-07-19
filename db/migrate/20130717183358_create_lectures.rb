class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
    	t.string :title
      t.string :topics
  
      t.datetime :starttime
      t.datetime :endtime
      t.integer :num_students, :default => 0
      t.integer :num_active, :default => 0
      t.boolean :active, :default => true
  
      t.timestamps
    end
  end
end
