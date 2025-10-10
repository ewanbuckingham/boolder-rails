module ActiveRecord
  class Base
    def self.database_roles=(_val)
      # no-op for Rails 8 compatibility
    end
  end
end
