class Service < ActiveRecord::Base
    has_many :vans
    has_many :companies, through: :vans
end