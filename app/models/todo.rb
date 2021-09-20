class Todo < ApplicationRecord
    has_many :plants
    belongs_to :user
    
end