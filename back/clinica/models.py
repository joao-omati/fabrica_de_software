# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Agendamento(models.Model):
    idagendamento = models.AutoField(primary_key=True)
    idsala = models.ForeignKey('Sala', models.DO_NOTHING, db_column='idsala')
    codfuncionario = models.ForeignKey('Secretaria', models.DO_NOTHING, db_column='codfuncionario', to_field='codfuncionario', blank=True, null=True)
    crpresp = models.ForeignKey('Resptec', models.DO_NOTHING, db_column='crpresp', to_field='crpresp', blank=True, null=True)
    crpcoord = models.ForeignKey('Coordenador', models.DO_NOTHING, db_column='crpcoord', to_field='crp', blank=True, null=True)
    confirmsec = models.BooleanField(blank=True, null=True)
    dthconfirmsec = models.DateTimeField(blank=True, null=True)
    confirmresp = models.BooleanField(blank=True, null=True)
    dthconfirmresp = models.DateTimeField(blank=True, null=True)
    confirmcoord = models.BooleanField(blank=True, null=True)
    dthconfirmcoord = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'agendamento'


class Anamnese(models.Model):
    idanamnese = models.AutoField(primary_key=True)
    idprontuario = models.ForeignKey('Prontuario', models.DO_NOTHING, db_column='idprontuario', blank=True, null=True)
    anamnesedoc = models.BinaryField(blank=True, null=True)
    dthanexo = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'anamnese'


class Arqinscrito(models.Model):
    idarqinscrito = models.AutoField(primary_key=True)
    idfichaconvenio = models.ForeignKey('Inscritoconvenio', models.DO_NOTHING, db_column='idfichaconvenio', blank=True, null=True)
    idfichacomunidade = models.ForeignKey('Inscritocomunidade', models.DO_NOTHING, db_column='idfichacomunidade', blank=True, null=True)
    status = models.BooleanField(blank=True, null=True)
    dtharquinscrito = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'arqinscrito'


class Arquivamento(models.Model):
    idarquivamento = models.AutoField(primary_key=True)
    idsolicitacao = models.IntegerField()
    crpcoord = models.ForeignKey('Coordenador', models.DO_NOTHING, db_column='crpcoord', to_field='crp', blank=True, null=True)
    crpresp = models.ForeignKey('Resptec', models.DO_NOTHING, db_column='crpresp', to_field='crpresp', blank=True, null=True)
    idprontuario = models.ForeignKey('Prontuario', models.DO_NOTHING, db_column='idprontuario', blank=True, null=True)
    idarqinscrito = models.ForeignKey(Arqinscrito, models.DO_NOTHING, db_column='idarqinscrito', blank=True, null=True)
    dtharq = models.DateTimeField(blank=True, null=True)
    retencao = models.DateTimeField(blank=True, null=True)
    justificativa = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'arquivamento'


class Coordenador(models.Model):
    idcoordenador = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=50)
    senha = models.CharField(max_length=255)
    cpf = models.CharField(unique=True, max_length=11)
    crp = models.IntegerField(unique=True)
    crpcoord = models.ForeignKey('self', models.DO_NOTHING, db_column='crpcoord', to_field='crp', blank=True, null=True)
    dthcoord = models.DateTimeField()
    emailinst = models.CharField(max_length=255)
    status = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'coordenador'


class Disponibilidade(models.Model):
    iddisponibilidade = models.AutoField(primary_key=True)
    idfichaconvenio = models.ForeignKey(
        'Inscritoconvenio',
        models.DO_NOTHING,
        db_column='idfichaconvenio',
        blank=True,
        null=True
    )
    idfichacomunidade = models.ForeignKey(
        'Inscritocomunidade',
        models.DO_NOTHING,
        db_column='idfichacomunidade',
        blank=True,
        null=True,
        related_name='disponibilidades'  # nome plural para evitar conflito
    )
    manha = models.BooleanField(blank=True, null=True)
    tarde = models.BooleanField(blank=True, null=True)
    noite = models.BooleanField(blank=True, null=True)
    sabado = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'disponibilidade'


