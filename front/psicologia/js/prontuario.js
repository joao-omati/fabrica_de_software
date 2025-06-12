// Função para visualizar documento em tela cheia
function visualizarDocumento() {
    const modalOverlay = document.getElementById('modalOverlay');
    
    // Exibe o modal
    modalOverlay.style.display = 'flex';
    
    // Adiciona listener para fechar com ESC
    document.addEventListener('keydown', handleEscapeKey);
}

// Função para fechar o modal
function fecharModal() {
    const modalOverlay = document.getElementById('modalOverlay');
    modalOverlay.style.display = 'none';
    
    // Remove o listener do ESC
    document.removeEventListener('keydown', handleEscapeKey);
}

// Função para lidar com a tecla ESC
function handleEscapeKey(event) {
    if (event.key === 'Escape') {
        fecharModal();
    }
}

// Inicialização quando o DOM estiver carregado
document.addEventListener('DOMContentLoaded', function() {
    console.log('Sistema de prontuários carregado com sucesso!');
    
    // Adiciona event listeners para os botões dentro do modal (se necessário)
    const modalButtons = document.querySelectorAll('.modal-content-full .btn');
    modalButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            // Por enquanto, apenas previne o comportamento padrão
            // Funcionalidades específicas podem ser adicionadas aqui no futuro
            console.log('Botão clicado:', this.textContent);
        });
    });
});

