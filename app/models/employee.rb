class Employee < ApplicationRecord
    has_many :battery
    belongs_to :user
end
