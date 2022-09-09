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
	href="../assets/img/apple-icon.png" />
<link rel="icon" type="image/png" href="../assets/img/favicon.png" />
<title>Zing mp3</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<!-- Nucleo Icons -->
<link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
<link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
	rel="stylesheet" />

<!-- Popper -->
<script src="https://unpkg.com/@popperjs/core@2"></script>
<!-- Main Styling -->
<link href="./assets/css/admin-styles.css" rel="stylesheet" />
</head>

<body
	class="m-0 font-sans antialiased font-normal text-size-base leading-default bg-gray-50 text-slate-500">

	<%
	ArtristDAOImpl arDao = new ArtristDAOImpl();
	CategoryDAOImpl cateDao = new CategoryDAOImpl();
	request.setAttribute("artrists", arDao.all()); 
	request.setAttribute("categorys", cateDao.all()); 
	%>
	<c:set var="listArtrist" value="${requestScope.artrists}"></c:set>
	<c:set var="listCategory" value="${requestScope.categorys}"></c:set>
	<nav
		class="absolute top-0 left-0 right-0 z-30 flex flex-wrap items-center px-4 py-2 mx-6 my-4 shadow-soft-2xl rounded-blur bg-white/80 backdrop-blur-2xl backdrop-saturate-200 lg:flex-nowrap lg:justify-start">
		<div
			class="flex items-center justify-between w-full p-0 pl-6 mx-auto flex-wrap-inherit">
			<a
				class="py-2.375 text-size-sm mr-4 ml-4 whitespace-nowrap font-bold text-slate-700 lg:ml-0"
				href="./dashboard.html"> Mp3 Management </a>
			<button navbar-trigger=""
				class="px-3 py-1 ml-2 leading-none transition-all bg-transparent border border-transparent border-solid rounded-lg shadow-none cursor-pointer text-size-lg ease-soft-in-out lg:hidden"
				type="button" aria-controls="navigation" aria-expanded="false"
				aria-label="Toggle navigation">
				<span
					class="inline-block mt-2 align-middle bg-center bg-no-repeat bg-cover w-6-em h-6-em bg-none">
					<span bar1=""
					class="w-5.5 rounded-xs relative my-0 mx-auto block h-px bg-gray-600 transition-all duration-300"></span>
					<span bar2=""
					class="w-5.5 rounded-xs mt-1.75 relative my-0 mx-auto block h-px bg-gray-600 transition-all duration-300"></span>
					<span bar3=""
					class="w-5.5 rounded-xs mt-1.75 relative my-0 mx-auto block h-px bg-gray-600 transition-all duration-300"></span>
				</span>
			</button>
			<div navbar-menu=""
				class="items-center flex-grow overflow-hidden transition-all duration-500 ease-soft lg-max:max-h-0 basis-full lg:flex lg:basis-auto">
				<ul
					class="flex flex-col pl-0 mx-auto mb-0 list-none lg:flex-row xl:ml-auto">
					<li><a
						class="block px-4 py-2 mr-2 font-normal transition-all lg-max:opacity-0 duration-250 ease-soft-in-out text-size-sm text-slate-700 lg:px-2"
						href="./users.html"> <i class="mr-1 fa fa-user opacity-60"
							aria-hidden="true"></i> Users
					</a></li>
					<li><a
						class="block px-4 py-2 mr-2 font-normal transition-all lg-max:opacity-0 duration-250 ease-soft-in-out text-size-sm text-slate-700 lg:px-2"
						href="./songs.html"> <i
							class="mr-1 fas fa-user-circle opacity-60" aria-hidden="true"></i>
							Songs
					</a></li>
					<li><a
						class="block px-4 py-2 mr-2 font-normal transition-all lg-max:opacity-0 duration-250 ease-soft-in-out text-size-sm text-slate-700 lg:px-2"
						href="./profile.html"> <i class="mr-1 fas fa-key opacity-60"
							aria-hidden="true"></i> Profile
					</a></li>
				</ul>

				<ul class="hidden pl-0 mb-0 list-none lg:block lg:flex-row">
					<li><a
						href="https://www.creative-tim.com/product/soft-ui-dashboard-tailwind"
						target="_blank"
						class="leading-pro hover:scale-102 hover:shadow-soft-xs active:opacity-85 ease-soft-in text-size-xs tracking-tight-soft shadow-soft-md bg-150 bg-x-25 bg-gradient-dark-gray rounded-3.5xl mb-0 mr-1 inline-block cursor-pointer border-0 bg-transparent px-8 py-2 text-center align-middle font-bold uppercase text-white transition-all">Have
							a good times</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div
		class="relative flex items-center p-0 overflow-hidden bg-center bg-cover min-h-75-screen">
		<div class="container z-10">
			<div class="flex flex-wrap mt-0 -mx-3">
				<div
					class="flex flex-col w-full max-w-full px-3 mx-auto md:flex-0 shrink-0 md:w-6/12 lg:w-5/12 xl:w-4/12">
					<div
						class="relative flex flex-col min-w-0 mt-20 break-words bg-transparent border-0 shadow-none rounded-2xl bg-clip-border">
						<div class="p-6 pb-0 mb-0 bg-transparent border-b-0 rounded-t-2xl">
							<h3
								class="relative z-10 font-bold text-transparent bg-gradient-dark-gray bg-clip-text">
								Add song</h3>
							<p class="mb-0">Enter your song's information</p>
						</div>
						<div class="flex-auto p-6">
							<form role="form" method="post" action="./AddSongServlet"
								enctype="multipart/form-data">
								<label class="mb-2 ml-1 font-bold text-size-xs text-slate-700">Song
									name</label>
								<div class="mb-4">
									<input type="text"
										class="focus:shadow-soft-primary-outline text-size-sm leading-5.6 ease-soft block w-full appearance-none rounded-lg border border-solid border-gray-300 bg-white bg-clip-padding px-3 py-2 font-normal text-gray-700 transition-all focus:border-fuchsia-300 focus:outline-none focus:transition-shadow"
										placeholder="Vd: A nice guy" name="songName" />
								</div>
								<label class="mb-2 ml-1 font-bold text-size-xs text-slate-700">Artist</label>
								<div class="mb-4 relative">
									<input list="artist-list"
										class="focus:shadow-soft-primary-outline text-size-sm leading-5.6 ease-soft block w-full appearance-none rounded-lg border border-solid border-gray-300 bg-white bg-clip-padding px-3 py-2 font-normal text-gray-700 transition-all focus:border-fuchsia-300 focus:outline-none focus:transition-shadow song__artists"
										placeholder="Vd: Adele" name="songArtist" /> <a
										class="absolute content right-0 top-0 mt-2 mr-[-24px] cursor-pointer"
										hidden> <i class="bx bx-check"></i>
									</a>
									<datalist id="artist-list">
									<c:forEach var="item" items="${listArtrist}">
											<option value="${item.getNameArtrist() }">${item.getNameArtrist()}</option>
										</c:forEach>
									</datalist>
								</div>
								<div
									class="mb-4 flex flex-wrap gap-4 font-bold text-size-xs text-slate-700 hidden">
									<label class="">Atirst saved:</label>
								</div>
								<label class="mb-2 ml-1 font-bold text-size-xs text-slate-700">Category</label>
								<div class="mb-4 relative">
									<input list="category-list"
										class="focus:shadow-soft-primary-outline text-size-sm leading-5.6 ease-soft block w-full appearance-none rounded-lg border border-solid border-gray-300 bg-white bg-clip-padding px-3 py-2 font-normal text-gray-700 transition-all focus:border-fuchsia-300 focus:outline-none focus:transition-shadow song__category"
										placeholder="Vd: Pop" name="songTopic" /> <a
										class="absolute content right-0 top-0 mt-2 mr-[-24px] cursor-pointer"
										hidden> <i class="bx bx-check"></i>
									</a>
									<datalist id="category-list">
										<c:forEach var="item" items="${listCategory}">
											<option value="${item.getNameCategory() }">${item.getNameCategory()}</option>
										</c:forEach>
									</datalist>
								</div>
								<div
									class="mb-4 flex gap-4 font-bold text-size-xs text-slate-700 hidden">
									<label class="">Category saved:</label>
								</div>
								<label class="mb-2 ml-1 font-bold text-size-xs text-slate-700">Upload
									image</label>
								<div class="mb-4">
									<input type="file"
										class="focus:shadow-soft-primary-outline text-size-sm leading-5.6 ease-soft block w-full appearance-none rounded-lg border border-solid border-gray-300 bg-white bg-clip-padding px-3 py-2 font-normal text-gray-700 transition-all focus:border-fuchsia-300 focus:outline-none focus:transition-shadow"
										name="songImage" />
								</div>
								<label class="mb-2 ml-1 font-bold text-size-xs text-slate-700">Upload
									link</label>
								<div class="mb-4">
									<input type="file"
										class="focus:shadow-soft-primary-outline text-size-sm leading-5.6 ease-soft block w-full appearance-none rounded-lg border border-solid border-gray-300 bg-white bg-clip-padding px-3 py-2 font-normal text-gray-700 transition-all focus:border-fuchsia-300 focus:outline-none focus:transition-shadow"
										name="songLink" />
								</div>
								<div class="text-center">
									<input type="submit"
										class="block px-6 py-3 font-bold text-center text-white uppercase align-middle transition-all bg-transparent rounded-lg cursor-pointer leading-pro text-size-xs ease-soft-in shadow-soft-md bg-150 bg-gradient-dark-gray hover:shadow-soft-xs active:opacity-85 hover:scale-102 tracking-tight-soft bg-x-25"
										href="javascript:;"></input>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="w-full max-w-full px-3 lg:flex-0 shrink-0 md:w-6/12">
					<div
						class="absolute top-0 hidden w-3/5 h-full -mr-32 overflow-hidden -skew-x-10 -right-40 rounded-bl-xl md:block">
						<div
							class="absolute inset-x-0 top-0 z-0 h-full -ml-16 bg-cover skew-x-10"
							style="background-image: url('https://i.pinimg.com/564x/a1/43/20/a1432019772dbb5b2ef600cbf57c82cc.jpg');"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- plugin for scrollbar  -->
