require "date"
class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @reservations = @user.reservations
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :member, :user_id, :room_id))
    if @reservation.start_date && @reservation.end_date
      @reservation.period = @reservation.end_date - @reservation.start_date
      @reservation.total_price = @reservation.member * @reservation.period * @room.price
    end
    if @reservation.save
      flash[:notice] = "予約を完了しました"
      redirect_to reservations_path
    else
      render "rooms/show"
    end
  end

  private

  def create_reservation
    params.permit(:start_date, :end_date, :member, :user_id, :room_id)
  end
end
