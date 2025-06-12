document.querySelectorAll('.faq-item').forEach(item => {
        const question = item.querySelector('.faq-question');
        const answer = item.querySelector('.faq-answer');
        const toggle = item.querySelector('.faq-toggle');

        question.addEventListener('click', () => {
            const isOpen = answer.style.display === 'block';
            answer.style.display = isOpen ? 'none' : 'block';
            toggle.textContent = isOpen ? '+' : '–';
        });
    });

    // Seleciona todas as células da tabela com a classe 'disponivel'
    const celulasDisponiveis = document.querySelectorAll('.disponivel');

    // Seleciona o formulário
    const consultaForm = document.getElementById('consulta-form');

    // Adiciona um evento de clique em cada célula de "Disponível"
    celulasDisponiveis.forEach(celula => {
        celula.addEventListener('click', () => {
            // Exibe o formulário de informações da consulta
            consultaForm.style.display = 'block';

            // Opcional: Desloca a página até o formulário para melhor visibilidade
            consultaForm.scrollIntoView({ behavior: 'smooth' });
        });
    });
