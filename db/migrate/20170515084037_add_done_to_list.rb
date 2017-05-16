class AddDoneToList < ActiveRecord::Migration
  def change
    add_column :lists, :done, :boolean, default: false
  end
end
