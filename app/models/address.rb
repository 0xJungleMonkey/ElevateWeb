class Address < ApplicationRecord

    has_one :building
    has_one :customer
def address
    [street, city, state, country].compact.join(', ')
  end
end
