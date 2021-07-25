class CreateWorkLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :work_logs do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamp :clock_in, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamp :clock_out
      t.string :description, limit: 100
      t.timestamps
    end
  end
end
