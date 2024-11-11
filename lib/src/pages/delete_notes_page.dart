import 'package:befocus/core/core.dart';
import 'package:befocus/src/controllers/notes/notes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DeleteNotesPage extends StatelessWidget {
  const DeleteNotesPage({required this.noteIndex, super.key});

  final int noteIndex;

  @override
  Widget build(BuildContext context) {
    return TemplateUI(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              TypographyUI('Deletar notas?')..h2Bold,
              const SizedBox(height: 16),
              TypographyUI(
                'Tem certeza? Essa ação é permanente e não pode ser desfeita.',
              )..body1,
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: SvgUI(size: 0.55)..personAttention,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          ButtonUI(
            'Cancelar',
            isExpanded: true,
            background: AppColors.black,
            onPressed: () => Modular.to.pop(),
          )..outlined,
          const SizedBox(width: 8),
          ButtonUI(
            'Apagar',
            isExpanded: true,
            onPressed: () {
              Modular.get<NotesCubit>().removeNote(noteIndex);
              Modular.to.pop();
            },
          )..solid,
        ],
      ),
    );
  }
}
