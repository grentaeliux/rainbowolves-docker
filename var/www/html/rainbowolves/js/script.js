document.addEventListener('DOMContentLoaded', function() {
    const counter = document.getElementById('days-counter');
    const timestamp = 1728226807;
    const daysWithoutWipe = Math.floor((Date.now() / 1000 - timestamp) / 86400);
    counter.textContent = daysWithoutWipe;

    const currentTheme = localStorage.getItem('theme') || 'light';
    if (currentTheme === 'dark') {
        document.body.classList.add('dark-mode');
    }
});

function toggleTheme() {
    document.body.classList.toggle('dark-mode');
    const currentTheme = document.body.classList.contains('dark-mode') ? 'dark' : 'light';
    localStorage.setItem('theme', currentTheme);
}

let currentImageIndex = 0;
const images = [
    './img/picture_1-min.png',
    './img/picture_2-min.png',
    './img/picture_3-min.png',
    './img/picture_4-min.png',
    './img/picture_5-min.png',
    './img/picture_6-min.png',
    './img/picture_7-min.png'
];
const carouselImg = document.querySelector('.carousel-img');

function updateImage() {
    carouselImg.src = images[currentImageIndex];
}

function prevImage() {
    currentImageIndex = (currentImageIndex - 1 + images.length) % images.length;
    updateImage();
}

function nextImage() {
    currentImageIndex = (currentImageIndex + 1) % images.length;
    updateImage();
}

document.addEventListener('DOMContentLoaded', function() {
    updateImage();
});
