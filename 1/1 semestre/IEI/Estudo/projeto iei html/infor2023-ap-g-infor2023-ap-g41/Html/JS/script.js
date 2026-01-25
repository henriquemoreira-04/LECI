function scrollToElement(elementSelector, instance = 0) {

    const elements = document.querySelectorAll(elementSelector);

    if (elements.length > instance) {

        elements[instance].scrollIntoView({ behavior: 'smooth' });
    }
}

const link1 = document.getElementById("link1");
const link2 = document.getElementById("link2");
const link3 = document.getElementById("link3");
const aboutButton = document.getElementById("aboutButton");
const gitButton = document.getElementById("gitButton");
const topico = document.getElementById("topico");
const watchbutton1 = document.getElementById("watchbutton1");
const watchbutton2 = document.getElementById("watchbutton2");
const watchbutton3 = document.getElementById("watchbutton3");


link1.addEventListener('click', () => {
    scrollToElement('.header');
});

link2.addEventListener('click', () => {

    scrollToElement('.header', 1);
});

link3.addEventListener('click', () => {
    scrollToElement('.column');
});

aboutButton.addEventListener('click', function() {
    window.location.href = 'about.html';
});

gitButton.addEventListener('click', function() {
    console.log('Botão 1 clicado')
    window.location.href = 'https://github.com/detiuaveiro/infor2023-ap-g-infor2023-ap-g41.git';
});

topico.addEventListener('click', () => {
    scrollToElement('.header');
});

watchbutton1.addEventListener('click', function() {
    console.log('Botão 1 clicado');
    window.location.href = 'https://youtu.be/VGLnDgagU_g?si=_Ba2CarBV3TmXsWh';
});

watchbutton2.addEventListener('click', function() {
    console.log('Botão 2 clicado');
    window.location.href = 'https://www.youtube.com/watch?v=5R8xZb6J3r0&t=4s';
});

watchbutton3.addEventListener('click', function() {
    console.log('Botão 3 clicado');
    window.location.href = 'https://www.youtube.com/watch?v=L_4BPjLBF4E';
});