# Delphi Softplan
Repósitório criado para teste técnico da Softplan

* Para essa tarefa, foram utilizados os componentes IdHTTP e IdAntiFreeze

* O banco de dados SQLite é criado em tempo de execução na pasta onde o executável estiver em execução, na subpasta Database, com o nome de logs.db, contendo a tabela logsdownload que armazena o histórico de downloads

* Layout do formulário principal da aplicação:

![image](https://user-images.githubusercontent.com/5474103/185820794-f5463fdf-cf93-4bfa-a826-48a39142c306.png)
  
* [Iniciar Download] - Fica habilitado somente após a url para download ser informada.
* [Exibir mensagem] - Também fica habilitado também durante o download do arquivo. Esse botão tem o efeito de mostrar a mensagem e, opcionalmente, de esconde-la novamente.
* [Parar download]  - Habilitado durante o download do arquivo
* [Exibir histórico de downloads ] - Sempre visível, quando executado, mostrar o histórico de downloads, somente os efetivamente realizados
* [Fechar sistema] - Sempre visível, quando executado e com download em andamento, segue as regras especificadas

* Formulário com a url para download informado:
 
![image](https://user-images.githubusercontent.com/5474103/185821296-2f49efd5-e941-4ef0-a4d8-0c337519e83e.png)

* Download em andamento - sem exibir mensagem
 
![image](https://user-images.githubusercontent.com/5474103/185822050-b77797df-a103-49d8-bed9-300943ab5ab2.png)

* Download em andamento - exibindo percentual de execução
 
![image](https://user-images.githubusercontent.com/5474103/185822210-c64572e8-52c4-4f3b-bc33-5e109f9d2878.png)

* Download em andamento e botão Fechar sistema executado
 
![image](https://user-images.githubusercontent.com/5474103/185822471-5be095d2-eb32-45a2-aca0-42345b75f457.png)

* Formulário do Histórico de downloads
 
![image](https://user-images.githubusercontent.com/5474103/185822780-d679efaf-5dff-4a80-b722-ca04f2beaa8b.png)

* Observação: nesse formulário implementei a tecla ESC para retornar ao formulário principal, conforme mostra o statusbar do formulário. 
                        No mesmo formulário, também no statusbar, implementei um contador de registros existentes na tabela.
