class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        clients = Client.all
        render json: clients, status: 200
    end

    def show
        client = Client.find(params[:id])
        render json: client, status: 200
    end

    def update
        client = Client.find_by(id: params[:id])
        client.update(client_params)
        render json: client, status: 200
    end

    private

    def not_found
        render json: { error: "Client not found" }, status: 404
    end

    def client_params
        params.permit(:name, :age)
    end
end