class Doencafisica(models.Model):
    iddoencafisica = models.AutoField(primary_key=True)
    idfichaconvenio = models.ForeignKey('Inscritoconvenio', models.DO_NOTHING, db_column='idfichaconvenio', blank=True, null=True)
    idfichacomunidade = models.ForeignKey('Inscritocomunidade', models.DO_NOTHING, db_column='idfichacomunidade', blank=True, null=True)
    doencaresp = models.BooleanField(blank=True, null=True)
    cancer = models.BooleanField(blank=True, null=True)
    diabete = models.BooleanField(blank=True, null=True)
    disfusexual = models.BooleanField(blank=True, null=True)
    doencadgt = models.BooleanField(blank=True, null=True)
    escleorosemlt = models.BooleanField(blank=True, null=True)
    hcpt = models.BooleanField(blank=True, null=True)
    luposatm = models.BooleanField(blank=True, null=True)
    obesidade = models.BooleanField(blank=True, null=True)
    pblmarenal = models.BooleanField(blank=True, null=True)
    outro = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'doencafisica'


class Endereco(models.Model):
    idendereco = models.AutoField(primary_key=True)
    idfichaconvenio = models.ForeignKey('Inscritoconvenio', models.DO_NOTHING, db_column='idfichaconvenio', blank=True, null=True)
    idfichacomunidade = models.ForeignKey('Inscritocomunidade', models.DO_NOTHING, db_column='idfichacomunidade', blank=True, null=True)
    cidade = models.CharField(max_length=40)
    bairro = models.CharField(max_length=50, blank=True, null=True)
    rua = models.CharField(max_length=100)
    uf = models.CharField(max_length=2, default='DF')
    cep = models.CharField(max_length=10, unique=True)

    class Meta:
        managed = False
        db_table = 'endereco'


class Escolheins(models.Model):
    idescolheins = models.AutoField(primary_key=True)
    idestagiario = models.ForeignKey('Inscritocomunidade', models.DO_NOTHING, db_column='idestagiario', blank=True, null=True)
    idfichaconvenio = models.ForeignKey('Inscritoconvenio', models.DO_NOTHING, db_column='idfichaconvenio', blank=True, null=True)
    idfichacomunidade = models.IntegerField(blank=True, null=True)
    status = models.BooleanField(blank=True, null=True)
    dthescolha = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'escolheins'


class Estagiario(models.Model):
    idestagiario = models.AutoField(primary_key=True)
    crpsup = models.ForeignKey('Supervisor', models.DO_NOTHING, db_column='crpsup', to_field='crp')
    crpcoord = models.ForeignKey(Coordenador, models.DO_NOTHING, db_column='crpcoord', to_field='crp')
    nome = models.CharField(max_length=50)
    ra = models.IntegerField(unique=True)
    senha = models.CharField(max_length=10)
    nivelestagio = models.CharField(max_length=10)
    semestre = models.CharField(max_length=10)
    emailinst = models.CharField(max_length=255)
    dthestg = models.DateTimeField(blank=True, null=True)
    status = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'estagiario'


class Fichafreqest(models.Model):
    idfichafreq = models.AutoField(primary_key=True)
    ra = models.ForeignKey(Estagiario, models.DO_NOTHING, db_column='ra', to_field='ra')
    crpsup = models.ForeignKey('Supervisor', models.DO_NOTHING, db_column='crpsup', to_field='crp', blank=True, null=True)
    crpcoord = models.ForeignKey(Coordenador, models.DO_NOTHING, db_column='crpcoord', to_field='crp', blank=True, null=True)
    fichafreq = models.BinaryField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'fichafreqest'


