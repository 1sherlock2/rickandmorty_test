import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty_test/core/routing/routes.dart';
import 'package:rickandmorty_test/core/widgets/character_status_widget.dart';
import 'package:rickandmorty_test/ui/bloc/character_by_id/character_by_id_bloc.dart';
import 'package:rickandmorty_test/ui/bloc/character_by_id/state/character_by_id_state.dart';
import 'package:rickandmorty_test/ui/core/colors.dart';
import 'package:rickandmorty_test/ui/pages/character_by_id/widgets/character_info.dart';

class CharacterById extends StatelessWidget {
  const CharacterById({super.key, required String id});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.customBlue,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: BlocBuilder<CharacterByIdBloc, CharacterByIdState>(
            builder: (context, state) {
              if (state.error != null && state.character == null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      Text(
                        state.error!,
                        style: TextStyle(color: AppColors.red1, fontSize: 2),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.white2,
                        ),
                        onPressed: () => context.go(Routes.characters),
                        child: Text('Вернуться на главную страницу'),
                      ),
                    ],
                  ),
                );
              }
              if (state.loading && state.character == null) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.white1),
                );
              }
              if (state.character != null) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return ClipRRect(
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Image.network(
                                    state.character!.image,
                                    width: constraints.maxWidth,
                                    height: 350,
                                    fit: BoxFit.fill,
                                  ),
                                  Positioned.fill(
                                    child: IgnorePointer(
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Colors.black.withValues(
                                                alpha: 0.75,
                                              ),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 40,
                                    left: 20,
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () =>
                                          context.go(Routes.characters),
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border: BoxBorder.all(
                                            color: Colors.green.shade400,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                          color: AppColors.customBlue2,
                                        ),
                                        child: Icon(
                                          Icons.keyboard_arrow_left_outlined,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    left: 20,
                                    child: Column(
                                      spacing: 10,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.character!.name,
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: AppColors.lightBrown,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        CharacterStatusWidget(
                                          characterItem: state.character!,
                                          fontSize: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Expanded(child: CharacterInfo(character: state.character!)),
                  ],
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
