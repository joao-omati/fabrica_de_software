// JavaScript para a tela de perfil
document.addEventListener('DOMContentLoaded', function() {
    // Função para validar formulário
    function validateForm() {
        const nome = document.getElementById('nome').value.trim();
        const email = document.getElementById('email').value.trim();
        const telefone = document.getElementById('telefone').value.trim();
        const newPassword = document.getElementById('new-password').value;
        const confirmPassword = document.getElementById('confirm-password').value;

        // Validar nome
        if (!nome) {
            alert('Por favor, preencha o nome.');
            return false;
        }

        // Validar email
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!email || !emailRegex.test(email)) {
            alert('Por favor, insira um email válido.');
            return false;
        }

        // Validar senhas se preenchidas
        if (newPassword || confirmPassword) {
            if (newPassword !== confirmPassword) {
                alert('As senhas não coincidem.');
                return false;
            }
            if (newPassword.length < 6) {
                alert('A senha deve ter pelo menos 6 caracteres.');
                return false;
            }
        }

        return true;
    }

    // Event listener para o botão salvar
    const saveButton = document.querySelector('.btn-primary');
    if (saveButton) {
        saveButton.addEventListener('click', function(e) {
            e.preventDefault();
            
            if (validateForm()) {
                // Simular salvamento
                alert('Alterações salvas com sucesso!');
                
                // Limpar campos de senha após salvar
                document.getElementById('new-password').value = '';
                document.getElementById('confirm-password').value = '';
            }
        });
    }

    // Event listener para o botão cancelar
    const cancelButton = document.querySelector('.btn-outline-secondary');
    if (cancelButton) {
        cancelButton.addEventListener('click', function(e) {
            e.preventDefault();
            
            // Confirmar cancelamento
            if (confirm('Deseja cancelar as alterações?')) {
                // Restaurar valores originais
                document.getElementById('nome').value = 'Lucas Carvalho';
                document.getElementById('email').value = 'lucas.carvalho@email.com';
                document.getElementById('telefone').value = '(61) 99999-9999';
                document.getElementById('new-password').value = '';
                document.getElementById('confirm-password').value = '';
            }
        });
    }

    // Máscara para telefone
    const telefoneInput = document.getElementById('telefone');
    if (telefoneInput) {
        telefoneInput.addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            
            if (value.length <= 11) {
                value = value.replace(/(\d{2})(\d{5})(\d{4})/, '($1) $2-$3');
                if (value.length < 14) {
                    value = value.replace(/(\d{2})(\d{4})(\d{4})/, '($1) $2-$3');
                }
            }
            
            e.target.value = value;
        });
    }
});