class Folhaevo(models.Model):
    idfolhaevolucao = models.AutoField(primary_key=True)
    idprontuario = models.IntegerField()
    folhaevolucao = models.BinaryField()
    dthanexo = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'folhaevo'


class Htocorrencia(models.Model):
    idhtc = models.AutoField(primary_key=True)
    idprontuario = models.ForeignKey('Prontuario', models.DO_NOTHING, db_column='idprontuario', blank=True, null=True)
    idarqinscrito = models.ForeignKey(Arqinscrito, models.DO_NOTHING, db_column='idarqinscrito', blank=True, null=True)
    ra = models.ForeignKey(Estagiario, models.DO_NOTHING, db_column='ra', to_field='ra', blank=True, null=True)
    crpsup = models.ForeignKey('Supervisor', models.DO_NOTHING, db_column='crpsup', to_field='crp', blank=True, null=True)
    crpcoord = models.ForeignKey(Coordenador, models.DO_NOTHING, db_column='crpcoord', to_field='crp', blank=True, null=True)
    nomepessoa = models.CharField(max_length=50)
    dthora = models.DateTimeField()
    comparecimento = models.BooleanField(blank=True, null=True)
    faltas = models.IntegerField()
    justificativa = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'htocorrencia'


class Inscritocomunidade(models.Model):
    ESTADO_CIVIL_CHOICES = [
        ('Solteiro', 'Solteiro'),
        ('Casado', 'Casado'),
        ('Divorciado', 'Divorciado'),
        ('Viúvo', 'Viúvo'),
        ('União Estável', 'União Estável'),
        ('Nenhum', 'Nenhum'),
        ('Outros', 'Outros'),
    ]

    IDENTIDADE_GENERO_CHOICES = [
        ('Masculino', 'Masculino'),
        ('Feminino', 'Feminino'),
        ('Não Binário', 'Não Binário'),
        ('Transgênero', 'Transgênero'),
        ('Outros', 'Outros'),
    ]

    ETNIA_CHOICES = [
        ('Branca', 'Branca'),
        ('Preta', 'Preta'),
        ('Parda', 'Parda'),
        ('Amarela', 'Amarela'),
        ('Indígena', 'Indígena'),
        ('Outras', 'Outras'),
    ]

    RELIGIAO_CHOICES = [
        ('Católico', 'Católico'),
        ('Evangélico', 'Evangélico'),
        ('Budismo', 'Budismo'),
        ('Espirita', 'Espirita'),
        ('Hinduísmo', 'Hinduísmo'),
        ('Islamismo', 'Islamismo'),
        ('Judaismo', 'Judaismo'),
        ('Religião de Matriz Africana', 'Religião de Matriz Africana'),
        ('Sem religião', 'Sem religião'),
        ('Outros', 'Outros'),
    ]

    idfichacomunidade = models.AutoField(primary_key=True)
    nomeinscrito = models.CharField(max_length=100)
    dtnascimento = models.DateField()
    nomeresp = models.CharField(max_length=50, blank=True, null=True)
    grauresp = models.CharField(max_length=25, blank=True, null=True)
    cpfresp = models.CharField(max_length=11, unique=True, blank=True, null=True)
    estadocivilresp = models.CharField(max_length=25, choices=ESTADO_CIVIL_CHOICES, blank=True, null=True)
    tellcellresp = models.CharField(max_length=20, blank=True, null=True)
    emailresp = models.CharField(max_length=45, blank=True, null=True)
    estadocivilinscrito = models.CharField(max_length=25, choices=ESTADO_CIVIL_CHOICES)
    cpfinscrito = models.CharField(max_length=11, unique=True)
    tellcellinscrito = models.CharField(max_length=20)
    contatourgencia = models.CharField(max_length=15)
    nomecontatourgencia = models.CharField(max_length=50)
    emailinscrito = models.CharField(max_length=45)
    identidadegenero = models.CharField(max_length=25, choices=IDENTIDADE_GENERO_CHOICES)
    etnia = models.CharField(max_length=15, choices=ETNIA_CHOICES)
    religiao = models.CharField(max_length=30, choices=RELIGIAO_CHOICES)
    confirmlgpd = models.BooleanField(default=False)
    dthinscricao = models.DateField(auto_now_add=True)
    status = models.BooleanField(default=True)

    def __str__(self):
        return self.nomeinscrito
    
    class Meta:
        managed = False
        db_table = 'inscritocomunidade'


