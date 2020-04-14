class Service < ActiveRecord::Base
    has_many :van_services, dependent: :destroy
    has_many :vans, through: :van_services
end