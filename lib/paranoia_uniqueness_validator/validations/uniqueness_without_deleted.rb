module ParanoiaUniquenessValidator
  module Validations
    class UniquenessWithoutDeletedValidator < ActiveRecord::Validations::UniquenessValidator
      def validate_each(record, attribute, value)
        finder_class = find_finder_class_for(record)
        value = map_enum_attribute(finder_class, attribute, value)

        relation = build_relation(finder_class, attribute, value)
        if record.persisted?
          if finder_class.primary_key
            relation = relation.where.not(finder_class.primary_key => record.id_in_database || record.id)
          else
            raise UnknownPrimaryKey.new(finder_class, "Can not validate uniqueness for persisted record without primary key.")
          end
        end
        relation = scope_relation(record, relation)
        relation = relation.merge(options[:conditions]) if options[:conditions]

        if defined?('Paranoia') && Paranoia.respond_to?(:default_sentinel_value)
          sentinel_value = Paranoia.default_sentinel_value
        else
          sentinel_value = nil
        end

        relation = relation.where(deleted_at: sentinel_value)

        if relation.exists?
          error_options = options.except(:case_sensitive, :scope, :conditions)
          error_options[:value] = value

          record.errors.add(attribute, :taken, **error_options)
        end
      end
    end

    module ClassMethods
      def validates_uniqueness_without_deleted_of(*attr_name)
        validates_with UniquenessWithoutDeletedValidator, _merge_attributes(attr_names)
      end
    end
  end
end
