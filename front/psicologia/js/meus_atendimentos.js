// Calendário JavaScript para seleção de dias e navegação entre meses
class Calendar {
    constructor() {
        this.currentDate = new Date();
        this.selectedDate = new Date(2025, 4, 26); // 26 de maio de 2025 (mês 4 = maio)
        this.monthNames = [
            'January', 'February', 'March', 'April', 'May', 'June',
            'July', 'August', 'September', 'October', 'November', 'December'
        ];
        this.monthNamesPortuguese = [
            'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
            'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'
        ];
        this.dayNamesPortuguese = [
            'Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'
        ];
        
        this.init();
    }

    init() {
        this.bindEvents();
        this.renderCalendar();
        this.updateSelectedDateDisplay();
    }

    bindEvents() {
        // Navegação do calendário
        const prevBtn = document.getElementById('prevMonth');
        const nextBtn = document.getElementById('nextMonth');
        
        if (prevBtn) {
            prevBtn.addEventListener('click', () => this.previousMonth());
        }
        
        if (nextBtn) {
            nextBtn.addEventListener('click', () => this.nextMonth());
        }
    }

    previousMonth() {
        this.currentDate.setMonth(this.currentDate.getMonth() - 1);
        this.renderCalendar();
    }

    nextMonth() {
        this.currentDate.setMonth(this.currentDate.getMonth() + 1);
        this.renderCalendar();
    }

    renderCalendar() {
        const monthElement = document.querySelector('.calendar-month');
        const daysContainer = document.querySelector('.calendar-days');
        
        if (!monthElement || !daysContainer) return;

        // Atualizar o título do mês
        const monthName = this.monthNames[this.currentDate.getMonth()];
        const year = this.currentDate.getFullYear();
        monthElement.textContent = `${monthName} ${year}`;

        // Limpar dias existentes
        daysContainer.innerHTML = '';

        // Obter primeiro dia do mês e número de dias
        const firstDay = new Date(this.currentDate.getFullYear(), this.currentDate.getMonth(), 1);
        const lastDay = new Date(this.currentDate.getFullYear(), this.currentDate.getMonth() + 1, 0);
        const daysInMonth = lastDay.getDate();
        const startingDayOfWeek = firstDay.getDay();

        // Adicionar dias vazios do mês anterior
        for (let i = 0; i < startingDayOfWeek; i++) {
            const emptyDay = document.createElement('div');
            emptyDay.className = 'calendar-day';
            daysContainer.appendChild(emptyDay);
        }

        // Adicionar dias do mês atual
        for (let day = 1; day <= daysInMonth; day++) {
            const dayElement = document.createElement('div');
            dayElement.className = 'calendar-day';
            dayElement.textContent = day;
            dayElement.setAttribute('data-day', day);
            
            // Verificar se é o dia selecionado
            if (this.isSelectedDate(day)) {
                dayElement.classList.add('selected-day');
            }
            
            // Verificar se é o dia atual (hoje)
            if (this.isToday(day)) {
                dayElement.classList.add('current-day');
            }
            
            // Adicionar evento de clique
            dayElement.addEventListener('click', () => this.selectDate(day));
            
            daysContainer.appendChild(dayElement);
        }

        // Atualizar a data de hoje no rodapé do calendário
        this.updateTodayDisplay();
    }

    selectDate(day) {
        // Atualizar a data selecionada
        this.selectedDate = new Date(this.currentDate.getFullYear(), this.currentDate.getMonth(), day);
        
        // Remover seleção anterior
        const previousSelected = document.querySelector('.calendar-day.selected-day');
        if (previousSelected) {
            previousSelected.classList.remove('selected-day');
        }
        
        // Adicionar seleção ao novo dia
        const selectedElement = document.querySelector(`[data-day="${day}"]`);
        if (selectedElement) {
            selectedElement.classList.add('selected-day');
        }
        
        // Atualizar a exibição da data selecionada
        this.updateSelectedDateDisplay();
        
        // Simular atualização das consultas (você pode personalizar isso)
        this.updateConsultasForDate();
    }

