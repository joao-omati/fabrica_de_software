// JavaScript para funcionalidade da página Visualização de Salas
class VisualizacaoSalas {
    constructor() {
        this.init();
    }

    init() {
        this.bindEvents();
        this.updateDateTime();
    }

    bindEvents() {
        // Eventos para botões "Novo" e "Modificar" na seção de solicitações
        const novoButton = document.querySelector('.btn-primary');
        const modificarButton = document.querySelector('.btn-outline-secondary');
        
        if (novoButton) {
            novoButton.addEventListener('click', () => {
                this.handleNovoAgendamento();
            });
        }
        
        if (modificarButton) {
            modificarButton.addEventListener('click', () => {
                this.handleModificarAgendamento();
            });
        }

        // Eventos para células de horários na tabela (para permitir seleção de horários disponíveis)
        const horarioCells = document.querySelectorAll('.horarios-grid td');
        horarioCells.forEach(cell => {
            const statusElement = cell.querySelector('.status.disponivel');
            if (statusElement) {
                cell.style.cursor = 'pointer';
                cell.addEventListener('click', (e) => {
                    this.handleHorarioClick(e.currentTarget);
                });
                
                // Adicionar hover effect
                cell.addEventListener('mouseenter', () => {
                    if (cell.querySelector('.status.disponivel')) {
                        cell.style.backgroundColor = '#f0f7ff';
                    }
                });
                
                cell.addEventListener('mouseleave', () => {
                    cell.style.backgroundColor = '';
                });
            }
        });
    }

    handleNovoAgendamento() {
        // Simular abertura de modal ou redirecionamento para nova solicitação
        alert('Funcionalidade "Novo Agendamento":\n\nEsta ação abriria um formulário para criar uma nova solicitação de agendamento de sala.\n\nPoderia incluir:\n- Seleção de sala\n- Data e horário\n- Tipo de consulta\n- Observações');
        console.log('Novo agendamento solicitado');
    }

    handleModificarAgendamento() {
        // Simular abertura de modal para modificar agendamento existente
        alert('Funcionalidade "Modificar Agendamento":\n\nEsta ação permitiria modificar uma solicitação existente.\n\nPoderia incluir:\n- Lista de agendamentos pendentes\n- Opção de alterar data/horário\n- Cancelar solicitação');
        console.log('Modificar agendamento solicitado');
    }

    handleHorarioClick(cell) {
        const statusElement = cell.querySelector('.status.disponivel');
        if (statusElement) {
            const horarioElement = cell.querySelector('.horario');
            const horario = horarioElement ? horarioElement.textContent : 'Horário não especificado';
            
            // Simular seleção de horário
            const confirmacao = confirm(`Deseja solicitar agendamento para:\n\nSala 1 - Infantil\nHorário: ${horario}\n\nConfirmar solicitação?`);
            
            if (confirmacao) {
                // Simular envio da solicitação
                this.enviarSolicitacao(horario);
            }
        }
    }

    enviarSolicitacao(horario) {
        // Simular envio de solicitação
        alert(`Solicitação enviada com sucesso!\n\nHorário: ${horario}\nStatus: Aguardando confirmação\n\nVocê receberá uma notificação quando a solicitação for processada.`);
        console.log(`Solicitação enviada para horário: ${horario}`);
    }

    updateDateTime() {
        // Atualizar a data/hora atual na página
        const dateInfo = document.querySelector('.date-info span');
        if (dateInfo) {
            const now = new Date();
            const options = { 
                weekday: 'long', 
                year: 'numeric', 
                month: '2-digit', 
                day: '2-digit' 
            };
            const dateString = now.toLocaleDateString('pt-BR', options);
            const dayName = dateString.split(',')[0];
            const datePart = dateString.split(',')[1].trim();
            
            // Converter formato da data
            const [day, month] = datePart.split('/');
            const dayNames = {
                'segunda-feira': 'Segunda',
                'terça-feira': 'Terça', 
                'quarta-feira': 'Quarta',
                'quinta-feira': 'Quinta',
                'sexta-feira': 'Sexta',
                'sábado': 'Sábado',
                'domingo': 'Domingo'
            };
            
            const shortDayName = dayNames[dayName.toLowerCase()] || dayName;
            dateInfo.textContent = `Hoje - ${day}/${month} - ${shortDayName}`;
        }
    }

    // Método público para adicionar nova consulta (para futuras expansões)
    adicionarConsulta(paciente, data, horario) {
        console.log(`Nova consulta adicionada: ${paciente} - ${data} ${horario}`);
        // Aqui poderia adicionar dinamicamente à lista de consultas
    }

    // Método público para atualizar status de solicitação
    atualizarStatusSolicitacao(sala, novoStatus) {
        const statusItems = document.querySelectorAll('.status-item');
        statusItems.forEach(item => {
            const salaLabel = item.querySelector('.status-label');
            if (salaLabel && salaLabel.textContent.includes(sala)) {
                const badge = item.querySelector('.status-badge');
                if (badge) {
                    // Remover classes antigas
                    badge.classList.remove('confirmado', 'aguardando', 'rejeitado');
                    
                    // Adicionar nova classe e texto
                    switch(novoStatus) {
                        case 'confirmado':
                            badge.classList.add('confirmado');
                            badge.textContent = 'Agendamento Confirmado';
                            break;
                        case 'aguardando':
                            badge.classList.add('aguardando');
                            badge.textContent = 'Aguardando Confirmação';
                            break;
                        case 'rejeitado':
                            badge.classList.add('rejeitado');
                            badge.textContent = 'Agendamento Negado';
                            break;
                    }
                }
            }
        });
        console.log(`Status da sala ${sala} atualizado para: ${novoStatus}`);
    }
}

// Inicializar a funcionalidade quando a página carregar
document.addEventListener('DOMContentLoaded', function() {
    window.visualizacaoSalas = new VisualizacaoSalas();
});

// Funções auxiliares globais (opcional)
function atualizarDataHora() {
    if (window.visualizacaoSalas) {
        window.visualizacaoSalas.updateDateTime();
    }
}

function simularNovaConsulta() {
    if (window.visualizacaoSalas) {
        window.visualizacaoSalas.adicionarConsulta('Novo Paciente', '05/06/2023', '14:00');
    }
}

