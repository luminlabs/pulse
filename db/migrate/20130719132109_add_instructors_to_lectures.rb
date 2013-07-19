class AddInstructorsToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :instructor, :string
  end
end
