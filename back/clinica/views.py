from django.shortcuts import render, redirect
from django.utils import timezone
from datetime import datetime
from .models import Inscritocomunidade, Endereco

def cadastrar_inscrito_comunidade(request):
    if request.method == 'POST':
        data = request.POST

        # Verifica LGPD
        if 'de_acordo' not in data:
            return render(request, 'comunidade_form.html', {'error': 'Você precisa aceitar a LGPD para continuar.'})

        # Normaliza e valida etnia
        etnia = data.get('etnia', '').capitalize()
        if etnia not in [choice[0] for choice in Inscritocomunidade.ETNIA_CHOICES]:
            return render(request, 'comunidade_form.html', {'error': 'Etnia inválida.'})

        # Estado civil
        estadocivil = data.get('estado_civil')
        if estadocivil not in [choice[0] for choice in Inscritocomunidade.ESTADO_CIVIL_CHOICES]:
            return render(request, 'comunidade_form.html', {'error': 'Estado civil inválido.'})

        # Data nascimento
        try:
            dtnascimento = datetime.strptime(data.get('data_nascimento'), '%Y-%m-%d').date()
        except (ValueError, TypeError):
            return render(request, 'comunidade_form.html', {'error': 'Data de nascimento inválida.'})

        # Cria o inscrito
        inscrito = Inscritocomunidade(
            nomeinscrito=data.get('nome'),
            cpfinscrito=data.get('cpf'),
            dtnascimento=dtnascimento,
            tellcellinscrito=data.get('telefone'),
            contatourgencia=data.get('telefone_urgencia'),
            nomecontatourgencia=data.get('nome_urgencia'),
            emailinscrito=data.get('email'),
            identidadegenero=data.get('identidade_genero'),
            etnia=etnia,
            religiao=data.get('religiao'),
            confirmlgpd=True,
            dthinscricao=timezone.now(),
            estadocivilinscrito=estadocivil,
        )

        # Responsável legal (se menor de idade)
        if data.get('menor_idade') == 'on':
            inscrito.nomeresp = data.get('nome_responsavel')
            inscrito.cpfresp = data.get('cpf_responsavel')
            inscrito.estadocivilresp = data.get('estado_civil_responsavel')
            inscrito.tellcellresp = data.get('telefone_responsavel')
            inscrito.emailresp = data.get('email_responsavel')
            inscrito.grauresp = data.get('parentesco_responsavel')

        try:
            inscrito.save()
        except Exception as e:
            return render(request, 'comunidade_form.html', {'error': f'Erro ao salvar inscrito: {e}'})

        # Verifica se o CEP já existe (evita erro UNIQUE)
        cep = data.get('cep')
        if Endereco.objects.filter(cep=cep).exists():
            return render(request, 'comunidade_form.html', {'error': 'CEP já cadastrado.'})

        # Cria o endereço vinculado
        try:
            endereco = Endereco(
                idfichacomunidade=inscrito,
                cidade=data.get('cidade'),
                bairro=data.get('bairro'),
                rua=data.get('rua'),
                uf='DF',  # fixo para atender o CHECK do banco
                cep=cep,
            )
            endereco.save()
            print("Endereço salvo com sucesso:", endereco.idendereco)
        except Exception as e:
            return render(request, 'comunidade_form.html', {'error': f'Erro ao salvar endereço: {e}'})

        return redirect('cadastro/comunidade/')  # Altere para a URL correta

    return render(request, 'comunidade_form.html')