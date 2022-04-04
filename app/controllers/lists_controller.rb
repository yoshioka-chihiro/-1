class ListsController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end

  def create
    #1＆2 データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    #3データをデータベースに保存するためのsaveメソッド実行
    list.save
    #詳細画面へリダイレクト
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    #今回はレコードを1件だけ取得するので、インスタンス変数名は単数形の「@list」にします。
    @list = List.find(params[:id])
  end

  def edit
  end

  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body)
  end
end
