class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        gyms = Gym.all
        render json: gyms, status: :ok
    end

    def show
        gym = Gym.find(params[:id])
        render json: gym, status: :ok
    end

    def update
        gym = Client.find_by(id: params[:id])
        gym.update(gym_params)
        render json: gym, status: 200
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        head :ok
    end

    private

    def not_found
        render json: { error: "Gym not found" }, status: 404
    end

    def gym_params
        params.permit(:name, :address)
    end
end
