require File.dirname(__FILE__) + '/spec_helper'
describe "skip_validations" do
  before(:each) do

    build_model :super_classes do
      string :name
      validates_presence_of :name
    end

    build_model :normal_sub_classes, :superclass => SuperClass

    build_model :skipping_sub_classes, :superclass => SuperClass do
      skip_validations :name
    end
  end

  describe "#skip_validtion" do
    it "should not validate inherited validations when specified" do
      SuperClass.new(:name => nil).should_not be_valid
      NormalSubClass.new(:name => nil).should_not be_valid
      SkippingSubClass.new(:name => nil).should be_valid
    end
  end
end