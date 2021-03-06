class NoteController < ApplicationController
  before_action :authenticate_user!
  # アクションが呼ばれる前に特定のアクションを実行している
  before_action :set_currentuser_id, only: [:index, :new]

  def index
    @note = Note.where(user_id: @c_user)
    # コンテンツモデル読み込みテスト
    
  end

  def show
    @note_contents = NoteContent.where(note_id: params[:id])
    # @note_contents = NoteContent.find_by(note_id: params[:id])
  end

  def new
    @note = Note.new
    # @note_contents = NoteContent.new
    @note.note_contents.build
  end

  def create
     @note = Note.new(note_params)
     # @note_contents = NoteContent.new(note_contents_params)
    if @note.save # && @note_contents.save
      # 現在のアクションのindexにリダイレクトする
      redirect_to :action => "index"
    else
      # ValidationエラーなどでDBに保存できない場合 new.html.erb を再表示
      render 'new'
    end
  end

  #アクション外から呼ばれないようにprivate指定している
  private

   def note_params
     # permitしている要素しか読み込まない
     params.require(:note).permit(:title, :description, :user_id, :id, note_contents_attributes: [:id, :contents, :version])
   end
   def note_contents_params
     # permitしている要素しか読み込まない
     params.require(:note_content).permit(:contents, :version)
   end

   def set_currentuser_id
     # ログイン中ユーザのidを読み込み
     @c_user = current_user.id
   end

end
