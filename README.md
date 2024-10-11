# PoC HTTP and HTTPS

## Sobre o projeto

Foram criados dois projetos: `app` e `http-simple-server`. O `app` é o aplicativo Flutter em si, e o `http-simple-server` é uma API Node.js simples com Express para testar requisições http locais.

Para o teste de requisições HTTPS, o aplicativo foi baseado na documentação oficial do Flutter, que pode ser consultada [aqui](https://docs.flutter.dev/cookbook/networking/fetch-data).

### Dependências utilizadas

- [http](https://pub.dev/packages/http)

## Para executar localmente

- Entre na pasta **http-simple-server**
- Execute o comando `npm ci` para instalar as dependências do projeto
- Execute o comando `npm start` para iniciar a API

- Entre na pasta **app**
- O console da API HTTP retornará o endereço em que o servidor foi iniciado na sua rede local. Pegue esse endereço e atualize a variável `localHttpServerUrl` no arquivo [main.dart](app/lib/main.dart), na linha 34;
- Execute o comando `flutter pub get` para instalar as dependências
- Execute o comando `flutter devices` para visualizar com dispositivos conectados e disponíveis para teste na máquina
- Execute o comando `flutter run --debug -d nome_do_dispositivo_desejado` (Ex.: `flutter run --debug -d macos`)
    - Para rodar o projeto no navegador basta executar `flutter run --debug -d web-server`
