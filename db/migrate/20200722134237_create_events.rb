class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title, :limit => 100, index:true, null: false, comment:'タイトル'
      t.string :body, :limit => 100, comment:'本文'
      t.timestamps
    end
  end
end
