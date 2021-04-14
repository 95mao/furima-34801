class BuysController < ApplicationController
  before_action :authenticate_user!  # ログインしているかの確認（していなければログインページへ遷移する）
  before_action :set_item, only: [:index, :create]
  before_action :if_item, only: [:index, :create]

  def index
    @buy_address = BuyAddress.new
    # @item = Item.find(params[:item_id])  before_actionで生成

    if_item
    # 出品者ならトップページへ遷移する または @itemのbuy にデータがある（売れてる）ならトップページへ
    # if current_user == @item.user || @item.buy != nil
    #   redirect_to root_path
    # end
    
  end

  def create
    @buy_address = BuyAddress.new(params_buy_address)
    # @item = Item.find(params[:item_id])  before_actionで生成

    if_item

    if @buy_address.valid?  # valid? は作られたクラスのバリデーションをかけて真偽を判断する（BuyAddressクラスから作られているのでbuy_addressのバリデーション）
      pay_buy_address
      @buy_address.save
      return redirect_to root_path  # return はここで処理が終わりですって合図
    else
      render 'index'  # indexアクションへ移動するのではなく、「indexのビュー」を表示させている為、@itemで情報を持ってくる必要がある
    end

  end

  private
  def params_buy_address                                                                                     # ↓ {}外のデータを記述paramsの外側にあるデータで取り扱いたいもの
    params.require(:buy_address).permit(:postal_code, :start_id, :city, :house_number, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token]) 
  end

  def pay_buy_address
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述 PAY.JP提供のGem Payjp.api_keyを使う  環境設定で定義した鍵を使う
    Payjp::Charge.create(  # 決済に必要な情報の定義、PAY.JP提供のGem Payjp::Charge.createのクラスおよびクラスメソッドを使う
      amount: @item.price,  # 商品の値段  
      card: @buy_address.token,    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id]) 
    # paramsの中身の確認は、binding.pry→params か rails routes のURI Patternで確認
  end

  # 出品者ならトップページへ遷移する または @itemのbuy にデータがある（売れてる）ならトップページへ
  def if_item  
    if current_user == @item.user || @item.buy != nil
      redirect_to root_path
    end
  end

end
