class ReservationsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
  
    def new
        @reservation = Reservation.new
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
    
      private
    
      def reservation_params
        params.require(:reservation).permit(:check_in_date, :check_out_date, :num_of_guests)
      end
    
      def calculate_total_price(reservation)
        # 合計金額を計算するロジックを実装する
      end
  end
  