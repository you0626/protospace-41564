class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show, :update]
  before_action :authenticate_user!, only: [:new,:edit,:destroy, :create, :destroy]
  before_action :move_to_root_if_not_owner, only: [:edit, :update, :destroy]
  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_root_if_not_owner
    @prototype = Prototype.find(params[:id])
    unless @prototype.user == current_user
      redirect_to root_path
    end
  end

end
