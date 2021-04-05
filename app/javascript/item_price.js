window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");  // どこのidをとってきてpriceInputに代入するか指定
  priceInput.addEventListener("input", () => {  // イベントの発火条件指定
    const inputValue = priceInput.value;
    console.log(inputValue);

    // 入力した金額をもとに販売手数料を計算する処理 
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = inputValue * 0.1   // innerHTMLは、HTML要素の書き換えを行う
    console.log(addTaxDom);

    const sum = document.getElementById("profit");
    sum.innerHTML = inputValue - inputValue * 0.1
    console.log(sum);

  })




});