class DreamsController < ApplicationController
  before_action :set_dream, only: %i[ show update destroy ]

  # GET /dreams
  def index
    @dreams = Dream.all

    render json: @dreams
  end

  # GET /dreams/1
  def show
    render json: @dream
  end

  # POST /dreams
  def create
    @dream = Dream.new(dream_params)

    if @dream.save
      render json: @dream, status: :created, location: @dream
    else
      render json: @dream.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dreams/1
  def update
    if @dream.update(dream_params)
      render json: @dream
    else
      render json: @dream.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dreams/1
  def destroy
    @dream.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dream
      @dream = Dream.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dream_params
      params.require(:dream).permit(:title, :content, :drawing, :user_id)
    end
end
