class NoteContent < ApplicationRecord
	# inverse_ofはレコード登録時、親モデルのid使用によるトランザクションを防ぐ
	belongs_to :note, inverse_of: :note_contents
end
