document.addEventListener('DOMContentLoaded', () => {
    console.log("Portfolio System Initialized.");

    // Funzione 1: Aggiorna lo stato del sistema nel footer
    const statusElement = document.getElementById('system-status');
    if (statusElement) {
        setTimeout(() => {
            statusElement.innerHTML = "System Status: <span style='color: #00ff41'>ONLINE</span> | Security: <span style='color: #00ff41'>SECURE</span>";
        }, 1500); // Ritardo simulato per effetto "boot"
    }

    // Funzione 2: Log dell'anno corrente (se volessi metterlo nel copyright)
    const currentYear = new Date().getFullYear();
    console.log(`Current session year: ${currentYear}`);
    
    // Qui in futuro potrai aggiungere la chiamata alla Lambda del contatore visite
    // fetch('https://tua-api-gateway-url/visitor-counter') ...
});

function setLanguage(lang) {
    // 1. Aggiorna tutti i testi con data-i18n
    document.querySelectorAll('[data-i18n]').forEach(element => {
        const key = element.getAttribute('data-i18n');
        if (translations[lang] && translations[lang][key]) {
            element.innerHTML = translations[lang][key]; // innerHTML per supportare i <br>
        }
    });

    // 2. Aggiorna lo stile dei bottoni
    document.querySelectorAll('.lang-btn').forEach(btn => {
        btn.classList.remove('active');
        if(btn.textContent.toLowerCase() === lang) btn.classList.add('active');
    });

    // 3. Salva la preferenza (opzionale)
    console.log(`Language switched to: ${lang}`);
}

// All'avvio, imposta l'inglese di default (più professionale)
document.addEventListener('DOMContentLoaded', () => {
    setLanguage('en'); 
    // ... il resto del tuo codice esistente ...
});
