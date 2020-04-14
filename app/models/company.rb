class Company < ActiveRecord::Base
    has_many :vans
    has_many :services, through: :vans
end