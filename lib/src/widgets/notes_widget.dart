import 'package:befocus/app/app_routing.dart';
import 'package:befocus/core/core.dart';
import 'package:befocus/src/controllers/notes/notes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NotesContentWidget extends StatelessWidget {
  const NotesContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = Modular.get<NotesCubit>();

    return BlocBuilder<NotesCubit, NotesState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is NotesLoaded) {
          return Column(
            children: List.generate(
              cubit.notesModeList.length,
              (index) => Container(
                margin: const EdgeInsets.only(bottom: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey100,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    unselectedWidgetColor: AppColors.black,
                                  ),
                                  child: Checkbox(
                                    value: cubit.isSelected,
                                    onChanged: (bool? value) {
                                      cubit.selectNote(value: value);
                                    },
                                    checkColor: AppColors.green,
                                    activeColor: AppColors.transparent,
                                    shape: const CircleBorder(),
                                    side: WidgetStateBorderSide.resolveWith(
                                      (Set<WidgetState> states) {
                                        return BorderSide(
                                          color: cubit.isSelected
                                              ? AppColors.green
                                              : AppColors.black,
                                          width: 2,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              TypographyUI(
                                cubit.notesModeList[index].title ?? '',
                              )..titleBold,
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              Modular.to.pushNamed(
                                AppRouting.deleteNotesPage,
                                arguments: index,
                              );
                            },
                            icon: Icon(
                              Icons.delete_rounded,
                              color: AppColors.greyDefault,
                            ),
                          ),
                        ],
                      ),
                      TypographyUI(
                        cubit.notesModeList[index].description ?? '',
                      )..body1,
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.lightGrey100,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: TypographyUI('Você ainda não tem nenhuma nota')..body1,
            ),
          ),
        );
      },
    );
  }
}
