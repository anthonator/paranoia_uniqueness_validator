class DummyModel < ApplicationRecord
  validates :unique_field, :uniqueness_without_deleted => true
end
