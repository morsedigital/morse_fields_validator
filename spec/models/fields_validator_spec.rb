require 'spec_helper'

RSpec.describe FieldsValidator, type: :module do

  class Thing 
    def self.column_names
      %w{name} 
    end
    include FieldsValidator
  end

  describe "when included" do
    it "should not get in the way of creation" do
      expect(Thing.new).to be_a(Thing)
    end
  end

  describe "validate_column_names" do 
    it "should squeak if column_names do not include input" do
      skip
      expect(Thing.validate_column_names("squirrels")).to raise_error("squirrels not included. please ensure necessary fields are in place")
    end
  end
end
