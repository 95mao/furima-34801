class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]  # 全てのアクションの前に、ユーザーがログインしているかどうか確認する！ただし、showアクションと、indexアクションが呼び出された場合は、除くよ

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])  # DBから編集したいレコードを取得
    @item.update(item_params)  # 取得したレコードに対してupdateメソッドを使って更新
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :goods_name, :explanation, :category_id, :status_id, :burden_id, :start_id, :preparation_id, :price).merge(user_id: current_user.id)
    # .requireメソッドがデータのオブジェクト名を定め,.permitメソッドで変更を加えられる（保存の処理ができる）キーを指定している
  end

  # 画像の保存を許可するストロングパラメーター
  # def message_params
  #   params.require(:items).permit(:content, :image).merge(user_id: current_user.id)
  # end
end