class Inscritoconvenio(models.Model):
    idfichaconvenio = models.AutoField(primary_key=True)
    nomeinscrito = models.CharField(max_length=100)
    dtnascimento = models.DateField()
    testavpsico = models.BooleanField()
    tipoencaminhamento = models.CharField(max_length=50)
    nomeresp = models.CharField(max_length=50, blank=True, null=True)
    grauresp = models.CharField(max_length=25, blank=True, null=True)
    cpfresp = models.CharField(unique=True, max_length=11, blank=True, null=True)
    estadocivilresp = models.CharField(max_length=25, blank=True, null=True)
    tellcellresp = models.CharField(max_length=20, blank=True, null=True)
    emailresp = models.CharField(max_length=45, blank=True, null=True)
    estadocivilinscrito = models.CharField(max_length=25, blank=True, null=True)
    cpfinscrito = models.CharField(unique=True, max_length=11)
    tellcellinscrito = models.CharField(max_length=20)
    contatourgencia = models.CharField(max_length=15)
    emailinscrito = models.CharField(max_length=50)
    identidadegenero = models.CharField(max_length=25)
    etnia = models.CharField(max_length=15)
    religiao = models.CharField(max_length=30)
    confirmlgpd = models.BooleanField()
    dthinscricao = models.DateField()
    status = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'inscritoconvenio'


class Laudomed(models.Model):
    idlaudo = models.AutoField(primary_key=True)
    idprontuario = models.ForeignKey('Prontuario', models.DO_NOTHING, db_column='idprontuario', blank=True, null=True)
    laudodoc = models.BinaryField(blank=True, null=True)
    dthanexo = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'laudomed'


class Medicamento(models.Model):
    idmedicamento = models.AutoField(primary_key=True)
    idfichaconvenio = models.ForeignKey(Inscritoconvenio, models.DO_NOTHING, db_column='idfichaconvenio', blank=True, null=True)
    idfichacomunidade = models.ForeignKey(Inscritocomunidade, models.DO_NOTHING, db_column='idfichacomunidade', blank=True, null=True)
    ansiolitico = models.BooleanField(blank=True, null=True)
    antidepressivo = models.BooleanField(blank=True, null=True)
    antipsicotico = models.BooleanField(blank=True, null=True)
    estabhumor = models.BooleanField(blank=True, null=True)
    memoriatct = models.BooleanField(blank=True, null=True)
    outro = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'medicamento'


class Motivoacompanhamento(models.Model):
    idmotivoacamp = models.AutoField(primary_key=True)
    idfichaconvenio = models.ForeignKey(Inscritoconvenio, models.DO_NOTHING, db_column='idfichaconvenio', blank=True, null=True)
    idfichacomunidade = models.ForeignKey(Inscritocomunidade, models.DO_NOTHING, db_column='idfichacomunidade', blank=True, null=True)
    ansiedade = models.BooleanField(blank=True, null=True)
    assediomoral = models.BooleanField(blank=True, null=True)
    depressao = models.BooleanField(blank=True, null=True)
    dfaprendizagem = models.BooleanField(blank=True, null=True)
    humorinstavel = models.BooleanField(blank=True, null=True)
    insonia = models.BooleanField(blank=True, null=True)
    isolasocial = models.BooleanField(blank=True, null=True)
    luto = models.BooleanField(blank=True, null=True)
    tristeza = models.BooleanField(blank=True, null=True)
    apatia = models.BooleanField(blank=True, null=True)
    chorofc = models.BooleanField(blank=True, null=True)
    exaustao = models.BooleanField(blank=True, null=True)
    fadiga = models.BooleanField(blank=True, null=True)
    faltanimo = models.BooleanField(blank=True, null=True)
    vldt = models.BooleanField(blank=True, null=True)
    assediosexual = models.BooleanField(blank=True, null=True)
    outro = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'motivoacompanhamento'


