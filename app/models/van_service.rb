class VanService < ActiveRecord::Base
    belongs_to :van
    belongs_to :service
    
end