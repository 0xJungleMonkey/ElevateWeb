class Customer < ApplicationRecord
    include ActiveModel::Dirty

    belongs_to :user
    has_many :buildings
    belongs_to :address

end
