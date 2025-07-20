# 🔄 Guia Completo MobX - FastMov

## 📋 Índice
1. [Conceitos Fundamentais](#conceitos-fundamentais)
2. [Estrutura de um Store](#estrutura-store)
3. [Observables, Actions e Computed](#observables-actions-computed)
4. [Integração com Flutter](#integracao-flutter)
5. [Padrões e Boas Práticas](#padroes-boas-praticas)
6. [Debugging e Performance](#debugging-performance)

## 🎯 Conceitos Fundamentais

### O que é MobX?
MobX é uma biblioteca de gerenciamento de estado baseada em **programação reativa**. Ele automaticamente rastreia dependências e atualiza a UI quando o estado muda.

### Principais Conceitos:

#### 1. **Observable** 📊
- Estado que pode ser observado
- Quando muda, notifica automaticamente os observadores

#### 2. **Action** ⚡
- Métodos que modificam observables
- Garantem que mudanças sejam rastreadas corretamente

#### 3. **Computed** 🧮
- Valores derivados de observables
- Recalculados automaticamente quando dependências mudam

#### 4. **Observer** 👁️
- Widget que reconstrói quando observables mudam

## 🏗️ Estrutura de um Store

### Template Básico
```dart
import 'package:mobx/mobx.dart';

// Inclui o arquivo gerado
part 'meu_store.g.dart';

// Classe principal que combina o mixin
class MeuStore = _MeuStoreBase with _$MeuStore;

// Classe base com a lógica
abstract class _MeuStoreBase with Store {
  // Construtor com dependências
  _MeuStoreBase({
    required this.useCase,
  });

  // Dependências injetadas
  final MeuUseCase useCase;

  // Observables - Estado
  @observable
  String nome = '';

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  // Actions - Modificam o estado
  @action
  void setNome(String novoNome) {
    nome = novoNome;
    errorMessage = null; // Limpa erro ao modificar
  }

  @action
  Future<void> salvarNome() async {
    isLoading = true;
    errorMessage = null;

    try {
      await useCase.salvar(nome);
      // Sucesso - estado já atualizado
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  // Computed - Valores derivados
  @computed
  bool get podeSerSalvo => nome.isNotEmpty && !isLoading;

  @computed
  String get nomeFormatado => nome.trim().toUpperCase();
}
```

## 📊 Observables, Actions e Computed

### Tipos de Observables

#### 1. **Observable Simples**
```dart
@observable
String texto = '';

@observable
int contador = 0;

@observable
bool ativo = false;
```

#### 2. **Observable List**
```dart
@observable
ObservableList<String> itens = ObservableList<String>();

// Uso
@action
void adicionarItem(String item) {
  itens.add(item);
}

@action
void removerItem(int index) {
  itens.removeAt(index);
}
```

#### 3. **Observable Map**
```dart
@observable
ObservableMap<String, dynamic> dados = ObservableMap<String, dynamic>();

// Uso
@action
void atualizarDado(String chave, dynamic valor) {
  dados[chave] = valor;
}
```

### Actions Avançadas

#### 1. **Action Assíncrona**
```dart
@action
Future<bool> carregarDados() async {
  isLoading = true;
  errorMessage = null;

  try {
    final resultado = await apiService.buscarDados();
    dados.addAll(resultado);
    return true;
  } catch (e) {
    errorMessage = 'Erro ao carregar: ${e.toString()}';
    return false;
  } finally {
    isLoading = false;
  }
}
```

#### 2. **Action com Validação**
```dart
@action
bool validarESubmeter() {
  // Limpa erros anteriores
  _limparErros();

  // Valida campos
  if (!_validarCampos()) {
    return false;
  }

  // Submete se válido
  _submeter();
  return true;
}

void _limparErros() {
  emailError = null;
  senhaError = null;
}

bool _validarCampos() {
  bool isValid = true;

  if (email.isEmpty) {
    emailError = 'Email é obrigatório';
    isValid = false;
  }

  if (senha.length < 6) {
    senhaError = 'Senha deve ter pelo menos 6 caracteres';
    isValid = false;
  }

  return isValid;
}
```

### Computed Avançados

#### 1. **Computed com Lógica Complexa**
```dart
@computed
String get statusMensagem {
  if (isLoading) return 'Carregando...';
  if (errorMessage != null) return 'Erro: $errorMessage';
  if (dados.isEmpty) return 'Nenhum dado encontrado';
  return '${dados.length} itens carregados';
}

@computed
Color get statusCor {
  if (isLoading) return Colors.blue;
  if (errorMessage != null) return Colors.red;
  if (dados.isEmpty) return Colors.grey;
  return Colors.green;
}
```

#### 2. **Computed com Filtros**
```dart
@computed
List<Usuario> get usuariosAtivos => 
    usuarios.where((u) => u.ativo).toList();

@computed
List<Usuario> get usuariosFiltrados {
  if (filtroTexto.isEmpty) return usuarios;
  
  return usuarios.where((usuario) =>
    usuario.nome.toLowerCase().contains(filtroTexto.toLowerCase()) ||
    usuario.email.toLowerCase().contains(filtroTexto.toLowerCase())
  ).toList();
}
```

## 🔗 Integração com Flutter

### 1. **Observer Widget**
```dart
class MinhaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<MeuStore>();

    return Scaffold(
      body: Observer(
        builder: (_) {
          // Este bloco reconstrói quando observables mudam
          if (store.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (store.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Erro: ${store.errorMessage}'),
                  ElevatedButton(
                    onPressed: store.recarregar,
                    child: Text('Tentar Novamente'),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: store.itens.length,
            itemBuilder: (context, index) {
              final item = store.itens[index];
              return ListTile(
                title: Text(item.nome),
                subtitle: Text(item.descricao),
              );
            },
          );
        },
      ),
    );
  }
}
```

### 2. **Observer em Widgets Específicos**
```dart
class ContadorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = sl<ContadorStore>();

    return Column(
      children: [
        // Apenas este Observer reconstrói quando contador muda
        Observer(
          builder: (_) => Text(
            'Contador: ${store.contador}',
            style: TextStyle(fontSize: 24),
          ),
        ),
        
        // Este botão não reconstrói
        ElevatedButton(
          onPressed: store.incrementar,
          child: Text('Incrementar'),
        ),
        
        // Outro Observer para status
        Observer(
          builder: (_) => Text(
            store.status,
            style: TextStyle(color: store.statusCor),
          ),
        ),
      ],
    );
  }
}
```

## 🎯 Padrões e Boas Práticas

### 1. **Estrutura de Store**
```dart
class UsuarioStore = _UsuarioStoreBase with _$UsuarioStore;

abstract class _UsuarioStoreBase with Store {
  // 1. Dependências no construtor
  _UsuarioStoreBase({
    required this.getUserUseCase,
    required this.updateUserUseCase,
  });

  final GetUserUseCase getUserUseCase;
  final UpdateUserUseCase updateUserUseCase;

  // 2. Estado principal
  @observable
  Usuario? usuario;

  // 3. Estados de UI
  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  // 4. Estados de formulário
  @observable
  String nome = '';

  @observable
  String email = '';

  // 5. Erros de validação
  @observable
  String? nomeError;

  @observable
  String? emailError;

  // 6. Actions públicas
  @action
  Future<void> carregarUsuario(String id) async {
    // implementação
  }

  @action
  void setNome(String value) {
    nome = value;
    nomeError = null;
  }

  // 7. Computed values
  @computed
  bool get podeEditar => usuario != null && !isLoading;

  @computed
  bool get formularioValido => nome.isNotEmpty && email.isNotEmpty;

  // 8. Métodos privados (sem @action se não modificam observables)
  void _validarFormulario() {
    // validação
  }
}
```

### 2. **Padrão de Loading/Error/Success**
```dart
@action
Future<T?> _executarComTratamento<T>(
  Future<Either<Failure, T>> Function() operacao,
) async {
  isLoading = true;
  errorMessage = null;

  try {
    final result = await operacao();
    return result.fold(
      (failure) {
        errorMessage = failure.message;
        return null;
      },
      (success) {
        return success;
      },
    );
  } finally {
    isLoading = false;
  }
}

// Uso
@action
Future<void> carregarUsuario(String id) async {
  final user = await _executarComTratamento(
    () => getUserUseCase(GetUserParams(id: id)),
  );
  
  if (user != null) {
    usuario = user;
  }
}
```

### 3. **Gerenciamento de Formulários**
```dart
// Mixin para formulários
mixin FormularioMixin on Store {
  @action
  void limparErros() {
    // Implementar limpeza de erros específicos
  }

  @action
  void limparFormulario() {
    // Implementar limpeza de campos
  }

  @computed
  bool get formularioValido;
}

// Uso no Store
abstract class _LoginStoreBase with Store, FormularioMixin {
  @observable
  String email = '';

  @observable
  String senha = '';

  @observable
  String? emailError;

  @observable
  String? senhaError;

  @override
  @action
  void limparErros() {
    emailError = null;
    senhaError = null;
  }

  @override
  @computed
  bool get formularioValido => 
      email.isNotEmpty && 
      senha.isNotEmpty && 
      emailError == null && 
      senhaError == null;
}
```

## 🐛 Debugging e Performance

### 1. **Logging de Actions**
```dart
// Adicione no construtor do Store
_UsuarioStoreBase() {
  // Log todas as mudanças de observable
  spy((change) {
    print('MobX Change: ${change.type} - ${change.name}');
  });
}
```

### 2. **Performance Tips**
```dart
// ❌ Evite - Observer muito amplo
Observer(
  builder: (_) => ExpensiveWidget(
    data: store.allData, // Reconstrói tudo quando qualquer dado muda
  ),
)

// ✅ Prefira - Observer específico
Observer(
  builder: (_) => Text(store.specificValue), // Só reconstrói quando necessário
)

// ✅ Use computed para cálculos caros
@computed
List<Item> get expensiveCalculation {
  // Só recalcula quando dependências mudam
  return items.where((item) => item.isValid).map((item) => 
    item.copyWith(processedData: heavyProcessing(item))
  ).toList();
}
```

### 3. **Debugging no DevTools**
```dart
// Adicione no main.dart para desenvolvimento
void main() {
  if (kDebugMode) {
    mainContext.config = mainContext.config.clone(
      isSpyEnabled: true,
    );
  }
  runApp(MyApp());
}
```
