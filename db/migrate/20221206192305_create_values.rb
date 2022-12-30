class CreateValues < ActiveRecord::Migration[7.0]
  def change
    create_table :values do |t|
      t.text :input
      t.text :output
      t.timestamps
    end
  end
end
