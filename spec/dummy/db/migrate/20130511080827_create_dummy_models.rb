class CreateDummyModels < ActiveRecord::Migration[5.0]
  def change
    create_table :dummy_models do |t|
      t.string   :unique_field
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
