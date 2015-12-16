class VlogsController < ApplicationController
  before_action(:find_vlog, {only: [:show, :edit, :update, :destroy]})

  def new
    @vlog = Vlog.new
  end

  def create
    @vlog = Vlog.new vlog_params
    if @vlog.save
      redirect_to(vlog_path(@vlog), notice: "Vlog Created!")
    else
      render :new, alert: "An Error occured while creating the vlog"
    end
  end

  def index
    @vlogs = Vlog.all.page(params[:page]).per(9)
  end

  def show
    @vlog = Vlog.find params[:id]
    @comment = Comment.new
  end


  def edit
  end

  def update
    if @vlog.update(vlog_params)
      redirect_to vlog_path(@vlog), notice: "Vlog Updated!"
    else
      render :edit, alert: "An Error occured editing the Vlog"
    end
  end

  def destroy
    @vlog.destroy
    flash[:notice] = "Vlogs Deleted Successfully"
    redirect_to vlogs_path
  end

  private

  def vlog_params
    vlog_params = params.require(:vlog).permit([:title, :body, :vlog_date, :user_id])
  end

  def find_vlog
    @vlog = Vlog.find params[:id]
  end
end
