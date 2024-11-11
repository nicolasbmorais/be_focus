import 'package:befocus/app/app_routing.dart';
import 'package:befocus/core/core.dart';
import 'package:befocus/core/themes/ui/form/form_ui.dart';
import 'package:befocus/src/controllers/notes/notes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = Modular.get<NotesCubit>();
    final titleEC = TextEditingController();
    final descriptionEC = TextEditingController();
    final formKey = FormUI.generateKey;

    return TemplateUI(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        title: TypographyUI('Notas')..h3Bold,
      ),
      body: FormUI(
        formKey: formKey,
        child: Column(
          children: [
            TextFieldUI(
              name: 'title',
              label: 'Título',
              hintText: 'Insira o título',
              controller: titleEC,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return 'É necessário adicionar um título';
                } else if (p0.length <= 2) {
                  return 'O título deve ser maior que duas letras';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            TextFieldUI(
              name: 'body',
              label: 'Descrição',
              hintText: 'Insira o texto',
              controller: descriptionEC,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return 'É necessário adicionar uma descrição';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtonUI(
        'Salvar',
        onPressed: () {
          if (!formKey.currentState!.saveAndValidate()) {
            return;
          }
          cubit.saveNotes(
            title: titleEC.text,
            description: descriptionEC.text,
          );
          Modular.to.pushNamedAndRemoveUntil(
            AppRouting.timerPage,
            ModalRoute.withName(AppRouting.timerPage),
          );
        },
      )..solid,
    );
  }
}
