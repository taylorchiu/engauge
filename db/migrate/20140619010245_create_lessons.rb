class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :url
      t.string :access_code
      t.timestamp :expiration
      t.integer :limit
      t.float :current_avg
      t.references :user_id, index: true
      t.timestamps
    end
  end
end
