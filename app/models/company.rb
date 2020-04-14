class Company < ActiveRecord::Base
    has_many :vehicles
    has_many :services, through: :vehicles
end