

class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.belongs_to :user
      t.belongs_to :lecture
      t.timestamps
    end
  end
end
