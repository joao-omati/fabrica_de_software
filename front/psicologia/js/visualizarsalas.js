// Função para inicializar a aplicação
document.addEventListener('DOMContentLoaded', function() {
    // Inicializar a funcionalidade de pesquisa
    initSearchFunctionality();
    
    // Inicializar os filtros de abas nas solicitações de agendamento
    initTabFilters();
    
    // Inicializar a funcionalidade de detalhes da sala
    initSalaDetalhes();
    
    // Inicializar os formulários
    initForms();
});

// Função para inicializar a funcionalidade de pesquisa
function initSearchFunctionality() {
    const searchInput = document.querySelector('.search-input');
    const searchButton = document.querySelector('.search-button');
    
    if (searchInput && searchButton) {
        searchButton.addEventListener('click', function() {
            performSearch(searchInput.value);
        });
        
        searchInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                performSearch(searchInput.value);
            }
        });
    }
}

// Função para realizar a pesquisa
function performSearch(query) {
    if (!query.trim()) {
        alert('Por favor, digite algo para pesquisar.');
        return;
    }
    
    // Aqui você pode implementar a lógica de pesquisa real
    // Por enquanto, apenas exibimos um alerta com o termo pesquisado
    alert(`Pesquisando por: ${query}`);
    
    // Limpar o campo de pesquisa após a busca
    document.querySelector('.search-input').value = '';
}

// Função para inicializar os filtros de abas nas solicitações de agendamento
function initTabFilters() {
    const tabLinks = document.querySelectorAll('.nav-tabs .nav-link');
    
    if (tabLinks.length > 0) {
        tabLinks.forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                
                // Remover a classe active de todas as abas
                tabLinks.forEach(tab => tab.classList.remove('active'));
                
                // Adicionar a classe active à aba clicada
                this.classList.add('active');
                
                // Aqui você pode implementar a lógica para filtrar as solicitações
                // com base na aba selecionada (hoje, amanhã, esta semana, todos)
                const filter = this.getAttribute('href').substring(1); // Remove o # do href
                filterSolicitacoes(filter);
            });
        });
    }
}

// Função para filtrar as solicitações com base no filtro selecionado
function filterSolicitacoes(filter) {
    console.log(`Filtrando solicitações por: ${filter}`);
    // Aqui você pode implementar a lógica real de filtragem
    // Por enquanto, apenas logamos o filtro selecionado
}

// Função para inicializar a funcionalidade de detalhes da sala
function initSalaDetalhes() {
    // Verificar se estamos na página de detalhes da sala
    const salaDetalhes = document.querySelector('.sala-detalhes');
    
    if (salaDetalhes) {
        // Obter o ID da sala da URL
        const urlParams = new URLSearchParams(window.location.search);
        const salaId = urlParams.get('sala');
        
        if (salaId) {
            // Aqui você pode carregar os detalhes específicos da sala
            // com base no ID da sala
            console.log(`Carregando detalhes da sala ${salaId}`);
            
            // Atualizar o título da sala
            const salaTitle = document.querySelector('.sala-title');
            if (salaTitle) {
                salaTitle.textContent = `Sala ${salaId} - ${getSalaTipo(salaId)}`;
            }
        }
        
        // Adicionar eventos aos botões do formulário
        const btnSalvar = document.querySelector('.form-actions .btn-primary');
        const btnCancelar = document.querySelector('.form-actions .btn-secondary');
        const btnVoltar = document.querySelector('.form-actions .btn-outline-primary');
        
        if (btnSalvar) {
            btnSalvar.addEventListener('click', function() {
                salvarConsulta();
            });
        }
        
        if (btnCancelar) {
            btnCancelar.addEventListener('click', function() {
                limparFormulario();
            });
        }
        
        if (btnVoltar) {
            btnVoltar.addEventListener('click', function() {
                window.location.href = 'visualizar-salas.html';
            });
        }
        
        // Adicionar eventos às células da tabela de horários
        const celulasHorario = document.querySelectorAll('.horarios-table td:not(:first-child)');
        
        if (celulasHorario.length > 0) {
            celulasHorario.forEach(celula => {
                celula.addEventListener('click', function() {
                    if (!this.classList.contains('indisponivel')) {
                        selecionarHorario(this);
                    }
                });
            });
        }
    }
}

// Função para obter o tipo da sala com base no ID
function getSalaTipo(salaId) {
    // Salas 1 e 2 são infantis, as demais são normais
    return (salaId === '1' || salaId === '2') ? 'Infantil' : 'Normal';
}

// Função para selecionar um horário na tabela
function selecionarHorario(celula) {
    // Remover a seleção anterior
    const celulaSelecionada = document.querySelector('.horarios-table td.selecionado');
    if (celulaSelecionada) {
        celulaSelecionada.classList.remove('selecionado');
    }
    
    // Adicionar a classe de seleção à célula clicada
    celula.classList.add('selecionado');
    
    // Obter informações do horário selecionado
    const linha = celula.parentElement;
    const horario = linha.cells[0].textContent;
    const dia = celula.cellIndex;
    
    // Preencher os campos do formulário com base no horário selecionado
    preencherFormularioHorario(horario, dia);
}

