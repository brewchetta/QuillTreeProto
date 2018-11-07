class StoriesController < ApplicationController
  before_action :find_story, only: [:show, :edit, :update, :destroy]


  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.create(story_params)
    if @story.valid?
      redirect_to @story
    else
      @errors = @story.errors.full_messages
      flash[:errors] = @errors
      redirect_to new_story_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @story.update(story_params)
    if @story.valid?
      redirect_to @story
    else
      @errors = @story.errors.full_messages
      flash[:errors] = @errors
      redirect_to edit_story_path
    end
  end

  def destroy
    # @story.pages.each do |p|
    #   p.destroy
    # end

    @story.destroy

    redirect_to stories_path
  end

  private

  def find_story
    @story = Story.find_by(id: params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :synopsis, :user_id)
  end

end
