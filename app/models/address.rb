class Address < ApplicationRecord
  # attr_accessor :number_and_street, :city, :postal_code, :country    s

  geocoded_by :kaddress
  def kaddress
    [number_and_street, city, postal_code, country].compact.join(', ')
  end
  def customerInfo
    [customer.CompanyName, customer.FullNameServiceTechAuth]
  end
  after_validation :geocode

    has_one :building
    has_one :customer
    
end
