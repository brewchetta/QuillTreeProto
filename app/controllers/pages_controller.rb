class PagesController < ApplicationController
  before_action :find_page, only: [:show, :edit, :update, :destroy]
  before_action :find_user_story

  def index
    @pages = @story.pages
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.create(page_params)
    if @page.valid?
      @story.pages << @page
      set_page_num(@page)
      redirect_to user_story_page_path(@user, @story, @page)
    else
      @errors = @page.errors.full_messages
      flash[:errors] = @errors
      redirect_to new_user_story_page_path(@user, @story)
    end
  end

  def show
    @bg = @page.background
  end

  def edit
  end

  def update
    @page.update(page_params)
    if @page.valid?
      redirect_to user_story_page_path(@user,@story,@page)
    else
      @errors = @page.errors.full_messages
      flash[:errors] = @errors
      redirect_to edit_user_story_page_path(@user,@story,@page)
    end

  end

  def destroy
    @page.destroy
  end

  private

  def find_page
    @page = Page.find_by(id: params[:id])
  end

  def page_params
    params.require(:page).permit(:background, :content)
  end

  def set_page_num(pg)
    pg.page_number = pg.story.pages.count
    pg.save
  end

  def find_user_story
    @user = User.find_by(id: params[:user_id])
    @story = Story.find_by(id: params[:story_id])
  end

end
