module Api
  module V1
    class CoinsController < ApplicationController
      def index
        coins = Coin.all

        render json: CoinSerializer.new(coins, options).serialized_json
      end

      def show
        coin = Coin.find_by(slug: params[:slug])

        render json: CoinSerializer.new(coin, options).serialized_json
      end

      def create
        coin = Coin.new(coin_params)
        if coin.save
          render json: CoinSerializer.new(coin).serialized_json
        else
          render json: {error: coin.error.messages}, status: 422
        end
      end

      def update
        coin = Coin.find_by(slug: params[:slug])
        if coin.update(coin_params)
          render json: CoinSerializer.new(coin, options).serialized_json
        else
          render json: {error: coin.error.messages}, status: 422
        end
      end

      def destroy
        coin = Coin.find_by(slug: params[:slug])
        if coin.destroy
          head :no_content
        else
          render json: {error: coin.error.messages}, status: 422
        end
      end


      private

      def coin_params
        params.require(:coin).permit(:name, :image_url)
      end

      def options
        @options ||= { include: %i[reviews]}
      end
    end
  end
end
