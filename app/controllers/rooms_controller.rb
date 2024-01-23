class RoomsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, :search]
    before_action :set_room, only: [:show, :edit, :update, :destroy]
  
    skip_before_action :authenticate_user!, only: [:search]
  
    def index
      @rooms = Room.all
    end
  
    def show
    end
  
    def new
      @room = Room.new
    end
  
    def create
      @room = Room.new(room_params)
      @room.user = current_user
  
      if @room.save
        redirect_to @room, notice: '施設を作成しました。'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @room.update(room_params)
        redirect_to @room, notice: '施設を更新しました。'
      else
        render :edit
      end
    end
  
    def destroy
      @room.destroy
      redirect_to rooms_path, notice: '施設を削除しました。'
    end
  
    # def search
    #   @areas = Area.all
    # end
  
    private
  
    def set_room
      @room = Room.find(params[:id])
    end
  
    def room_params
      params.require(:room).permit(:name, :description, :price, :address)
    end
  end