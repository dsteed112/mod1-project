class Van < ActiveRecord::Base
    belongs_to :company
    has_many :van_services, dependent: :destroy
    has_many :services, through: :van_services
end