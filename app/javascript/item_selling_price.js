function item () {
const itemPrice = document.getElementById("item-price");
const addTaxPrice = document.getElementById("add-tax-price");
const profit = document.getElementById("profit");
itemPrice.addEventListener("input", () =>{
  const inputValue = itemPrice.value;
  const addTaxPriceValue = inputValue * 0.1
  const profitValue = (inputValue - addTaxPriceValue)
  addTaxPrice.innerHTML = Math.floor(addTaxPriceValue)
  profit.innerHTML = Math.ceil(profitValue)
});
}

window.addEventListener('load', item)
