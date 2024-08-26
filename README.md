<!-- <div align="center"><img src="/docs/images/logo_200px.png" /></div> -->

# Ília Challenge

<!-- Caso necessário adicionar as telas do app -->
<!-- |||||||||
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| <img style="max-width: 200px; margin-bottom: 10px;" src="/docs/images/screenshot/1_image.png" /> | <img style="max-width: 200px; margin-bottom: 10px;" src="/docs/images/screenshot/2_image.png" /> | <img style="max-width: 200px; margin-bottom: 10px;" src="/docs/images/screenshot/3_image.png" /> | <img style="max-width: 200px; margin-bottom: 10px;" src="/docs/images/screenshot/4_image.png" /> |<img style="max-width: 200px; margin-bottom: 10px;" src="/docs/images/screenshot/5_image.png" /> |<img style="max-width: 200px; margin-bottom: 10px;" src="/docs/images/screenshot/6_image.png" /> |<img style="max-width: 200px; margin-bottom: 10px;" src="/docs/images/screenshot/7_image.png" /> |<img style="max-width: 200px; margin-bottom: 10px;" src="/docs/images/screenshot/8_image.png" /> | -->

📺 O projeto consiste no desenvolvimento de um aplicativo que permite aos usuários pesquisar, visualizar e gerenciar informações sobre filmes utilizando a API do The Movie Database (TMDb). Este desafio técnico tem como objetivo demonstrar habilidades em arquitetura de software, consumo de APIs externas e desenvolvimento de uma interface de usuário intuitiva.

## Versões Necessárias

