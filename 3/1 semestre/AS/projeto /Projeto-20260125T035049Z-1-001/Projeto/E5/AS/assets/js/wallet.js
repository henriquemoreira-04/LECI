document.addEventListener('DOMContentLoaded', function() {

    const email = 'cliente@multipower.pt';
    localStorage.setItem('email', email);
    
    console.log("Carteira iniciada para: " + email);
    
    atualizarSaldo(email);

    const btnCarregar = document.querySelector('.add-funds-btn'); 
    
    if(btnCarregar) {
        btnCarregar.addEventListener('click', () => {
             const valor = prompt("Quanto deseja carregar? (Ex: 20)");
             
             if(valor && !isNaN(valor) && parseFloat(valor) > 0) {
                 adicionarSaldo(email, parseFloat(valor));
             } else if (valor !== null) {
                 alert("Por favor insira um valor válido.");
             }
        });
    }
});

async function atualizarSaldo(email) {
    try {
        const res = await fetch(`/api/wallet/${email}`);
        const data = await res.json();
        
        const el = document.querySelector('.balance-amount');
        if(el) {
            el.textContent = (data.saldo || 0).toFixed(2) + '€';
        }
    } catch(e) { 
        console.error("Erro ao ler saldo:", e); 
    }
}

async function adicionarSaldo(email, valor) {
    try {
        const res = await fetch('/api/adicionar-saldo', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ email: email, valor: valor })
        });
        
        if (res.ok) {
            alert(`Sucesso! Foram adicionados ${valor}€ à sua conta.`);
            atualizarSaldo(email);
        } else {
            const err = await res.json();
            alert("Erro: " + (err.error || "Não foi possível carregar."));
        }
    } catch(e) { 
        alert("Erro de ligação ao servidor."); 
    }
}