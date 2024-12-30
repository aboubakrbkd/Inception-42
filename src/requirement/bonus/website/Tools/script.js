let clickCounter = 0;

const button = document.getElementById('clickButton');
const clickCountDisplay = document.getElementById('clickCount');

button.addEventListener('click', () => {
    clickCounter++;
    clickCountDisplay.textContent = `Clicks: ${clickCounter}`;
});
