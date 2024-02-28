class RoomsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, :search]
    before_action :set_room, only: [:show, :edit, :update, :destroy]
  
    skip_before_action :authenticate_user!, only: [:search]
  
    def index
      @rooms = Room.all
    end
  
    def show
      @room = Room.find(params[:id]) 
    end
  
    def new
      @room = Room.new
    #   @room.build_photo
    end
  
    def create
      @room = Room.new(room_params)
      @room.user_id = current_user.id
  
  
      if @room.save
        redirect_to @room
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @room.update(room_params)
        redirect_to @room
      else
        render :edit
      end
    end
  
    def destroy
      @room.destroy
      redirect_to rooms_path
    end
  
    def search
      # @rooms = Room.search(params[:keyword])
      
      @rooms = Room.all

      if params[:address].present?
        # @rooms = Room.where("address LIKE ?", "%params[:address]%")
        @rooms = Room.where("address LIKE ?", "%#{params[:address]}%")
      end
    
      if params[:keywords].present?
        @rooms = @rooms.where("name LIKE ?", "%#{params[:keywords]}%")
      end
    end

    def list
      @rooms = Room.where(user_id: current_user.id) 
    end
  
    private
  
    def set_room
     if params[:id] == 'list'
      @rooms = Room.all # 全ての部屋情報を取得
    #     # リストページ用の処理を追加する（施設を全て取得するなど）
     else
      @room = Room.find(params[:id])
     end
    end
  
    def room_params
      params.require(:room).permit(:name, :description, :price, :address, :photo)  
    end

  end