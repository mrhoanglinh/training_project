class Admin::BlogsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_blog, only: [:edit, :update, :destroy, :search]
  layout 'admin'

  # GET /blogs
  # GET /json
  def index
    @search = Blog.search(params[:q])
    unless params[:sort_by].blank?
      @search.sorts = ['created_at DESC']
    end
    @blogs = @search.result.page(params[:page]).per(20)
    respond_to do |format|
      format.html
      format.json { render json: { lists: @blogs } }
    end
  end

  #def show
  #end

  # GET /blogs/new
  def new
  	@blog = Blog.new
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to admin_blogs_path, success: '新しいブログ記事を作成しました。'}
        format.json { render :index, status::created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update_attributes(blog_params)
        unless params[:redirect_check]
          format.html { redirect_to admin_blogs_path, success: 'ブログ記事を更新しました。' }
          format.json { render :show, status: :ok, location: @blog }
        end
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to admin_blogs_url, notice: 'ブログ記事を削除しました。' }
      format.json { head :no_content }
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
    if params[:id]
      render "edit" if @blog.invalid?
    else
      render "new" if @blog.invalid?
    end
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :category_id, :isSuggest, :image, :isPublic, :datePublic, :content, :author, :jobName, :age, :authorImage)
    end
end