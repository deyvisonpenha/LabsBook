class BookingsController < AuthorizationController
  before_action :set_prof, only: [:show, :edit, :new, :destroy]

  def index
    @bookings = Booking.all
  end
  
  def show
  end

  
  def new
    @booking = Booking.new(:user_id => User.find(session[:user_id]))    
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to professor_path
    else
      render :new
    end
  end


  def edit

  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prof
      @current_user ||= User.find(session[:user_id]) 
    end

    def booking_params
      params.require(:booking).permit(:disciplina, :inicio,:fim, :lab, :user_id => User.find(session[:user_id]))
    end

  
end