class Admin::BlogsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :search]
  layout 'admin'
  DEFAULT_IMAGE_URL = "/assets/avatar_default.png"


  # GET /blogs
  # GET /json
  def index
    @search = Blog.search(params[:q])
    if params[:sort_by] == "ASC"
      @search.sorts = ['created_at ASC'] if @search.sorts.empty?
    elsif params[:sort_by] == "DESC"
      @search.sorts = ['created_at DESC'] if @search.sorts.empty?
    end

    @blogs = @search.result.page(params[:page]).per(20)
    respond_to do |format|
      format.html
      format.json { render json: { lists: @blogs } }
    end
  end

  def show
  end

  # GET /blogs/new
  def new
  	@blog = Blog.new
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    @blog.image = File.open(Rails.root.to_s + "/public/" + params[:blog][:image])
    if params[:blog][:authorImage] == DEFAULT_IMAGE_URL
      @blog.authorImage = File.open(Rails.root.to_s + "/app/assets/images/avatar_default.png")
    else
      @blog.authorImage = File.open(Rails.root.to_s + "/public/" + params[:blog][:authorImage])
    end

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
    @blog.update(image: File.open(Rails.root.to_s + "/public/" + params[:blog][:image]))
    if params[:blog][:authorImage] == DEFAULT_IMAGE_URL
      @blog.update(authorImage: File.open(Rails.root.to_s + "/app/assets/images/avatar_default.png"))
    else
      @blog.update(authorImage: File.open(Rails.root.to_s + "/public/" + params[:blog][:authorImage]))
    end

    respond_to do |format|
      if @blog.update(blog_params)
        unless params[:redirect_check]
          format.html { redirect_to admin_blogs_path, success: 'ブログ記事を更新しました。' }
          format.json { render :index, status: :ok, location: @blog }
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
    if params[:id]
      @blog = Blog.find(params[:id])
      @blog.assign_attributes blog_params
      render :edit if @blog.invalid?
    else
      @blog = Blog.new(blog_params)
      render :new if @blog.invalid?
    end
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :category_id, :isSuggest, :image, :image_cache, :isPublic, :datePublic,
                                   :content, :author, :jobName, :age, :authorImage, :authorImage_cache)
    end

    # def update?
    #   params[:action] == "update"
    # end
end