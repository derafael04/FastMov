# FastMov

Um aplicativo Flutter moderno para serviços de mobilidade urbana, construído seguindo os princípios da Clean Architecture.

## 🏗️ Arquitetura

Este projeto implementa **Clean Architecture** com as seguintes camadas:

### 📁 Estrutura de Pastas

```
lib/
├── core/                    # Funcionalidades centrais
│   ├── constants/          # Constantes da aplicação
│   ├── errors/             # Definições de erros e falhas
│   ├── network/            # Configurações de rede
│   ├── utils/              # Utilitários (Either, Validators)
│   └── di/                 # Injeção de dependências
├── data/                   # Camada de dados
│   ├── datasources/        # Fontes de dados (local/remoto)
│   ├── models/             # Modelos de dados
│   └── repositories/       # Implementações dos repositories
├── domain/                 # Camada de domínio
│   ├── entities/           # Entidades de negócio
│   ├── repositories/       # Contratos dos repositories
│   └── usecases/           # Casos de uso
├── presentation/           # Camada de apresentação
│   ├── stores/             # Stores MobX
│   └── screens/            # Telas (futuras)
├── screen/                 # Telas atuais (legado)
├── widget/                 # Widgets customizados
└── main.dart              # Ponto de entrada
```

## 🚀 Tecnologias Utilizadas

### Core
- **Flutter 3.5.4** - Framework de desenvolvimento
- **Dart** - Linguagem de programação

### Gerenciamento de Estado
- **MobX** - Gerenciamento de estado reativo
- **flutter_mobx** - Integração MobX com Flutter

### Arquitetura
- **Clean Architecture** - Separação de responsabilidades
- **GetIt** - Injeção de dependências
- **Either** - Tratamento funcional de erros

### UI/UX
- **Google Fonts** - Tipografia
- **Lottie** - Animações
- **Heroicons** - Ícones
- **Custom Widgets** - Componentes reutilizáveis

### Armazenamento
- **SharedPreferences** - Armazenamento local
- **Dio** - Cliente HTTP (preparado para futuras integrações)

### Testes
- **flutter_test** - Testes de widget
- **mockito** - Mocks para testes
- **build_runner** - Geração de código

## 🛠️ Como Executar

### Pré-requisitos
- Flutter SDK 3.5.4 ou superior
- Dart SDK
- Android Studio / VS Code

### Instalação

1. **Clone o repositório**
   ```bash
   git clone https://github.com/seu-usuario/fastmov.git
   cd fastmov
   ```

2. **Instale as dependências**
   ```bash
   flutter pub get
   ```

3. **Gere os arquivos de código**
   ```bash
   dart run build_runner build
   ```

4. **Execute o aplicativo**
   ```bash
   flutter run
   ```

## 🧪 Testes

### Executar todos os testes
```bash
flutter test
```

### Executar testes específicos
```bash
flutter test test/domain/usecases/auth/login_usecase_test.dart
```

### Gerar coverage
```bash
flutter test --coverage
```

## 📱 Funcionalidades

### ✅ Implementadas
- [x] Arquitetura Clean Architecture
- [x] Gerenciamento de estado com MobX
- [x] Sistema de autenticação (mock)
- [x] Validação de formulários
- [x] Tratamento de erros
- [x] Tema claro/escuro
- [x] Testes unitários
- [x] Injeção de dependências

### 🔄 Em Desenvolvimento
- [ ] Integração com APIs reais
- [ ] Telas de cadastro completas
- [ ] Sistema de navegação avançado
- [ ] Testes de integração
- [ ] CI/CD

## 🏛️ Padrões Arquiteturais

### Clean Architecture
- **Entities**: Objetos de negócio puros
- **Use Cases**: Lógica de negócio específica
- **Repositories**: Contratos para acesso a dados
- **Data Sources**: Implementações concretas de acesso a dados

### Dependency Injection
- Configuração centralizada em `injection_container.dart`
- Uso do padrão Service Locator com GetIt
- Fácil substituição de implementações para testes

### Error Handling
- Uso do padrão Either para tratamento funcional de erros
- Hierarquia de falhas tipadas
- Propagação adequada de erros entre camadas

## 🎨 Design System

### Componentes Customizados
- **CustomButton**: Botões padronizados com diferentes tipos
- **CustomTextField**: Campos de texto com validação
- **CustomAppText**: Textos com tipografia consistente

### Temas
- Suporte a tema claro e escuro
- Cores consistentes em toda a aplicação
- Persistência da preferência do usuário

## 📄 Licença

Este projeto está sob a licença MIT.


