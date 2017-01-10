class BaiPostsController < ApplicationController
  before_action :set_bai_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @bai_posts = BaiPost.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @bai_post = BaiPost.new
    #@post.foodimage = params[:file]
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @bai_post = BaiPost.new(bai_post_params)
    @bai_post.TrangThai = "Active"
   # @post.foodimage = params[:file]
    respond_to do |format|
      if @bai_post.save
        format.html { redirect_to @bai_post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @bai_post }
      else
        format.html { render :new }
        format.json { render json: @bai_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @bai_post.update(bai_post_params)
        format.html { redirect_to @bai_post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @bai_post }
      else
        format.html { render :edit }
        format.json { render json: @bai_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @bai_post.TrangThai = "Deleted"
    @bai_post.save
    respond_to do |format|
      format.html { redirect_to bai_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bai_post
      @bai_post = BaiPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bai_post_params
       params.require(:bai_post).permit(:TenMonAn,:CongThucCheBien,:ThanhPhan,:Gia,:ThoiGianPhucVu,:ThoiGianNau,:HanSuDung,:ThoiGianDungMon,:TheLoai1,:TheLoai2,:TheLoai3,:ThongTinPhu,:DiaChiNguoiBan,:Hinh1,:Hinh2,:Hinh3,:foodimage)
     end
end
