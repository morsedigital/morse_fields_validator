require 'spec_helper'

RSpec.describe FieldsValidator, type: :module do

  class Thing 
    include ActiveModel::Validations
    def initialize
      @errors={}
    end
    def self.column_names
      [:name] 
    end
    def errors_add(k,v)
      @errors[k]=v
    end
    include FieldsValidator
  end

  class ThingWithCorrectFields < Thing
    def self.required_database_fields
      [:name]
    end
  end

  class ThingWithIncorrectFields < Thing
    def self.required_database_fields
      [:squirrels]
    end
  end

  describe "when included" do
    it "should not get in the way of creation" do
      expect(Thing.new).to be_a(Thing)
      expect(ThingWithIncorrectFields.new).to be_a(ThingWithIncorrectFields)
    end
  end

  describe "validations" do 
    describe "validate_column_names" do 
      context "where the correct fields are present" do
        it "should be valid" do
          t=ThingWithCorrectFields.new
          expect(t).to be_valid
        end
      end
      context "where the correct fields are not present" do
        it "should not be valid" do
          t=ThingWithIncorrectFields.new
          expect(t).to_not be_valid
          expect(t.errors).to have_key(:squirrels)
        end
      end
    end
  end
end
