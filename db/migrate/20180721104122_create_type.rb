class CreateType < ActiveRecord::Migration[5.1]
  def change
    create_table :types do |t|
      t.string :name
      t.timestamp
    end
  end
end
