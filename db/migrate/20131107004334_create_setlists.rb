class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
      t.integer :user_id
      t.integer :show_id

      t.timestamps
    end
  end
end
