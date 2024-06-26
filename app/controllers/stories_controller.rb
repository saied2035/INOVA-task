class StoriesController < ApplicationController
    def index
        page = params[:page]
        if page.nil? || page == 0
            render json: {error: "Please provide page number as query paramter"} 
            return
        end 
        stories_per_page = 5 # this would be an envirment variable
        user = User.find(params[:user_id])
        user_stories = user.stories.offset((page - 1)*stories_per_page).limit(stories_per_page)
        render json: user_stories, status: :ok
    end

    def create
        user =  User.find(params[:user_id])
        story = user.stories.new(story_params)
      if story.save
        render json: story, status: :ok
      else
        render json: story.errors, status: 400  
      end  
    end
    

    def top_stories
      page = params[:page]
      if page.nil? || page == 0
        render json: {error: "Please provide page number as query paramter"} 
        return
      end  
      render json: Story.top_stories(page), status: :ok
    end    

    private
    def story_params
      params.require(:story).permit(:title, :body)  
    end    
end
