<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="dao.Entity.*"%>
<%@ page import="java.util.List"%>
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
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->

<link rel="stylesheet" href="./assets/css/main.css" />
<title>Nhạc cá nhân | Xem bài hát, album, MV đang hot nhất hiện
	tại</title>
</head>

<body>

	<div class="app">
		<c:set var="user" value="${sessionScope.user}"></c:set>
		<c:choose>
			<c:when test="${user==null}">
				<c:set var="log" value="Đăng Nhập"></c:set>
				<c:set var="avatar" value="${requestScope.avatar}"></c:set>
				<c:set var="urlLog" value="./login.jsp"></c:set>
				<br />
			</c:when>
			<c:otherwise>
				<c:set var="log" value="Đăng Xuất"></c:set>
				<c:set var="avatar" value="${user.getAvatar() }"></c:set>
				<c:set var="urlLog" value="LogoutServlet"></c:set>
			</c:otherwise>
		</c:choose>
		<!-- Sidebar -->
		<aside class="app__sidebar">
			<div class="sidebar__logo">
				<a href="" class="sidebar__logo-link" alt="logo"> <img
					src="./assets/img/logos/main-logo.svg" alt=""
					class="sidebar__logo-img" /></a>
			</div>
			<nav class="sidebar__nav sidebar__nav--separate">
				<ul class="sidebar__nav-list">
					<li class="sidebar__nav-item active"><a href=""
						class="sidebar__item-link"> <i class="bi bi-music-player"></i>
							<span>Cá nhân</span>
					</a></li>
					<li class="sidebar__nav-item"><a href="#"
						class="sidebar__item-link"> <i class="bi bi-vinyl"></i> <span>Khám
								phá</span>
					</a></li>
					<li class="sidebar__nav-item"><a href="#"
						class="sidebar__item-link"> <i class="bi bi-music-note-list"></i>
							<span>#zingchart</span>
					</a></li>
					<li class="sidebar__nav-item"><a href="#"
						class="sidebar__item-link"> <i class="bi bi-soundwave"></i> <span>Radio</span>
							<div class="sidebar__nav-label">live</div>
					</a></li>
					<li class="sidebar__nav-item"><a href="#"
						class="sidebar__item-link"> <i
							class="bi bi-file-earmark-slides"></i> <span>Theo dõi</span>
					</a></li>
				</ul>
			</nav>
			<nav class="sidebar__subnav has-mask">
				<ul class="sidebar__nav-list">
					<li class="sidebar__nav-item subnav--item"><a href="#"
						class="sidebar__item-link"> <i class="bi bi-music-note-beamed"></i>
							<span>Nhạc mới</span>
					</a></li>
					<li class="sidebar__nav-item subnav--item"><a href="#"
						class="sidebar__item-link"> <i class="bi bi-slack"></i> <span>Thể
								loại</span>
					</a></li>
					<li class="sidebar__nav-item subnav--item"><a href="#"
						class="sidebar__item-link"> <i class="bi bi-star"></i> <span>Top
								100</span>
					</a></li>
					<li class="sidebar__nav-item subnav--item"><a href="#"
						class="sidebar__item-link"> <i class="bi bi-camera-video"></i>
							<span>MV</span>
					</a></li>
				</ul>
				<!--Buy VIP -->
				<div class="sidebar__login">
					<p class="sidebar__login-desc">Nghe nhạc không quảng cáo cùng
						kho nhạc VIP</p>
					<a href="" class="sidebar__login-btn button is-small button-gold">
						Mua vip </a>
				</div>
				<ul class="sidebar__subnav-menu">
					<li class="sidebar__menu-item menu-header">
						<h2 class="sidebar__menu-title">Thư viện</h2> <i
						class="bi bi-pencil hide-on-tablet"></i>
					</li>
					<li class="sidebar__menu-item"><a href=""
						class="sidebar__menu-link"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24">
                  <defs>
                    <linearGradient id="0783s0j89a" x1="0%" x2="0%"
									y1="0%" y2="100%">
                      <stop offset="0%" stop-color="#3CA2FF" />
                      <stop offset="100%" stop-color="#008FFF" />
                    </linearGradient>
                    <linearGradient id="prx3tly02b" x1="21.839%"
									x2="21.839%" y1="43.679%" y2="100%">
                      <stop offset="0%" stop-color="#FFF" />
                      <stop offset="100%" stop-color="#FFF"
									stop-opacity=".9" />
                    </linearGradient>
                  </defs>
                  <g fill="none" fill-rule="evenodd">
                    <g>
                      <g>
                        <path fill="url(#0783s0j89a)"
									d="M.516 7.143c.812-3.928 3.31-6.115 7.207-6.776 2.88-.489 5.762-.495 8.637.014 4.012.709 6.424 3.024 7.192 7.011.594 3.082.603 6.196-.009 9.274-.821 3.9-3.384 6.309-7.266 6.967-2.88.489-5.762.495-8.637-.014-4.012-.709-6.435-3.14-7.203-7.127-.624-3.102-.564-6.235.08-9.349z"
									transform="translate(-21 -433) translate(21 433)" />
                        <path fill="url(#prx3tly02b)"
									d="M3.995 9.479c-.245.48-.245 1.11-.245 2.371v3.3c0 1.26 0 1.89.245 2.371.216.424.56.768.984.984.48.245 1.11.245 2.371.245h9.3c1.26 0 1.89 0 2.372-.245.423-.216.767-.56.983-.983.245-.482.245-1.112.245-2.372v-3.3c0-1.26 0-1.89-.245-2.371-.216-.424-.56-.768-.983-.984-.482-.245-1.112-.245-2.372-.245h-9.3c-1.26 0-1.89 0-2.371.245-.424.216-.768.56-.984.984zm8.567.571l.06.004.068.015.057.02.017.008c.556.27 1.067.623 1.516 1.046.075.07.148.142.22.217.172.18.166.464-.014.636-.18.172-.464.167-.636-.013-.061-.063-.123-.125-.187-.185-.202-.19-.42-.365-.65-.521v3.442c0 1.025-.832 1.856-1.857 1.856S9.3 15.744 9.3 14.719c0-1.025.831-1.856 1.856-1.856.35 0 .677.096.957.264V10.5c0-.249.201-.45.45-.45z"
									transform="translate(-21 -433) translate(21 433)" />
                        <path fill="#FFF" fill-opacity=".6"
									fill-rule="nonzero"
									d="M7.5 5.25c0-.414.336-.75.75-.75h7.5c.414 0 .75.336.75.75h-9z"
									transform="translate(-21 -433) translate(21 433)" />
                        <path fill="#FFF" fill-opacity=".9"
									fill-rule="nonzero"
									d="M6 6.75c0-.414.336-.75.75-.75h10.5c.414 0 .75.336.75.75H6z"
									transform="translate(-21 -433) translate(21 433)" />
                      </g>
                    </g>
                  </g>
                </svg> <span>Bài hát</span>
					</a></li>
					<li class="sidebar__menu-item"><a href=""
						class="sidebar__menu-link"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24">
                  <defs>
                    <linearGradient id="ghd4ngt38a" x1="50%" x2="50%"
									y1="0%" y2="100%">
                      <stop offset="0%" stop-color="#9FD465" />
                      <stop offset="100%" stop-color="#70B129" />
                    </linearGradient>
                  </defs>
                  <g fill="none" fill-rule="evenodd">
                    <g>
                      <g>
                        <path fill="url(#ghd4ngt38a)"
									d="M.516 7.143c.812-3.928 3.31-6.115 7.207-6.776 2.88-.489 5.762-.495 8.637.014 4.012.709 6.424 3.024 7.192 7.011.594 3.082.603 6.196-.009 9.274-.821 3.9-3.384 6.309-7.266 6.967-2.88.489-5.762.495-8.637-.014-4.012-.709-6.435-3.14-7.203-7.127-.624-3.102-.564-6.235.08-9.349z"
									transform="translate(-21 -467) translate(21 467)" />
                        <path stroke="#FFF" stroke-linecap="round"
									stroke-linejoin="round" stroke-width="1.5"
									d="M13.5 11.5h5m-5 3h5M6 17.5h12.5"
									transform="translate(-21 -467) translate(21 467)" />
                        <path fill="#FFF"
									d="M10.786 4.025c-.053-.016-.11-.025-.167-.025-.316 0-.572.262-.572.585v4.782c-.532-.44-1.21-.704-1.948-.704C6.387 8.663 5 10.082 5 11.831 5 13.581 6.387 15 8.099 15c1.711 0 3.099-1.419 3.099-3.169 0-.074-.003-.147-.007-.22l.001-6.04c.534.336 1.033.728 1.49 1.169.114.109.225.22.334.337.218.233.58.24.808.017.228-.223.235-.593.017-.826-.123-.131-.247-.257-.375-.38-.766-.738-1.64-1.355-2.589-1.826l-.091-.037z"
									transform="translate(-21 -467) translate(21 467)" />
                      </g>
                    </g>
                  </g>
                </svg> <span>Playlist</span>
					</a></li>
					<li class="sidebar__menu-item"><a href=""
						class="sidebar__menu-link"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24">
                  <defs>
                    <linearGradient id="v6mduhifwa" x1="50%" x2="50%"
									y1="0%" y2="100%">
                      <stop offset="0%" stop-color="#FFD677" />
                      <stop offset="100%" stop-color="#F7AA45" />
                    </linearGradient>
                    <linearGradient id="dkfkk30hhb" x1="21.205%"
									x2="21.205%" y1="43.042%" y2="100.632%">
                      <stop offset="0%" stop-color="#FFF" />
                      <stop offset="100%" stop-color="#FFF"
									stop-opacity=".9" />
                    </linearGradient>
                  </defs>
                  <g fill="none" fill-rule="evenodd">
                    <g>
                      <g>
                        <path fill="url(#v6mduhifwa)"
									d="M.516 7.143c.812-3.928 3.31-6.115 7.207-6.776 2.88-.489 5.762-.495 8.637.014 4.012.709 6.424 3.024 7.192 7.011.594 3.082.603 6.196-.009 9.274-.821 3.9-3.384 6.309-7.266 6.967-2.88.489-5.762.495-8.637-.014-4.012-.709-6.435-3.14-7.203-7.127-.624-3.102-.564-6.235.08-9.349z"
									transform="translate(-21 -569) translate(21 569)" />
                        <path fill="url(#dkfkk30hhb)"
									d="M12 3.75c-4.556 0-8.25 3.694-8.25 8.25s3.694 8.25 8.25 8.25 8.25-3.694 8.25-8.25S16.556 3.75 12 3.75zm3.805 12.388c-.13.13-.301.195-.472.195-.17 0-.341-.065-.47-.195l-3.334-3.333c-.126-.125-.196-.294-.196-.472V8c0-.369.299-.667.667-.667.368 0 .667.298.667.667v4.057l3.138 3.138c.26.261.26.682 0 .943z"
									transform="translate(-21 -569) translate(21 569)" />
                      </g>
                    </g>
                  </g>
                </svg> <span>Gần đây</span>
					</a></li>
				</ul>
				<ul class="sidebar__nav-list">
					<li class="sidebar__nav-item"><a href="#"
						class="sidebar__item-link"> <span class="sidebar__link-topic">Tháng
								1</span>
					</a></li>
					<li class="sidebar__nav-item"><a href="#"
						class="sidebar__item-link"> <span class="sidebar__link-topic">Tháng
								2</span>
					</a></li>
					<li class="sidebar__nav-item"><a href="#"
						class="sidebar__item-link"> <span class="sidebar__link-topic">Tháng
								7</span>
					</a></li>
				</ul>
			</nav>
			<div class="sidebar__create-playlist">
				<div class="sidebar__create-playlist-container">
					<i class="bi bi-plus-lg"> </i>
					<h2 class="sidebar__create-title">Tạo playlist mới</h2>
				</div>
			</div>
		</aside>
		<!-- Header -->
		<header class="header">
			<div class="header__with-search">
				<button class="header__button">
					<i class="bi bi-arrow-left header__button-icon"></i>
				</button>
				<button class="header__button button--disabled">
					<i class="bi bi-arrow-right header__button-icon"></i>
				</button>
				<div class="header__search">
					<div class="header__search-btn">
						<i class="bi bi-search header__search-icon"></i>
					</div>
					<input type="text"
						placeholder="Nhập tên bài hát, nghệ sĩ hoặc MV ..."
						class="header__search-input" />
					<div class="header__search-history">
						<ul class="header__search-list">
							<li class="header__search-item"><i
								class="bi bi-search header__item-icon"></i> <a href="#"
								class="header__item-link">Tình bạn diệu kì</a></li>
							<li class="header__search-item"><i
								class="bi bi-search header__item-icon"></i> <a href="#"
								class="header__item-link">Gác lại âu lo</a></li>
							<li class="header__search-item"><i
								class="bi bi-search header__item-icon"></i> <a href="#"
								class="header__item-link">Hongkong1</a></li>
							<li class="header__search-item"><i
								class="bi bi-search header__item-icon"></i> <a href="#"
								class="header__item-link">#zingchart</a></li>
							<li class="header__search-item"><i
								class="bi bi-search header__item-icon"></i> <a href="#"
								class="header__item-link">Cheating on you</a></li>
							<li class="header__search-item"><i
								class="bi bi-search header__item-icon"></i> <a href="#"
								class="header__item-link">Black Jack</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="header__nav">
				<ul class="header__nav-list">
					<li class="header__nav-item">
						<div class="header__nav-btn nav-btn--theme">
							<svg width="20" height="20" class="header__nav-icon"
								viewBox="0 0 20 20">
                  <defs>
                    <linearGradient id="j32lhg93hd" x1="62.206%"
									x2="18.689%" y1="70.45%" y2="39.245%">
                      <stop offset="0%" stop-color="#F81212"></stop>
                      <stop offset="100%" stop-color="red"></stop>
                    </linearGradient>
                    <linearGradient id="hjoavsus6g" x1="50%"
									x2="11.419%" y1="23.598%" y2="71.417%">
                      <stop offset="0%" stop-color="#00F"></stop>
                      <stop offset="100%" stop-color="#0031FF"></stop>
                    </linearGradient>
                    <linearGradient id="la1y5u3dvi" x1="65.655%"
									x2="25.873%" y1="18.825%" y2="56.944%">
                      <stop offset="0%" stop-color="#FFA600"></stop>
                      <stop offset="100%" stop-color="orange"></stop>
                    </linearGradient>
                    <linearGradient id="2dsmrlvdik" x1="24.964%"
									x2="63.407%" y1="8.849%" y2="55.625%">
                      <stop offset="0%" stop-color="#13EFEC"></stop>
                      <stop offset="100%" stop-color="#00E8DF"></stop>
                    </linearGradient>
                    <filter id="4a7imk8mze" width="230%" height="230%"
									x="-65%" y="-65%" filterUnits="objectBoundingBox">
                      <feGaussianBlur in="SourceGraphic"
									stdDeviation="3.9"></feGaussianBlur>
                    </filter>
                    <filter id="301mo6jeah" width="312.7%"
									height="312.7%" x="-106.4%" y="-106.4%"
									filterUnits="objectBoundingBox">
                      <feGaussianBlur in="SourceGraphic"
									stdDeviation="3.9"></feGaussianBlur>
                    </filter>
                    <filter id="b2zvzgq7fj" width="295%" height="295%"
									x="-97.5%" y="-97.5%" filterUnits="objectBoundingBox">
                      <feGaussianBlur in="SourceGraphic"
									stdDeviation="3.9"></feGaussianBlur>
                    </filter>
                    <filter id="a1wq161tvl" width="256%" height="256%"
									x="-78%" y="-78%" filterUnits="objectBoundingBox">
                      <feGaussianBlur in="SourceGraphic"
									stdDeviation="3.9"></feGaussianBlur>
                    </filter>
                    <path id="qtpqrj1oda"
									d="M3.333 14.167V5.833l-1.666.834L0 3.333 3.333 0h3.334c.04 1.57.548 2.4 1.524 2.492l.142.008C9.403 2.478 9.958 1.645 10 0h3.333l3.334 3.333L15 6.667l-1.667-.834v8.334h-10z"></path>
                    <path id="jggzvnjgfc" d="M0 0H20V20H0z"></path>
                    <path id="2eiwxjmc7m"
									d="M3.333 14.167V5.833l-1.666.834L0 3.333 3.333 0h3.334c.04 1.57.548 2.4 1.524 2.492l.142.008C9.403 2.478 9.958 1.645 10 0h3.333l3.334 3.333L15 6.667l-1.667-.834v8.334h-10z"></path>
                  </defs>
                  <g fill="none" fill-rule="evenodd"
									transform="translate(2 3)">
                    <mask id="tinejqaasb" fill="#fff">
                      <use xlink:href="#qtpqrj1oda"></use>
                    </mask>
                    <use fill="#FFF" fill-opacity="0"
									xlink:href="#qtpqrj1oda"></use>
                    <g mask="url(#tinejqaasb)">
                      <g transform="translate(-2 -3)">
                        <mask id="uf3ckvfvpf" fill="#fff">
                          <use xlink:href="#jggzvnjgfc"></use>
                        </mask>
                        <use fill="#D8D8D8" xlink:href="#jggzvnjgfc"></use>
                        <circle cx="8.9" cy="6.8" r="9"
									fill="url(#j32lhg93hd)" filter="url(#4a7imk8mze)"
									mask="url(#uf3ckvfvpf)"></circle>
                        <circle cx="9.3" cy="13.7" r="5.5"
									fill="url(#hjoavsus6g)" filter="url(#301mo6jeah)"
									mask="url(#uf3ckvfvpf)"></circle>
                        <circle cx="15.9" cy="6.9" r="6"
									fill="url(#la1y5u3dvi)" filter="url(#b2zvzgq7fj)"
									mask="url(#uf3ckvfvpf)"></circle>
                        <circle cx="16.4" cy="17.7" r="7.5"
									fill="url(#2dsmrlvdik)" filter="url(#a1wq161tvl)"
									mask="url(#uf3ckvfvpf)"></circle>
                      </g>
                    </g>
                    <use fill="#FFF" fill-opacity="0.05"
									xlink:href="#2eiwxjmc7m"></use>
                  </g>
                </svg>
						</div>
					</li>
					<li class="header__nav-item">
						<div class="header__nav-btn">
							<input type="file" name="upload song" id="header__nav-input" />
							<label for="header__nav-input"> <i
								class="bi bi-upload header__nav-icon"></i>
							</label>
						</div>
					</li>
					<li class="header__nav-item">
						<div class="header__nav-btn btn--nav-setting">
							<i class="bi bi-gear header__nav-icon"></i>
							<div class="setting__menu">
								<div class="setting__nav">
									<div class="setting__item">
										<div class="setting__item-content">
											<i class="bi bi-shield-lock setting__item-icon"></i> <span>
												Danh sách chặn</span>
										</div>
									</div>
									<div class="setting__item">
										<div class="setting__item-content">
											<i class="bi bi-badge-hd setting__item-icon"></i> <span>Chất
												lượng âm nhạc</span>
										</div>
										<i class="bi bi-chevron-right setting__item-icon"></i>
									</div>
									<div class="setting__item">
										<div class="setting__item-content">
											<i class="bi bi-play-circle setting__item-icon"></i> <span>Trình
												phát nhạc</span>
										</div>
										<i class="bi bi-chevron-right setting__item-icon"></i>
									</div>
								</div>
								<div class="setting__subnav">
									<div class="setting__item">
										<div class="setting__item-content">
											<i class="bi bi-exclamation-circle setting__item-icon"></i> <span>Giới
												thiệu</span>
										</div>
									</div>
									<div class="setting__item">
										<div class="setting__item-content">
											<i class="bi bi-flag setting__item-icon"></i> <span>Góp
												ý</span>
										</div>
									</div>
									<div class="setting__item">
										<div class="setting__item-content">
											<i class="bi bi-telephone setting__item-icon"></i> <span>Liên
												hệ</span>
										</div>
									</div>
									<div class="setting__item">
										<div class="setting__item-content">
											<i class="bi bi-badge-ad setting__item-icon"></i> <span>Quảng
												cáo</span>
										</div>
									</div>
									<div class="setting__item">
										<div class="setting__item-content">
											<i class="bi bi-file-text setting__item-icon"></i> <span>Thỏa
												thuận sử dụng</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="header__nav-item"><img src="${avatar}" alt="user"
						class="header__nav-btn" /></li>
				</ul>
			</div>
		</header>





		<div class="app__container tab--personal active">
			<div class="app__header">
				<div class="app__header-bg"
					style="background: url(${avatar}) no-repeat center center/cover;"></div>
				<div class="app__header-overlay"></div>
				<div class="app__header-container">
					<div class="app__header-user">
						<div class="app__user-avatar">
							<img src="${avatar}" alt="Đây là avatar" class="app__user-img" />
						</div>
						<span class="app__user-name">${user.getName() }</span>
					</div>
					<div class="app__header-actions">
						<a href="" class="vip-btn is-small button button-gold">Mua vip
							ngay</a> <a href="" class="vip-code-btn is-small button">Nhập
							code vip</a> <a href="#" class="app__header-options options--logout">

							<i class="bi bi-three-dots"></i> <a href="${urlLog}"
							class="option__log-out"> <i
								class="bi bi-box-arrow-left log-in__icon"></i> <span>${log}
							</span>
						</a> <c:choose>
								<c:when test="${user!=null&&user.isRole()}">
									<a class="option__management" href="songs.jsp"> <i
										class="bi bi-box-arrow-left log-in__icon"></i> <span>Quản
											Lý </span>
									</a>
								</c:when>
							</c:choose>
						</a>
					</div>
				</div>
			</div>
			<!-- Content -->
			<div class="content">
				<div class="content__navbar">
					<ul class="content__navbar-menu">
						<li class="content__navbar-item active">Tổng quan</li>
						<li class="content__navbar-item">Bài hát</li>
						<li class="content__navbar-item">Playlist</li>
						<li class="content__navbar-item">Album</li>
						<li class="content__navbar-item">MV</li>
						<li class="content__navbar-item">Nghệ sĩ</li>
						<li class="content__navbar-item">Tải lên</li>
					</ul>
				</div>
				<div class="content__container">
					<!-- Tab home -->
					<div class="container__tab tab-home active">
						<!-- Play music -->
						<div class="container__control">
							<div class="container__header">
								<a href="" class="container__header-title">
									<h3>Bài hát&nbsp;</h3> <i
									class="bi bi-chevron-right container__header-icon"></i>
								</a>
								<div class="container__header-actions">
									<div class="button is-small container__header-btn">
										<input type="file" class="container__header-input"
											name="upload song" id="home__upload-input" /> <label
											for="home__upoad-input" class="container__header-label">
											<i class="bi bi-upload container__header-icon"></i> <span>Tải
												lên</span>
										</label>
									</div>
									<button
										class="
                        button button-primary
                        container__header-btn
                        btn--play-all
                      ">
										<i class="bi bi-play-fill container__header-icon"></i> <span>Phát
											tất cả</span>
									</button>
								</div>
							</div>
							<div class="container__playmusic">
								<div class="container__slide">
									<div class="container__slide-show">
										<div class="container__slide-item first">
											<div
												style="background: url('./assets/img/slides/slide1.jpg') no-repeat center center/cover;"
												class="container__slide-img"></div>
										</div>
										<div class="container__slide-item second">
											<div
												style="background: url('./assets/img/slides/slide2.jpg') no-repeat center center/cover;"
												class="container__slide-img"></div>
										</div>
										<div class="container__slide-item third">
											<div
												style="background: url('./assets/img/slides/slide3.jpg') no-repeat center center/cover;"
												class="container__slide-img"></div>
										</div>
										<c:forEach var="i" begin="4" end="14">
											<div class="container__slide-item fourth">
												<div
													style="background: url('./assets/img/slides/slide${i}.jpg') no-repeat center center/cover;"
													class="container__slide-img"></div>
											</div>
										</c:forEach>
									</div>
								</div>
								<div class="container__playlist">
									<div class="playlist__list">
										<!-- 1 -->
										<div class="playlist__list-song media active" data-index="0"
											src="./assets/music/listSong2/song1.mp3"
											onclick="changeSong(0)">
											<div class="playlist__song-info media__left">
												<div class="playlist__song-thumb media__thumb mr-10"
													style="background: url('./assets/img/music/listSong2/song1.jpg') no-repeat center center/cover;">
													<div class="play-song--actions">
														<div class="control-btn btn-toggle-play btn--play-song">
															<i class="bi bi-play-fill none-border"></i>
														</div>
													</div>
												</div>
												<div class="playlist__song-body media__info">
													<span class="playlist__song-title info__title"> Rồi
														tới luôn </span>
													<p class="playlist__song-author info__author">
														<a href="#" class="is-ghost">Nal</a>
													</p>
												</div>
											</div>
											<span class="playlist__song-time media__content">04:02</span>
											<div class="playlist__song-option media__right">
												<div class="playlist__song-btn btn--mic option-btn">
													<i class="btn--icon song__icon bi bi-mic-fill"></i>
												</div>
												<div
													class="
                              playlist__song-btn
                              song-btn--heart
                              option-btn
                            ">
													<i
														class="
                                btn--icon
                                song__icon
                                icon--heart
                                bi bi-heart-fill
                                primary
                              "></i>
												</div>
												<div class="playlist__song-btn option-btn">
													<i class="btn--icon bi bi-three-dots"></i>
												</div>
											</div>
										</div>

										<%
										SongDAOImpl test = new SongDAOImpl();
										request.setAttribute("listSong", test.all());
										%>
										<c:set var="listSong" value="${requestScope.listSong}"></c:set>
										<c:forEach var="item" items="${listSong}" begin="0" end="8"
											varStatus="loop">
											<div class="playlist__list-song media"
												data-index="${loop.index+1 }" src="${item.getLinkSong()} "
												onclick="changeSong(${loop.index+1 })">
												<div class="playlist__song-info media__left">
													<div class="playlist__song-thumb media__thumb mr-10"
														style="background: url('${item.getLinkImage()}') no-repeat center center/cover;">
														<div class="play-song--actions">
															<div class="control-btn btn-toggle-play btn--play-song">
																<i class="bi bi-play-fill none-border"></i>
															</div>
														</div>
													</div>
													<div class="playlist__song-body media__info">
														<span class="playlist__song-title info__title">
															${item.getNameSong()} </span>
														<p class="playlist__song-author info__author">
															<a href="#" class="is-ghost">${item.getNameArtist()}</a>
														</p>
													</div>
												</div>
												<span class="playlist__song-time media__content">${item.getTime1()}</span>
												<div class="playlist__song-option media__right">
													<div class="playlist__song-btn btn--mic option-btn">
														<i class="btn--icon song__icon bi bi-mic-fill"></i>
													</div>
													<div
														class="
                              playlist__song-btn
                              song-btn--heart
                              option-btn
                            ">
														<i
															class="
                                btn--icon
                                song__icon
                                icon--heart
                                bi bi-heart-fill
                                primary
                              "></i>
													</div>
													<div class="playlist__song-btn option-btn">
														<i class="btn--icon bi bi-three-dots"></i>
													</div>
												</div>
											</div>

										</c:forEach>

									</div>
								</div>
							</div>
						</div>


						<!-- Playlist -->
						<div class="container__section mb-5">
							<div class="container__header">
								<a href="" class="container__header-title">
									<h3>Playlist&nbsp;</h3> <i
									class="bi bi-chevron-right container__header-icon"></i>
								</a>
								<div class="container__header-actions">
									<div
										class="
                        container__move-btn
                        move-btn--playlist
                        button--disabled
                      ">
										<i class="bi bi-chevron-left container__move-btn-icon"></i>
									</div>
									<div class="container__move-btn move-btn--playlist">
										<i class="bi bi-chevron-right container__move-btn-icon"></i>
									</div>
								</div>
							</div>
							<div class="row__wrapper">
								<div class="row playlist--container no-wrap">
									<!-- 1 -->
									<div class="row__item-wrapper">
										<div class="row__item playlist--create item--playlist">
											<div
												class="row__item-container flex--center item-create--properties">
												<i class="bi bi-plus-lg album__create-icon"></i> <span
													class="album__create-annotate text-center">Tạo
													playlist mới</span>
											</div>
										</div>
									</div>

									<%
									PlaylistDAOImpl playlistDAO = new PlaylistDAOImpl();
									request.setAttribute("playlists", playlistDAO.all());
									%>

									<c:set var="playlists" value="${requestScope.playlists}"></c:set>
									<c:forEach var="item" items="${playlists}" begin="0" end="18"
										varStatus="loop">
										<!-- 2 -->
										<div class="row__item-wrapper">
											<div class="row__item item--playlist">
												<div class="row__item-container flex--top-left">
													<div class="row__item-display br-5">
														<div class="row__item-img img-square"
															style="background: url('${item.getLinkImage()}') no-repeat center center/cover">
														</div>
														<div class="row__item-actions">
															<div class="action-btn btn--heart">
																<i
																	class="btn--icon icon--heart bi bi-heart-fill primary"></i>
															</div>
															<div class="action-btn btn--play-playlist">
																<div class="control-btn btn-toggle-play">
																	<i class="bi bi-play-fill"></i>
																</div>
															</div>
															<div class="action-btn">
																<i class="btn--icon bi bi-three-dots"></i>
															</div>
														</div>
														<div class="overlay"></div>
													</div>

													<div class="row__item-info">
														<a href="" class="row__info-name is-two">${item.getNamePlaylist() }</a>
														<h3 class="row__info-create">${item.getNameCreator()}</h3>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>

						<!-- Album -->
						<div class="container__section mb-5">
							<div class="container__header">
								<a href="" class="container__header-title">
									<h3>Album&nbsp;</h3> <i
									class="bi bi-chevron-right container__header-icon"></i>
								</a>
								<div class="container__header-actions">
									<div
										class="
                        container__move-btn
                        move-btn--album
                        button--disabled
                      ">
										<i class="bi bi-chevron-left container__move-btn-icon"></i>
									</div>
									<div class="container__move-btn move-btn--album">
										<i class="bi bi-chevron-right container__move-btn-icon"></i>
									</div>
								</div>
							</div>
							<div class="row__wrapper">
								<div class="row  album--container no-wrap">
									<!-- 1 -->
									<div class="row__item-wrapper">
										<div class="row__item  item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album1.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>
												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Golden housr</a>

												</div>
											</div>
										</div>
									</div>
									<!-- 2 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album2.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>
												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Boy cold (Mini
														Album)</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 3 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album3.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>
												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Red</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 4 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album4.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Người yêu cũ
														(Gửi cho anh 2) (Mini Album)</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 5 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album5.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>
												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Querecia (Mini
														Album)</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 6 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album6.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Justice (Mini
														Album)</a>

												</div>
											</div>
										</div>
									</div>
									<!-- 7 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album7.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Teenage Dream</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 8 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album8.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">The Off Season</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 9 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album9.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two"> The Album </a>
												</div>
											</div>
										</div>
									</div>
									<!-- 10 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album10.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>
												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Random Access
														Memories</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 11 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album11.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Map Of the
														Sould: 7</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 12 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album12.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Chromatica</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 13 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album13.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">My Turn</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 14 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album14.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Meet the woo 2</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 15 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album15.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Meet the woo 2</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>















































						<!-- Mv -->
						<div class="container__section mb-5">
							<div class="container__header">
								<a href="" class="container__header-title">
									<h3>MV&nbsp;</h3> <i
									class="bi bi-chevron-right container__header-icon"></i>
								</a>
								<div class="container__header-actions">
									<div
										class="
                        container__move-btn
                        move-btn--mv
                        button--disabled
                      ">
										<i class="bi bi-chevron-left container__move-btn-icon"></i>
									</div>
									<div class="container__move-btn move-btn--mv">
										<i class="bi bi-chevron-right container__move-btn-icon"></i>
									</div>
								</div>
							</div>
							<div class="row__wrapper">
								<div class="row  mv--container no-wrap">
									<%
									MVDAOImpl mvDao = new MVDAOImpl();
									request.setAttribute("listMV", mvDao.all());
									%>
									<c:set var="listMV" value="${requestScope.listMV}"></c:set>
									<c:forEach var="item" items="${listMV}" begin="0" end="13"
										varStatus="loop">
										<!-- 1 -->
										<div class="row__item-wrapper mv">
											<div class="row__item  item--mv">
												<div class="row__item-container flex--top-left">
													<div class="row__item-display br-5">
														<div class="row__item-img  img--mv"
															style="background: url('${item.getImageMV()}') no-repeat center center/cover">
														</div>
														<div class="row__item-actions">
															<div class="action-btn btn--play-playlist">
																<div class="control-btn btn-toggle-play">
																	<i class="bi bi-play-fill"></i>
																</div>
															</div>
														</div>
														<div class="mv__time">${item.getTimeMV1() }</div>
														<div class="overlay"></div>
													</div>
													<div class="row__item-info media">
														<div class="media__left">
															<div class="media__thumb is-round"
																style="background: url('${item.getMainArtist().getLinkImage()}') no-repeat center center/cover"></div>
														</div>
														<div class="media__info">
															<span class="info__title is-activ is-two">${item.getNameMV() }
															</span>
															<p class="info__author">
																<c:set var="listArtist" value="${item.getArtist()}"></c:set>
																<c:forEach var="artist" items="${listArtist}">
																	<a href="#" class="is-ghost">
																		${artist.getNameArtrist() } </a>
																</c:forEach>
															</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>













						<!-- Artist-->
						<div class="container__section">
							<div class="container__header">
								<a href="" class="container__header-title">
									<h3>Nghệ sĩ&nbsp;</h3> <i
									class="bi bi-chevron-right container__header-icon"></i>
								</a>
								<div class="container__header-actions">
									<div
										class="
                        container__move-btn
                        move-btn--artist
                        button--disabled
                      ">
										<i class="bi bi-chevron-left container__move-btn-icon"></i>
									</div>
									<div class="container__move-btn move-btn--artist">
										<i class="bi bi-chevron-right container__move-btn-icon"></i>
									</div>
								</div>
							</div>
							<div class="row__wrapper">
								<div class="row  artist--container no-wrap">
									<%
									ArtristDAOImpl artistDao = new ArtristDAOImpl();
									request.setAttribute("listArtist", artistDao.all());
									%>
									<c:set var="listArtist" value="${requestScope.listArtist}"></c:set>
									<c:forEach var="item" items="${listArtist}" begin="0" end="9"
										varStatus="loop">
										<!-- 1 -->
										<div class="row__item-wrapper">
											<div class="row__item  item--artist is-rounded">
												<div class="row__item-container flex--top-left">
													<div class="row__item-display br-5 is-round">
														<div class="row__item-img img-square"
															style="background: url('${item.getLinkImage()}') no-repeat center center/contain">
														</div>
														<div class="row__item-actions">
															<div class="action-btn btn--play-playlist">
																<div class="control-btn btn-toggle-play">
																	<i class="bi bi-play-fill"></i>
																</div>
															</div>
														</div>
														<div class="overlay"></div>
													</div>
													<div class="row__item-info media artist--info">
														<div class="media__left">
															<div class="row__info-name is-ghost mt-15">
																${item.getNameArtrist()} <i
																	class="bi bi-star-fill row__info-icon"></i>
															</div>
															<div class="row__info-creator">${item.getNumFollow()}K
																quan tâm</div>
														</div>
													</div>
													<div class="row__item-btn">
														<button class="button is-small button-primary">
															<i class="bi bi-check2"></i> <span>&nbsp;Đã quan
																tâm</span>
														</button>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>

								</div>
							</div>
						</div>
					</div>


					<!-- Tab song -->






					<%-- 	<c:set var="listSong" value="${requestScope.listSong}"></c:set> --%>
					<div class="container__tab tab-song">
						<div class="container__header mb-10">
							<a href="#" class="container__header-title">
								<h3>Bài hát</h3>
							</a>
							<div class="container__header-actions">
								<div class="button is-small container__header-btn">
									<input type="file" class="container__header-input"
										name="upload song" id="home__upload-input" /> <label
										for="home__upoad-input" class="container__header-label">
										<i class="bi bi-upload container__header-icon"></i> <span>Tải
											lên</span>
									</label>
								</div>
								<button
									class="
                  button button-primary
                  container__header-btn
                  btn--play-all
                ">
									<i class="bi bi-play-fill container__header-icon"></i> <span>Phát
										tất cả</span>
								</button>
							</div>
						</div>
						<div class="container__playlist">
							<div class="playlist__header mt-5">
								<span class="playlist__header-title">Bài hát</span> <span
									class="playlist__header-time">Thời gian</span>
							</div>
							<div class="playlist__list">



								<!-- 1 -->
								<div class="playlist__list-song media active" data-index="0"
									src="./assets/music/listSong2/song1.mp3"
									onclick="changeSong(0)">
									<div class="playlist__song-info media__left">
										<div class="playlist__song-check">
											<input type="checkbox" id="playlist__check-0" class="mr-10"
												style="display: none" /> <label for="playlist__check-0"></label>
										</div>
										<i class="bi bi-music-note-beamed mr-10"></i>
										<div class="playlist__song-thumb media__thumb mr-10"
											style="background: url('./assets/img/music/listSong2/song1.jpg') no-repeat center center/cover;">
											<div class="play-song--actions">
												<div class="control-btn btn-toggle-play btn--play-song">
													<i class="bi bi-play-fill none-border"></i>
												</div>
											</div>
										</div>
										<div class="playlist__song-body media__info">
											<span class="playlist__song-title info__title"> Rồi
												tới luôn </span>
											<p class="playlist__song-author info__author">
												<a href="#" class="is-ghost">Nal</a>
											</p>
										</div>
									</div>
									<span class="playlist__song-time media__content">04:02</span>
									<div class="playlist__song-option media__right">
										<div class="playlist__song-btn btn--mic option-btn">
											<i class="btn--icon song__icon bi bi-mic-fill"></i>
										</div>
										<div
											class="
                        playlist__song-btn
                        song-btn--heart
                        option-btn
                      ">
											<i
												class="
                          btn--icon
                          song__icon
                          icon--heart
                          bi bi-heart-fill
                          primary
                        "></i>
										</div>
										<div class="playlist__song-btn option-btn">
											<i class="btn--icon bi bi-three-dots"></i>
										</div>
									</div>
								</div>
								<!-- 2 -->
								<c:forEach var="item" items="${listSong}" begin="0"
									varStatus="loop">
									<div class="playlist__list-song media"
										data-index="${loop.index+1}" src="${item.getLinkSong()}"
										onclick="changeSong(${loop.index+1 })">
										<div class="playlist__song-info media__left">
											<div class="playlist__song-check">
												<input type="checkbox" id="playlist__check-1" class="mr-10"
													style="display: none" /> <label for="playlist__check-1"></label>
											</div>
											<i class="bi bi-music-note-beamed mr-10"></i>
											<div class="playlist__song-thumb media__thumb mr-10"
												style="background: url('${item.getLinkImage() }') no-repeat
												center center/cover;">
												<div class="play-song--actions">
													<div class="control-btn btn-toggle-play btn--play-song">
														<i class="bi bi-play-fill none-border"></i>
													</div>
												</div>
											</div>
											<div class="playlist__song-body media__info">
												<span class="playlist__song-title info__title">${item.getNameSong() }
												</span>
												<p class="playlist__song-author info__author">
													<a href="#" class="is-ghost">${item.getNameArtist() }</a>
												</p>
											</div>
										</div>
										<span class="playlist__song-time media__content">${item.getTime1()}</span>
										<div class="playlist__song-option media__right">
											<div class="playlist__song-btn btn--mic option-btn">
												<i class="btn--icon song__icon bi bi-mic-fill"></i>
											</div>
											<div
												class="
                        playlist__song-btn
                        song-btn--heart
                        option-btn
                      ">
												<i
													class="
                          btn--icon
                          song__icon
                          icon--heart
                          bi bi-heart-fill
                          primary
                        "></i>
											</div>
											<div class="playlist__song-btn option-btn">
												<i class="btn--icon bi bi-three-dots"></i>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>



					<!-- Tab playlist -->
					<div class="container__tab tab-playlist">
						<div class="container__section mb-5">
							<div class="container__header">
								<a href="" class="container__header-title">
									<h3>Playlist&nbsp;</h3> <i
									class="bi bi-chevron-right container__header-icon"></i>
								</a>
								<div class="container__header-actions">
									<div
										class="
                        container__move-btn
                        move-btn--playlist
                        button--disabled
                      ">
										<i class="bi bi-chevron-left container__move-btn-icon"></i>
									</div>
									<div class="container__move-btn move-btn--playlist">
										<i class="bi bi-chevron-right container__move-btn-icon"></i>
									</div>
								</div>
							</div>
							<div class="row__wrapper">
								<div class="row playlist--container no-wrap">
									<!-- 1 -->
									<div class="row__item-wrapper">
										<div class="row__item playlist--create item--playlist">
											<div
												class="row__item-container flex--center item-create--properties">
												<i class="bi bi-plus-lg album__create-icon"></i> <span
													class="album__create-annotate text-center">Tạo
													playlist mới</span>
											</div>
										</div>
									</div>
									<!-- 2 -->



									<c:choose>
										<c:when test="${user==null ||user.getPlaylists()==null }">
											<%
											PlaylistDAOImpl playlistDao = new PlaylistDAOImpl();
											request.setAttribute("playlists", playlistDao.all());
											%>
											<c:set var="playlists" value="${requestScope.playlists}"></c:set>
										</c:when>
										<c:otherwise>
											<c:set var="playlists" value="${user.getPlaylists()}"></c:set>
										</c:otherwise>
									</c:choose>
									<c:forEach var="item" items="${playlists}">
										<div class="row__item-wrapper">
											<div class="row__item item--playlist">
												<div class="row__item-container flex--top-left">
													<div class="row__item-display br-5">
														<div class="row__item-img img-square"
															style="background: url('${item.getLinkImage()}') no-repeat center center/cover">
														</div>
														<div class="row__item-actions">
															<div class="action-btn btn--heart">
																<i
																	class="btn--icon icon--heart bi bi-heart-fill primary"></i>
															</div>
															<div class="action-btn btn--play-playlist">
																<div class="control-btn btn-toggle-play">
																	<i class="bi bi-play-fill"></i>
																</div>
															</div>
															<div class="action-btn">
																<i class="btn--icon bi bi-three-dots"></i>
															</div>
														</div>
														<div class="overlay"></div>
													</div>

													<div class="row__item-info">
														<a href="" class="row__info-name is-two">${item.getNamePlaylist()}</a>
														<h3 class="row__info-create">${item.getNameCreator()}</h3>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>






























					<!-- Tab Album -->
					<div class="container__tab tab-album">
						<div class="container__section mb-5">
							<div class="container__header">
								<a href="" class="container__header-title">
									<h3>Album&nbsp;</h3> <i
									class="bi bi-chevron-right container__header-icon"></i>
								</a>
								<div class="container__header-actions">
									<div
										class="
                      container__move-btn
                      move-btn--album
                      button--disabled
                    ">
										<i class="bi bi-chevron-left container__move-btn-icon"></i>
									</div>
									<div class="container__move-btn move-btn--album">
										<i class="bi bi-chevron-right container__move-btn-icon"></i>
									</div>
								</div>
							</div>
							<div class="row__wrapper">
								<div class="row  album--container no-wrap">
									<!-- 1 -->
									<div class="row__item-wrapper">
										<div class="row__item  item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album1.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>
												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Golden housr</a>

												</div>
											</div>
										</div>
									</div>
									<!-- 2 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album2.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>
												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Boy cold (Mini
														Album)</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 3 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album3.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>
												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Red</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 4 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album4.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Người yêu cũ
														(Gửi cho anh 2) (Mini Album)</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 5 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album5.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>
												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Querecia (Mini
														Album)</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 6 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album6.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Justice (Mini
														Album)</a>

												</div>
											</div>
										</div>
									</div>
									<!-- 7 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album7.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Teenage Dream</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 8 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album8.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">The Off Season</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 9 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album9.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two"> The Album </a>
												</div>
											</div>
										</div>
									</div>
									<!-- 10 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album10.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>
												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Random Access
														Memories</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 11 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album11.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Map Of the
														Sould: 7</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 12 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album12.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Chromatica</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 13 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album13.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">My Turn</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 14 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album14.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Meet the woo 2</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 15 -->
									<div class="row__item-wrapper">
										<div class="row__item item--album">
											<div class="row__item-container flex--top-left">
												<div class="row__item-display br-5">
													<div class="row__item-img img-square"
														style="background: url('./assets/img/albums/album15.jpg') no-repeat center center/cover">
													</div>
													<div class="row__item-actions">
														<div class="action-btn btn--heart">
															<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
														</div>
														<div class="action-btn btn--play-playlist">
															<div class="control-btn btn-toggle-play">
																<i class="bi bi-play-fill"></i>
															</div>
														</div>
														<div class="action-btn">
															<i class="btn--icon bi bi-three-dots"></i>
														</div>
													</div>
													<div class="overlay"></div>
												</div>

												<div class="row__item-info">
													<a href="" class="row__info-name is-two">Meet the woo 2</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>




























					<!-- Tab MV -->
					<div class="container__tab tab-mv">
						<div class="container__section mb-5">
							<div class="container__header">
								<a href="" class="container__header-title">
									<h3>MV&nbsp;</h3> <i
									class="bi bi-chevron-right container__header-icon"></i>
								</a>
								<div class="container__header-actions">
									<div
										class="
                        container__move-btn
                        move-btn--mv
                        button--disabled
                      ">
										<i class="bi bi-chevron-left container__move-btn-icon"></i>
									</div>
									<div class="container__move-btn move-btn--mv">
										<i class="bi bi-chevron-right container__move-btn-icon"></i>
									</div>
								</div>
							</div>
							<div class="row__wrapper">
								<div class="row  mv--container no-wrap">
									<!-- 1 -->
									<c:forEach var="item" items="${listMV}">
										<div class="row__item-wrapper mv">
											<div class="row__item  item--mv">
												<div class="row__item-container flex--top-left">
													<div class="row__item-display br-5">
														<div class="row__item-img  img--mv"
															style="background: url('${item.getImageMV()}') no-repeat center center/cover">
														</div>
														<div class="row__item-actions">
															<div class="action-btn btn--play-playlist">
																<div class="control-btn btn-toggle-play">
																	<i class="bi bi-play-fill"></i>
																</div>
															</div>
														</div>
														<div class="mv__time">${item.getTimeMV1() }</div>
														<div class="overlay"></div>
													</div>
													<div class="row__item-info media">
														<div class="media__left">
															<div class="media__thumb is-round"
																style="background: url('${item.getMainArtist().getLinkImage()}') no-repeat center center/cover"></div>
														</div>
														<div class="media__info">
															<span class="info__title is-activ is-two">${item.getNameMV() }
															</span>
															<p class="info__author">
																<c:set var="listArtistOfSong"
																	value="${item.getArtist()}"></c:set>
																<c:forEach var="artist" items="${listArtistOfSong}">
																	<a href="#" class="is-ghost">
																		${artist.getNameArtrist() } </a>
																</c:forEach>
															</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<!-- Tab Artist -->
					<div class="container__tab tab-artist">
						<div class="container__section">
							<div class="container__header">
								<a href="" class="container__header-title">
									<h3>Nghệ sĩ&nbsp;</h3> <i
									class="bi bi-chevron-right container__header-icon"></i>
								</a>
								<div class="container__header-actions">
									<div
										class="
                        container__move-btn
                        move-btn--artist
                        button--disabled
                      ">
										<i class="bi bi-chevron-left container__move-btn-icon"></i>
									</div>
									<div class="container__move-btn move-btn--artist">
										<i class="bi bi-chevron-right container__move-btn-icon"></i>
									</div>
								</div>
							</div>
							<div class="row__wrapper">
								<div class="row  artist--container no-wrap">
									<!-- 1 -->
									<c:forEach var="item" items="${listArtist}" begin="0" end="16">
										<div class="row__item-wrapper">
											<div class="row__item  item--artist is-rounded">
												<div class="row__item-container flex--top-left">
													<div class="row__item-display br-5 is-round">
														<div class="row__item-img img-square"
															style="background: url('${item.getLinkImage()}') no-repeat center center/contain">
														</div>
														<div class="row__item-actions">
															<div class="action-btn btn--play-playlist">
																<div class="control-btn btn-toggle-play">
																	<i class="bi bi-play-fill"></i>
																</div>
															</div>
														</div>
														<div class="overlay"></div>
													</div>
													<div class="row__item-info media artist--info">
														<div class="media__left">
															<div class="row__info-name is-ghost mt-15">
																${item.getNameArtrist()} <i
																	class="bi bi-star-fill row__info-icon"></i>
															</div>
															<div class="row__info-creator">${item.getNumFollow()}K
																quan tâm</div>
														</div>
													</div>
													<div class="row__item-btn">
														<button class="button is-small button-primary">
															<i class="bi bi-check2"></i> <span>&nbsp;Đã quan
																tâm</span>
														</button>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<!-- Tab upload -->
					<div class="container__tab tab-upload">
						<div class="container__section row">
							<div class="container__header">
								<a class="container__header-title">
									<h3>Danh sách tải lên</h3>
								</a>
							</div>
							<div class="box--no-content">
								<div class="no-content-image"></div>
								<span class="no-content-text">Không có bài hát tải lên</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Player -->
			<div class="player">
				<div class="player__container">
					<div class="player__container-song">
						<div class="player__song-info media">
							<div class="media__left">
								<div class="player__song-thumb media__thumb note-1">
									<div class="thumb-img"
										style="background: url('./assets/img/music/listSong2/song1.jpg') center center/cover no-repeat"></div>
									<svg fill="#fff" viewBox="0 0 512 512"
										class="thumb-note note-1">
                      <path
											d="M470.38 1.51L150.41 96A32 32 0 0 0 128 126.51v261.41A139 139 0 0 0 96 384c-53 0-96 28.66-96 64s43 64 96 64 96-28.66 96-64V214.32l256-75v184.61a138.4 138.4 0 0 0-32-3.93c-53 0-96 28.66-96 64s43 64 96 64 96-28.65 96-64V32a32 32 0 0 0-41.62-30.49z"></path>
                    </svg>
									<svg fill="#fff" viewBox="0 0 384 512"
										class="thumb-note note-2">
                      <path
											d="M310.94 1.33l-96.53 28.51A32 32 0 0 0 192 60.34V360a148.76 148.76 0 0 0-48-8c-61.86 0-112 35.82-112 80s50.14 80 112 80 112-35.82 112-80V148.15l73-21.39a32 32 0 0 0 23-30.71V32a32 32 0 0 0-41.06-30.67z"></path>
                    </svg>
									<svg fill="#fff" viewBox="0 0 512 512"
										class="thumb-note note-3">
                      <path
											d="M470.38 1.51L150.41 96A32 32 0 0 0 128 126.51v261.41A139 139 0 0 0 96 384c-53 0-96 28.66-96 64s43 64 96 64 96-28.66 96-64V214.32l256-75v184.61a138.4 138.4 0 0 0-32-3.93c-53 0-96 28.66-96 64s43 64 96 64 96-28.65 96-64V32a32 32 0 0 0-41.62-30.49z"></path>
                    </svg>
									<svg fill="#fff" viewBox="0 0 384 512"
										class="thumb-note note-4">
                      <path
											d="M310.94 1.33l-96.53 28.51A32 32 0 0 0 192 60.34V360a148.76 148.76 0 0 0-48-8c-61.86 0-112 35.82-112 80s50.14 80 112 80 112-35.82 112-80V148.15l73-21.39a32 32 0 0 0 23-30.71V32a32 32 0 0 0-41.06-30.67z"></path>
                    </svg>
								</div>
							</div>
							<div class="media__content">
								<div class="player__song-body media__info">
									<div class="player__song-title info__title">
										<div class="player__title-animate">
											<div class="title__item">Rồi Tới Luôn</div>
										</div>
									</div>
									<div class="player__song-author info__author">
										<a href="#" class="is-ghost">Nal</a>
									</div>
								</div>
							</div>
							<div class="media__right">
								<div class="player__song-options">
									<div class="player__song-btn option-btn btn--heart">
										<i class="btn--icon icon--heart bi bi-heart-fill primary"></i>
									</div>
									<div class="player__song-btn option-btn">
										<i class="btn--icon bi bi-three-dots"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="player__control">
						<div class="player__control-btn">
							<div class="control-btn btn-random is-small">
								<i class="bi bi-shuffle"></i>
							</div>
							<div class="control-btn btn-prev">
								<i class="bi bi-skip-start-fill"></i>
							</div>
							<div class="control-btn btn-toggle-play btn--play-song is-medium">
								<i class="bi bi-play-fill icon-play"></i>
							</div>
							<div class="control-btn btn-next">
								<i class="bi bi-skip-end-fill"></i>
							</div>
							<div class="control-btn btn-repeat is-small">
								<i class="bi bi-arrow-repeat"></i>
							</div>
						</div>
						<div class="progress-block">
							<span class="tracktime">00:00</span> <input type="range"
								class="progress" id="progress--main" value="0" step="1" min="0"
								max="100" />
							<div class="progress__track song--track">
								<div class="progress__track-update"></div>
							</div>
							<span class="durationtime">--:--</span>
						</div>
					</div>
					<div class="player__options">
						<div class="player__options-container">
							<div class="player__options-btn option-btn">
								<i class="bi bi-camera-video btn--icon"></i>
							</div>
							<div class="player__options-btn option-btn">
								<i class="bi bi-mic btn--icon"></i>
							</div>
							<div class="player__options-btn volume option-btn">
								<i class="bi bi-volume-up btn--icon"></i>
							</div>
							<div class="player__volume-progress">
								<div class="progress__track volume--track">
									<div class="progress__track-update"></div>
								</div>
							</div>
							<div class="player__list-icon">
								<i class="bi bi-music-note-list"></i>
							</div>
						</div>
					</div>
					<audio id="audio" src="./assets/music/listSong1/song5.mp3"></audio>
				</div>
			</div>
		</div>
	</div>
	<!-- Theme -->
	<div class="modal-theme">
		<div class="modal-container">
			<div class="modal__close-btn">
				<i class="bi bi-x-lg close close__btn-icon"></i>
			</div>
			<div class="theme__header">
				<h3 class="theme__header-title">Giao diện</h3>
			</div>
			<div class="theme__content">
				<div class="theme__container">
					<div class="theme__list">
						<div class="theme__container-info">
							<h3 class="theme__info-name">Chủ đề</h3>
						</div>
						<!-- 1 -->
						<div class="theme__container-wrapper">
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme1/theme1.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Zing Music Awards</div>
								</div>
							</div>
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme1/theme2.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Tháp Eiffel</div>
								</div>
							</div>
						</div>
						<!-- 2 -->
					</div>
					<div class="theme__list">
						<div class="theme__container-info">
							<h3 class="theme__info-name">Nghệ sĩ</h3>
						</div>
						<!-- 1 -->
						<div class="theme__container-wrapper">
							<!-- 1 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme2/theme1.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Rosé</div>
								</div>
							</div>
							<!-- 2 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme2/theme2.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">IU</div>
								</div>
							</div>
							<!-- 3 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme2/theme3.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Ji Chang Wook</div>
								</div>
							</div>
							<!-- 4 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme2/theme4.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Lisa</div>
								</div>
							</div>
							<!-- 5 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme2/theme5.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Jennie Kim</div>
								</div>
							</div>
							<!-- 6 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme2/theme6.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Jisoo</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 3 -->
					<div class="theme__list">
						<div class="theme__container-info">
							<h3 class="theme__info-name">Màu tối</h3>
						</div>
						<!-- 1 -->
						<div class="theme__container-wrapper">
							<!-- 1 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme3/theme1.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Tối</div>
								</div>
							</div>
							<!-- 2 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme3/theme2.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Tím</div>
								</div>
							</div>
							<!-- 3 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme3/theme3.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Xanh đậm</div>
								</div>
							</div>
							<!-- 4 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme3/theme4.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Xanh biển</div>
								</div>
							</div>
							<!-- 5 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme3/theme5.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Xanh lá</div>
								</div>
							</div>
							<!-- 6 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme3/theme5.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Nâu</div>
								</div>
							</div>
							<!-- 7 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme3/theme7.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Hồng</div>
								</div>
							</div>
							<!-- 8 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme3/theme8.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Đỏ</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 4 -->
					<div class="theme__list">
						<div class="theme__container-info">
							<h3 class="theme__info-name">Màu sáng</h3>
						</div>
						<!-- 1 -->
						<div class="theme__container-wrapper">
							<!-- 1 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme4/theme1.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Sáng</div>
								</div>
							</div>
							<!-- 2 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme4/theme2.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Xám</div>
								</div>
							</div>
							<!-- 3 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme4/theme3.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Xanh nhạt</div>
								</div>
							</div>
							<!-- 4 -->
							<div class="theme__container-item">
								<div class="theme__item-display row__item-display">
									<div class="theme__item-img row__item-img"
										style="background: url('./assets/img/modalThemes/modalTheme4/theme4.jpg') no-repeat center center/cover"></div>
									<div class="overlay"></div>
									<div class="theme__item-actions">
										<button
											class="button theme__actions-btn btn--apply-theme button-primary">
											<span class="theme__btn-title">Áp dụng</span>
										</button>
										<button class="button theme__actions-btn btn--preview">
											<span class="theme__btn-title">Xem trước</span>
										</button>
									</div>
								</div>
								<div class="theme__item-info">
									<div class="theme__item-name">Hồng cánh sen</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Toast -->
	<div id="toast"></div>
	<script src="./assets/js/main.js"></script>
	<script src="./assets/js/playMusic.js"></script>
	<script src="./assets/js/toast.js"></script>
	<!-- 	<script src="./assets/js/scrollBar.js"></script> -->
</body>

</html>