class PagesController < ApplicationController
  before_action :find_page, only: [:show, :edit, :update, :destroy]


  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update

  end

  def destroy
    @page.destroy
  end

  private

  def find_page
    @page = Page.find_by(id: params[:id])
  end

  def page_params
    params.require(:page).permit(:background, :content, :story_id)
  end

end
