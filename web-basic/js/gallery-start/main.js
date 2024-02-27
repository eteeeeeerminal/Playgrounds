const displayedImage = document.querySelector('.displayed-img');
const thumbBar = document.querySelector('.thumb-bar');

const btn = document.querySelector('button');
const overlay = document.querySelector('.overlay');

/* Declaring the array of image filenames */
const imagePaths = [
  'images/pic1.jpg',
  'images/pic2.jpg',
  'images/pic3.jpg',
  'images/pic4.jpg',
  'images/pic5.jpg',
]

/* Declaring the alternative text for each image file */
const imageAlts = [
  'images/pic1.jpg',
  'images/pic2.jpg',
  'images/pic3.jpg',
  'images/pic4.jpg',
  'images/pic5.jpg',
]

for (let i = 0; i < 5; i++) {
  const newImage = document.createElement('img');
  newImage.setAttribute('src', imagePaths[i]);
  newImage.setAttribute('alt', imageAlts[i]);
  thumbBar.appendChild(newImage);
}

thumbBar.addEventListener('click', (e) => {
  displayedImage.setAttribute('src', e.target.src);
  displayedImage.setAttribute('alt', e.target.alt);
});

btn.addEventListener('click', () => {
  const className = btn.getAttribute('class');
  if (className === 'dark') {
    btn.setAttribute('class', 'light');
    btn.textContent = 'Lighten';
    overlay.style.backgroundColor = 'rgba(0,0,0,0.5)';
  } else {
    btn.setAttribute('class', 'dark');
    btn.textContent = 'Darken';
    overlay.style.backgroundColor = 'rgba(0,0,0,0)';
  }
});
