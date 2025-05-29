import 'package:flutter/material.dart';

class CardAnuncio extends StatelessWidget {
  const CardAnuncio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 156,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF161934), Color(0xFF393C5E)],
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Lado esquerdo com texto e cupom
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Ativo',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'R\$330,00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '2 Sessões no mês',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Detalhes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.chevron_right, size: 16, color: Colors.black),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Lado direito com imagem
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/images/paciente.png',
                width: 128,
                height: 134,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}