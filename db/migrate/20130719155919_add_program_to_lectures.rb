class AddProgramToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :program, :string
  end
end
