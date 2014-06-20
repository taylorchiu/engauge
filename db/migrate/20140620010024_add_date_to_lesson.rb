class AddDateToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :date, :date
  end
end
