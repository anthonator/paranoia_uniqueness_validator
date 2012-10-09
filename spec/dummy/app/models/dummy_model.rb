class DummyModel < ActiveRecord::Base
  validates :unique_field, :uniqueness_without_deleted => true

  attr_accessible :unique_field
end
