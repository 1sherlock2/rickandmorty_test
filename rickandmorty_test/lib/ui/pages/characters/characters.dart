import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rickandmorty_test/data/services/models/character_model/character_model.dart';
import 'package:rickandmorty_test/ui/bloc/character/character_bloc.dart';
import 'package:rickandmorty_test/ui/bloc/character/character_event.dart';
import 'package:rickandmorty_test/ui/bloc/character/state/character_state.dart';
import 'package:rickandmorty_test/ui/core/colors.dart';
import 'package:rickandmorty_test/ui/pages/characters/widgets/character_card.dart';

class Characters extends StatefulWidget {
  const Characters({super.key});

  @override
  State<Characters> createState() => _CharactersState();
}

class _CharactersState extends State<Characters> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.customBlue,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.customBlue,
        body: SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.only(top: 40, bottom: 14),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Text(
                      'Персонажи',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: BlocBuilder<CharacterBloc, CharacterState>(
                      builder: (context, state) {
                        if (state.characters == null) {
                          return Center(
                            child: state.isLoading
                                ? const CircularProgressIndicator()
                                : Text(
                                    state.error ??
                                        'Не удалось загрузить персонажей',
                                  ),
                          );
                        }
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                bottom: 10,
                              ),
                              child: Align(
                                alignment: AlignmentGeometry.centerLeft,
                                child: Text(
                                  'Количество: ${state.characters!.info.count}',
                                ),
                              ),
                            ),
                            Expanded(
                              child: PagedListView<int, CharacterResult>(
                                state: PagingState<int, CharacterResult>(
                                  pages: state.pages,
                                  keys: state.pageKeys,
                                  hasNextPage:
                                      state.characters!.info.next != null,
                                  isLoading: state.isLoading,
                                  error: state.error,
                                ),
                                fetchNextPage: () {
                                  context.read<CharacterBloc>().add(
                                    CharacterNextPageRequested(),
                                  );
                                },
                                builderDelegate: PagedChildBuilderDelegate<CharacterResult>(
                                  itemBuilder: (context, item, index) =>
                                      ListTile(
                                        title: CharacterCard(
                                          characterItem: item,
                                        ),
                                      ),
                                  transitionDuration: Duration(seconds: 2),
                                  newPageProgressIndicatorBuilder: (context) =>
                                      const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                  newPageErrorIndicatorBuilder: (context) => Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: state.retryAfterSeconds > 0
                                        ? SizedBox(
                                            width: 56,
                                            height: 56,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                const CircularProgressIndicator(
                                                  color: AppColors.white1,
                                                ),
                                                Text(
                                                  '${state.retryAfterSeconds}',
                                                ),
                                              ],
                                            ),
                                          )
                                        : Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Не удалось загрузить страницу: ${state.error ?? 'Неизвестная ошибка'}',
                                                textAlign: TextAlign.center,
                                              ),
                                              TextButton.icon(
                                                onPressed: () => context
                                                    .read<CharacterBloc>()
                                                    .add(
                                                      CharacterNextPageRequested(),
                                                    ),
                                                icon: const Icon(Icons.refresh),
                                                label: const Text('Повторить'),
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
