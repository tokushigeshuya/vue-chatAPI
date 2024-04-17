class Room < ApplicationRecord
    # Room が複数の Message を持つ（1対Nの関係）
    has_many :messages, dependent: :destroy
end
