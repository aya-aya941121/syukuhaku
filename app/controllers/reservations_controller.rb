class ReservationsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
  
    def new
        # @room = Room.find(params[:room_id])
        # @reservation = Reservation.new
        # @room = Room.find(params[:room_id])
        # @reservation = @room.reservations.build
        @room = Room.find(params[:room_id])
        @reservation = Reservation.new
      rescue ActiveRecord::RecordNotFound
        raise ActionController::RoutingError, 'Room not found'
    end
    
    
      def create
        @reservation = current_user.reservations.build(reservation_params)
        if @reservation.save
          redirect_to reservation_path(@reservation)
        else
          render :new
        end
      end
    
      def show
        @reservation = Reservation.find(params[:id])
        @total_price = calculate_total_price(@reservation)
      end
    
      def index
        @reservations = current_user.reservations
      end


      def confirm
        # @room = Room.find(params[:room_id])
        if params[:date].present? && params[:username].present?  # パラメーターが存在するかを確認
          @room = Room.find(params[:room_id])  # 予約データをロード
        else
          redirect_to new_reservation_path, alert: 'Please fill in all fields.'  # パラメーターが不足している場合は、予約画面にリダイレクトし、エラーメッセージを表示
        end
      end
    
      private
    
      def reservation_params
        params.require(:reservation).permit(:check_in_date, :check_out_date, :num_of_guests)
      end
    
      def calculate_total_price(reservation)
        # 合計金額を計算するロジックを実装する
      end

  end
  