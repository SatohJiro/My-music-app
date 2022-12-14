const audio = $("#song");
const PLAYER_STORAGE_KEY = "MP3_PLAYER";

const trackTime = $(".tracktime");
const durationTime = $(".durationtime");

const songImage = $(".player__song-thumb.media__thumb.note-1 .thumb-img");
const songNames = $$(".player__title-animate .title__item");
const songAuthor = $(".player__song-author.info__author");

const titleSong = $(".player__title-animate");

const songThumb = $(".player__song-thumb.media__thumb.note-1");
const songNotes = $$(".thumb-note");

// option btn
const playSongBtn = $(".control-btn.btn-toggle-play.btn--play-song.is-medium");
const nextSongBtn = $(".control-btn.btn-next");
const preSongBtn = $(".control-btn.btn-prev");
const randomSongBtn = $(".control-btn.btn-random");
// progess
const progessSongBar = document.getElementById("progress--main");
const repeatSongBtn = $(".control-btn.btn-repeat");
// playlist list
const playlist = $(".playlist__list");
//
// set duration time, current time
// //
// let timer;
//play, pause Song
let isPlaying = true;
let musics = [];
let index = 0;
let isRepeat = false;
let countRepeat = 0;
// list Song
const listSongControl = $$(".container__control .playlist__list-song.media");
let count = 0;

