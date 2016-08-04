module ParanoiaUniquenessValidator
  module Validations
    class UniquenessWithoutDeletedValidator < ActiveRecord::Validations::UniquenessValidator
      def validate_each(record, attribute, value)
        finder_class = find_finder_class_for(record)
        table = finder_class.arel_table

        if ActiveRecord.version.to_s >= '4.2.0'
          value = map_enum_attribute(finder_class, attribute, value)
        else
          value = deserialize_attribute(record, attribute, value)
        end

        relation = build_relation(finder_class, table, attribute, value)
        if ActiveRecord.version.to_s >= '5.0.0'
          relation = relation.where(table[finder_class.primary_key.to_sym].not_eq(record.id)) if record.persisted?
        else
          relation = relation.and(table[finder_class.primary_key.to_sym].not_eq(record.id)) if record.persisted?
        end
        default_sentinel_value = Object.const_defined?('Paranoia') ? Paranoia.default_sentinel_value : nil

        if ActiveRecord.version.to_s >= '5.0.0'
          relation = relation.where(table[:deleted_at].eq(default_sentinel_value))
        else
          relation = relation.and(table[:deleted_at].eq(default_sentinel_value))
        end

        relation = scope_relation(record, table, relation)

        if ActiveRecord.version.to_s >= '5.0.0'
          relation = finder_class.unscoped.merge(relation)
        else
          relation = finder_class.unscoped.where(relation)
        end
        relation = relation.merge(options[:conditions]) if options[:conditions]

        if relation.exists?
          error_options = options.except(:case_sensitive, :scope, :conditions)
          error_options[:value] = value

          record.errors.add(attribute, :taken, error_options)
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
