const pay = () => {
  Payjp.setPublicKey("pk_test_ca388c36555bf0fae016810b");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult);

      const card = {
        number: formData.get("number"),
        cvc: formData.get("cvc"),
        exp_month: formData.get("exp_month"),
        exp_year: `20${formData.get("exp_year")}`,
      };
  });
};

window.addEventListener("load", pay);