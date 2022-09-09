// btn create
const content = document.querySelector(".app");
let tabPersonal = document.querySelector(".app__container.tab--personal");
let tabPlaylist = document.querySelector(".app__container.tab--playlist");
const closeFormBtn = document.querySelector(".btn__close");

// btn create

const formPlaylist = document.querySelector(".playlist__create");
const formWrapperPlaylist = document.querySelector(".create__wrapper");

//
const createPlaylistBtn1 = document.querySelectorAll(
  ".row__item-container.flex--center.item-create--properties"
);
const createPlayListBtn2 = document.querySelector(".sidebar__create-playlist");

//
createPlayListBtn2.addEventListener("click", () => {
  formPlaylist.classList.add("active");
});

formPlaylist.onclick = () => {
  formPlaylist.classList.remove("active");
};
for (const createBtn of createPlaylistBtn1) {
  createBtn.onclick = () => {
    createPlayListBtn2.click();
  };
}
formWrapperPlaylist.onclick = (e) => {
  e.stopPropagation();
};

closeFormBtn.onclick = () => {
  formPlaylist.classList.remove("active");
};
const createBtn = document.querySelector(".btn.btn__create");

createBtn.addEventListener("click", () => {
  if (tabPersonal) {
    tabPersonal.classList.remove("active");
  }
  tabPersonal = tabPlaylist.classList.add("active");
  formPlaylist.classList.remove("active");
});

const playlistSongItems = document.querySelectorAll(
  ".tab-song .playlist__list-song.media"
);
const btnAdds = document.querySelectorAll(".btn--add");

// let container = document.querySelector(".box--no-content");

for (const item of playlistSongItems) {
  item.addEventListener("click", () => {
    if (item.querySelector(".playlist__list-song input").checked) {
      item.classList.remove("active");
      item.querySelector(".playlist__list-song input").checked = false;
    } else {
      item.classList.add("active");
      item.querySelector(".playlist__list-song input").checked = true;
    }
  });
}
let boxContent = document.querySelector(
  ".playlist__contain-song .box--no-content"
);

for (const btn of btnAdds) {
  btn.onclick = () => {
    // container.classList.add("display-none");
    let container = document.querySelector(
      ".playlist__contain-song .container__playlist"
    );
    container.classList.add("active");
    boxContent.classList.add("active");
  };
}
let test = document.querySelector;
for (let i = 0; i < 50; i++) {}
