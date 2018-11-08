class StoriesController < ApplicationController
  before_action :find_story, only: [:show, :edit, :update, :destroy]
  before_action :find_user

  def new
    # @user = User.find_by(id: params[:user_id])
    @story = Story.new
    @story.user_id = @user.id
  end

  def create
    @story = Story.create(story_params)
    if @story.valid?
      @user.stories << @story
      redirect_to user_story_path(@user, @story)
    else
      @errors = @story.errors.full_messages
      flash[:errors] = @errors
      redirect_to new_user_story_path(@user)
    end
  end

  def show
  end

  def edit
  end

  def update
    @story.update(story_params)
    if @story.valid?
      redirect_to user_story_path(@user, @story)
    else
      @errors = @story.errors.full_messages
      flash[:errors] = @errors
      redirect_to edit_user_story_path(@user, @story)
    end
  end

  def destroy
    if @story.pages
      @story.pages.each do |p|
        p.destroy
      end
    end

    @story.destroy

    redirect_to user_path(@user)
  end

  private

  def find_story
    @story = Story.find_by(id: params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :synopsis, :user_id)
  end

  def find_user
    @user = User.find_by(id: params[:user_id])
  end

end
