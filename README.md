# Bemol App

Aplicativo para unificar leading cadastral de usuários

## Plataforma desenvolvida
* O aplicativo foi desenvolvido para Android;

## Configurando o ambiente do projeto
### Requisitos de configuração:
- Versão do Flutter 3.3.2
- Versão do Dart 2.18.1
- minSdkVersion 19
- multiDexEnabled true

### Configuração do repositório
- Clonar repositório `git clone git@github.com:John-Rocha/bemol.git`
- Navegar até o projeto `cd /bemol`
- Baixar as dependências `flutter pub get`
- Rodar o projeto `flutter run`

### Banco de dados
O banco de dados escolhido foi o Firebase Firestore, por se tratar de um ambiente de teste mais dinamizado e de menor impacto no tempo de elaboração. Seu formato de consumo é em JSON no qual é transformado para objeto Dart.

### Packages utilizados com suas versões
- mask_text_input_formatter: ^2.4.0
- cpf_cnpj_validator: ^2.0.0
- intl: ^0.17.0
- dio: ^4.0.6
- firebase_core: ^2.0.0
- firebase_auth: ^4.0.1
- cloud_firestore: ^4.0.1
- validatorless: ^1.2.

### Informações do desenvolvedor
email: johnathanrocha@gmail.com
whatsapp: (48) 99610-7270
