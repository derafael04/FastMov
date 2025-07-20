/// Interface para verificar conectividade de rede
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// Implementação mock da verificação de rede
/// Em um projeto real, usaria connectivity_plus ou similar
class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    // Mock - sempre retorna true
    // Em produção, implementaria verificação real
    return true;
  }
}
