class Job < ApplicationRecord
    has_many :bookmarks
    has_many :users, through: :bookmarks
    
    def location
        [city, state].join(', ')
    end
    
    def location=(loc)
        split = loc.split(', ', 2)
        self.city = split.first
        self.state = split.last
    end      
end
