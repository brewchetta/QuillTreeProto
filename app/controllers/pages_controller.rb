class PagesController < ApplicationController
  before_action :find_page, only: [:show, :edit, :update, :destroy]


  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.create(page_params)
    if @page.valid?
      set_page_num(@page)
      redirect_to @page
    else
      @errors = @page.errors.full_messages
      flash[:errors] = @errors
      redirect_to new_page_path
    end
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

  def set_page_num(pg)
    pg.page_number = pg.story.pages.count
    puts "Page num has been set!\n-----------\n"
    pg.save
  end

end
