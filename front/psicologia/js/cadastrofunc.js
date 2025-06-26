// ================== VARIÁVEIS GLOBAIS ==================
const profileButtons = document.querySelectorAll('.profile-btn');
const formContainers = document.querySelectorAll('.form-container');

// ================== INICIALIZAÇÃO ==================
document.addEventListener('DOMContentLoaded', function() {
    // Configurar eventos dos botões de perfil
    setupProfileButtons();
    
    // Configurar validações dos formulários
    setupFormValidations();
    
    // Configurar máscaras de input
    setupInputMasks();
    
    // Mostrar formulário inicial (Coordenador)
    showForm('coordenador');
});

// ================== FUNÇÕES DE PERFIL ==================
function setupProfileButtons() {
    profileButtons.forEach(button => {
        button.addEventListener('click', function() {
            const profileType = this.getAttribute('data-profile');
            
            // Remover classe active de todos os botões
            profileButtons.forEach(btn => btn.classList.remove('active'));
            
            // Adicionar classe active ao botão clicado
            this.classList.add('active');
            
            // Mostrar formulário correspondente
            showForm(profileType);
        });
    });
}

function showForm(profileType) {
    // Esconder todos os formulários
    formContainers.forEach(container => {
        container.classList.add('hidden');
    });
    
    // Mostrar formulário selecionado
    const targetForm = document.getElementById(`${profileType}-form`);
    if (targetForm) {
        targetForm.classList.remove('hidden');
        
        // Focar no primeiro input do formulário
        const firstInput = targetForm.querySelector('input[type="text"], input[type="email"]');
        if (firstInput) {
            setTimeout(() => firstInput.focus(), 100);
        }
    }
}

// ================== VALIDAÇÕES DE FORMULÁRIO ==================
function setupFormValidations() {
    const forms = document.querySelectorAll('form');
    
    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            
            if (validateForm(this)) {
                showSuccessMessage();
                resetForm(this);
            }
        });
    });
}

function validateForm(form) {
    const inputs = form.querySelectorAll('input[required], select[required]');
    let isValid = true;
    
    inputs.forEach(input => {
        if (!input.value.trim()) {
            showFieldError(input, 'Este campo é obrigatório');
            isValid = false;
        } else {
            clearFieldError(input);
        }
    });
    
    // Validações específicas
    const emailInputs = form.querySelectorAll('input[type="email"]');
    emailInputs.forEach(input => {
        if (input.value && !isValidEmail(input.value)) {
            showFieldError(input, 'Digite um e-mail válido');
            isValid = false;
        }
    });
    
    const cpfInputs = form.querySelectorAll('input[id*="cpf"]');
    cpfInputs.forEach(input => {
        if (input.value && !isValidCPF(input.value)) {
            showFieldError(input, 'Digite um CPF válido');
            isValid = false;
        }
    });
    
    return isValid;
}

function showFieldError(input, message) {
    clearFieldError(input);
    
    input.style.borderColor = '#e74c3c';
    input.style.backgroundColor = '#fdf2f2';
    
    const errorDiv = document.createElement('div');
    errorDiv.className = 'field-error';
    errorDiv.textContent = message;
    errorDiv.style.color = '#e74c3c';
    errorDiv.style.fontSize = '12px';
    errorDiv.style.marginTop = '5px';
    
    input.parentNode.appendChild(errorDiv);
}

function clearFieldError(input) {
    input.style.borderColor = '';
    input.style.backgroundColor = '';
    
    const existingError = input.parentNode.querySelector('.field-error');
    if (existingError) {
        existingError.remove();
    }
}

function showSuccessMessage() {
    // Criar overlay
    const overlay = document.createElement('div');
    overlay.style.cssText = `
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 1000;
    `;
    
    // Criar modal de sucesso
    const modal = document.createElement('div');
    modal.style.cssText = `
        background-color: white;
        padding: 30px;
        border-radius: 10px;
        text-align: center;
        max-width: 400px;
        margin: 20px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
    `;
    
    modal.innerHTML = `
        <div style="color: #27ae60; font-size: 48px; margin-bottom: 20px;">✓</div>
        <h3 style="color: #333; margin-bottom: 15px;">Usuário Cadastrado!</h3>
        <p style="color: #666; margin-bottom: 25px;">O usuário foi cadastrado com sucesso no sistema.</p>
        <button onclick="this.closest('.overlay').remove()" style="
            background-color: #1976d2;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 25px;
            cursor: pointer;
            font-size: 14px;
        ">OK</button>
    `;
    
    overlay.className = 'overlay';
    overlay.appendChild(modal);
    document.body.appendChild(overlay);
    
    // Remover modal após 3 segundos se não for clicado
    setTimeout(() => {
        if (document.body.contains(overlay)) {
            overlay.remove();
        }
    }, 3000);
}

