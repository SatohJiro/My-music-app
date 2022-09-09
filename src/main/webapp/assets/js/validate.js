function Validate(options) {
  const getParent = (e, selector) => {
    while (e.parentElement) {
      if (e.parentElement.matches(selector)) {
        return e.parentElement;
      }
      e = e.parentElement;
    }
  };
  let selecterRules = {};
  let valid = (inputElement, rule) => {
    // let errorElement = getParent(inputElement,'.field')
    let errorMessage = rule.test(inputElement.value);
    let errorElement = getParent(
      inputElement,
      options.formGroupSelector
    ).querySelector(options.errorSelector);
    var rules = selecterRules[rule.selector];

    for (let i = 0; i < rules.length; ++i) {
      switch (inputElement.type) {
        case "radio":
        case "checkbox":
          errorMessage = rules[i](
            formElement.querySelector(rule.selector + ":checked")
          );

          break;
        default:
          errorMessage = rules[i](inputElement.value);
      }
      if (errorMessage) break;
    }

    if (errorMessage) {
      errorElement.innerText = errorMessage;
      getParent(inputElement, options.formGroupSelector).classList.add(
        "invalid"
      );
    } else {
      errorElement.innerText = "";
      getParent(inputElement, options.formGroupSelector).classList.remove(
        "invalid"
      );
    }
    return !errorMessage;
  };
  let formElement = document.querySelector(options.form);
  if (formElement) {
    formElement.onsubmit = (e) => {
      e.preventDefault();
      let isFormValid = true;

      options.rules.forEach(function (rule) {
        const inputElement = formElement.querySelector(rule.selector);
        let isValid = valid(inputElement, rule);
        if (!isValid) {
          isFormValid = false;
        }
      });

      if (isFormValid) {
        if (typeof options.onSubmit === "function") {
          let dataInputForm = formElement.querySelectorAll("[name]");
          let formValues = Array.from(dataInputForm).reduce(function (
            values,
            input
          ) {
            switch (input.type) {
              case "radio":
              case "checkbox":
                values[input.name] = formElement.querySelector(
                  'input[name="' + input.name + '"]:checked'
                ).value;
                break;
              case "file":
                values[input.name] = input.files[0];
                break;
              default:
                values[input.name] = input.value;
            }
            return values;
          },
          {});
          options.onSubmit(formValues);
        } else {
          formElement.submit();
        }
      }
    };
    options.rules.forEach(function (rule) {
      if (Array.isArray(selecterRules[rule.selector])) {
        selecterRules[rule.selector].push(rule.test);
      } else {
        selecterRules[rule.selector] = [rule.test];
      }
      let inputElements = formElement.querySelectorAll(rule.selector);
      Array.from(inputElements).forEach(function (inputElement) {
        inputElement.onblur = () => {
          valid(inputElement, rule);
        };
        inputElement.oninput = () => {
          let errorElement = getParent(
            inputElement,
            options.formGroupSelector
          ).querySelector(".error__message");
          errorElement.innerText = "";
          getParent(inputElement, options.formGroupSelector).classList.remove(
            "invalid"
          );
        };
      });
    });
  }
}
Validate.isRequired = function (selector, message) {
  return {
    selector: selector,
    test: function (value) {
      return value ? undefined : message || "Vui lòng nhập thông tin";
    },
  };
};
Validate.isEmail = function (selector, message) {
  return {
    selector: selector,
    test: function (value) {
      const regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
      return regex.test(value)
        ? undefined
        : message || "Vui lòng nhập thông tin";
    },
  };
};
Validate.minLength = (selector, min, message) => {
  return {
    selector: selector,
    test: function (value) {
      return value.length >= min
        ? undefined
        : message || "Vui lòng nhập thông tin";
    },
  };
};
Validate.isConfirmed = (selector, getConfirmValue, message) => {
  return {
    selector: selector,
    test: function (value) {
      return value === getConfirmValue()
        ? undefined
        : message || "Vui lòng nhập thông tin";
    },
  };
};
Validate.isName = (selector, message) => {
  const regex =
    /^[A-ZÀ|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ|È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ|Ì|Í|Ị|Ỉ|Ĩ|Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ|Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ|Ỳ|Ý|Ỵ|Ỷ|Ỹ|Đ][a-zà|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ|è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ|ì|í|ị|ỉ|ĩ|ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ|ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ|ỳ|ý|ỵ|ỷ|ỹ]*([ ][A-ZÀ|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ|È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ|Ì|Í|Ị|Ỉ|Ĩ|Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ|Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ|Ỳ|Ý|Ỵ|Ỷ|Ỹ|Đ][a-zà|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ|è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ|ì|í|ị|ỉ|ĩ|ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ|ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ|ỳ|ý|ỵ|ỷ|ỹ]*)*$/;
  return {
    selector: selector,
    test: function (value) {
      return regex.test(value)
        ? undefined
        : message || "Vui lòng nhập thông tin";
    },
  };
};
Validate.isPhone = (selector, message) => {
  const regex = /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/;
  return {
    selector: selector,
    test: function (value) {
      return regex.test(value)
        ? undefined
        : message || "Vui lòng nhập thông tin";
    },
  };
};
