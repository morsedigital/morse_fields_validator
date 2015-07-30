module FieldsValidator 

  extend ActiveSupport::Concern

  included do
    validate :validate_column_names if respond_to?(:validate)
  end

  class_methods do 
    def validate_required_attributes
      required_attributes.each do |a|
        validates a.to_sym, presence: true 
      end
    end
    def load_required_attributes(*_attrs)
      @required_attributes=_attrs.any? ? _attrs : []
      @required_attributes.uniq!
    end

    def required_attributes
      @required_attributes
    end
  end

  private

  def required_database_fields
    defined?(super) ? super : []
  end

  def validate_column_names
    required_database_fields.each { |rdf| errors_add(rdf, "does not have a column in the database.")  unless self.class.column_names.include?(rdf)} if required_database_fields.any?
  end
end
