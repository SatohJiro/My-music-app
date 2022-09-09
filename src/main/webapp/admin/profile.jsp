<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dao.Entity.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="apple-touch-icon" sizes="76x76"
	href="./assets/img/apple-icon.png" />
<link rel="icon" type="image/png" href="./assets/img/favicon.png" />
<title>Zing mp3</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<!-- Nucleo Icons -->

<!-- Popper -->
<script src="https://unpkg.com/@popperjs/core@2"></script>
<!-- Main Styling -->
<link
	href="${pageContext.request.contextPath}/assets/css/admin-styles.css"
	rel="stylesheet" />

</head>
<body
	class="m-0 font-sans antialiased font-normal text-size-base leading-default bg-gray-50 text-slate-500">
	<c:set var="user" value="${sessionScope.user}"></c:set>
	<aside
		class="max-w-62.5 ease-nav-brand z-990 fixed inset-y-0 my-4 ml-4 block w-full -translate-x-full flex-wrap items-center justify-between overflow-y-auto rounded-2xl border-0 bg-white p-0 antialiased shadow-none transition-transform duration-200 xl:left-0 xl:translate-x-0 xl:bg-transparent">
		<div class="h-19.5">
			<i
				class="absolute top-0 right-0 hidden p-4 opacity-50 cursor-pointer fas fa-times text-slate-400 xl:hidden"
				sidenav-close></i> <a
				class="block px-8 py-6 m-0 text-size-sm whitespace-nowrap text-slate-700"
				href="#" target="_blank"> <img
				src="./assets/img/logos/small-logo.svg"
				class="inline h-full max-w-full transition-all duration-200 ease-nav-brand max-h-8"
				alt="main_logo" /> <span
				class="ml-1 font-semibold transition-all duration-200 ease-nav-brand">Mp3
					management</span>
			</a>
		</div>

		<hr class="h-px mt-0 bg-transparent bg-gradient-horizontal-dark" />

		<!-- change h-sidenav-no-pro to h-sidenav when pro is up -->
		<div
			class="items-center block w-auto max-h-screen overflow-auto h-sidenav grow basis-full">
			<ul class="flex flex-col pl-0 mb-0">
				<li class="mt-0.5 w-full"><a
					class="py-2.7 text-size-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap px-4 transition-colors"
					href="users.jsp">
						<div
							class="shadow-soft-2xl mr-2 flex h-8 w-8 items-center justify-center rounded-lg bg-white bg-center stroke-0 text-center xl:p-2.5">
							<svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1"
								xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink">
                  <title>office</title>
                  <g stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
                    <g transform="translate(-1869.000000, -293.000000)"
									fill="#FFFFFF" fill-rule="nonzero">
                      <g transform="translate(1716.000000, 291.000000)">
                        <g transform="translate(153.000000, 2.000000)">
                          <path class="fill-slate-800 opacity-60"
									d="M12.25,17.5 L8.75,17.5 L8.75,1.75 C8.75,0.78225 9.53225,0 10.5,0 L31.5,0 C32.46775,0 33.25,0.78225 33.25,1.75 L33.25,12.25 L29.75,12.25 L29.75,3.5 L12.25,3.5 L12.25,17.5 Z"></path>
                          <path class="fill-slate-800"
									d="M40.25,14 L24.5,14 C23.53225,14 22.75,14.78225 22.75,15.75 L22.75,38.5 L19.25,38.5 L19.25,22.75 C19.25,21.78225 18.46775,21 17.5,21 L1.75,21 C0.78225,21 0,21.78225 0,22.75 L0,40.25 C0,41.21775 0.78225,42 1.75,42 L40.25,42 C41.21775,42 42,41.21775 42,40.25 L42,15.75 C42,14.78225 41.21775,14 40.25,14 Z M12.25,36.75 L7,36.75 L7,33.25 L12.25,33.25 L12.25,36.75 Z M12.25,29.75 L7,29.75 L7,26.25 L12.25,26.25 L12.25,29.75 Z M35,36.75 L29.75,36.75 L29.75,33.25 L35,33.25 L35,36.75 Z M35,29.75 L29.75,29.75 L29.75,26.25 L35,26.25 L35,29.75 Z M35,22.75 L29.75,22.75 L29.75,19.25 L35,19.25 L35,22.75 Z"></path>
                        </g>
                      </g>
                    </g>
                  </g>
                </svg>
						</div> <span
						class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Users</span>
				</a></li>
				<li class="mt-0.5 w-full"><a
					class="py-2.7 text-size-sm ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap px-4 transition-colors"
					href="songs.jsp">
						<div
							class="shadow-soft-2xl mr-2 flex h-8 w-8 items-center justify-center rounded-lg bg-white bg-center stroke-0 text-center xl:p-2.5">
							<svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1"
								xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink">
                  <title>office</title>
                  <g stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
                    <g transform="translate(-1869.000000, -293.000000)"
									fill="#FFFFFF" fill-rule="nonzero">
                      <g transform="translate(1716.000000, 291.000000)">
                        <g transform="translate(153.000000, 2.000000)">
                          <path class="fill-slate-800 opacity-60"
									d="M12.25,17.5 L8.75,17.5 L8.75,1.75 C8.75,0.78225 9.53225,0 10.5,0 L31.5,0 C32.46775,0 33.25,0.78225 33.25,1.75 L33.25,12.25 L29.75,12.25 L29.75,3.5 L12.25,3.5 L12.25,17.5 Z"></path>
                          <path class="fill-slate-800"
									d="M40.25,14 L24.5,14 C23.53225,14 22.75,14.78225 22.75,15.75 L22.75,38.5 L19.25,38.5 L19.25,22.75 C19.25,21.78225 18.46775,21 17.5,21 L1.75,21 C0.78225,21 0,21.78225 0,22.75 L0,40.25 C0,41.21775 0.78225,42 1.75,42 L40.25,42 C41.21775,42 42,41.21775 42,40.25 L42,15.75 C42,14.78225 41.21775,14 40.25,14 Z M12.25,36.75 L7,36.75 L7,33.25 L12.25,33.25 L12.25,36.75 Z M12.25,29.75 L7,29.75 L7,26.25 L12.25,26.25 L12.25,29.75 Z M35,36.75 L29.75,36.75 L29.75,33.25 L35,33.25 L35,36.75 Z M35,29.75 L29.75,29.75 L29.75,26.25 L35,26.25 L35,29.75 Z M35,22.75 L29.75,22.75 L29.75,19.25 L35,19.25 L35,22.75 Z"></path>
                        </g>
                      </g>
                    </g>
                  </g>
                </svg>
						</div> <span
						class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Songs</span>
				</a></li>
				<li class="w-full mt-4">
					<h6
						class="pl-6 ml-2 font-bold leading-tight uppercase text-size-xs opacity-60">
						Account pages</h6>
				</li>
				<li class="mt-0.5 w-full"><a
					class="py-2.7 text-size-sm shadow-soft-xl ease-nav-brand my-0 mx-4 flex items-center whitespace-nowrap rounded-lg bg-white px-4 font-semibold text-slate-700 transition-colors"
					href="#">
						<div
							class="bg-gradient-fuchsia shadow-soft-2xl mr-2 flex h-8 w-8 items-center justify-center rounded-lg bg-white bg-center stroke-0 text-center xl:p-2.5">
							<svg width="12px" height="12px" viewBox="0 0 46 42" version="1.1"
								xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink">
                  <title>customer-support</title>
                  <g stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
                    <g transform="translate(-1717.000000, -291.000000)"
									fill="#FFFFFF" fill-rule="nonzero">
                      <g transform="translate(1716.000000, 291.000000)">
                        <g transform="translate(1.000000, 0.000000)">
                          <path class="opacity-60"
									d="M45,0 L26,0 C25.447,0 25,0.447 25,1 L25,20 C25,20.379 25.214,20.725 25.553,20.895 C25.694,20.965 25.848,21 26,21 C26.212,21 26.424,20.933 26.6,20.8 L34.333,15 L45,15 C45.553,15 46,14.553 46,14 L46,1 C46,0.447 45.553,0 45,0 Z"></path>
                          <path class=""
									d="M22.883,32.86 C20.761,32.012 17.324,31 13,31 C8.676,31 5.239,32.012 3.116,32.86 C1.224,33.619 0,35.438 0,37.494 L0,41 C0,41.553 0.447,42 1,42 L25,42 C25.553,42 26,41.553 26,41 L26,37.494 C26,35.438 24.776,33.619 22.883,32.86 Z"></path>
                          <path class=""
									d="M13,28 C17.432,28 21,22.529 21,18 C21,13.589 17.411,10 13,10 C8.589,10 5,13.589 5,18 C5,22.529 8.568,28 13,28 Z"></path>
                        </g>
                      </g>
                    </g>
                  </g>
                </svg>
						</div> <span
						class="ml-1 duration-300 opacity-100 pointer-events-none ease-soft">Profile</span>
				</a></li>
			</ul>
		</div>
	</aside>
	<main>
		<div
			class="ease-soft-in-out xl:ml-68.5 relative h-full max-h-screen bg-gray-50 transition-all duration-200">
			<nav
				class="absolute z-20 flex flex-wrap items-center justify-between w-full px-6 py-2 text-white transition-all shadow-none duration-250 ease-soft-in lg:flex-nowrap lg:justify-start"
				navbar-profile="" navbar-scroll="true">
				<div
					class="flex items-center justify-between w-full px-6 py-1 mx-auto flex-wrap-inherit">
					<nav>
						<ol
							class="flex flex-wrap pt-1 pl-2 pr-4 mr-12 bg-transparent rounded-lg sm:mr-16">
							<li class="leading-normal text-size-sm"><a
								class="opacity-50" href="javascript:;">Pages</a></li>
							<li
								class="text-size-sm pl-2 capitalize leading-normal before:float-left before:pr-2 before:content-['/']"
								aria-current="page">Profile</li>
						</ol>
						<h6 class="mb-2 ml-2 font-bold text-white capitalize">Profile</h6>
					</nav>
					<div
						class="flex items-center mt-2 grow sm:mt-0 sm:mr-6 md:mr-0 lg:basis-auto">
						<ul
							class="flex flex-row items-center ml-auto justify-end pl-0 mb-0 list-none md-max:w-full">
							<li class="mr-4">
								<h6 class="text-white">${user.getName()}</h6>
							</li>
								<li class="mr-4 underline">
							<a href="LogoutServlet" class="underline text-sm">Logout</a>
						</li>
							<li class="flex items-center"><a href=""
								class="block px-0 py-2 font-semibold text-white transition-all ease-soft-in-out text-size-sm">
							</a></li>
							<li>
								<div class="w-[50px] h-[50px] rounded-circle overflow-hidden">
									<img class="w-full h-full" src="${user.getAvatar()}"
										lazy-src="" alt="" />
								</div>
							</li>
							<li class="flex items-center pl-4 xl:hidden"><a
								href="javascript:;"
								class="block p-0 text-white transition-all ease-soft-in-out text-size-sm"
								sidenav-trigger="">
									<div class="w-4.5 overflow-hidden">
										<i
											class="ease-soft mb-0.75 relative block h-0.5 rounded-sm bg-white transition-all"></i>
										<i
											class="ease-soft mb-0.75 relative block h-0.5 rounded-sm bg-white transition-all"></i>
										<i
											class="ease-soft relative block h-0.5 rounded-sm bg-white transition-all"></i>
									</div>
							</a></li>
							<li class="flex items-center px-4"><a href="javascript:;"
								class="p-0 text-white transition-all text-size-sm ease-soft-in-out">
									<i fixed-plugin-button-nav="" class="cursor-pointer fa fa-cog"
									aria-hidden="true"></i>
							</a></li>

							<li class="relative flex items-center pr-2">
								<p class="hidden transform-dropdown-show"></p> <a
								dropdown-trigger="" href="javascript:;"
								class="block p-0 text-white transition-all text-size-sm ease-nav-brand"
								aria-expanded="false"> <i class="cursor-pointer fa fa-bell"
									aria-hidden="true"></i>
							</a>
								<ul dropdown-menu=""
									class="text-size-sm transform-dropdown before:font-awesome before:leading-default before:duration-350 before:ease-soft lg:shadow-soft-3xl duration-250 min-w-44 before:sm:right-7.5 before:text-5.5 pointer-events-none absolute right-0 top-0 z-50 origin-top list-none rounded-lg border-0 border-solid border-transparent bg-white bg-clip-padding px-2 py-4 text-left text-slate-500 opacity-0 transition-all before:absolute before:right-2 before:left-auto before:top-0 before:z-50 before:inline-block before:font-normal before:text-white before:antialiased before:transition-all before:content-['\f0d8'] sm:-mr-6 lg:absolute lg:right-0 lg:left-auto lg:mt-2 lg:block lg:cursor-pointer">
									<li class="relative mb-2"><a
										class="ease-soft py-1.2 clear-both block w-full whitespace-nowrap rounded-lg bg-transparent px-4 duration-300 lg:transition-colors"
										href="javascript:;">
											<div class="flex py-1">
												<div class="my-auto">
													<img src="" lazy-src="./assets/img/team-2.jpg"
														class="inline-flex items-center justify-center mr-4 text-white text-size-sm h-9 w-9 max-w-none rounded-xl" />
												</div>
												<div class="flex flex-col justify-center">
													<h6 class="mb-1 font-normal leading-normal text-size-sm">
														<span class="font-semibold">New message</span> from Laur
													</h6>
													<p class="mb-0 leading-tight text-size-xs text-slate-400">
														<i class="mr-1 fa fa-clock" aria-hidden="true"></i> 13
														minutes ago
													</p>
												</div>
											</div>
									</a></li>
									<li class="relative mb-2"><a
										class="ease-soft py-1.2 clear-both block w-full whitespace-nowrap rounded-lg px-4 duration-300 lg:transition-colors"
										href="javascript:;">
											<div class="flex py-1">
												<div class="my-auto">
													<img src=""
														lazy-src="./assets/img/small-logos/logo-spotify.svg"
														class="inline-flex items-center justify-center mr-4 text-white text-size-sm bg-gradient-dark-gray h-9 w-9 max-w-none rounded-xl" />
												</div>
												<div class="flex flex-col justify-center">
													<h6 class="mb-1 font-normal leading-normal text-size-sm">
														<span class="font-semibold">New album</span> by Travis
														Scott
													</h6>
													<p class="mb-0 leading-tight text-size-xs text-slate-400">
														<i class="mr-1 fa fa-clock" aria-hidden="true"></i> 1 day
													</p>
												</div>
											</div>
									</a></li>
									<li class="relative"><a
										class="ease-soft py-1.2 clear-both block w-full whitespace-nowrap rounded-lg px-4 duration-300 lg:transition-colors"
										href="javascript:;">
											<div class="flex py-1">
												<div
													class="inline-flex items-center justify-center my-auto mr-4 text-white transition-all duration-200 ease-soft-in-out text-size-sm bg-gradient-slate h-9 w-9 rounded-xl">
													<svg width="12px" height="12px" viewBox="0 0 43 36"
														version="1.1" xmlns="http://www.w3.org/2000/svg"
														xmlns:xlink="http://www.w3.org/1999/xlink">
                              <title>credit-card</title>
                              <g stroke="none" stroke-width="1"
															fill="none" fill-rule="evenodd">
                                <g
															transform="translate(-2169.000000, -745.000000)"
															fill="#FFFFFF" fill-rule="nonzero">
                                  <g
															transform="translate(1716.000000, 291.000000)">
                                    <g
															transform="translate(453.000000, 454.000000)">
                                      <path class="color-background"
															d="M43,10.7482083 L43,3.58333333 C43,1.60354167 41.3964583,0 39.4166667,0 L3.58333333,0 C1.60354167,0 0,1.60354167 0,3.58333333 L0,10.7482083 L43,10.7482083 Z"
															opacity="0.593633743"></path>
                                      <path class="color-background"
															d="M0,16.125 L0,32.25 C0,34.2297917 1.60354167,35.8333333 3.58333333,35.8333333 L39.4166667,35.8333333 C41.3964583,35.8333333 43,34.2297917 43,32.25 L43,16.125 L0,16.125 Z M19.7083333,26.875 L7.16666667,26.875 L7.16666667,23.2916667 L19.7083333,23.2916667 L19.7083333,26.875 Z M35.8333333,26.875 L28.6666667,26.875 L28.6666667,23.2916667 L35.8333333,23.2916667 L35.8333333,26.875 Z"></path>
                                    </g>
                                  </g>
                                </g>
                              </g>
                            </svg>
												</div>
												<div class="flex flex-col justify-center">
													<h6 class="mb-1 font-normal leading-normal text-size-sm">
														Payment successfully completed</h6>
													<p class="mb-0 leading-tight text-size-xs text-slate-400">
														<i class="mr-1 fa fa-clock" aria-hidden="true"></i> 2 days
													</p>
												</div>
											</div>
									</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</nav>
			<div class="w-full px-6 mx-auto">
				<div
					class="relative flex items-center p-0 mt-6 overflow-hidden bg-center bg-cover min-h-75 rounded-2xl"
					style="background-image: url('./assets/img/curved-images/curved0.jpg'); background-position-y: 50%;">
					<span
						class="absolute inset-y-0 w-full h-full bg-center bg-cover bg-gradient-fuchsia opacity-60"></span>
				</div>
				<div
					class="relative flex justify-center max-w-[300px] min-w-0 p-4 mx-6 -mt-16 overflow-hidden break-words border-0 shadow-blur rounded-2xl bg-white/80 bg-clip-border backdrop-blur-2xl backdrop-saturate-200">
					<div class="flex flex-wrap -mx-3">
						<div class="flex-none w-auto max-w-full px-3">
							<div
								class="text-size-base ease-soft-in-out h-18.5 w-18.5 relative inline-flex items-center justify-center rounded-xl text-white transition-all duration-200">
								<img src="${user.getAvatar()}"
									lazy-src="./assets/img/bruce-mars.jpg" alt="profile_image"
									class="w-full shadow-soft-sm rounded-xl" />
							</div>
						</div>
						<div class="flex-none w-auto max-w-full px-3 my-auto">
							<div class="h-full">
								<h5 class="mb-1">${user.getName()}</h5>
								<p class="mb-0 font-semibold leading-normal text-size-sm">
									CEO / Co-Founder</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="w-full p-6 mx-auto">
				<div class="flex flex-wrap -mx-3">
					<div class="w-full max-w-full px-3 xl:w-4/12">
						<div
							class="relative flex flex-col h-full min-w-0 break-words bg-white border-0 shadow-soft-xl rounded-2xl bg-clip-border">
							<div class="p-4 pb-0 mb-0 bg-white border-b-0 rounded-t-2xl">
								<h6 class="mb-0">Platform Settings</h6>
							</div>
							<div class="flex-auto p-4">
								<h6
									class="font-bold leading-tight uppercase text-size-xs text-slate-500">
									Account</h6>
								<ul class="flex flex-col pl-0 mb-0 rounded-lg">
									<li
										class="relative block px-0 py-2 bg-white border-0 rounded-t-lg text-inherit">
										<div class="min-h-6 mb-0.5 block pl-0">
											<input id="follow"
												class="mt-0.54 rounded-10 duration-250 ease-soft-in-out after:rounded-circle after:shadow-soft-2xl after:duration-250 checked:after:translate-x-5.25 h-5-em relative float-left ml-auto w-10 cursor-pointer appearance-none border border-solid border-gray-200 bg-slate-800/10 bg-none bg-contain bg-left bg-no-repeat align-top transition-all after:absolute after:top-px after:h-4 after:w-4 after:translate-x-px after:bg-white after:content-[''] checked:border-slate-800/95 checked:bg-slate-800/95 checked:bg-none checked:bg-right"
												type="checkbox" checked="" /> <label for="follow"
												class="w-4/5 mb-0 ml-4 overflow-hidden font-normal cursor-pointer select-none text-size-sm text-ellipsis whitespace-nowrap text-slate-500">Email
												me when someone follows me</label>
										</div>
									</li>
									<li
										class="relative block px-0 py-2 bg-white border-0 text-inherit">
										<div class="min-h-6 mb-0.5 block pl-0">
											<input id="answer"
												class="mt-0.54 rounded-10 duration-250 ease-soft-in-out after:rounded-circle after:shadow-soft-2xl after:duration-250 checked:after:translate-x-5.25 h-5-em relative float-left ml-auto w-10 cursor-pointer appearance-none border border-solid border-gray-200 bg-slate-800/10 bg-none bg-contain bg-left bg-no-repeat align-top transition-all after:absolute after:top-px after:h-4 after:w-4 after:translate-x-px after:bg-white after:content-[''] checked:border-slate-800/95 checked:bg-slate-800/95 checked:bg-none checked:bg-right"
												type="checkbox" /> <label for="answer"
												class="w-4/5 mb-0 ml-4 overflow-hidden font-normal cursor-pointer select-none text-size-sm text-ellipsis whitespace-nowrap text-slate-500">Email
												me when someone answers on my post</label>
										</div>
									</li>
									<li
										class="relative block px-0 py-2 bg-white border-0 rounded-b-lg text-inherit">
										<div class="min-h-6 mb-0.5 block pl-0">
											<input id="mention"
												class="mt-0.54 rounded-10 duration-250 ease-soft-in-out after:rounded-circle after:shadow-soft-2xl after:duration-250 checked:after:translate-x-5.25 h-5-em relative float-left ml-auto w-10 cursor-pointer appearance-none border border-solid border-gray-200 bg-slate-800/10 bg-none bg-contain bg-left bg-no-repeat align-top transition-all after:absolute after:top-px after:h-4 after:w-4 after:translate-x-px after:bg-white after:content-[''] checked:border-slate-800/95 checked:bg-slate-800/95 checked:bg-none checked:bg-right"
												type="checkbox" checked="" /> <label for="mention"
												class="w-4/5 mb-0 ml-4 overflow-hidden font-normal cursor-pointer select-none text-size-sm text-ellipsis whitespace-nowrap text-slate-500">Email
												me when someone mentions me</label>
										</div>
									</li>
								</ul>
								<h6
									class="mt-6 font-bold leading-tight uppercase text-size-xs text-slate-500">
									Application</h6>
								<ul class="flex flex-col pl-0 mb-0 rounded-lg">
									<li
										class="relative block px-0 py-2 bg-white border-0 rounded-t-lg text-inherit">
										<div class="min-h-6 mb-0.5 block pl-0">
											<input id="launches projects"
												class="mt-0.54 rounded-10 duration-250 ease-soft-in-out after:rounded-circle after:shadow-soft-2xl after:duration-250 checked:after:translate-x-5.25 h-5-em relative float-left ml-auto w-10 cursor-pointer appearance-none border border-solid border-gray-200 bg-slate-800/10 bg-none bg-contain bg-left bg-no-repeat align-top transition-all after:absolute after:top-px after:h-4 after:w-4 after:translate-x-px after:bg-white after:content-[''] checked:border-slate-800/95 checked:bg-slate-800/95 checked:bg-none checked:bg-right"
												type="checkbox" /> <label for="launches projects"
												class="w-4/5 mb-0 ml-4 overflow-hidden font-normal cursor-pointer select-none text-size-sm text-ellipsis whitespace-nowrap text-slate-500">New
												launches and projects</label>
										</div>
									</li>
									<li
										class="relative block px-0 py-2 bg-white border-0 text-inherit">
										<div class="min-h-6 mb-0.5 block pl-0">
											<input id="product updates"
												class="mt-0.54 rounded-10 duration-250 ease-soft-in-out after:rounded-circle after:shadow-soft-2xl after:duration-250 checked:after:translate-x-5.25 h-5-em relative float-left ml-auto w-10 cursor-pointer appearance-none border border-solid border-gray-200 bg-slate-800/10 bg-none bg-contain bg-left bg-no-repeat align-top transition-all after:absolute after:top-px after:h-4 after:w-4 after:translate-x-px after:bg-white after:content-[''] checked:border-slate-800/95 checked:bg-slate-800/95 checked:bg-none checked:bg-right"
												type="checkbox" checked="" /> <label for="product updates"
												class="w-4/5 mb-0 ml-4 overflow-hidden font-normal cursor-pointer select-none text-size-sm text-ellipsis whitespace-nowrap text-slate-500">Monthly
												product updates</label>
										</div>
									</li>
									<li
										class="relative block px-0 py-2 pb-0 bg-white border-0 rounded-b-lg text-inherit">
										<div class="min-h-6 mb-0.5 block pl-0">
											<input id="subscribe"
												class="mt-0.54 rounded-10 duration-250 ease-soft-in-out after:rounded-circle after:shadow-soft-2xl after:duration-250 checked:after:translate-x-5.25 h-5-em relative float-left ml-auto w-10 cursor-pointer appearance-none border border-solid border-gray-200 bg-slate-800/10 bg-none bg-contain bg-left bg-no-repeat align-top transition-all after:absolute after:top-px after:h-4 after:w-4 after:translate-x-px after:bg-white after:content-[''] checked:border-slate-800/95 checked:bg-slate-800/95 checked:bg-none checked:bg-right"
												type="checkbox" /> <label for="subscribe"
												class="w-4/5 mb-0 ml-4 overflow-hidden font-normal cursor-pointer select-none text-size-sm text-ellipsis whitespace-nowrap text-slate-500">Subscribe
												to newsletter</label>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="w-full max-w-full px-3 lg-max:mt-6 xl:w-4/12">
						<div
							class="relative flex flex-col h-full min-w-0 break-words bg-white border-0 shadow-soft-xl rounded-2xl bg-clip-border">
							<div class="p-4 pb-0 mb-0 bg-white border-b-0 rounded-t-2xl">
								<div class="flex flex-wrap -mx-3">
									<div
										class="flex items-center w-full max-w-full px-3 shrink-0 md:w-8/12 md:flex-none">
										<h6 class="mb-0">Profile Information</h6>
									</div>
									<div
										class="w-full max-w-full px-3 text-right shrink-0 md:w-4/12 md:flex-none">
										<a href="users.jsp" data-target="tooltip_trigger"
											data-placement="top"> <i
											class="leading-normal fas fa-user-edit text-size-sm text-slate-400"
											aria-hidden="true"></i>
										</a>
										<div data-target="tooltip"
											class="hidden px-2 py-1 text-center text-white bg-black rounded-lg text-size-sm"
											role="tooltip" data-popper-placement="top"
											style="position: absolute; inset: auto auto 0px 0px; margin: 0px; transform: translate(889px, -350px);">
											Edit Profile
											<div
												class="invisible absolute h-2 w-2 bg-inherit before:visible before:absolute before:h-2 before:w-2 before:rotate-45 before:bg-inherit before:content-['']"
												data-popper-arrow=""
												style="position: absolute; left: 0px; transform: translate(0px, 0px);"></div>
										</div>
									</div>
								</div>
							</div>
							<div class="flex-auto p-4">
								<p class="leading-normal text-size-sm">Hi, I’m
									${user.getName() }, Decisions: If you can’t decide, the answer
									is no. If two equally difficult paths, choose the one more
									painful in the short term (pain avoidance is creating an
									illusion of equality).</p>
								<hr
									class="h-px my-6 bg-transparent bg-gradient-horizontal-light" />
								<ul class="flex flex-col pl-0 mb-0 rounded-lg">
									<li
										class="relative block px-4 py-2 pt-0 pl-0 leading-normal bg-white border-0 rounded-t-lg text-size-sm text-inherit">
										<strong class="text-slate-700">Full Name:</strong> &nbsp;
										${user.getName() }
									</li>
									<li
										class="relative block px-4 py-2 pl-0 leading-normal bg-white border-0 border-t-0 text-size-sm text-inherit">
										<strong class="text-slate-700">Mobile:</strong>
										&nbsp;${user.getPhone() }
									</li>
									<li
										class="relative block px-4 py-2 pl-0 leading-normal bg-white border-0 border-t-0 text-size-sm text-inherit">
										<strong class="text-slate-700">Email:</strong> &nbsp;
										${user.getEmail() }
									</li>
									<li
										class="relative block px-4 py-2 pl-0 leading-normal bg-white border-0 border-t-0 text-size-sm text-inherit">
										<strong class="text-slate-700">Location:</strong> &nbsp;
										${user.getAddress() }
									</li>
									<li
										class="relative block px-4 py-2 pb-0 pl-0 bg-white border-0 border-t-0 rounded-b-lg text-inherit">
										<strong class="leading-normal text-size-sm text-slate-700">Social:</strong>
										&nbsp; <a
										class="inline-block py-0 pl-1 pr-2 mb-0 font-bold text-center text-blue-800 align-middle transition-all bg-transparent border-0 rounded-lg shadow-none cursor-pointer leading-pro text-size-xs ease-soft-in bg-none"
										href="javascript:;"> <i class="fab fa-facebook fa-lg"
											aria-hidden="true"></i>
									</a> <a
										class="inline-block py-0 pl-1 pr-2 mb-0 font-bold text-center align-middle transition-all bg-transparent border-0 rounded-lg shadow-none cursor-pointer leading-pro text-size-xs ease-soft-in bg-none text-sky-600"
										href="javascript:;"> <i class="fab fa-twitter fa-lg"
											aria-hidden="true"></i>
									</a> <a
										class="inline-block py-0 pl-1 pr-2 mb-0 font-bold text-center align-middle transition-all bg-transparent border-0 rounded-lg shadow-none cursor-pointer leading-pro text-size-xs ease-soft-in bg-none text-sky-900"
										href="javascript:;"> <i class="fab fa-instagram fa-lg"
											aria-hidden="true"></i>
									</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="w-full max-w-full px-3 lg-max:mt-6 xl:w-4/12">
						<div
							class="relative flex flex-col h-full min-w-0 break-words bg-white border-0 shadow-soft-xl rounded-2xl bg-clip-border">
							<div class="p-4 pb-0 mb-0 bg-white border-b-0 rounded-t-2xl">
								<h6 class="mb-0">Conversations</h6>
							</div>
							<div class="flex-auto p-4">
								<ul class="flex flex-col pl-0 mb-0 rounded-lg">
									<%
									UserDAOImpl userDao = new UserDAOImpl();
									request.setAttribute("listUser", userDao.all());
									%>
									<c:set var="listUser" value="${requestScope.listUser}"></c:set>
									<c:forEach var="item" items="${listUser}" begin="0" end="4"
										varStatus="loop">
										<li
											class="relative flex items-center px-0 py-2 mb-2 bg-white border-0 rounded-t-lg text-inherit">
											<div
												class="inline-flex items-center justify-center w-12 h-12 mr-4 text-white transition-all duration-200 text-size-base ease-soft-in-out rounded-xl">
												<img src="${item.getAvatar() }" lazy-src="" alt="kal"
													class="w-full shadow-soft-2xl rounded-xl" />
											</div>
											<div class="flex flex-col items-start justify-center">
												<h6 class="mb-0 leading-normal text-size-sm">${item.getName() }</h6>
												<p class="mb-0 leading-tight text-size-xs">Hi! I need
													more information..</p>
											</div> <a
											class="inline-block py-3 pl-0 pr-4 mb-0 ml-auto font-bold text-center uppercase align-middle transition-all bg-transparent border-0 rounded-lg shadow-none cursor-pointer leading-pro text-size-xs ease-soft-in hover:scale-102 hover:active:scale-102 active:opacity-85 text-fuchsia-500 hover:text-fuchsia-800 hover:shadow-none active:scale-100"
											href="javascript:;">Reply</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
<!-- plugin for scrollbar  -->
<!-- github button -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- main script file  -->
</html>