    isSelectedDate(day) {
        return this.selectedDate.getDate() === day &&
               this.selectedDate.getMonth() === this.currentDate.getMonth() &&
               this.selectedDate.getFullYear() === this.currentDate.getFullYear();
    }

    isToday(day) {
        const today = new Date();
        return today.getDate() === day &&
               today.getMonth() === this.currentDate.getMonth() &&
               today.getFullYear() === this.currentDate.getFullYear();
    }

    updateSelectedDateDisplay() {
        const selectedDateElement = document.querySelector('.selected-date h3');
        if (selectedDateElement) {
            const dayName = this.dayNamesPortuguese[this.selectedDate.getDay()];
            const day = this.selectedDate.getDate();
            const monthName = this.monthNamesPortuguese[this.selectedDate.getMonth()];
            const year = this.selectedDate.getFullYear();
            
            selectedDateElement.textContent = `${dayName} - ${day}. ${monthName}. ${year}`;
        }
    }

    updateTodayDisplay() {
        const todayElement = document.querySelector('.calendar-today');
        if (todayElement) {
            const today = new Date();
            const day = String(today.getDate()).padStart(2, '0');
            const month = String(today.getMonth() + 1).padStart(2, '0');
            const year = today.getFullYear();
            
            todayElement.textContent = `Today: ${day}/${month}/${year}`;
        }
    }

    updateConsultasForDate() {
        // Esta função pode ser expandida para carregar consultas específicas da data
        // Por enquanto, vamos apenas simular uma atualização
        console.log(`Data selecionada: ${this.selectedDate.toLocaleDateString('pt-BR')}`);
        
        // Você pode adicionar aqui a lógica para:
        // - Buscar consultas da data selecionada
        // - Atualizar os contadores (Confirmado, Pendente, Cancelado)
        // - Atualizar a lista de consultas
        
        // Exemplo de como você poderia atualizar os contadores:
        // this.updateConsultasStatus();
    }

    updateConsultasStatus() {
        // Exemplo de como atualizar os status das consultas
        // Você pode personalizar isso baseado nos seus dados
        const statusCounts = this.getConsultasForDate(this.selectedDate);
        
        const confirmadoElement = document.querySelector('.status-item:nth-child(1) .status-count');
        const pendenteElement = document.querySelector('.status-item:nth-child(2) .status-count');
        const canceladoElement = document.querySelector('.status-item:nth-child(3) .status-count');
        
        if (confirmadoElement) confirmadoElement.textContent = statusCounts.confirmado || 0;
        if (pendenteElement) pendenteElement.textContent = statusCounts.pendente || 0;
        if (canceladoElement) canceladoElement.textContent = statusCounts.cancelado || 0;
    }

    getConsultasForDate(date) {
        // Esta função deveria buscar as consultas reais para a data
        // Por enquanto, retorna dados de exemplo
        const dateString = date.toDateString();
        
        // Dados de exemplo - você pode substituir por dados reais
        const consultasData = {
            'Mon May 26 2025': { confirmado: 2, pendente: 2, cancelado: 1 },
            'Tue May 27 2025': { confirmado: 1, pendente: 0, cancelado: 0 },
            'Wed May 28 2025': { confirmado: 3, pendente: 1, cancelado: 0 }
        };
        
        return consultasData[dateString] || { confirmado: 0, pendente: 0, cancelado: 0 };
    }

    // Método público para obter a data selecionada
    getSelectedDate() {
        return this.selectedDate;
    }

    // Método público para definir uma nova data selecionada
    setSelectedDate(date) {
        this.selectedDate = new Date(date);
        this.currentDate = new Date(date);
        this.renderCalendar();
        this.updateSelectedDateDisplay();
    }
}

// Inicializar o calendário quando a página carregar
document.addEventListener('DOMContentLoaded', function() {
    window.calendar = new Calendar();
});

// Funções auxiliares globais (opcional)
function goToToday() {
    if (window.calendar) {
        window.calendar.setSelectedDate(new Date());
    }
}

function getSelectedDate() {
    if (window.calendar) {
        return window.calendar.getSelectedDate();
    }
    return null;
}

