from django.views import View
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.generic import View, CreateView
from .models import Inscritoconvenio, Endereco, Motivoacompanhamento, Medicamento, Pcdsnd, Doencafisica, Tipoterapia, Disponibilidade
from datetime import datetime


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
        nomeresp = request.POST['nomeresp']
        grauresp = request.POST['grauresp']
        cpfresp = request.POST['cpfresp']
        estadocivilresp = request.POST['estadocivilresp']
        tellcellresp = request.POST['tellcellresp']
        emailresp = request.POST['emailresp']
        estadocivilinscrito = request.POST['estadocivilinscrito']
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
        bairro = request.POST['bairro']
        rua = request.POST['rua']
        uf = request.POST['uf']
        cep = request.POST['cep']
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

        return redirect('homepage')
        




        

        

        




        
