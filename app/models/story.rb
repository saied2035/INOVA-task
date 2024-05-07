class Story < ApplicationRecord
    belongs_to :user
    has_many :reviews

    validates :title, presence: true
    validates :body, presence: true
    def self.top_stories
        query = <<-SQL
        SELECT DISTINCT stories.* FROM reviews
        JOIN stories ON stories.id = reviews.story_id
        WHERE rate = ROUND((SELECT AVG(rate) FROM reviews));
      SQL
      result = ActiveRecord::Base.connection.execute(query)
    end    
end
