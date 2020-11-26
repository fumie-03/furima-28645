window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const addTaxDomValue = addTaxDom.innerHTML;
    console.log(addTaxDomValue);

    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - addTaxDomValue);
    const profitValue = profit.innerHTML;
    console.log(profitValue);
  })
});