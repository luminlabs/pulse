class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :twitter
    	t.string :linkedin
    	t.integer :currentstatus , :default => 0
    	t.boolean :instructor, :default => false
      t.timestamps
    end
  end
end
