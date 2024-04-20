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
        render json: message, status: :created
        # メッセージが作成されたときに指定したチャンネルにブロードキャスト(チャンネル経由でフロントエンドに送信)
        ActionCable.server.broadcast "room_channel_#{params[:room_id]}", message
    end

    private

    def message_params
        # キーの指定
        params.require(:message).permit(:content, :sender_name)
    end
end
