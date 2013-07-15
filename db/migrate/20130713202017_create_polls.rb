class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :topictag
      t.string :prompt

      t.timestamps 

    end
  end
end
