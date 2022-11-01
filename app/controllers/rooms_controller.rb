class RoomsController < ApplicationController
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def index
    @rooms = @q.result.order(created_at: :desc)
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(create_room)
    if @room.save
      flash[:notice] = "お部屋の投稿が完了しました"
      redirect_to rooms_path
    else
      render "new"
    end
  end

  def posts
    @user = User.find(current_user.id)
    @rooms = @user.rooms
  end

  private

  def create_room
    params.require(:room).permit(:title, :introduction, :price, :address, :image, :user_id)
  end
end
