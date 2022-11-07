class Building < ApplicationRecord

    belongs_to :address
    belongs_to :customer
    has_many :batteries
    has_one :building_detail

end
