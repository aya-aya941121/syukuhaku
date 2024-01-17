class ReservationsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
  
    def new
      @room = Room.find(params[:room_id])
      @reservation = Reservation.new
    end
  
    def create
      @room = Room.find(params[:room_id])
      @reservation = current_user.reservations.new(reservation_params)
      @reservation.room = @room
  
      if @reservation.save
        redirect_to reservation_path(@reservation), notice: "予約が完了しました。"
      else
        render :new
      end
    end
  
    def show
      @reservation = Reservation.find(params[:id])
    end
  
    private
  
    def reservation_params
      params.require(:reservation).permit(:check_in_date, :check_out_date, :number_of_guests)
    end
  end
  