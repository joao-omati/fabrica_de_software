// JavaScript para a tela do estagiário
document.addEventListener('DOMContentLoaded', function() {
    // Função para marcar/desmarcar todos os checkboxes
    function toggleAllCheckboxes() {
        const checkboxes = document.querySelectorAll('.checkbox-container input[type="checkbox"]');
        const allChecked = Array.from(checkboxes).every(checkbox => checkbox.checked);
        
        checkboxes.forEach(checkbox => {
            checkbox.checked = !allChecked;
        });
    }

    // Função para abrir prontuário
    function abrirProntuario(nome) {
        alert(`Abrindo prontuário de ${nome}`);
        // Aqui você pode implementar a lógica para abrir o prontuário
    }

    // Função para abrir atendimento
    function abrirAtendimento(nome) {
        alert(`Abrindo atendimento de ${nome}`);
        // Aqui você pode implementar a lógica para abrir o atendimento
    }

    // Adicionar event listeners aos botões de abrir prontuário
    const botoesAbrirProntuario = document.querySelectorAll('.prontuario-item .btn');
    botoesAbrirProntuario.forEach((botao, index) => {
        botao.addEventListener('click', function() {
            const nome = this.closest('.prontuario-item').querySelector('h4').textContent;
            abrirProntuario(nome);
        });
    });

    // Adicionar event listeners aos botões de abrir atendimento
    const botoesAbrirAtendimento = document.querySelectorAll('.atendimentos-recentes .btn');
    botoesAbrirAtendimento.forEach((botao, index) => {
        botao.addEventListener('click', function() {
            const linha = this.closest('tr');
            const nome = linha.querySelector('td:first-child').textContent;
            abrirAtendimento(nome);
        });
    });

    // Função para destacar item ativo na sidebar
    function highlightActiveMenuItem() {
        const currentPage = window.location.pathname.split('/').pop();
        const menuItems = document.querySelectorAll('.sidebar-nav a');
        
        menuItems.forEach(item => {
            const href = item.getAttribute('href');
            if (href === currentPage) {
                item.closest('li').classList.add('active');
            } else {
                item.closest('li').classList.remove('active');
            }
        });
    }

    // Chamar função para destacar item ativo
    highlightActiveMenuItem();

    // Função para busca (se necessário)
    const searchInput = document.querySelector('.search-input');
    const searchButton = document.querySelector('.search-button');
    
    if (searchInput && searchButton) {
        searchButton.addEventListener('click', function() {
            const searchTerm = searchInput.value.trim();
            if (searchTerm) {
                // Implementar lógica de busca
                console.log('Buscando por:', searchTerm);
            }
        });

        searchInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                searchButton.click();
            }
        });
    }
});

