require 'spec_helper'
require 'paranoia'


describe ParanoiaUniquenessValidator::Validations::UniquenessWithoutDeletedValidator do

  context 'with nil default_sentinel_value' do

    before(:all) do
      Paranoia.default_sentinel_value = nil
    end

    it "should validate uniqueness" do
      DummyModel.create(:unique_field => "unique")
      DummyModel.new(:unique_field => "unique").should_not be_valid
    end

    it "should should be valid if not unique with a deleted record" do
      dummy_model = DummyModel.create(:unique_field => "unique")
      dummy_model.destroy
      dummy_model = DummyModel.new(:unique_field => "unique")
      dummy_model.should be_valid
    end

  end

  context 'with datetime (non nil) default_sentinel_value' do

    before(:all) do
      Paranoia.default_sentinel_value = DateTime.new(0)
    end

    it "should validate uniqueness" do
      DummyNonNilModel.create(:unique_field => "unique")
      DummyNonNilModel.new(:unique_field => "unique").should_not be_valid
    end

    it "should should be valid if not unique with a deleted record" do
      dummy_model = DummyNonNilModel.create(:unique_field => "unique")
      dummy_model.destroy
      dummy_model = DummyNonNilModel.new(:unique_field => "unique")
      dummy_model.should be_valid
    end

  end

end
