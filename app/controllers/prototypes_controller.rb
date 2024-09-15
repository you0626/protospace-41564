class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :update, :destroy, :show, :index]
  before_action :move_to_index, except: [:index, :show]
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
    redirect_to @prototype
    else
    @prototype.image.purge
    render :new
    end
  end

  def destroy
    @prototype.destroy
    redirect_to root_path
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
    redirect_to @prototype
    else
    @prototype.image.purge
      render :edit
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