<script src="../assets/js/plugins/perfect-scrollbar.min.js" async></script>
<!-- github button -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- main script file  -->
<script>
    const $ = document.querySelector.bind(document);
    const inputArtist = $("input.song__artists");
    const btnArtistCheck = $("input.song__artists + a");

    const inputCategory = $("input.song__category");
    const btnCategoryCheck = $("input.song__category + a");

    const listArtist = inputArtist.parentNode.nextElementSibling;
    const listCategory = inputCategory.parentNode.nextElementSibling;

    inputArtist.oninput = () => {
      inputArtist.value.trim() != ""
        ? (btnArtistCheck.hidden = false)
        : (btnArtistCheck.hidden = true);
    };
    inputCategory.oninput = () => {
      inputCategory.value.trim() != ""
        ? (btnCategoryCheck.hidden = false)
        : (btnCategoryCheck.hidden = true);
    };

    btnArtistCheck.onclick = () => {
      listArtist.classList.remove("hidden");
      listArtist.insertAdjacentHTML(
        "beforeend",
        `<div><span class="mr-1">${inputArtist.value}</span><i onclick="this.parentNode.remove()" class='bx bx-trash cursor-pointer' ></i></div>`
      );
      inputArtist.value = "";
      btnArtistCheck.hidden = true;
    };
    btnCategoryCheck.onclick = () => {
      listCategory.classList.remove("hidden");
      listCategory.insertAdjacentHTML(
        "beforeend",
        `<div><span class="mr-1">${inputCategory.value}</span><i onclick="this.parentNode.remove()" class='bx bx-trash cursor-pointer' ></i></div>`
      );
      inputCategory.value = "";
      btnCategoryCheck.hidden = true;
    };
  </script>
</html>
