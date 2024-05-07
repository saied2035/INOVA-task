class Story < ApplicationRecord
    belongs_to :user
    has_many :reviews

    validates :title, presence: true
    validates :body, presence: true
    def self.top_stories(page)
        puts page
        stories_per_page = 5 # this would be an envirment variable
        query = <<-SQL
        SELECT DISTINCT stories.* FROM reviews
        JOIN stories ON stories.id = reviews.story_id
        WHERE rate = ROUND((SELECT AVG(rate) FROM reviews)) OFFSET ($1 - 1)*$2 LIMIT $2;
      SQL
      result = ActiveRecord::Base.connection.exec_query(query,nil, [page, stories_per_page])
    end    
end
