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

// ** REMOVIDO: Validação antes do submit **
// document.querySelector('form').addEventListener('submit', e => { ... });

// Funções dropdown e toggleOtherInput permanecem iguais
function toggleDropdown(dropdownId) {
  const allDropdowns = document.querySelectorAll('.dropdown-content');
  allDropdowns.forEach(dropdown => {
    if (dropdown.id !== dropdownId) {
      dropdown.style.display = 'none';
      dropdown.classList.remove('show');
    }
  });

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

// Atualiza obrigatoriedade dos campos do responsável no DOMContentLoaded
document.addEventListener('DOMContentLoaded', () => {
  const camposResponsavel = [
    'nomeresp',
    'emailresp',
    'cpfresp',
    'estadocivilresp',
    'tellcellresp',
    'grauresp'
  ].map(id => document.getElementById(id));

  const inputNascimento = document.querySelector('input[name="dtnascimento"]');

  const checkboxesDeficiencia = [
    'tea', 'tdah', 'dffs', 'dfv', 'dfa', 'ttap', 'ahst', 'outropcdsnd'
  ].map(id => document.getElementById(id));

  function calcularIdade(dataNasc) {
    if (!dataNasc) return null;
    const hoje = new Date();
    const nasc = new Date(dataNasc);
    let idade = hoje.getFullYear() - nasc.getFullYear();
    const m = hoje.getMonth() - nasc.getMonth();
    if (m < 0 || (m === 0 && hoje.getDate() < nasc.getDate())) {
      idade--;
    }
    return idade;
  }

  function possuiDeficienciaMarcada() {
    return checkboxesDeficiencia.some(cb => cb && cb.checked);
  }

  function atualizarObrigatoriedadeCamposResponsavel() {
    const dataNasc = inputNascimento ? inputNascimento.value : null;
    if (!dataNasc) return;

    const idade = calcularIdade(dataNasc);
    const obrigatorio = (idade !== null && idade < 18) || possuiDeficienciaMarcada();

    camposResponsavel.forEach(campo => {
      if (!campo) return;
      if (obrigatorio) {
        campo.setAttribute('required', 'required');
      } else {
        campo.removeAttribute('required');
      }
    });
  }

  if (inputNascimento) inputNascimento.addEventListener('change', atualizarObrigatoriedadeCamposResponsavel);
  checkboxesDeficiencia.forEach(cb => {
    if (cb) cb.addEventListener('change', atualizarObrigatoriedadeCamposResponsavel);
  });

  atualizarObrigatoriedadeCamposResponsavel();
});
