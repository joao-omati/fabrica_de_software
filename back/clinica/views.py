from django.views import View
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.generic import View, CreateView
from .models import Inscritoconvenio, Endereco, Motivoacompanhamento, Medicamento, Pcdsnd, Doencafisica, Tipoterapia, Disponibilidade, Inscritocomunidade
from datetime import datetime, date
from django.contrib import messages


# Create your views here.

def homepage(request):
    return render(request, "index.html")


class InscricaoConvenio(View):
    def get(self, request):
        return render(request, 'convenio_form.html')
    
    def post(self, request):
        testavpsico = request.POST.get('testavpsico') == 'on'
        nomeinscrito = request.POST['nomeinscrito']
        dtnascimento = request.POST['dtnascimento']
        tipoencaminhamento = request.POST['tipoencaminhamento']
        nomeresp = request.POST.get('nomeresp')
        grauresp = request.POST.get('grauresp')
        cpfresp = request.POST.get('cpfresp')
        estadocivilresp = request.POST.get('estadocivilresp')
        tellcellresp = request.POST.get('tellcellresp')
        emailresp = request.POST.get('emailresp')
        estadocivilinscrito = request.POST.get('estadocivilinscrito')
        cpfinscrito = request.POST['cpfinscrito']
        tellcellinscrito = request.POST['tellcellinscrito']
        nomecontatourgencia = request.POST['nomecontatourgencia']
        contatourgencia = request.POST['contatourgencia']
        emailinscrito = request.POST['emailinscrito']
        identidadegenero = request.POST['identidadegenero']
        etnia = request.POST['etnia']
        religiao = request.POST['religiao']
        dthinscricao = datetime.now()
        confirmlgpd = request.POST.get('confirmlgpd') == 'on'
        cidade = request.POST['cidade']
        bairro = request.POST.get('bairro')
        rua = request.POST['rua']
        uf = request.POST['uf']
        cep = request.POST['cep']

        errors = []

        required_fields = {
            "nomeinscrito": nomeinscrito,
            "dtnascimento": dtnascimento,
            "testavpsico": testavpsico,
            "tipoencaminhamento": tipoencaminhamento,
            "cpfinscrito": cpfinscrito,
            "tellcellinscrito": tellcellinscrito,
            "contatourgencia": contatourgencia,
            "nomecontatourgencia": nomecontatourgencia,
            "emailinscrito": emailinscrito,
            "identidadegenero": identidadegenero,
            "etnia": etnia,
            "religiao": religiao,
            "confirmlgpd": confirmlgpd,
            "cidade": cidade,
            "rua": rua,
            "uf": uf,
            "cep": cep    
        }

        for field_name, value in required_fields.items():
            if value in [None, '', False]:
                errors.append(f"O campo '{field_name}' é obrigatório.")

        # Verifica se é menor de idade
        try:
            data_nascimento = datetime.strptime(dtnascimento, "%Y-%m-%d").date()
            hoje = date.today()
            idade = hoje.year - data_nascimento.year - (
                (hoje.month, hoje.day) < (data_nascimento.month, data_nascimento.day)
            )

            if idade < 18:
                responsavel_fields = {
                    "nomeresp": nomeresp,
                    "grauresp": grauresp,
                    "cpfresp": cpfresp,
                    "estadocivilresp": estadocivilresp,
                    "tellcellresp": tellcellresp,
                    "emailresp": emailresp
                }
                for field_name, value in responsavel_fields.items():
                    if value in [None, '']:
                        errors.append(f"Como o inscrito é menor de idade, o campo '{field_name}' é obrigatório.")
        except ValueError:
            errors.append("Data de nascimento inválida.")

        # Se houver erros, retorna com mensagem
        if errors:
            return render(request, 'convenio_form.html', {'errors': errors})
        

        ansiedade = request.POST.get('ansiedade') == 'on'
        assediomoral = request.POST.get('assediomoral') == 'on'
        depressao = request.POST.get('depressao') == 'on'
        dfaprendizagem = request.POST.get('dfaprendizagem') == 'on'
        humorinstavel = request.POST.get('humorinstavel') == 'on'
        insonia = request.POST.get('insonia') == 'on'
        isolasocial = request.POST.get('isolasocial') == 'on'
        luto = request.POST.get('luto') == 'on'
        tristeza = request.POST.get('tristeza') == 'on'
        apatia = request.POST.get('apatia') == 'on'
        chorofc = request.POST.get('chorofc') == 'on'
        exaustao = request.POST.get('exaustao') == 'on'
        fadiga = request.POST.get('fadiga') == 'on'
        faltanimo = request.POST.get('faltanimo') == 'on'
        vldt = request.POST.get('vldt') == 'on'
        assediosexual = request.POST.get('assediosexual') == 'on'
        motivotratoutro = request.POST.get('motivotratoutro') == 'on'
        ansiolitico = request.POST.get('ansiolitico') == 'on'
        antidepressivo = request.POST.get('antidepressivo') == 'on'
        antipsicotico = request.POST.get('antipsicotico') == 'on'
        estabhumor = request.POST.get('estabhumor') == 'on'
        memoriatct = request.POST.get('memoriatct') == 'on'
        outromedicamento = request.POST.get('outromedicamento') == 'on'
        tea = request.POST.get('tea') == 'on'
        tdah = request.POST.get('tdah') == 'on'
        dffs = request.POST.get('dffs') == 'on'
        dfv = request.POST.get('dfv') == 'on'
        dfa = request.POST.get('dfa') == 'on'
        ttap = request.POST.get('ttap') == 'on'
        ahst = request.POST.get('ahst') == 'on'
        outropcdsnd = request.POST.get('outropcdsnd') == 'on'
        doencaresp = request.POST.get('doencaresp') == 'on'
        cancer = request.POST.get('cancer') == 'on'
        diabete = request.POST.get('diabete') == 'on'
        disfusexual = request.POST.get('disfusexual') == 'on'
        doencadgt = request.POST.get('doencadgt') == 'on'
        escleorosemlt = request.POST.get('escleorosemlt') == 'on'
        hcpt = request.POST.get('hcpt') == 'on'
        luposatm = request.POST.get('luposatm') == 'on'
        obesidade = request.POST.get('obesidade') == 'on'
        pblmarenal = request.POST.get('pblmarenal') == 'on'
        outradoenca = request.POST.get('outradoenca') == 'on'
        individualift = request.POST.get('individualift') == 'on'
        individualadt = request.POST.get('individualadt') == 'on'
        individualadto = request.POST.get('individualadto') == 'on'
        individualids = request.POST.get('individualids') == 'on'
        familia = request.POST.get('familia') == 'on'
        grupo = request.POST.get('grupo') == 'on'
        casal = request.POST.get('casal') == 'on'
        manha = request.POST.get('manha') == 'on'
        tarde = request.POST.get('tarde') == 'on'
        noite = request.POST.get('noite') == 'on'
        sabado = request.POST.get('sabado') == 'on'

        inscritoconvenio = Inscritoconvenio.objects.create( nomeinscrito=nomeinscrito, dtnascimento=dtnascimento, testavpsico=testavpsico,tipoencaminhamento=tipoencaminhamento,
                                                           nomeresp=nomeresp, grauresp=grauresp, cpfresp=cpfresp, estadocivilresp=estadocivilresp, 
                                                           tellcellresp=tellcellresp, emailresp=emailresp, estadocivilinscrito=estadocivilinscrito, cpfinscrito=cpfinscrito,
                                                           tellcellinscrito=tellcellinscrito, nomecontatourgencia=nomecontatourgencia,contatourgencia=contatourgencia, 
                                                           emailinscrito=emailinscrito, identidadegenero=identidadegenero, etnia=etnia, religiao=religiao, confirmlgpd=confirmlgpd, dthinscricao=dthinscricao)
        
        Endereco.objects.create(idfichaconvenio=inscritoconvenio, cidade=cidade, bairro=bairro, rua=rua, uf=uf, cep=cep)

        Motivoacompanhamento.objects.create(idfichaconvenio=inscritoconvenio, ansiedade=ansiedade, assediomoral=assediomoral, depressao=depressao, dfaprendizagem=dfaprendizagem,
                                            humorinstavel=humorinstavel, insonia=insonia, isolasocial=isolasocial, luto=luto, tristeza=tristeza, apatia=apatia, chorofc=chorofc,
                                            exaustao=exaustao, fadiga=fadiga, faltanimo=faltanimo, vldt=vldt, assediosexual=assediosexual, outro=motivotratoutro)
        
        Medicamento.objects.create(idfichaconvenio=inscritoconvenio, ansiolitico=ansiolitico, antidepressivo=antidepressivo, antipsicotico=antipsicotico, estabhumor=estabhumor,
                                   memoriatct=memoriatct, outro=outromedicamento)
        
        Pcdsnd.objects.create(idfichaconvenio=inscritoconvenio, tea=tea, tdah=tdah, dffs=dffs, dfv=dfv, dfa=dfa, ttap=ttap, ahst=ahst, outro=outropcdsnd)

        Doencafisica.objects.create(idfichaconvenio=inscritoconvenio, doencaresp=doencaresp, cancer=cancer, diabete=diabete, disfusexual=disfusexual, doencadgt=doencadgt,
                                    escleorosemlt=escleorosemlt, hcpt=hcpt, luposatm=luposatm, obesidade=obesidade, pblmarenal=pblmarenal, outro=outradoenca)
        
        Tipoterapia.objects.create(idfichaconvenio=inscritoconvenio, individualift=individualift, individualadt=individualadt, individualadto=individualadto,
                                   individualids=individualids, familia=familia, grupo=grupo, casal=casal)
        
        Disponibilidade.objects.create(idfichaconvenio=inscritoconvenio, manha=manha, tarde=tarde, noite=noite, sabado=sabado)

        messages.success(request, 'Inscrição realizada com sucesso!')
        return redirect('homepage')
    

