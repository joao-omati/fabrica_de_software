from django.shortcuts import render, redirect
from .models import Inscritocomunidade
from django.utils import timezone
from datetime import datetime

ETNIAS_PERMITIDAS = ['branca', 'preta', 'parda', 'amarela', 'indígena']

def cadastrar_inscrito_comunidade(request):
    if request.method == 'POST':
        data = request.POST

        if 'de_acordo' not in data:
            return render(request, 'comunidade_form.html', {
                'error': 'Você precisa aceitar a LGPD para continuar.'
            })

        etnia = data.get('cor_etnia', '').lower()
        if etnia not in ETNIAS_PERMITIDAS:
            return render(request, 'comunidade_form.html', {
                'error': f'Etnia inválida. Escolha uma das opções: {", ".join(ETNIAS_PERMITIDAS)}.'
            })

        # Converter string de data para objeto date
        try:
            dtnascimento = datetime.strptime(data.get('data_nascimento'), '%Y-%m-%d').date()
        except (ValueError, TypeError):
            return render(request, 'comunidade_form.html', {
                'error': 'Data de nascimento inválida. Use o formato YYYY-MM-DD.'
            })

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
            dthinscricao=timezone.now()
        )

        if data.get('menor_idade'):
            inscrito.nomeresp = data.get('nome_responsavel')
            inscrito.cpfresp = data.get('cpf_responsavel')
            inscrito.estadocivilresp = data.get('estado_civil_responsavel')
            inscrito.tellcellresp = data.get('telefone_responsavel')
            inscrito.emailresp = data.get('email_responsavel')
            inscrito.grauresp = data.get('parentesco_responsavel')

        inscrito.save()
        return redirect('pagina_de_sucesso')

    return render(request, 'comunidade_form.html')