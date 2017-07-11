class BlogsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :search]
  
  def index
	  @blogs = Blog.all.page(params[:page]).per(20)
    @kq = Blog.search

    respond_to do |format|
      format.html
      format.json { render json: { lists: @blogs } }
    end
  end

  def show
  end

  def new
  	@blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to blogs_path, success: '新しいブログ記事を作成しました。'}
        format.json { render :index, status::created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
  end

  def update
    respond_to do |format|
      if @blog.update_attributes(blog_params)
        format.html { redirect_to blogs_path, success: 'ブログ記事を更新しました。' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'ブログ記事を削除しました。' }
      format.json { head :no_content }
    end
  end

  def unPublic
    @blog = Blog.find(params[:id])
    if @blog.isPublic = true
      @blog.update(isPublic: 'false')
      redirect_to blogs_path
    end
  end

  def changeDate
    @blog = Blog.find(params[:id])
    #@blog.update(datePublic: '2017-01-01 01:01')

  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :category, :isSuggest, :image, :isPublic, :datePublic, :body, :author, :jobName, :age, :authorImage)

    end
end