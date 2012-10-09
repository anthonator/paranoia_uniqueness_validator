require "paranoia_uniqueness_validator/validations/uniqueness_without_deleted"
require "paranoia_uniqueness_validator/version"

module ParanoiaUniquenessValidator

end

class ActiveRecord::Base
  include ParanoiaUniquenessValidator::Validations
end
