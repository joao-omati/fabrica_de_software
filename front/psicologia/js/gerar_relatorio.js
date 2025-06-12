// JavaScript para funcionalidade de pesquisa de pacientes
class PatientSearch {
    constructor() {
        this.patients = [
            'Maria Silva',
            'Carla Mendes',
            'Guilherme Ferreira',
            'Pedro Henrique',
            'João Peres',
            'Cleiton'
        ];
        this.init();
    }

    init() {
        this.bindEvents();
    }

    bindEvents() {
        const searchInput = document.querySelector('.search-patient-input');
        const searchButton = document.querySelector('.search-patient-button');

        if (searchInput) {
            // Pesquisa em tempo real enquanto digita
            searchInput.addEventListener('input', (e) => {
                this.filterPatients(e.target.value);
            });

            // Pesquisa ao pressionar Enter
            searchInput.addEventListener('keypress', (e) => {
                if (e.key === 'Enter') {
                    this.filterPatients(e.target.value);
                }
            });
        }

        if (searchButton) {
            searchButton.addEventListener('click', () => {
                const searchTerm = searchInput ? searchInput.value : '';
                this.filterPatients(searchTerm);
            });
        }

        // Adicionar eventos aos botões de ação
        this.bindActionButtons();
    }

    filterPatients(searchTerm) {
        const patientItems = document.querySelectorAll('.patient-item');
        const normalizedSearchTerm = searchTerm.toLowerCase().trim();

        patientItems.forEach(item => {
            const patientName = item.querySelector('.patient-name');
            if (patientName) {
                const normalizedPatientName = patientName.textContent.toLowerCase();

                if (normalizedPatientName.includes(normalizedSearchTerm) || normalizedSearchTerm === '') {
                    item.style.display = 'grid';
                } else {
                    item.style.display = 'none';
                }
            }
        });

        // Mostrar mensagem se nenhum paciente for encontrado
        this.showNoResultsMessage(searchTerm);
    }

    showNoResultsMessage(searchTerm) {
        const patientList = document.querySelector('.patient-list');
        const visibleItems = document.querySelectorAll('.patient-item[style="display: grid"], .patient-item:not([style*="display: none"])');

        // Remove mensagem anterior se existir
        const existingMessage = document.querySelector('.no-results-message');
        if (existingMessage) {
            existingMessage.remove();
        }

        // Se não há itens visíveis e há um termo de pesquisa
        if (visibleItems.length === 0 && searchTerm.trim() !== '') {
            const noResultsDiv = document.createElement('div');
            noResultsDiv.className = 'no-results-message';
            noResultsDiv.innerHTML = `
                <div style="padding: 20px; text-align: center; color: var(--cor-texto-secundaria);">
                    <i class="fas fa-search" style="font-size: 24px; margin-bottom: 10px;"></i>
                    <p>Nenhum paciente encontrado para "${searchTerm}"</p>
                </div>
            `;
            patientList.appendChild(noResultsDiv);
        }
    }

    bindActionButtons() {
        // Eventos para botões "Enviar Relatório"
        const sendReportButtons = document.querySelectorAll('.btn-send-report');
        sendReportButtons.forEach(button => {
            button.addEventListener('click', (e) => {
                const patientItem = e.target.closest('.patient-item');
                const patientName = patientItem.querySelector('.patient-name').textContent;
                this.handleSendReport(patientName, button);
            });
        });

        // Eventos para botões "Ver Detalhes"
        const viewDetailsButtons = document.querySelectorAll('.btn-view-details');
        viewDetailsButtons.forEach(button => {
            button.addEventListener('click', (e) => {
                const patientItem = e.target.closest('.patient-item');
                const patientName = patientItem.querySelector('.patient-name').textContent;
                this.handleViewDetails(patientName);
            });
        });
    }

    handleSendReport(patientName, button) {
        // Simular envio de relatório
        const originalText = button.textContent;
        button.textContent = 'Enviando...';
        button.disabled = true;
        button.style.backgroundColor = '#ccc';

        // Simular delay de envio
        setTimeout(() => {
            button.textContent = 'Enviado!';
            button.style.backgroundColor = '#28a745';

            // Voltar ao estado original após 2 segundos
            setTimeout(() => {
                button.textContent = originalText;
                button.disabled = false;
                button.style.backgroundColor = '';
            }, 2000);
        }, 1500);

        console.log(`Relatório enviado para: ${patientName}`);
    }

    handleViewDetails(patientName) {
        // Simular visualização de detalhes
        alert(`Visualizando detalhes de: ${patientName}\n\nEsta funcionalidade abriria uma nova página ou modal com os detalhes do paciente.`);
        console.log(`Visualizando detalhes de: ${patientName}`);
    }

    // Método público para limpar a pesquisa
    clearSearch() {
        const searchInput = document.querySelector('.search-patient-input');
        if (searchInput) {
            searchInput.value = '';
            this.filterPatients('');
        }
    }

    // Método público para adicionar novo paciente (para futuras expansões)
    addPatient(patientName) {
        this.patients.push(patientName);
        console.log(`Paciente adicionado: ${patientName}`);
    }
}

// Inicializar a funcionalidade de pesquisa quando a página carregar
document.addEventListener('DOMContentLoaded', function () {
    window.patientSearch = new PatientSearch();
});

// Funções auxiliares globais (opcional)
function clearPatientSearch() {
    if (window.patientSearch) {
        window.patientSearch.clearSearch();
    }
}

