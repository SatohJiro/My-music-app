// show form login
const fileName = document.querySelector(".file__name");
const loginForm = document.querySelector(".form__login");
const signupForm = document.querySelector(".form__signup");
const loginBtn = document.querySelector(".slide__login");
const signupBtn = document.querySelector(".slide__signup");
const signupLink = document.querySelector(".signup__link");
const cancelBtn = document.querySelector(".btn__cancel");
const titleLogin = document.querySelector(".form__title .title__login");
const titleSignup = document.querySelector(".form__title .title__signup");
//
const btnDefault = document.querySelector("#btn__default");
const btnCustom = document.querySelector("#btn__custom");
//
const img = document.querySelector('img[class="choose__avt"]');
let regExp = /[0-9a-zA-Z\^\&\'\@\{\}\[\]\,\$\=\!\-\#\(\)\.\%\+\~\_ ]+$/;
const wrapper = document.querySelector(".file__wrapper");

//
const showLogin = document.querySelector(".option__log-in");
//
const form = document.querySelector(".modal");
const formWrapper = document.querySelector(".wrapper");

btnDefault.addEventListener("change", function () {
  const file = this.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = () => {
      const result = reader.result;
      img.src = result;
      wrapper.classList.add("active");
    };
    cancelBtn.addEventListener("click", function () {
      img.src = "";
      wrapper.classList.remove("active");
    });
    reader.readAsDataURL(file);
  }
  if (this.value) {
    let valueStore = this.value.match(regExp);
    fileName.textContent = valueStore;
    console.log(valueStore);
  }
});
//

//
btnCustom.onclick = () => {
  btnDefault.click();
  return false;
};
//
signupBtn.onclick = () => {
  loginForm.style.marginLeft = "-50%";
  titleLogin.style.marginLeft = "-50%";
};
loginBtn.onclick = () => {
  loginForm.style.marginLeft = "0%";
  titleLogin.style.marginLeft = "0%";
};
signupLink.onclick = () => {
  signupBtn.click();
  return false;
};

//
