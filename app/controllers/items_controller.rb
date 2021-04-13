class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]  # 全てのアクションの前に、ユーザーがログインしているかどうか確認する！ただし、showアクションと、indexアクションが呼び出された場合は、除くよ
  before_action :set_item, only: [:show, :edit, :update, :destroy]  # show edit update destroy へ、アクセスがあった場合に 「 move_to_index 」 の前にprivateへいく
  before_action :move_to_index, only: [:edit, :update, :destroy]  # edit update destroy にアクセスがある場合先にprivateにいくようにする

  def index
    @items = Item.all.order("created_at DESC")  # Itemのデータを全て取得・order("created_at DESC")で降順に
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # @item = Item.find(params[:id])  before_action :set_item で定義
  end

  def edit
    # @item = Item.find(params[:id])  before_action :set_item で定義
    unless @item.buy == nil  # 購入履歴が空でなけれは
      redirect_to root_path
    end
  end

  def update
    # @item = Item.find(params[:id])   DBから編集したいレコードを取得・・before_action :set_item で定義された
    @item.update(item_params)  # 取得したレコードに対してupdateメソッドを使って更新
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    # @item = Item.find(params[:id])   DBから削除したいレコードを取得・・before_action :set_item で定義された
    if @item.destroy  # 取得したレコードに対してdestroyメソッドを使って削除 & 削除の処理後はトップページへ
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :goods_name, :explanation, :category_id, :status_id, :burden_id, :start_id, :preparation_id, :price).merge(user_id: current_user.id)
    # .requireメソッドがデータのオブジェクト名を定め,.permitメソッドで変更を加えられる（保存の処理ができる）キーを指定している
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index  # ログイン者が出品者でない時の処理
    unless current_user == @item.user  # unless はこの条件でない時以下の処理を行うというメソッド（ifの逆）
      redirect_to root_path
    end
  end

  # 画像の保存を許可するストロングパラメーター
  # def message_params
  #   params.require(:items).permit(:content, :image).merge(user_id: current_user.id)
  # end
end
