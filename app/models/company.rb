class Company < ActiveRecord::Base
    has_many :vans, dependent: :destroy
end