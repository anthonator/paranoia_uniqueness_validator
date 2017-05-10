require 'spec_helper'
require 'paranoia'


describe ParanoiaUniquenessValidator::Validations::UniquenessWithoutDeletedValidator do

  context 'with nil default_sentinel_value' do
    it "should validate uniqueness" do
      DummyModel.create(:unique_field => "unique")

      expect(DummyModel.new(:unique_field => "unique")).to_not be_valid
    end

    it "should should be valid if not unique with a deleted record" do
      dummy_model = DummyModel.create(:unique_field => "unique")
      dummy_model.destroy

      expect(DummyModel.new(:unique_field => "unique")).to be_valid
    end

  end

  context 'with datetime (non nil) default_sentinel_value' do

    before(:all) do
      if Paranoia.respond_to?(:default_sentinel_value)
        Paranoia.default_sentinel_value = DateTime.new(0)
      else
        skip('Version of paranoia does not support default_sentinel_value')
      end
    end

    it "should validate uniqueness" do
      DummyNonNilModel.create(:unique_field => "unique")

      expect(DummyNonNilModel.new(:unique_field => "unique")).to_not be_valid
    end

    it "should should be valid if not unique with a deleted record" do
      dummy_model = DummyNonNilModel.create(:unique_field => "unique")
      dummy_model.destroy
      dummy_model = DummyNonNilModel.new(:unique_field => "unique")
      expect(dummy_model).to be_valid
    end

  end

end