const listSong = $$(".tab-song .playlist__list .playlist__list-song");
//all data song : name, src, artist, img, ...
for (let x = 0; x < listSong.length; x++) {
  const item = listSong[x];
  const listAuthor = item.querySelectorAll(
    ".playlist__song-author.info__author a"
  );
  const authorName = [];

  for (const name of listAuthor) {
    authorName.push(`<a class="is-ghost">${`&nbsp`}${name.textContent}</a>`);
  }
  musics.push({
    class: item.getAttribute("class"),
    id: item.getAttribute("data-index"),
    name: item.querySelector(".playlist__song-title.info__title").textContent,
    author: authorName,
    image: item
      .querySelector(".playlist__song-thumb.media__thumb")
      .getAttribute("style"),
    file: `song${x + 1}.mp3`,
  });
}
const player = {
  currentIndex: 0,
  currentPlaylist: 0, //choose playlist
  songs: musics,
  isSeeking: false,
  isUpdateTime: true,
  isPlaying: false,
  isRepeat: false,
  isRandom: false,
  count: 0,
  config: JSON.parse(localStorage.getItem(PLAYER_STORAGE_KEY)) || {},
  setConfig: function (key, value) {
    this.config[key] = value;
    localStorage.setItem(PLAYER_STORAGE_KEY, JSON.stringify(this.config));
  },
  defineProperties: function () {
    Object.defineProperty(this, "currentSong", {
      get: function () {
        return this.songs[this.currentIndex];
      },
    });
  },
  handleEvents: function () {
    const _this = this;
    // set thumbnail progress position

    // x??? l?? Rotate cd
    const songThumbAnimate = songThumb.animate(
      {
        transform: "rotate(360deg)",
      },
      {
        duration: 8000,
        iterations: Infinity,
      }
    );
    songThumbAnimate.pause();
    const playSong = () => {
      if (_this.isPlaying) {
        audio.pause();
      } else {
        audio.play();
      }
    };
    // X??? l?? khi click play
    playSongBtn.addEventListener("click", playSong);
    // khi song played
    audio.onplay = () => {
      _this.isPlaying = true;
      songThumb.classList.add("is-playing");
      songThumbAnimate.play();
      for (const note of songNotes) {
        note.classList.add("is-playing");
      }
      playSongBtn.style.color = "#c662ef";
      playSongBtn.innerHTML = '<i class="bi bi-pause"></i>';
      titleSong.classList.add("is-playing");
    };
    // Khi song pause
    audio.onpause = () => {
      _this.isPlaying = false;
      playSongBtn.innerHTML = '<i class="bi bi-play-fill icon-play"></i>';
      playSongBtn.removeAttribute("style");
      songThumb.classList.remove("is-playing");
      songThumbAnimate.pause();
      for (const note of songNotes) {
        note.classList.remove("is-playing");
      }
    };
    audio.ontimeupdate = () => {
      if (audio.duration && this.isUpdateTime === true) {
        durationTime.textContent = formatTimer(audio.duration);
        trackTime.textContent = formatTimer(audio.currentTime);
        progessSongBar.max = audio.duration;
        progessSongBar.value = audio.currentTime;
      } else {
        durationTime.textContent = "00:00";
        progessSongBar.value = 0;
      }
    };
    // Khi b???m v??o progress
    progessSongBar.onmousedown = () => {
      _this.isUpdateTime = false;
    };
    // khi tua nh???c
    progessSongBar.oninput = (e) => {
      const seekTime = e.target.value;
      audio.currentTime = seekTime;
      _this.isUpdateTime = true;
    };
    progessSongBar.onkeydown = function (e) {
      if (e.keyCode === 39) {
        progessSongBar.value++;
      }
    };
    // X??? l?? khi click next play
    nextSongBtn.onclick = () => {
      if (_this.isRandom) {
        _this.randomSong();
      } else {
        _this.nextSong();
      }
      audio.play();
    };
    // X??? l?? khi click pre play
    preSongBtn.onclick = () => {
      if (_this.isRandom) {
        _this.randomSong();
      } else {
        _this.prevSong();
      }
      audio.play();
    };
    // X??? l?? khi random
    randomSongBtn.onclick = () => {
      _this.isRandom = !_this.isRandom;
      _this.setConfig("isRandom", _this.isRandom);
      randomSongBtn.classList.toggle("active", _this.isRandom);
    };
    // X??? l?? khi repeat song
    repeatSongBtn.onclick = (e) => {
      _this.isRepeat = !_this.isRepeat;
      _this.setConfig("isRepeat", _this.isRepeat);
      repeatSongBtn.classList.toggle("active", _this.isRepeat);
    };
    // X??? l?? next Song khi ended
    audio.onended = function () {
      _this.count++;
      if (_this.isRepeat && _this.count === 1) {
        audio.play();
      } else {
        nextSongBtn.click();
        repeatSongBtn.classList.remove("active");
      }
    };
    // L???ng nghe h??nh vi click v??o playlist
    playlist.onclick = (e) => {
      const songNode = e.target.closest(".playlist__list-song:not(.active)");
      if (
        songNode ||
        // X??? l?? khi click v??o song
        e.target.closest(".option-btn")
      ) {
        if (songNode) {
          listSongControl[_this.currentIndex].classList.remove("active");
          _this.currentIndex = Number(songNode.dataset.index);
          // console.log(_this.currentSong);
          listSongControl[_this.currentIndex].classList.add("active");
          _this.loadCurrentSong();
          audio.play();
        }
      }
    };
    // X??? l?? format time
    const formatTimer = (n) => {
      const minutes = Math.floor(n / 60);
      const seconds = Math.floor(n - minutes * 60);
      return `${minutes < 10 ? "0" + minutes : minutes}:${
        seconds < 10 ? "0" + seconds : seconds
      }`;
    };
  },

  loadCurrentSong: function () {
    for (const songName of songNames) {
      songName.textContent = this.currentSong.name;
      this.setConfig("currentIndex", this.currentIndex);
    }
    songAuthor.innerHTML = this.currentSong.author.toString();
    songImage.style = this.currentSong.image;
    audio.src = `./assets/music/listSong2/${this.currentSong.file}`;
  },
  loadConfig: function () {
    //First load
    if (this.config.currentIndex === undefined) {
      this.currentIndex = 0;
      this.config.volume = 100;
    } else {
      this.currentIndex = this.config.currentIndex;
      this.isRandom = this.config.isRandom;
      this.isRepeat = this.config.isRepeat;
    }
    randomSongBtn.classList.toggle("active", this.isRandom);
    repeatSongBtn.classList.toggle("active", this.isRepeat);
  },
  nextSong: function () {
    this.currentIndex++;
    if (this.currentIndex >= this.songs.length) {
      this.currentIndex = 0;
    }
    this.loadCurrentSong();
  },
  prevSong: function () {
    this.currentIndex--;
    if (this.currentIndex < 0) {
      this.currentIndex = this.songs.length - 1;
    }
    this.loadCurrentSong();
  },
  randomSong: function () {
    let newIndex;
    do {
      newIndex = Math.floor(Math.random() * this.songs.length);
    } while (newIndex == this.currentIndex);
    this.currentIndex = newIndex;
    this.loadCurrentSong();
  },

  start: function () {
    //G??n c???u h??nh t??? Config v??o app
    this.loadConfig();
    //?????nh ngh??a c??c thu???c t??nh c???a Object
    this.defineProperties();
    //Load th??ng tin b??i ?????u ti??n khi run
    this.loadCurrentSong();
    // X??? l?? c??c s??? ki???n DOM Event;
    this.handleEvents();
    //Hi???n th??? tr???ng th??i ban ?????u c???a btn repeat, random
  },
};
player.start();
