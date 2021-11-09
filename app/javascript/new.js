window.addEventListener("load", () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const taxValue = document.getElementById("add-tax-price");
    const profitValue = document.getElementById("profit");
    taxValue.innerHTML = (inputValue / 10)
    profitValue.innerHTML = (inputValue - (inputValue / 10))
  })
})