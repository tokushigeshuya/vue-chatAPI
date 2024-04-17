class MessagesController < ApplicationController
    def index
        # room_id パラメータに一致するRoomオブジェクトを取得
        room = Room.find(params[:room_id])
        messages = room.messages.limit(20) # 取得するデータ件数を20に指定

        render json: messages, status: :ok
    end
    def create
        room = Room.find(params[:room_id])
        message = room.messages.create(message_params)
        render json: message,   status: :created
    end

    private

    def massage_params
        # キーの指定
        params.require(:message).permit(:content, :sender_name)
    end
end
