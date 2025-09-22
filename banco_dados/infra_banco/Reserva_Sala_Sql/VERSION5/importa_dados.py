# Criei um script para inserir todas as turmas no banco de dados através de um arquivo excel
import pandas as pd
from sqlalchemy import create_engine
import time

# Corrigido: caminho real do arquivo Excel (atenção às barras!)
#caminho_arq_excel = r'/workspaces/fabrica_de_software/doc/docs_unieuro/Turmas_Curso.xlsx'
caminho_arq_excel = r'/workspaces/fabrica_de_software/banco_dados/doc/docs_unieuro/Turmas_Curso.xlsx'

# Conectar ao banco de dados PostgreSQL
user = 'postgres'
password = '123456'
host = 'localhost'
database = 'scp'
engine = create_engine(f'postgresql+psycopg2://{user}:{password}@{host}/{database}')

# Variável para contar o total de linhas importadas
total_linhas_importadas = 0

try:
    print("Conexão realizada!\nInício da exportação dos dados...")
    start_time = time.time()

    # Lê o Excel com cabeçalho na primeira linha
    df = pd.read_excel(caminho_arq_excel, header=0)

    # Pular a primeira linha de dados, se necessário
    df = df.iloc[1:]

    # Renomeia as colunas para bater com as da tabela 'turma'
    df = df.rename(columns={
        'Cód. Período letivo': 'periodoletivo',
        'Código da Turma': 'codturma'
    })

    # Seleciona apenas as colunas que existem na tabela e adiciona as que faltam
    df['idcurso'] = None
    df['matriculauser'] = None
    df['qtdaluno'] = None
    df['dthinsert'] = pd.Timestamp.now()
    df['dthdelete'] = None
    df['statusdelete'] = True

    # Define a ordem das colunas conforme a tabela 'turma'
    colunas_ordenadas = [
        'idcurso',
        'matriculauser',
        'codturma',
        'periodoletivo',
        'qtdaluno',
        'dthinsert',
        'dthdelete',
        'statusdelete'
    ]
    df = df[colunas_ordenadas]

    # Define o tamanho do chunk (opcional)
    chunk_size = 10
    for i in range(0, len(df), chunk_size):
        chunk = df.iloc[i:i + chunk_size]

        # Inserir no banco
        chunk.to_sql('turma', engine, if_exists='append', index=False)

        total_linhas_importadas += len(chunk)
        print(f"Lote {i // chunk_size + 1} inserido com sucesso. Total de linhas importadas até agora: {total_linhas_importadas}")
        #time.sleep(3)

    elapsed_time = time.time() - start_time
    print(f"\nExportação concluída com sucesso em {elapsed_time:.2f} segundos.")
    print(f"Total de linhas importadas: {total_linhas_importadas}")

except Exception as e:
    print(f"Ocorreu um erro ao inserir os dados: {e}")