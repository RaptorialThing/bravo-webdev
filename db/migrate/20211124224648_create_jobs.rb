class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.integer :workers_count
      t.integer :status
      t.belongs_to :headhunter

      t.timestamps
    end
  end
end
