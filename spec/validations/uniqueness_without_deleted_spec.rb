require 'spec_helper'

describe ParanoiaUniquenessValidator::Validations::UniquenessWithoutDeletedValidator do
  it "should validate uniqueness" do
    DummyModel.create(:unique_field => "unique")
    DummyModel.new(:unique_field => "unique").should_not be_valid
  end

  it "should should be valid if not unqiue with a deleted record" do
    dummy_model = DummyModel.create(:unique_field => "unique")
    dummy_model.destroy
    dummy_model = DummyModel.new(:unique_field => "unique")
    dummy_model.should be_valid
  end
end
