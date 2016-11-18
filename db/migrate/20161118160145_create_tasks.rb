class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks, id: :uuid do |t|
      t.text :title, null: false
      t.belongs_to :user, foreign_key: true, null:false, type: :uuid
      t.datetime :completed_at, null: true

      t.timestamps null:false
    end
  end
end
