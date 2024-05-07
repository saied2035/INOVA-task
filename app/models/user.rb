class User < ApplicationRecord
    has_many :stories

    validates :username, presence true 
end
