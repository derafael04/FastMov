import 'package:fastmov/widget/custom_app_text.dart';
import 'package:fastmov/widget/custom_button.dart';
import 'package:flutter/material.dart';

class RatingModal extends StatefulWidget {
  const RatingModal({super.key});

  @override
  State<RatingModal> createState() => _RatingModalState();
}

class _RatingModalState extends State<RatingModal> {
  int selectedRating = 0;
  final TextEditingController _commentController = TextEditingController();

  void _setRating(int rating) {
    setState(() {
      selectedRating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomTextSubheadline('Avalie sua consulta'),
            const SizedBox(height: 12),
            const CustomTextBody('Qual sua nota para o seu atendimento com o profissional?', isHeavy: false, textAlign: TextAlign.center),

            // Estrelas
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  final starFilled = index < selectedRating;
                  return IconButton(
                    onPressed: () => _setRating(index + 1),
                    icon: Icon(
                      starFilled ? Icons.star : Icons.star_border,
                      color: starFilled ? Colors.amber : Colors.grey,
                      size: 38,
                    ),
                  );
                }),
              ),
            ),

            // Campo de comentário
            TextField(
              controller: _commentController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Comentário',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Botão Avaliar
            CustomButton(
              label: 'Avaliar', 
              type: ButtonType.primary,
              onPressed: () {

              },
            )
          ],
        ),
      ),
    );
  }
}
