class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :list_id
      t.text :content

      t.timestamps null: false
    end
  end
end