function resetForm(form) {
    form.reset();
    
    // Limpar erros
    const errorElements = form.querySelectorAll('.field-error');
    errorElements.forEach(error => error.remove());
    
    // Resetar estilos dos inputs
    const inputs = form.querySelectorAll('input, select');
    inputs.forEach(input => {
        input.style.borderColor = '';
        input.style.backgroundColor = '';
    });
}

// ================== MÁSCARAS DE INPUT ==================
function setupInputMasks() {
    // Máscara para CPF
    const cpfInputs = document.querySelectorAll('input[id*="cpf"]');
    cpfInputs.forEach(input => {
        input.addEventListener('input', function() {
            this.value = formatCPF(this.value);
        });
    });
    
    // Máscara para CRP
    const crpInputs = document.querySelectorAll('input[id*="crp"]');
    crpInputs.forEach(input => {
        input.addEventListener('input', function() {
            this.value = formatCRP(this.value);
        });
    });
    
    // Máscara para RA
    const raInputs = document.querySelectorAll('input[id*="ra"]');
    raInputs.forEach(input => {
        input.addEventListener('input', function() {
            this.value = formatRA(this.value);
        });
    });
}

function formatCPF(value) {
    // Remove tudo que não é dígito
    value = value.replace(/\D/g, '');
    
    // Aplica a máscara
    value = value.replace(/(\d{3})(\d)/, '$1.$2');
    value = value.replace(/(\d{3})(\d)/, '$1.$2');
    value = value.replace(/(\d{3})(\d{1,2})$/, '$1-$2');
    
    return value;
}

function formatCRP(value) {
    // Remove tudo que não é dígito
    value = value.replace(/\D/g, '');
    
    // Aplica a máscara CRP XX/XXXXX
    value = value.replace(/(\d{2})(\d)/, '$1/$2');
    
    return value;
}

function formatRA(value) {
    // Remove tudo que não é dígito
    value = value.replace(/\D/g, '');
    
    // Limita a 10 dígitos
    return value.substring(0, 10);
}

// ================== VALIDAÇÕES ESPECÍFICAS ==================
function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

function isValidCPF(cpf) {
    // Remove formatação
    cpf = cpf.replace(/\D/g, '');
    
    // Verifica se tem 11 dígitos
    if (cpf.length !== 11) return false;
    
    // Verifica se todos os dígitos são iguais
    if (/^(\d)\1{10}$/.test(cpf)) return false;
    
    // Validação do algoritmo do CPF
    let sum = 0;
    for (let i = 0; i < 9; i++) {
        sum += parseInt(cpf.charAt(i)) * (10 - i);
    }
    let remainder = (sum * 10) % 11;
    if (remainder === 10 || remainder === 11) remainder = 0;
    if (remainder !== parseInt(cpf.charAt(9))) return false;
    
    sum = 0;
    for (let i = 0; i < 10; i++) {
        sum += parseInt(cpf.charAt(i)) * (11 - i);
    }
    remainder = (sum * 10) % 11;
    if (remainder === 10 || remainder === 11) remainder = 0;
    if (remainder !== parseInt(cpf.charAt(10))) return false;
    
    return true;
}

// ================== MELHORIAS DE UX ==================
document.addEventListener('DOMContentLoaded', function() {
    // Adicionar efeitos de hover nos inputs
    const inputs = document.querySelectorAll('input, select');
    inputs.forEach(input => {
        input.addEventListener('focus', function() {
            this.parentNode.style.transform = 'scale(1.02)';
            this.parentNode.style.transition = 'transform 0.2s ease';
        });
        
        input.addEventListener('blur', function() {
            this.parentNode.style.transform = 'scale(1)';
        });
    });
    
    // Adicionar loading no botão de cadastrar
    const submitButtons = document.querySelectorAll('.btn-cadastrar');
    submitButtons.forEach(button => {
        button.addEventListener('click', function() {
            const originalText = this.textContent;
            this.textContent = 'Cadastrando...';
            this.disabled = true;
            
            setTimeout(() => {
                this.textContent = originalText;
                this.disabled = false;
            }, 2000);
        });
    });
});

// ================== ACESSIBILIDADE ==================
document.addEventListener('keydown', function(e) {
    // Navegação por teclado nos botões de perfil
    if (e.key === 'ArrowLeft' || e.key === 'ArrowRight') {
        const activeButton = document.querySelector('.profile-btn.active');
        if (activeButton) {
            const buttons = Array.from(profileButtons);
            const currentIndex = buttons.indexOf(activeButton);
            let nextIndex;
            
            if (e.key === 'ArrowLeft') {
                nextIndex = currentIndex > 0 ? currentIndex - 1 : buttons.length - 1;
            } else {
                nextIndex = currentIndex < buttons.length - 1 ? currentIndex + 1 : 0;
            }
            
            buttons[nextIndex].click();
            buttons[nextIndex].focus();
        }
    }
});

