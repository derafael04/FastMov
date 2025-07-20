import 'package:fastmov/data/models/faq_model.dart';
import 'package:fastmov/screen/ajuda/tela_detalhes_pergunta.dart';
import 'package:fastmov/widget/custom_appBar_controller.dart';
import 'package:fastmov/widget/custom_app_text.dart';
import 'package:flutter/material.dart';

class TelaAjuda extends StatefulWidget {
  const TelaAjuda({super.key});

  @override
  State<TelaAjuda> createState() => _TelaAjudaState();
}

class _TelaAjudaState extends State<TelaAjuda> {
  late FaqModel faqData;

  @override
  void initState() {
    super.initState();
    _loadFaqData();
  }

  void _loadFaqData() {
    // Dados do FAQ baseados no JSON fornecido
    const faqJson = {
      "Titulo": "FAQ FastMov – Perguntas Frequentes",
      "List": [
        {
          "Titulo": "SOBRE A FASTMOV E O FUNCIONAMENTO DO APP",
          "Perguntas": [
            {
              "pergunta": "O que é a FastMov?",
              "resposta": "A FastMov é uma healthtech que conecta você a profissionais especializados em saúde, bem-estar e recuperação física. Com um simples agendamento via aplicativo, oferecemos atendimentos presenciais de alta qualidade no conforto da sua casa, com foco em liberação miofascial, fisioterapia, recuperação muscular e terapias complementares."
            },
            {
              "pergunta": "Como funciona o atendimento domiciliar?",
              "resposta": "Você acessa o app, escolhe o serviço desejado, seleciona o horário e insere o endereço de atendimento. Um profissional qualificado vai até você com todos os materiais necessários, como maca, acessórios e equipamentos."
            },
            {
              "pergunta": "Preciso ter algum espaço ou estrutura especial em casa?",
              "resposta": "Não. Basta dispor de um espaço livre de aproximadamente 2m x 2m, ventilado e tranquilo para o atendimento. O restante é por nossa conta."
            },
            {
              "pergunta": "Quais regiões a FastMov atende atualmente?",
              "resposta": "Atualmente atuamos na cidade de São Paulo e em fase de expansão. A disponibilidade por região pode ser consultada diretamente no app durante o agendamento."
            },
            {
              "pergunta": "Posso escolher o profissional que irá me atender?",
              "resposta": "Sim. Você pode visualizar o perfil completo dos profissionais disponíveis, com suas avaliações, especialidades e agenda. Também é possível marcar como \"profissional favorito\" para priorização em sessões futuras."
            }
          ]
        },
        {
          "Titulo": "PAGAMENTOS, AGENDAMENTOS E POLÍTICAS",
          "Perguntas": [
            {
              "pergunta": "Quais são as formas de pagamento aceitas?",
              "resposta": "Aceitamos cartão de crédito, Pix e carteiras digitais diretamente pelo aplicativo. O processo é 100% seguro e gerenciado dentro da própria plataforma."
            },
            {
              "pergunta": "Quando o pagamento é realizado?",
              "resposta": "O pagamento é efetuado no momento da confirmação do agendamento. Sem pagamento antecipado, o atendimento não será confirmado."
            },
            {
              "pergunta": "Posso cancelar ou reagendar uma sessão?",
              "resposta": "Sim. Reagendamentos e cancelamentos são permitidos com no mínimo 6 horas de antecedência, diretamente pelo app. Cancelamentos fora desse prazo estão sujeitos a cobrança de taxas. A política completa está disponível na aba de Termos de Uso."
            },
            {
              "pergunta": "E se o profissional atrasar ou não comparecer?",
              "resposta": "Você poderá reagendar gratuitamente ou solicitar reembolso integral pelo app ou pelo canal de suporte. Casos de ausência ou imprevistos são tratados com total prioridade."
            },
            {
              "pergunta": "Como acompanho o status do meu agendamento?",
              "resposta": "Na aba \"Pedidos Ativos\" do app, você visualiza todos os detalhes da sua sessão: profissional, horário, local, status do pagamento e possibilidade de alteração."
            }
          ]
        },
        {
          "Titulo": "SERVIÇOS OFERECIDOS",
          "Perguntas": [
            {
              "pergunta": "Quais serviços estão disponíveis na FastMov?",
              "resposta": "RESET Miofascial® (recuperação física e performance), Drenagem Linfática, Fisioterapia Pós-Operatória, Atendimento Preventivo para Bem-estar, Mat Pilates, Acupuntura, Pacotes temáticos: Saúde da Mulher, Fisioterapia Esportiva, Performance"
            },
            {
              "pergunta": "Qual a diferença entre liberação miofascial e massagem tradicional?",
              "resposta": "A liberação miofascial é uma técnica terapêutica com base científica, que atua nas fáscias musculares para tratar dores, prevenir lesões e melhorar o desempenho físico. Não é uma massagem com foco estético ou relaxante."
            },
            {
              "pergunta": "A FastMov atende empresas?",
              "resposta": "Sim. Oferecemos soluções personalizadas para empresas, como sessões in company, programas de qualidade de vida e parcerias para colaboradores. Entre em contato com nosso time comercial pelo app."
            }
          ]
        },
        {
          "Titulo": "INDICAÇÕES, GAMIFICAÇÃO E BENEFÍCIOS",
          "Perguntas": [
            {
              "pergunta": "Como funciona o programa de indicação?",
              "resposta": "Ao indicar amigos pelo seu código pessoal, você recebe créditos para usar no app assim que eles realizarem o primeiro atendimento. Eles também ganham desconto. Sem limite de indicações."
            },
            {
              "pergunta": "O que é a gamificação da FastMov?",
              "resposta": "Você acumula pontos a cada agendamento, indicação ou desafio completado. Esses pontos podem ser trocados por benefícios, como descontos, sessões gratuitas ou vantagens exclusivas."
            },
            {
              "pergunta": "Como definir meu profissional favorito?",
              "resposta": "Após cada atendimento, você poderá marcar o profissional como favorito. Sempre que ele estiver disponível, você terá prioridade para agendamentos com ele."
            }
          ]
        },
        {
          "Titulo": "SEGURANÇA, QUALIFICAÇÃO E DADOS",
          "Perguntas": [
            {
              "pergunta": "Os profissionais são certificados?",
              "resposta": "Sim. Todos os profissionais passam por uma seleção rigorosa, possuem registro ativo no conselho de classe (ex: CREFITO) e recebem treinamentos padronizados da FastMov para garantir excelência no atendimento."
            },
            {
              "pergunta": "Meus dados estão seguros na plataforma?",
              "resposta": "Sim. Seguimos a Lei Geral de Proteção de Dados (LGPD). Todas as informações são criptografadas e utilizadas exclusivamente para garantir segurança, personalização e eficiência na sua experiência."
            },
            {
              "pergunta": "Como funciona o Código de Acesso?",
              "resposta": "Em alguns atendimentos, um código de 4 dígitos será gerado para permitir que o profissional autorizado entre em condomínios com controle de acesso. Esse código estará disponível no app, na aba do agendamento."
            }
          ]
        },
        {
          "Titulo": "SUPORTE E AJUDA",
          "Perguntas": [
            {
              "pergunta": "Como entro em contato com o suporte da FastMov?",
              "resposta": "Na aba \"Ajuda\" do app, você encontra: Chat com suporte em horário comercial, Central de dúvidas e documentos, Canal para sugestões ou problemas específicos."
            },
            {
              "pergunta": "E se eu tiver uma emergência ou problema com o atendimento?",
              "resposta": "A equipe da FastMov está preparada para lidar com situações urgentes. Use o suporte via app ou, em último caso, entre em contato pelo canal de emergência fornecido após agendamento."
            }
          ]
        }
      ]
    };

    faqData = FaqModel.fromJson(faqJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Perguntas Frequentes',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //CustomTextTitle2(faqData.titulo),
            const SizedBox(height: 24),
            ...faqData.list.map((category) => _buildCategory(context, category)),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(BuildContext context, FaqCategoryModel category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título da categoria
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          margin: const EdgeInsets.only(bottom: 16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: CustomTextBodyStrong(
            category.titulo,
            color: Theme.of(context).primaryColor,
          ),
        ),

        // Lista de perguntas
        ...category.perguntas.map((question) => _buildQuestionCard(context, question)),

        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildQuestionCard(BuildContext context, FaqQuestionModel question) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[850]
            : Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[700]!
              : Colors.grey[200]!,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () => _navigateToQuestionDetails(context, question),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.help_outline,
                      size: 20,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white70
                          : Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomTextBodyStrong(question.pergunta),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white54
                          : Colors.grey[400],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                CustomTextCaption1(
                  question.respostaPreview,
                  isHeavy: false,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white70
                      : Colors.grey[600],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToQuestionDetails(BuildContext context, FaqQuestionModel question) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaDetalhesPergunta(question: question),
      ),
    );
  }
}