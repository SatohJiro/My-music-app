const audio = document.getElementById("audio");
const durationtime = document.querySelector(".durationtime");
const tracktime = document.querySelector(".tracktime");



//
let timer;
//play, pause Song
let isPlaying = true;
let index = 0;

//Song model
function Song(name, artist, linkSong, linkImage) {
	this.name = name;
	this.artist = artist;
	this.linkSong = linkSong;
	this.linkImage = linkImage;
}
/*document.querySelectorAll(".tab-song .playlist__list .playlist__list-song");*/
/*document.querySelectorAll(".tab-song .playlist__list .playlist__list-song")[0].getAttribute('src');*/
/*document.querySelectorAll(".tab-song .playlist__list .playlist__list-song .playlist__song-thumb").getAttribute('style')*/
/*document.querySelectorAll(".tab-song .playlist__list .playlist__list-song .playlist__song-body .info__title")[0].innerText;*/
/*document.querySelectorAll(".tab-song .playlist__list .playlist__list-song .playlist__song-body .info__author .is-ghost")[0].innerText;*/
// playSong
const linkSong = document.querySelectorAll(".tab-song .playlist__list .playlist__list-song");
const list_info_Song = [];
for (var i = 0; i < linkSong.length; i++) {
	const songURL = linkSong[i].getAttribute('src');
	const linkImagesSong = linkSong[i].querySelector(".playlist__song-thumb").getAttribute('style');
	const artistSong = linkSong[i].querySelector(".playlist__song-body .info__author .is-ghost").innerText;
	const nameSong = linkSong[i].querySelector(".playlist__song-body .info__title").innerText;
	let s = new Song(nameSong, artistSong, songURL, linkImagesSong);
	list_info_Song[i] = s;

}


// xoay image

let rotateAngle = 90;
let rotateAngleSpeed = 0;

function rotate() {
	const image = document.querySelector('.player .player__container .player__song-info .player__song-thumb .thumb-img');
	const style = document.querySelector('.player .player__container .player__song-info .player__song-thumb .thumb-img').getAttribute('style');
	image.setAttribute("style", style + ';transform: rotate(' + rotateAngle + 'deg);');
	rotateAngle = rotateAngle + rotateAngleSpeed;
}
timerRotate = setInterval(rotate, 50);




// option btn

const playSongBtn = document.querySelector(
	".control-btn.btn-toggle-play.btn--play-song.is-medium"
);
const nextSongBtn = document.querySelector(".control-btn.btn-next");
const preSongBtn = document.querySelector(".control-btn.btn-prev");
// progess
const progessSongBar = document.getElementById("progress--main");
// set duration time, current time
let displayTimer = () => {
	const { duration, currentTime } = audio;
	progessSongBar.max = duration;
	progessSongBar.value = currentTime;
	tracktime.textContent = formatTimer(currentTime);
	if (!duration) {
		durationtime.textContent = "00:00";
	} else {
		durationtime.textContent = formatTimer(duration);
	}
};
const formatTimer = (n) => {
	const minutes = Math.floor(n / 60);
	const seconds = Math.floor(n - minutes * 60);
	return `${minutes < 10 ? "0" + minutes : minutes}:${seconds < 10 ? "0" + seconds : seconds}`;
};
displayTimer();

//set first audio
audio.setAttribute("src", `${list_info_Song[index].linkSong}`);
//playSong
const playSong = () => {
	if (isPlaying) {
		audio.play();
		playSongBtn.innerHTML = '<i class="bi bi-pause"></i>';
		isPlaying = false;
		rotateAngleSpeed = 1;
		timer = setInterval(displayTimer, 500);
	} else {
		audio.pause();
		playSongBtn.innerHTML = '<i class="bi bi-play-fill icon-play"></i>';
		isPlaying = true;
		rotateAngleSpeed = 0;
		clearInterval(timer);
	}
};
playSongBtn.addEventListener("click", playSong);
nextSongBtn.addEventListener("click", () => {
	changeSong('next');
});
preSongBtn.addEventListener("click", () => {
	changeSong('back');
});


// when end song
audio.addEventListener("ended", handleEndedSong);
function handleEndedSong() {
	changeSong(Math.floor(Math.random() * list_info_Song.length));
}

function changeSong(e) {
	if (e == 'next') {
		index++;
		isPlaying = true;
		if (index >= list_info_Song.length) {
			index = 0;
		}
	} else if (e == 'back') {
		index--;
		isPlaying = true;
		if (index < 0) {
			index = list_info_Song.length - 1;
		}
	}
	else {
		index = Number(e);
		isPlaying = true;
		console.log(e);
	}
	document.querySelector('.player .player__container .player__song-info .player__song-thumb .thumb-img').setAttribute('style', list_info_Song[index].linkImage);
	document.querySelector('.player__title-animate .title__item').innerText = list_info_Song[index].name;
	console.log(list_info_Song[index].name);
	document.querySelector('.player .player__container .player__container-song .player__song-info .media__content .player__song-body .info__author').innerText = list_info_Song[index].artist;
	audio.setAttribute("src", `${list_info_Song[index].linkSong}`);
	playSong();
}


// song bar progess
progessSongBar.addEventListener("change", handleChangeBar);
function handleChangeBar() {
	audio.currentTime = progessSongBar.value;
}
