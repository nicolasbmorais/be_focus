import 'package:befocus/app/app_routing.dart';
import 'package:befocus/core/core.dart';
import 'package:befocus/src/widgets/notes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NotesContent extends StatelessWidget {
  const NotesContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TypographyUI('Notas')..title,
            ButtonUI(
              'Adicionar notas',
              color: AppColors.orangePrimary,
              onPressed: () {
                Modular.to.pushNamed(AppRouting.notesPage);
              },
            )..textButton,
          ],
        ),
        const NotesContentWidget(),
      ],
    );
  }
}
