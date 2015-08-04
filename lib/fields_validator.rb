module FieldsValidator 

  extend ActiveSupport::Concern

  included do
    validate :validate_column_names if respond_to?(:validate)
  end

  class_methods do 
    def validate_required_attributes
      if required_attributes and required_attributes.any?
        required_attributes.each do |a|
          validates a.to_sym, presence: true 
        end 
      end
    end

    def required_attributes
      (defined?(super) and super.is_a?(Array)) ? super : []
    end

    def required_database_fields
      (defined?(super) and super.is_a?(Array)) ? super : []
    end

  end

  private

  def validate_column_names
    if self.class.required_database_fields and self.class.required_database_fields.any?
      self.class.required_database_fields.each { |rdf| errors.add(rdf, "does not have a column in the database.")  unless self.class.column_names.include?(rdf.to_s)} if self.class.required_database_fields.any?
    end
  end
end
