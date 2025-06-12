// Função para limpar valores não permitidos
function limparApenasLetras(input) {
  input.value = input.value.replace(/[^A-Za-zÀ-ÿ\s]/g, '');
}

function limparApenasNumeros(input) {
  input.value = input.value.replace(/\D/g, '');
}

// Aplica nos inputs que têm a classe apenas-letras
document.querySelectorAll('.apenas-letras').forEach(input => {
  input.addEventListener('input', () => limparApenasLetras(input));
});

// Aplica nos inputs que têm a classe cpf
document.querySelectorAll('.cpf').forEach(input => {
  input.setAttribute('maxlength', '11');
  input.addEventListener('input', () => limparApenasNumeros(input));
});

// Aplica nos inputs que têm a classe telefone
document.querySelectorAll('.telefone').forEach(input => {
  input.setAttribute('maxlength', '11');
  input.addEventListener('input', () => limparApenasNumeros(input));
});

// Validação antes do submit
document.querySelector('form').addEventListener('submit', e => {
  let formValido = true;

  // Verifica todos os cpfs
  document.querySelectorAll('.cpf').forEach(input => {
    if (input.value.length !== 11) {
      alert('O CPF deve conter exatamente 11 números.');
      input.focus();
      formValido = false;
      e.preventDefault();
      return false;
    }
  });

  // Verifica todos os telefones
  document.querySelectorAll('.telefone').forEach(input => {
    if (input.value.length < 10 || input.value.length > 11) {
      alert('O telefone deve conter 10 ou 11 números.');
      input.focus();
      formValido = false;
      e.preventDefault();
      return false;
    }
  });

  if (!formValido) e.preventDefault();
});

function toggleDropdown(dropdownId) {
  // Fechar todos os outros dropdowns antes de abrir o atual
  const allDropdowns = document.querySelectorAll('.dropdown-content');
  allDropdowns.forEach(function (dropdown) {
    if (dropdown.id !== dropdownId) {
      dropdown.style.display = 'none';
      dropdown.classList.remove('show');
    }
  });

  // Abrir/fechar o dropdown atual
  const dropdown = document.getElementById(dropdownId);

  if (dropdown.style.display === 'none' || dropdown.style.display === '') {
    dropdown.style.display = 'block';
    dropdown.classList.add('show');
  } else {
    dropdown.style.display = 'none';
    dropdown.classList.remove('show');
  }
}

function toggleOtherInput(checkboxId, inputId) {
  const checkbox = document.getElementById(checkboxId);
  const inputDiv = document.getElementById(inputId);

  if (checkbox.checked) {
    inputDiv.style.display = 'block';
  } else {
    inputDiv.style.display = 'none';
    inputDiv.querySelector('input').value = '';
  }
}