// Wait for the DOM to load
document.addEventListener('DOMContentLoaded', () => {
    const heroSelect = document.getElementById('hero-select');
    const monsterSelect = document.getElementById('monster-select');
    const heroImage = document.getElementById('hero-image');
    const monsterImage = document.getElementById('monster-image');
    const checkboxes = document.querySelectorAll('.habit-tracker input[type="checkbox"]');
    const progress = document.getElementById('habit-progress');
    const rewardMessage = document.getElementById('reward-message');
    const resetButton = document.getElementById('reset-button')

    // Load saved avatars from local storage
    const savedHero = localStorage.getItem('hero');
    const savedMonster = localStorage.getItem('monster');

    if (savedHero) {
        heroSelect.value = savedHero;
        heroImage.src = savedHero;
    }

    if (savedMonster) {
        monsterSelect.value = savedMonster;
        monsterImage.src = savedMonster;
    }

    // Update hero image and save selection to local storage
    heroSelect.addEventListener('change', (event) => {
        const selectedHero = event.target.value;
        heroImage.src = selectedHero;
        localStorage.setItem('hero', selectedHero);
    });

    // Update monster image and save selection to local storage
    monsterSelect.addEventListener('change', (event) => {
        const selectedMonster = event.target.value;
        monsterImage.src = selectedMonster;
        localStorage.setItem('monster', selectedMonster);
    });

    // Update progress based on completed habits
    checkboxes.forEach(checkbox => {
        checkbox.addEventListener('change', updateProgress);
    });

    function updateProgress() {
        const completedHabits = Array.from(checkboxes).filter(checkbox => checkbox.checked).length;
        progress.value = completedHabits;

        if (completedHabits === checkboxes.length) {
            defeatMonster();
        }
    }

    function defeatMonster() {
        rewardMessage.textContent = "Congratulations! You've defeated the monster and earned a reward!";
        // Additional reward logic can be added here
    }

    resetButton.addEventListener('click', resetGame);

    function resetGame() {
        // Reset checkboxes
        checkboxes.forEach(checkbox => checkbox.checked = false);

        // Reset progress bar
        progress.value = 0;

        // Clear reward message
        rewardMessage.textContent = '';

        // Clear local storage
        localStorage.removeItem('hero');
        localStorage.removeItem('monster');

        // Reset hero and monster images to default
        heroSelect.value = 'images/hero1.png';
        heroImage.src = 'images/hero1.png';
        monsterSelect.value = 'images/monster1.png';
        monsterImage.src = 'images/monster1.png';
    }
});

  