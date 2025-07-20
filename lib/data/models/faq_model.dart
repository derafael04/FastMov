/// Model para FAQ - responsável pela serialização/deserialização
class FaqModel {
  final String titulo;
  final List<FaqCategoryModel> list;

  const FaqModel({
    required this.titulo,
    required this.list,
  });

  /// Cria FaqModel a partir de JSON
  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      titulo: json['Titulo'] as String,
      list: (json['List'] as List<dynamic>)
          .map((item) => FaqCategoryModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Converte FaqModel para JSON
  Map<String, dynamic> toJson() {
    return {
      'Titulo': titulo,
      'List': list.map((category) => category.toJson()).toList(),
    };
  }
}

/// Model para categoria do FAQ
class FaqCategoryModel {
  final String titulo;
  final List<FaqQuestionModel> perguntas;

  const FaqCategoryModel({
    required this.titulo,
    required this.perguntas,
  });

  /// Cria FaqCategoryModel a partir de JSON
  factory FaqCategoryModel.fromJson(Map<String, dynamic> json) {
    return FaqCategoryModel(
      titulo: json['Titulo'] as String,
      perguntas: (json['Perguntas'] as List<dynamic>)
          .map((item) => FaqQuestionModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Converte FaqCategoryModel para JSON
  Map<String, dynamic> toJson() {
    return {
      'Titulo': titulo,
      'Perguntas': perguntas.map((question) => question.toJson()).toList(),
    };
  }
}

/// Model para pergunta do FAQ
class FaqQuestionModel {
  final String pergunta;
  final String resposta;

  const FaqQuestionModel({
    required this.pergunta,
    required this.resposta,
  });

  /// Cria FaqQuestionModel a partir de JSON
  factory FaqQuestionModel.fromJson(Map<String, dynamic> json) {
    return FaqQuestionModel(
      pergunta: json['pergunta'] as String,
      resposta: json['resposta'] as String,
    );
  }

  /// Converte FaqQuestionModel para JSON
  Map<String, dynamic> toJson() {
    return {
      'pergunta': pergunta,
      'resposta': resposta,
    };
  }

  /// Retorna um trecho da resposta (primeiras 100 caracteres)
  String get respostaPreview {
    if (resposta.length <= 100) {
      return resposta;
    }
    return '${resposta.substring(0, 100)}...';
  }
}