class Pcdsnd(models.Model):
    idpcdnd = models.AutoField(primary_key=True)
    idfichaconvenio = models.ForeignKey(Inscritoconvenio, models.DO_NOTHING, db_column='idfichaconvenio', blank=True, null=True)
    idfichacomunidade = models.ForeignKey(Inscritocomunidade, models.DO_NOTHING, db_column='idfichacomunidade', blank=True, null=True)
    tea = models.BooleanField(blank=True, null=True)
    tdah = models.BooleanField(blank=True, null=True)
    dffs = models.BooleanField(blank=True, null=True)
    dfv = models.BooleanField(blank=True, null=True)
    dfa = models.BooleanField(blank=True, null=True)
    ttap = models.BooleanField(blank=True, null=True)
    ahst = models.BooleanField(blank=True, null=True)
    outro = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pcdsnd'


class Prontuario(models.Model):
    idprontuario = models.AutoField(primary_key=True)
    crpcoord = models.ForeignKey(Coordenador, models.DO_NOTHING, db_column='crpcoord', to_field='crp', blank=True, null=True)
    crpsup = models.ForeignKey('Supervisor', models.DO_NOTHING, db_column='crpsup', to_field='crp', blank=True, null=True)
    ra = models.ForeignKey(Estagiario, models.DO_NOTHING, db_column='ra', to_field='ra', blank=True, null=True)
    idfichaconvenio = models.ForeignKey(Inscritoconvenio, models.DO_NOTHING, db_column='idfichaconvenio', blank=True, null=True)
    idfichacomunidade = models.ForeignKey(Inscritocomunidade, models.DO_NOTHING, db_column='idfichacomunidade', blank=True, null=True)
    tcle = models.BinaryField()
    dthprontuario = models.DateTimeField()
    status = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'prontuario'


class Resptec(models.Model):
    idresptec = models.AutoField(primary_key=True)
    crpcoord = models.ForeignKey(Coordenador, models.DO_NOTHING, db_column='crpcoord', to_field='crp')
    nome = models.CharField(max_length=50)
    senha = models.CharField(max_length=255)
    cpf = models.CharField(unique=True, max_length=11)
    crpresp = models.IntegerField(unique=True)
    dthresp = models.DateTimeField()
    emailinst = models.CharField(max_length=255)
    status = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'resptec'


class Sala(models.Model):
    idsala = models.AutoField(primary_key=True)
    codfuncionario = models.ForeignKey('Secretaria', models.DO_NOTHING, db_column='codfuncionario', to_field='codfuncionario', blank=True, null=True)
    crpresp = models.ForeignKey(Resptec, models.DO_NOTHING, db_column='crpresp', to_field='crpresp', blank=True, null=True)
    crpcoord = models.ForeignKey(Coordenador, models.DO_NOTHING, db_column='crpcoord', to_field='crp', blank=True, null=True)
    numsala = models.IntegerField()
    tiposala = models.CharField(max_length=10)
    capacidade = models.IntegerField()
    dthsala = models.DateTimeField()
    status = models.BooleanField()

    class Meta:
        managed = False
        db_table = 'sala'


