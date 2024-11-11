import 'package:befocus/src/models/notes_model.dart';
import 'package:bloc/bloc.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NotesModel> notesModeList = List.empty(growable: true);
  bool isSelected = false;

  void saveNotes({required String title, required String description}) {
    final newNote = NotesModel(
      title: title,
      description: description,
    );
    notesModeList.add(newNote);
    emit(NotesLoaded());
  }

  void removeNote(int index) {
    notesModeList.removeAt(index);
    emit(NotesLoaded());
  }

  void selectNote({required bool? value}) {
    isSelected = value!;
    emit(NotesLoaded());
  }
}
