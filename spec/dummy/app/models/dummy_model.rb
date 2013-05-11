class DummyModel < ActiveRecord::Base
  validates :unique_field, :uniqueness_without_deleted => true
end
