window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
  })
});

window.addEventListener('load', () => {
  const priceInput = document.getElementById("add-tax-price");
  console.log(priceInput);
});

window.addEventListener('load', () => {
  const priceInput = document.getElementById("profit");
  console.log(priceInput);
});