// Função para preencher o formulário com base no horário selecionado
function preencherFormularioHorario(horario, diaIndex) {
    const diasSemana = ['', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo'];
    const dia = diasSemana[diaIndex];
    
    // Obter a data atual
    const hoje = new Date();
    
    // Calcular a data do dia da semana selecionado
    const dataConsulta = new Date(hoje);
    const diferencaDias = diaIndex - hoje.getDay();
    dataConsulta.setDate(hoje.getDate() + diferencaDias);
    
    // Formatar a data para o formato YYYY-MM-DD para o input date
    const dataFormatada = dataConsulta.toISOString().split('T')[0];
    
    // Preencher o campo de data
    const inputData = document.getElementById('data-consulta');
    if (inputData) {
        inputData.value = dataFormatada;
    }
    
    // Extrair o horário de início e fim
    const horarios = horario.split(' - ');
    const horaInicio = horarios[0];
    const horaFim = horarios[1];
    
    // Preencher os campos de horário
    const inputHoraInicio = document.getElementById('horario-inicio');
    const inputHoraFim = document.getElementById('horario-termino');
    
    if (inputHoraInicio) {
        inputHoraInicio.value = horaInicio;
    }
    
    if (inputHoraFim) {
        inputHoraFim.value = horaFim;
    }
}

// Função para salvar os dados da consulta
function salvarConsulta() {
    const estagiario = document.getElementById('estagiario').value;
    const paciente = document.getElementById('paciente').value;
    const dataConsulta = document.getElementById('data-consulta').value;
    const horaInicio = document.getElementById('horario-inicio').value;
    const horaFim = document.getElementById('horario-termino').value;
    const observacoes = document.getElementById('observacoes').value;
    
    // Validar os campos obrigatórios
    if (!estagiario || !paciente || !dataConsulta || !horaInicio || !horaFim) {
        alert('Por favor, preencha todos os campos obrigatórios.');
        return;
    }
    
    // Aqui você pode implementar a lógica para salvar os dados da consulta
    // Por enquanto, apenas exibimos um alerta com os dados
    alert(`Consulta agendada com sucesso!\n\nEstagiário: ${estagiario}\nPaciente: ${paciente}\nData: ${dataConsulta}\nHorário: ${horaInicio} - ${horaFim}`);
    
    // Limpar o formulário após salvar
    limparFormulario();
    
    // Redirecionar para a página de visualização de salas
    window.location.href = 'visualizar-salas.html';
}

// Função para limpar o formulário
function limparFormulario() {
    const form = document.querySelector('.consulta-form');
    
    if (form) {
        const inputs = form.querySelectorAll('input, textarea');
        
        inputs.forEach(input => {
            input.value = '';
        });
    }
}

// Função para inicializar os formulários
function initForms() {
    // Adicionar eventos aos botões de ação nas solicitações
    const btnAprovar = document.querySelectorAll('.solicitacao-actions .btn-primary');
    const btnRejeitar = document.querySelectorAll('.solicitacao-actions .btn-outline-secondary');
    
    if (btnAprovar.length > 0) {
        btnAprovar.forEach(btn => {
            btn.addEventListener('click', function() {
                const solicitacaoCard = this.closest('.solicitacao-card');
                const estagiario = solicitacaoCard.querySelector('.solicitacao-info h4').textContent;
                const horario = solicitacaoCard.querySelector('.solicitacao-info p').textContent;
                
                aprovarSolicitacao(estagiario, horario);
            });
        });
    }
    
    if (btnRejeitar.length > 0) {
        btnRejeitar.forEach(btn => {
            btn.addEventListener('click', function() {
                const solicitacaoCard = this.closest('.solicitacao-card');
                const estagiario = solicitacaoCard.querySelector('.solicitacao-info h4').textContent;
                const horario = solicitacaoCard.querySelector('.solicitacao-info p').textContent;
                
                rejeitarSolicitacao(estagiario, horario);
            });
        });
    }
}

// Função para aprovar uma solicitação
function aprovarSolicitacao(estagiario, horario) {
    // Aqui você pode implementar a lógica para aprovar a solicitação
    alert(`Solicitação de ${estagiario} para ${horario} aprovada com sucesso!`);
    
    // Remover o card da solicitação após aprovar
    removerCardSolicitacao(estagiario, horario);
}

// Função para rejeitar uma solicitação
function rejeitarSolicitacao(estagiario, horario) {
    // Aqui você pode implementar a lógica para rejeitar a solicitação
    alert(`Solicitação de ${estagiario} para ${horario} rejeitada.`);
    
    // Remover o card da solicitação após rejeitar
    removerCardSolicitacao(estagiario, horario);
}

// Função para remover o card da solicitação
function removerCardSolicitacao(estagiario, horario) {
    const solicitacaoCards = document.querySelectorAll('.solicitacao-card');
    
    if (solicitacaoCards.length > 0) {
        solicitacaoCards.forEach(card => {
            const cardEstagiario = card.querySelector('.solicitacao-info h4').textContent;
            const cardHorario = card.querySelector('.solicitacao-info p').textContent;
            
            if (cardEstagiario === estagiario && cardHorario === horario) {
                // Adicionar classe para animar a remoção
                card.classList.add('removing');
                
                // Remover o card após a animação
                setTimeout(() => {
                    card.remove();
                }, 300);
            }
        });
    }
}