class InscricaoComunidade(View):
    def get(self, request):
        return render(request, 'comunidade_form.html')
    
    def post(self, request):
        # Captura campos
        nomeinscrito = request.POST.get('nomeinscrito', '').strip()
        dtnascimento = request.POST.get('dtnascimento', '').strip()
        nomeresp = request.POST.get('nomeresp', '').strip()
        grauresp = request.POST.get('grauresp', '').strip()
        cpfresp = request.POST.get('cpfresp', '').strip()
        if not cpfresp:
            cpfresp = None
        estadocivilresp = request.POST.get('estadocivilresp', '').strip() or 'Nenhum'
        tellcellresp = request.POST.get('tellcellresp', '').strip()
        emailresp = request.POST.get('emailresp', '').strip()
        estadocivilinscrito = request.POST.get('estadocivilinscrito', '').strip()
        cpfinscrito = request.POST.get('cpfinscrito', '').strip()
        tellcellinscrito = request.POST.get('tellcellinscrito', '').strip()
        nomecontatourgencia = request.POST.get('nomecontatourgencia', '').strip()
        contatourgencia = request.POST.get('contatourgencia', '').strip()
        emailinscrito = request.POST.get('emailinscrito', '').strip()
        identidadegenero = request.POST.get('identidadegenero', '').strip()
        etnia = request.POST.get('etnia', '').strip()
        religiao = request.POST.get('religiao', '').strip()
        cidade = request.POST.get('cidade', '').strip()
        bairro = request.POST.get('bairro', '').strip()
        rua = request.POST.get('rua', '').strip()
        uf = request.POST.get('uf', '').strip()
        cep = request.POST.get('cep', '').strip()
        confirmlgpd = request.POST.get('confirmlgpd') == 'on'

        # Checkboxs de deficiência
        checkbox_deficiencia = [
            request.POST.get('tea') == 'on',
            request.POST.get('tdah') == 'on',
            request.POST.get('dffs') == 'on',
            request.POST.get('dfv') == 'on',
            request.POST.get('dfa') == 'on',
            request.POST.get('ttap') == 'on',
            request.POST.get('ahst') == 'on',
            request.POST.get('outropcdsnd') == 'on',
        ]
        tem_deficiencia = any(checkbox_deficiencia)

        # Função para calcular idade
        def calcular_idade(data_str):
            try:
                nasc = datetime.strptime(data_str, '%Y-%m-%d')
            except Exception:
                return None
            hoje = datetime.today()
            idade = hoje.year - nasc.year - ((hoje.month, hoje.day) < (nasc.month, nasc.day))
            return idade

        idade = calcular_idade(dtnascimento)

        # Função para retornar dados para reexibir no form
        def context_com_dados_extra():
            return {
                **request.POST,
                'tem_deficiencia': tem_deficiencia,
                'idade': idade,
            }

        # Validações básicas
        if not nomeinscrito:
            messages.error(request, 'Informe o nome do inscrito.')
            return render(request, 'comunidade_form.html', context=context_com_dados_extra())

        if not dtnascimento:
            messages.error(request, 'Informe a data de nascimento.')
            return render(request, 'comunidade_form.html', context=context_com_dados_extra())

        if idade is None:
            messages.error(request, 'Data de nascimento inválida.')
            return render(request, 'comunidade_form.html', context=context_com_dados_extra())

        # CPF inscrito deve ter 11 números
        if len(cpfinscrito) != 11 or not cpfinscrito.isdigit():
            messages.error(request, 'O CPF do inscrito deve conter exatamente 11 números.')
            return render(request, 'comunidade_form.html', context=context_com_dados_extra())

        # Telefone inscrito deve ter 10 ou 11 números
        if len(tellcellinscrito) not in (10, 11) or not tellcellinscrito.isdigit():
            messages.error(request, 'O telefone do inscrito deve conter 10 ou 11 números.')
            return render(request, 'comunidade_form.html', context=context_com_dados_extra())

        # LGPD obrigatório
        if not confirmlgpd:
            messages.error(request, 'Você deve aceitar a confirmação da LGPD.')
            return render(request, 'comunidade_form.html', context=context_com_dados_extra())

        # Checa se responsável é obrigatório: idade < 18 ou tem deficiência
        exige_responsavel = (idade < 18) or tem_deficiencia

        if exige_responsavel:
            if not nomeresp:
                messages.error(request, 'Informe o nome do responsável legal.')
                return render(request, 'comunidade_form.html', context=context_com_dados_extra())

            if len(cpfresp) != 11 or not cpfresp.isdigit():
                messages.error(request, 'O CPF do responsável legal deve conter exatamente 11 números.')
                return render(request, 'comunidade_form.html', context=context_com_dados_extra())

            if len(tellcellresp) not in (10, 11) or not tellcellresp.isdigit():
                messages.error(request, 'O telefone do responsável legal deve conter 10 ou 11 números.')
                return render(request, 'comunidade_form.html', context=context_com_dados_extra())

        # Tudo ok, segue criando os objetos

        dthinscricao = datetime.now()

        inscritocomunidade = Inscritocomunidade.objects.create(
            nomeinscrito=nomeinscrito,
            dtnascimento=dtnascimento,
            nomeresp=nomeresp,
            grauresp=grauresp,
            cpfresp=cpfresp,
            estadocivilresp=estadocivilresp,
            tellcellresp=tellcellresp,
            emailresp=emailresp,
            estadocivilinscrito=estadocivilinscrito,
            cpfinscrito=cpfinscrito,
            tellcellinscrito=tellcellinscrito,
            nomecontatourgencia=nomecontatourgencia,
            contatourgencia=contatourgencia,
            emailinscrito=emailinscrito,
            identidadegenero=identidadegenero,
            etnia=etnia,
            religiao=religiao,
            confirmlgpd=confirmlgpd,
            dthinscricao=dthinscricao
        )
        
        Endereco.objects.create(
            idfichacomunidade=inscritocomunidade,
            cidade=cidade,
            bairro=bairro,
            rua=rua,
            uf=uf,
            cep=cep
        )

        # Criação dos outros modelos (exemplo, você já tem isso)
        Motivoacompanhamento.objects.create(
            idfichacomunidade=inscritocomunidade,
            ansiedade=request.POST.get('ansiedade') == 'on',
            assediomoral=request.POST.get('assediomoral') == 'on',
            depressao=request.POST.get('depressao') == 'on',
            dfaprendizagem=request.POST.get('dfaprendizagem') == 'on',
            humorinstavel=request.POST.get('humorinstavel') == 'on',
            insonia=request.POST.get('insonia') == 'on',
            isolasocial=request.POST.get('isolasocial') == 'on',
            luto=request.POST.get('luto') == 'on',
            tristeza=request.POST.get('tristeza') == 'on',
            apatia=request.POST.get('apatia') == 'on',
            chorofc=request.POST.get('chorofc') == 'on',
            exaustao=request.POST.get('exaustao') == 'on',
            fadiga=request.POST.get('fadiga') == 'on',
            faltanimo=request.POST.get('faltanimo') == 'on',
            vldt=request.POST.get('vldt') == 'on',
            assediosexual=request.POST.get('assediosexual') == 'on',
            outro=request.POST.get('motivotratoutro') == 'on',
        )
        
        Medicamento.objects.create(
            idfichacomunidade=inscritocomunidade,
            ansiolitico=request.POST.get('ansiolitico') == 'on',
            antidepressivo=request.POST.get('antidepressivo') == 'on',
            antipsicotico=request.POST.get('antipsicotico') == 'on',
            estabhumor=request.POST.get('estabhumor') == 'on',
            memoriatct=request.POST.get('memoriatct') == 'on',
            outro=request.POST.get('outromedicamento') == 'on',
        )
        
        Pcdsnd.objects.create(
            idfichacomunidade=inscritocomunidade,
            tea=request.POST.get('tea') == 'on',
            tdah=request.POST.get('tdah') == 'on',
            dffs=request.POST.get('dffs') == 'on',
            dfv=request.POST.get('dfv') == 'on',
            dfa=request.POST.get('dfa') == 'on',
            ttap=request.POST.get('ttap') == 'on',
            ahst=request.POST.get('ahst') == 'on',
            outro=request.POST.get('outropcdsnd') == 'on',
        )

        Doencafisica.objects.create(
            idfichacomunidade=inscritocomunidade,
            doencaresp=request.POST.get('doencaresp') == 'on',
            cancer=request.POST.get('cancer') == 'on',
            diabete=request.POST.get('diabete') == 'on',
            disfusexual=request.POST.get('disfusexual') == 'on',
            doencadgt=request.POST.get('doencadgt') == 'on',
            escleorosemlt=request.POST.get('escleorosemlt') == 'on',
            hcpt=request.POST.get('hcpt') == 'on',
            luposatm=request.POST.get('luposatm') == 'on',
            obesidade=request.POST.get('obesidade') == 'on',
            pblmarenal=request.POST.get('pblmarenal') == 'on',
            outro=request.POST.get('outradoenca') == 'on',
        )
        
        Tipoterapia.objects.create(
            idfichacomunidade=inscritocomunidade,
            individualift=request.POST.get('individualift') == 'on',
            individualadt=request.POST.get('individualadt') == 'on',
            individualadto=request.POST.get('individualadto') == 'on',
            individualids=request.POST.get('individualids') == 'on',
            familia=request.POST.get('familia') == 'on',
            grupo=request.POST.get('grupo') == 'on',
            casal=request.POST.get('casal') == 'on',
        )
        
        Disponibilidade.objects.create(
            idfichacomunidade=inscritocomunidade,
            manha=request.POST.get('manha') == 'on',
            tarde=request.POST.get('tarde') == 'on',
            noite=request.POST.get('noite') == 'on',
            sabado=request.POST.get('sabado') == 'on',
        )

        messages.success(request, 'Inscrição realizada com sucesso!')
        return redirect('homepage')




        

        

        




        
