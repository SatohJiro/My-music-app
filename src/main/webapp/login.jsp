<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="./assets/img/favicon/icon_zing_mp3.png"
	type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;700&display=swap"
	rel="stylesheet" />
<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<title>Nhạc cá nhân | Xem bài hát, album, MV đang hot nhất hiện
	tại</title>
</head>
<body>
	<div class="modal">
		<div class="wrapper">
			<div class="btn btn__close">
				<i class="bi bi-x-circle-fill"></i>
			</div>
			<div class="form__title">
				<h2 class="title__login">Đăng nhập</h2>
				<h2 class="title__signup">Đăng ký</h2>
			</div>
			<div class="form__container">
				<div class="slide__controls">
					<input type="radio" name="slider" id="checked__login" checked /> <input
						type="radio" name="slider" id="checked__signup" /> <label
						for="checked__login" class="slide slide__login">Đăng nhập</label>
					<label for="checked__signup" class="slide slide__signup">Đăng
						ký</label>
					<div class="slide__tab"></div>
				</div>
				<div class="form__inner">
					<div class="form form__login">
						<form action="LoginServlet" id="form-1" method="post">
							</br> <span class="error__Register" style="color: red;">${requestScope.errorRegister }</span>
							<span class="sucRegister" style="color: green;">${requestScope.sucRegister }</span>
							<div class="field">
								<input type="text" placeholder="Tên đăng nhập" id="username"
									name="username" /> <span class="error__message"></span>
							</div>
							<div class="field">
								<input type="password" placeholder="Mật khẩu" id="password"
									name="password" /> <span class="error__message"
									style="color: red; margin-top: 6px"> ${requestScope.msg }
								</span>
							</div>
							<div class="forgot__pasword">
								<a href="">Quên mật khẩu ?</a>
							</div>
							<div class="field">
								<input type="submit" value="Đăng nhập" />
							</div>
							<div class="signup__link">
								<span>Bạn chưa là thành viên ? </span> <a href="#">Đăng ký
									ngay</a>
							</div>
						</form>
					</div>
					<div class="form form__signup">
						<form action="RegisterServlet" id="form-2"
							enctype="multipart/form-data" method="post">
							<div class="form__box">
								<div class="form__box-item">
									<div class="field">
										<input type="text" placeholder="Tên đăng nhập" id="Rusername"
											name="Rusername" /> <span class="error__message"
											style="color: red;">${requestScope.Rmsg }</span>
									</div>
									<div class="field">
										<input type="email" placeholder="Email" id="email"
											name="email" value="${requestScope.email }" /> <span
											class="error__message"></span>
									</div>
									<div class="field">
										<input type="text" placeholder="Địa chỉ" id="address"
											name="address" value="${requestScope.address }" /> <span
											class="error__message"></span>
									</div>
									<div class="field">
										<input type="tel" placeholder="Số điện thoại" name="phone"
											id="phone" value="${requestScope.phone }" /> <span
											class="error__message"></span>
									</div>
									<div class="field field__gender">
										<div class="">
											<div>
												<input type="radio" value="0" name="gender" /> <label
													for="female">Nữ</label>
											</div>
											<div class="" style="margin-left: 4px">
												<input type="radio" value="1" name="gender" /> <label
													for="male">Nam</label>
											</div>
										</div>
										<span class="error__message"></span>
									</div>
								</div>
								<div class="form__box-item">
									<div class="field">
										<input type="date" placeholder="Ngày tháng năm sinh" id="dob"
											name="dob" /> <span class="error__message"></span>
									</div>
									<div class="field">
										<input type="text" placeholder="Họ và tên" id="name"
											name="name" value="${requestScope.name }" /> <span
											class="error__message"></span>
									</div>
									<div class="field">
										<input type="password" placeholder="Mật khẩu" name="Rpassword"
											id="Rpassword" /> <span class="error__message"
											style="color: red;">${requestScope.Pmsg }</span>
									</div>
									<div class="field">
										<input type="password" placeholder="Nhập lại mật khẩu"
											name="repassword" id="repassword" /> <span
											class="error__message"></span>
									</div>
								</div>
							</div>
							<div class="file__container">
								<div class="file__wrapper">
									<div class="file__image">
										<img class="choose__avt"
											src="https://source.unsplash.com/random" alt="" />
									</div>
									<div class="file__content">
										<div class="file__icon">
											<svg xmlns="http://www.w3.org/2000/svg" width="16"
												height="16" fill="currentColor"
												class="bi bi-cloud-arrow-up-fill" viewBox="0 0 16 16">
                          <path
													d="M8 2a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 6.095 0 7.555 0 9.318 0 11.366 1.708 13 3.781 13h8.906C14.502 13 16 11.57 16 9.773c0-1.636-1.242-2.969-2.834-3.194C12.923 3.999 10.69 2 8 2zm2.354 5.146a.5.5 0 0 1-.708.708L8.5 6.707V10.5a.5.5 0 0 1-1 0V6.707L6.354 7.854a.5.5 0 1 1-.708-.708l2-2a.5.5 0 0 1 .708 0l2 2z" />
                        </svg>
										</div>
										<div class="file__text">No file chosen</div>
									</div>
									<div class="file__btn btn__cancel">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
                        <path
												d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                      </svg>
									</div>
									<div class="file__name">File name here</div>
								</div>
								<div class="field">
									<input type="file" id="btn__default" name="avatar" hidden />
									<button id="btn__custom">Chọn ảnh đại diện</button>
								</div>
							</div>
							<div class="field">
								<input type="submit" value="Đăng ký" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="./assets/js/login.js"></script>
	<!--     <script src="./playlist.js"></script> -->
	<!-- <script src="./assets/js/validate.js"></script> -->
	<!-- <script>
		Validate({
			form : "#form-1",
			formGroupSelector : ".field",
			errorSelector : ".error__message",
			rules : [
					Validate.isRequired("#username"),
					Validate.minLength("#password", 6,
							"Mật khẩu chứa ít nhất 6 kí tự"), ]
		// onSubmit: function(data) {
		//   console.log(data);
		//   return true;
		// }
		});
		Validate({
			form : "#form-2",
			formGroupSelector : ".field",
			errorSelector : ".error__message",
			rules : [
					Validate.isRequired("#username"),
					Validate.minLength("#password", 6,
							"Mật khẩu chứa ít nhất 6 kí tự"),
					Validate.isName("#name",
							"Tên có dấu và viết hoa chữ cái đầu"),
					Validate.isPhone("#phone", "Số điện thoại không hợp lệ"),
					Validate.isRequired("#address"),
					Validate.isRequired("#repassword",
							"Vui lòng nhập thông tin"),
					Validate
							.isConfirmed(
									"#repassword",
									function() {
										return document
												.querySelector("#form-2 #password").value;
									}, "Mật khẩu không tương ứng"),
					Validate.isEmail("#email", "Email không hợp lệ"),
					Validate.isRequired("#dob"),
					Validate.isRequired('input[name="gender"]'), ],
		// onSubmit: function(data) {
		//   return true;
		//   console.log(data);
		// }
		});
	</script> -->
</body>
</html>