- **Dart**: ![Dart Version](https://img.shields.io/static/v1?label=Dart&amp;message=3.5.0&amp;color=blue&amp;logo=dart)
  [Documentação Oficial do Dart](https://dart.dev)

- **Flutter**: ![Flutter Version](https://img.shields.io/static/v1?label=Flutter&amp;message=3.24.0&amp;color=blue&amp;logo=flutter)
  [Documentação Oficial do Flutter](https://docs.flutter.dev/get-started/install)

## Sumário

- [Funcionalidades](#funcionalidades)
- [Tecnologias e Pacotes Utilizados](#tecnologias-e-pacotes-utilizados)
- [Como executar o projeto](#como-executar-o-projeto)
- [Princípio da inversão de dependências (DIP)](#princípio-da-inversão-de-dependências-dip)
- [Manipulação de Erros e Resultados](#manipulação-de-erros-e-resultados)
- [Uso de Adapters](#uso-de-adapters)
- [Variáveis de ambiente](#variáveis-de-ambiente)

### Funcionalidades

- **Filmes em cartaz**
Exibir uma lista de filmes que estão em exibição atualmente nos cinemas.
Utilizar a API do TMDb para buscar os filmes em cartaz e mostrar informações relevantes como título, sinopse e pôsteres.
Implementar um sistema de rolagem infinita para carregar mais filmes conforme o usuário rola a página.

- **Pesquisar Filmes**
Implementar uma funcionalidade de busca que permite aos usuários pesquisar filmes por título, gênero ou ano de lançamento.
Exibir os resultados da pesquisa com informações resumidas, como título, e imagem.

- **Visualizar Detalhes dos Filmes**
Tela filme com detalhes completos, incluindo sinopse, e informações de avaliações.
Mostrar imagens adicionais, como pôsteres e cenas do filme, e permitir a visualização de trailers disponíveis.

- **Assistir aos Trailers Disponíveis**:
Integrar a funcionalidade para assistir aos trailers dos filmes disponíveis diretamente no aplicativo.

### Tecnologias e Pacotes Utilizados

- [Get It](https://pub.dev/packages/get_it): Para injeção de dependências.
- [Cached Network Image](https://pub.dev/packages/cached_network_image): Para exibir imagens em telas.
- [http](https://pub.dev/packages/http): Para fazer requisições HTTP.
- [youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter): Para exibir os trailers dos filmes.
- [mockito](https://pub.dev/packages/mockito): Para criar mocks e stubs em testes.

### Gerenciamento de Estado com `BaseController`

`BaseController` é uma classe abstrata que gerencia e notifica alterações de estado usando `ValueNotifier`. Ela fornece uma maneira eficiente de gerenciar e observar mudanças no estado em um aplicativo Flutter.

#### Características Principais

- **Abstração de Estado**: Usa `ValueNotifier<T>`, onde `T` é o tipo de estado que estende `BaseState`.
- **Acesso ao Estado**: Fornece acesso ao estado atual através das propriedades `state` e `value`.



### Como executar o projeto

- Certifique-se de que sua versão do dart seja >= 3.5.0

- Certifique-se de que sua versão do flutter seja >= 3.24.0

Instale o melos: https://melos.invertase.dev/getting-started
Execute:

```sh
melos bootstrap
```

#### Instalando manualmente

```dart
https://github.com/eric-oliveira23/ilia-flutter-challenge.git
```

- Acesse a pasta do projeto

```sh
cd ilia_challenge/
```

#### Após instalado

- Execute o app

```sh
cd app

# dependencias
flutter pub get

# executando
flutter run
```

# Estrutura do Projeto
O projeto é organizado de forma modular para facilitar a manutenção e escalabilidade. Abaixo está um resumo das principais pastas e suas responsabilidades:

## `app/`
Contém o código principal da aplicação, dividido por funcionalidades e controle de dependências.

```markdown
app/
├── di/                        // Configuração de injeção de dependências
├── features/
│   └── movie/                 // Separação por features
│       ├── details/           
│       ├── list/              
│       └── video/             
└── main.dart              
```

## `core/`
Fornece funcionalidades essenciais e utilitários usados em toda a aplicação.
  
```markdown
core/
├── client/                    // Cliente HTTP e modelos de requisição
├── constant/                  
├── controller/                // Controladores base para gerenciamento de estados
├── error/                     // Exceções padrão
├── state/                     // Estados base
├── type/                      // Tipos personalizados para resultados e erros
└── util/                      
```

## `design_system/`
Contém ferramentas e componentes para a interface do usuário.
  
```markdown
design_system/
├── assets/                    // Recursos estáticos
├── lib/
│   ├── themes/                // Temas do aplicativo
│   └── widgets/               // Componentes reutilizáveis
```

## `service/`
Implementações e repositórios para interagir com APIs e serviços externos.

```markdown
service/
└── movie/
    ├── adapter/               // Adaptadores para conversão de dados
    ├── entities/              // Entidades de dados dos filmes
    └── repository/remote/     // Repositórios para serviços remotos
```

### Princípio da Inversão de Dependências (DIP)

O Princípio da Inversão de Dependências é um dos cinco princípios SOLID da programação orientada a objetos e visa promover uma arquitetura de software mais flexível e modular. Este princípio é descrito da seguinte forma:

- **Módulos de alto nível não devem depender de módulos de baixo nível. Ambos devem depender de abstrações.**
- **Abstrações não devem depender de detalhes. Detalhes devem depender de abstrações.**

Em outras palavras, o DIP afirma que os módulos de alto nível devem ser independentes das implementações concretas dos módulos de baixo nível e sim, devem depender apenas das abstrações. Isso garante que o código seja mais flexível e fácil de adaptar, pois os módulos de alto nível não estão diretamente acoplados aos detalhes das implementações concretas.

### Como Aplicar o DIP

Para implementar o DIP em um projeto, considere as seguintes práticas:

1. **Defina Abstrações Claras**
   - Crie interfaces ou classes abstratas que descrevam os comportamentos esperados pelos módulos de alto nível. Essas abstrações devem ser independentes de qualquer implementação concreta específica.

2. **Injete Dependências**
   - Em vez de criar instâncias de objetos diretamente dentro de outros objetos, use a injeção de dependências. Isso pode ser feito por meio de construtores, métodos ou propriedades, permitindo que as implementações concretas sejam substituídas sem alterar o código dos módulos de alto nível.

3. **Adote o Princípio da Inversão de Controle (IoC)**
   - Inverta o controle para que as implementações concretas dependam das abstrações. Isso é comumente feito utilizando um contêiner de injeção de dependência, que gerencia a criação e resolução das dependências.

4. **Facilite o Teste de Unidades**
   - A utilização de abstrações e a injeção de dependências permitem a escrita de testes de unidade mais eficazes. Durante os testes, as implementações reais podem ser substituídas por mocks ou stubs, facilitando a validação isolada do comportamento do código.

Seguindo essas práticas, seu código será mais modular, flexível e fácil de manter, alinhado com os princípios do DIP.


### Manipulação de Erros e Resultados

- Ao trabalhar com operações que podem retornar resultados ou erros, podemos usar o typedef `Output<T>` para representar a saída dessas operações. Este typedef nos permite encapsular tanto o sucesso quanto o fracasso em um único tipo usando `Either`.
  - Definição de um typedef para representar a saída de uma operação, onde o tipo de dado retornado pode ser um sucesso (T) ou um erro `(BaseException)`.
  - Este typedef é parametrizado com um tipo genérico T, que representa o tipo de dado retornado em caso de sucesso.
  - Exemplo de uso: `Output<User>` representa a saída de uma operação que retorna um objeto do tipo User em caso de sucesso, ou uma exceção do tipo `BaseException` em caso de erro.

```dart
typedef Output<T> = Either<BaseException, T>;
```

**Exemplo de uso do `Output`**.

```dart
abstract class IAuthRepository {
  Future<Output<void>> login(Credentials credential);
}
```

### Uso de Adapters

Os adapters recebem um Map e devem retornar entity, podem existir também adapters que recebem uma Entity e retornam outra.


### Variáveis de ambiente

As keys de desenvolvimento estão em `dev.env`

Crie um arquivo `.env` na raiz do projeto e adicione-o à raiz de `app/`, seguindo o padrão de `dev.env`.

```env
BASE_URL=YOUR_TMDB_BASE_URL
IMAGE_BASE_URL=YOUR_TMDB_IMAGE_BASE_URL
API_KEY=YOUR_TMDB_API_KEY
```

Para usar a key: `String.fromEnvironment(CHAVE_DA_VARIAVEL);`


#  Ilia Challenge (English)

📺 This project involves developing an application that allows users to search, view, and manage information about movies using The Movie Database (TMDb) API. This technical challenge aims to demonstrate skills in software architecture, external API consumption, and intuitive user interface development.

## Required Versions

- **Dart**: ![Dart Version](https://img.shields.io/static/v1?label=Dart&amp;message=3.5.0&amp;color=blue&amp;logo=dart)
  [Official Dart Documentation](https://dart.dev)

- **Flutter**: ![Flutter Version](https://img.shields.io/static/v1?label=Flutter&amp;message=3.24.0&amp;color=blue&amp;logo=flutter)
  [Official Flutter Documentation](https://docs.flutter.dev/get-started/install)

## Summary

- [Features](#features)
- [Technologies and Packages Used](#technologies-and-packages-used)
- [How to Run the Project](#how-to-run-the-project)
- [Dependency Inversion Principle (DIP)](#dependency-inversion-principle-dip)
- [Error Handling and Result Management](#error-handling-and-result-management)
- [Use of Adapters](#use-of-adapters)
- [Environment Variables](#environment-variables)

### Features

- **Now Playing Movies**
Display a list of movies currently playing in theaters.
Use the TMDb API to fetch playing movies and show relevant information such as title, synopsis, and posters.
Implement infinite scrolling to load more movies as the user scrolls.

- **Movie Search**
Implement a search functionality that allows users to search for movies by title, genre, or release year.
Display search results with summarized information, such as title and image.

- **View Movie Details**
A movie screen with complete details, including synopsis and rating information.
Show additional images, such as posters and movie stills, and allow viewing of available trailers.

- **Watch Available Trailers**:
Integrate the functionality to watch movie trailers directly within the app.

### Technologies and Packages Used

- [Get It](https://pub.dev/packages/get_it): For dependency injection.
- [Cached Network Image](https://pub.dev/packages/cached_network_image): For displaying images on screens.
- [http](https://pub.dev/packages/http): For making HTTP requests.
- [youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter): For displaying movie trailers.
- [mockito](https://pub.dev/packages/mockito): For creating mocks and stubs in tests.

### State Management with `BaseController`

`BaseController` is an abstract class that manages and notifies state changes using `ValueNotifier`. It provides an efficient way to manage and observe state changes in a Flutter application.

#### Main Features

- **State Abstraction**: Uses `ValueNotifier<T>`, where `T` is the state type that extends `BaseState`.
- **State Access**: Provides access to the current state through the `state` and `value` properties.



### How to Run the Project

- Make sure your Dart version is >= 3.5.0

- Make sure your Flutter version is >= 3.24.0

Install melos: https://melos.invertase.dev/getting-started
Run:

```sh
melos bootstrap
```

#### Manual Installation

```dart
git clone https://github.com/eric-oliveira23/ilia-flutter-challenge.git
```

- Access the project folder

```sh
cd ilia_challenge/
```

#### After Installation

- Run the app

```sh
cd app

# dependencies
flutter pub get

# running
flutter run
```

# Project Structure
The project is organized in a modular way to facilitate maintenance and scalability. Below is a summary of the main folders and their responsibilities:

## `app/`
Contains the main application code, divided by functionality and dependency management.

```markdown
app/
├── di/                        // Dependency injection configuration
├── features/
│   └── movie/                 // Feature separation
│       ├── details/           
│       ├── list/              
│       └── video/             
└── main.dart              
```

## `core/`
Provides essential functionalities and utilities used throughout the application.

```markdown
core/
├── client/                    // HTTP client and request model
├── constant/                  
├── controller/                // Base controllers for state management
├── error/                     // Standard exceptions
├── state/                     // Base states
├── type/                      // Custom types for results and errors
└── util/                      
```

## `design_system/`
Contains tools and reusable components for the user interface.

```markdown
design_system/
├── assets/                    // Static resources
├── lib/
│   ├── themes/                // Application themes
│   └── widgets/               // Reusable widgets
```

## `service/`
Implementations and repositories for interacting with APIs and external services.

```markdown
service/
└── movie/
    ├── adapter/               // Data conversion adapters
    ├── entities/              // Movie data entities
    └── repository/remote/     // Repositories for remote services
```

### Dependency Inversion Principle (DIP)

The Dependency Inversion Principle is one of the five SOLID principles of object-oriented programming and aims to promote a more flexible and modular software architecture. This principle is described as follows:

- **High-level modules should not depend on low-level modules. Both should depend on abstractions.**
- **Abstractions should not depend on details. Details should depend on abstractions.**

In other words, the DIP states that high-level modules should be independent of the concrete implementations of low-level modules and should only depend on abstractions. This ensures that the code is more flexible and easier to adapt, as high-level modules are not directly coupled to the details of concrete implementations.

### How to Apply the DIP

To implement the DIP in a project, consider the following practices:

1. **Define Clear Abstractions**
   - Create interfaces or abstract classes that describe the expected behaviors of high-level modules. These abstractions should be independent of any specific concrete implementation.

2. **Inject Dependencies**
   - Instead of creating object instances directly within other objects, use dependency injection. This can be done through constructors, methods, or properties, allowing concrete implementations to be replaced without changing the code of high-level modules.

3. **Adopt the Inversion of Control (IoC) Principle**
   - Invert control so that concrete implementations depend on abstractions. This is commonly done using a dependency injection container, which manages the creation and resolution of dependencies.

4. **Facilitate Unit Testing**
   - Using abstractions and dependency injection allows for more effective unit testing. During testing, real implementations can be replaced with mocks or stubs, making it easier to validate the isolated behavior of the code.

Following these practices will make your code more modular, flexible, and easier to maintain, aligning with the principles of DIP.


### Error Handling and Result Management

- When working with operations that can return results or errors, we can use the `Output<T>` typedef to represent the output of these operations. This typedef allows us to encapsulate both success and failure in a single type using `Either`.
  - Definition of a typedef to represent the output of an operation, where the data type returned can be a success (T) or an error (`BaseException`).
  - This typedef is parameterized with a generic type T, which represents the data type returned in case of success.
  - Example of use: `Output<User>` represents the output of an operation that returns a `User` object in case of success, or an exception of type `BaseException` in case of error.

```dart
typedef Output<T> = Either<BaseException, T>;
```

**Example of using `Output`**.

```dart
abstract class IAuthRepository {
  Future<Output<void>> login(Credentials credential);
}
```

### Use of Adapters

Adapters receive a Map and must return an entity, adapters can also exist that receive an Entity and return another.


### Environment Variables

The development keys are in `dev.env`

Create a `.env` file in the root of the project and add it to the root of `app/`, following the `dev.env` pattern.

```env
BASE_URL=YOUR_TMDB_BASE_URL
IMAGE_BASE_URL=YOUR_TMDB_IMAGE_BASE_URL
API_KEY=YOUR_TMDB_API_KEY
```

To use the key: `String.fromEnvironment(KEY_VARIABLE);`