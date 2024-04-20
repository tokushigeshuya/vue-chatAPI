# 特定のチャットルームのメッセージを監視
class RoomChannel < ApplicationCable::Channel
    # 特定のチャンネルからのメッセージを受け取る
    def subscribed
        #  チャンネルの名前を指定
        stream_from "room_channel_#{params[:room_id]}"
    end
end