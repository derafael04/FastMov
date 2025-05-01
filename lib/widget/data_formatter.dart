import 'package:intl/intl.dart';

class DataFormatter {
  /// Formata para: dd/MM/yyyy
  static String formatDiaMesAno(dynamic data) {
    final date = _parseDate(data);
    return DateFormat('dd/MM/yyyy').format(date);
  }

  /// Formata para: dd/MM
  static String formatDiaMes(dynamic data) {
    final date = _parseDate(data);
    return DateFormat('dd/MM').format(date);
  }

  /// Formata para: MM/yyyy
  static String formatMesAno(dynamic data) {
    final date = _parseDate(data);
    return DateFormat('MM/yyyy').format(date);
  }

  /// Formata para: Segunda, 05 mai
  static String formatDiaSemanaDiaMesAbreviado(dynamic data) {
    final date = _parseDate(data);
    final diaSemana = DateFormat.EEEE('pt_BR').format(date);
    final dia = DateFormat('dd').format(date);
    final mesAbreviado = DateFormat.MMM('pt_BR').format(date);
    return '${_capitalize(diaSemana)}, $dia $mesAbreviado';
  }

  /// Utilitário para converter qualquer tipo de entrada para DateTime
  static DateTime _parseDate(dynamic input) {
    if (input is DateTime) {
      return input;
    } else if (input is int) {
      return DateTime.fromMillisecondsSinceEpoch(input);
    } else if (input is String) {
      try {
        return DateTime.parse(input); // Espera formato ISO: yyyy-MM-dd
      } catch (_) {
        throw FormatException('String de data inválida: "$input". Esperado: yyyy-MM-dd');
      }
    } else {
      throw ArgumentError('Tipo não suportado: ${input.runtimeType}');
    }
  }

  /// Capitaliza primeira letra
  static String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
