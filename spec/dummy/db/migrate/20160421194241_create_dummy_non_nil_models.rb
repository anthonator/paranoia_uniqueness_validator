class CreateDummyNonNilModels < ActiveRecord::Migration[5.0]
  def change
    create_table :dummy_non_nil_models do |t|
      t.string   :unique_field
      t.datetime :deleted_at, null: false, default: DateTime.new(0)

      t.timestamps
    end
  end
end
