const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵  process.env.PAYJP_PUBLIC_KEY は環境変数で定義した鍵
  const form = document.getElementById("charge-form");  // document.getElementById("id名")でHTMLで定義したidを取得できる
  form.addEventListener("submit", (e) => {  // addEventListener（イベント名,関数）はイベント発火の定義
    e.preventDefault();  // event.preventDefaultは、submitイベントの発生元であるフォームが持つデフォルトの動作をキャンセルするメソッド(一旦送信を止めている)
    console.log("フォーム送信時にイベント発火")

    // payjpへ送るデータの準備
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    // payjpへ送るデータの内容
    const card = {
      number: formData.get("buy_address[number]"), // （）はブラウザで検証をかけて指定した場所のnameを記述
      cvc: formData.get("buy_address[cvc]"),
      exp_month: formData.get("buy_address[exp_month]"),
      exp_year: `20${formData.get("buy_address[exp_year]")}`,
    };

    // カード情報のトークン化(HTML用へ変換)
    Payjp.createToken(card, (status, response) => {  // Payjp.createToken(カード情報, トークンが送付された後に実行する処理 )
      console.log(status)
      if (status == 200) {  // HTTPステータスコード (200~299 送信成功 )
        const token = response.id;  // response.idとすることでトークンの値を取得することができ

        // トークン情報をサーバーサイドに送信する処理
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;  // tokenObjの中にtokenの情報(value)、名前はtoken としてインプット
        renderDom.insertAdjacentHTML("beforeend", tokenObj);  // insertAdjacentHTML(挿入したい位置,挿入したいHTML) はある要素の指定した箇所に挿入するメソッド (カード情報の後ろにトークン情報追加)
      }

      // クレジットカード情報の削除
      document.getElementById("card-number").removeAttribute("name");  // 要素.removeAttribute(name, value) 要素から、特定の属性を削除(nameは属性の名前を文字列で,valueは属性に削除したい値を指定)
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      // データの送信
      document.getElementById("charge-form").submit();  // 5行目で止めてた送信をここでトークン情報を含んだ状態で送信
    });
  });
};

window.addEventListener("load", pay);