class Salaagendamento(models.Model):
    idsolicitacoes = models.AutoField(primary_key=True)
    idagendamento = models.ForeignKey(Agendamento, models.DO_NOTHING, db_column='idagendamento')
    crpsup = models.ForeignKey('Supervisor', models.DO_NOTHING, db_column='crpsup', to_field='crp', blank=True, null=True)
    ra = models.ForeignKey(Estagiario, models.DO_NOTHING, db_column='ra', to_field='ra', blank=True, null=True)
    dthsolisup = models.DateTimeField(blank=True, null=True)
    dthsoliest = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'salaagendamento'


class Secretaria(models.Model):
    idsecretaria = models.AutoField(primary_key=True)
    crpcoord = models.ForeignKey(Coordenador, models.DO_NOTHING, db_column='crpcoord', to_field='crp')
    nome = models.CharField(max_length=50)
    cpf = models.CharField(unique=True, max_length=11)
    codfuncionario = models.IntegerField(unique=True)
    senha = models.CharField(max_length=255)
    dthsec = models.DateTimeField()
    emailinst = models.CharField(max_length=255, blank=True, null=True)
    status = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'secretaria'


class Soliarquivamento(models.Model):
    idsloicitacao = models.AutoField(primary_key=True)
    idprontuario = models.ForeignKey(Prontuario, models.DO_NOTHING, db_column='idprontuario', blank=True, null=True)
    idarqinscrito = models.ForeignKey(Arqinscrito, models.DO_NOTHING, db_column='idarqinscrito', blank=True, null=True)
    idarquivamento = models.ForeignKey(Arquivamento, models.DO_NOTHING, db_column='idarquivamento')
    ra = models.ForeignKey(Estagiario, models.DO_NOTHING, db_column='ra', to_field='ra', blank=True, null=True)
    dthsoliestagiario = models.DateTimeField(blank=True, null=True)
    crpsup = models.ForeignKey('Supervisor', models.DO_NOTHING, db_column='crpsup', to_field='crp', blank=True, null=True)
    confirmsup = models.BooleanField(blank=True, null=True)
    dthsolisup = models.DateTimeField(blank=True, null=True)
    crpresp = models.ForeignKey(Resptec, models.DO_NOTHING, db_column='crpresp', to_field='crpresp', blank=True, null=True)
    confirmresp = models.BooleanField(blank=True, null=True)
    crpcoord = models.ForeignKey(Coordenador, models.DO_NOTHING, db_column='crpcoord', to_field='crp', blank=True, null=True)
    confirmcoord = models.BooleanField(blank=True, null=True)
    descricao = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'soliarquivamento'


class Supervisor(models.Model):
    idsupervisor = models.AutoField(primary_key=True)
    crpcoord = models.ForeignKey(Coordenador, models.DO_NOTHING, db_column='crpcoord', to_field='crp')
    nome = models.CharField(max_length=50)
    cpf = models.CharField(unique=True, max_length=11)
    crp = models.IntegerField(unique=True)
    senha = models.CharField(max_length=255, blank=True, null=True)
    emailinst = models.CharField(max_length=255, blank=True, null=True)
    dthsup = models.DateTimeField()
    status = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'supervisor'


class Tipoterapia(models.Model):
    idtipoterapia = models.AutoField(primary_key=True)
    idfichaconvenio = models.ForeignKey(
        Inscritoconvenio, 
        models.DO_NOTHING, 
        db_column='idfichaconvenio', 
        blank=True, 
        null=True
    )
    idfichacomunidade = models.ForeignKey(
        Inscritocomunidade, 
        models.DO_NOTHING, 
        db_column='idfichacomunidade', 
        blank=True, 
        null=True,
        related_name='tipoterapias'  # aqui, nome plural para o reverse lookup
    )
    individualift = models.BooleanField(blank=True, null=True)
    individualadt = models.BooleanField(blank=True, null=True)
    individualadto = models.BooleanField(blank=True, null=True)
    individualids = models.BooleanField(blank=True, null=True)
    familia = models.BooleanField(blank=True, null=True)
    grupo = models.BooleanField(blank=True, null=True)
    casal = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tipoterapia'
