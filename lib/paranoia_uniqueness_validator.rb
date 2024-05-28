require "paranoia_uniqueness_validator/validations/uniqueness_without_deleted"
require "paranoia_uniqueness_validator/version"

module ParanoiaUniquenessValidator

end

ActiveSupport.on_load(:active_record) do
  include ParanoiaUniquenessValidator::Validations
end
