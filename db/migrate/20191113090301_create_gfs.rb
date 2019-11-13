class CreateGfs < ActiveRecord::Migration[5.2]
  def change
    create_table :gfs do |t|
      t.string :url
      t.integer :state, default:0

      t.timestamps
    end
  end
end
