class Van < ActiveRecord::Base
    belongs_to :company
    belongs_to :service
end