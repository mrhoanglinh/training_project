class Admin::BlogsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :search]
  layout 'admin'

  DEFAULT_IMAGE_URL = "/assets/avatar_default.png"

  # GET /blogs
  # GET /json
  def index
    @search = Blog.includes(:category).search(params[:q])
    if params[:sort_by] == "ASC"
      @search.sorts = ['created_at ASC'] if @search.sorts.empty?
    elsif params[:sort_by] == "DESC"
      @search.sorts = ['created_at DESC'] if @search.sorts.empty?
    end

    @blogs = @search.result.paginate(page: params[:page],
                                     per_page: 20)
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

    if params[:blog][:image].present?
      @blog.image = File.open(Rails.root.to_s + "/public/" + params[:blog][:image])
    end
    
    if params[:blog][:authorImage] == DEFAULT_IMAGE_URL
      @blog.authorImage = File.open(Rails.root.to_s + "/app/assets/images/avatar_default.png")
    else
      @blog.authorImage = File.open(Rails.root.to_s + "/public/" + params[:blog][:authorImage])
    end

    render :new and return if params[:re_new].present?

    respond_to do |format|
      if @blog.save
        format.html { redirect_to admin_blogs_path }
        flash[:success] =  t "alert.blog.create"
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
    @blog.assign_attributes blog_params

    if params[:blog][:image].present?
      @blog.image = File.open(Rails.root.to_s + "/public/" + params[:blog][:image])   

      if params[:blog][:authorImage] == DEFAULT_IMAGE_URL
        @blog.authorImage = File.open(Rails.root.to_s + "/app/assets/images/avatar_default.png")
      else
        @blog.authorImage = File.open(Rails.root.to_s + "/public/" + params[:blog][:authorImage])
      end    
    end        

    render :edit and return if params[:re_edit].present?

    respond_to do |format|
      if @blog.save
        unless params[:redirect_check]
          format.html { redirect_to admin_blogs_path }
          flash[:success] = t "alert.blog.update"
          format.json { render :index, status: :ok, location: @blog }
        else
          format.json
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
      format.html { redirect_to admin_blogs_url }
      flash[:success] = t "alert.blog.delete"
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