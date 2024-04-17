class RoomsController < ApplicationController
    def index
        # Room モデルの全てのデータを取得して、JSON形式でレスポンスを返します。
        rooms = Room.all
        render json: rooms, status: :ok
    end

    def create
        # Room モデルに新しいデータを作成して、JSON形式でレスポンスを返します。
        room = Room.create(room_params)
        render json: room, status: :created
    end

    private

    def room_params
        params.require(:room).permit(:name)
    end
end
