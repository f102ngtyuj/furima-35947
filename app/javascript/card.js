const pay = () => {
  Payjp.setPublicKey("pk_test_ca388c36555bf0fae016810b");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_shipping[number]"),
      cvc: formData.get("purchase_shipping[cvc]"),
      exp_month: formData.get("purchase_shipping[exp_month]"),
      exp_year: `20${formData.get("purchase_shipping[exp_year]")}`,
    };
    console.log(card)


    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);