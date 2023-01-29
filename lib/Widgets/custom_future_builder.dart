import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../constans/app_colors.dart';
import '../constans/app_constants.dart';
import '../constans/app_named_routes.dart';
import '../constans/app_text_styles.dart';
import '../controllers/poke_controller.dart';
import '../models/pokemon_detail_model.dart';

class CustomFutureBuilder extends StatefulWidget {
  CustomFutureBuilder({
    Key? key,
    required PokeController pokeController,
  })  : _pokeController = pokeController,
        super(key: key);

  final PokeController _pokeController;

  @override
  State<CustomFutureBuilder> createState() => _CustomFutureBuilderState();
}

class _CustomFutureBuilderState extends State<CustomFutureBuilder> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        widget._pokeController.fetchPokemons();
        // Bottom poistion
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: FutureBuilder<List<PokemonModel>>(
        future: widget._pokeController.fetchPokemons(),
        builder: (context, snapshot) {
          if (widget._pokeController.inLoader == null) {
            return const Center(
              child: Text(AppConstants.ERROR),
            );
          }
          if (widget._pokeController.inLoader == true) {
            return const Center(
                child: Padding(
              padding: EdgeInsets.only(top: 90),
              child: CircularProgressIndicator(
                color: AppColors.DARK_BLUE,
              ),
            ));
          }

          return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: _scrollController,
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Modular.to.pushNamed(AppNamedRoutes.detailsPage, arguments: {
                    'id': snapshot.data![index].id,
                  });
                },
                child: Container(
                  margin: snapshot.data![index].id!.isEven
                      ? const EdgeInsets.only(
                          left: 7.37, right: 18.37, bottom: 10)
                      : const EdgeInsets.only(left: 30, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16, left: 6),
                            child: Text(
                              snapshot.data![index].name!,
                              style: AppTextStyles.NUNITO_700_LOW
                                  .copyWith(color: AppColors.POKE_BLUE),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 8),
                                height: 20,
                                width: 66.95,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  color: AppColors.LIGHT_GREEN,
                                ),
                                child: Center(
                                  child: Text(
                                    AppConstants.NORMAL_TYPE,
                                    style: AppTextStyles.NUNITO_400_LOW
                                        .copyWith(
                                            color: AppColors.BACKGROUND_COLLOR),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SizedBox(
                                  height: 78,
                                  width: 78,
                                  child: Image.network(
                                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${snapshot.data![index].id ?? 0}.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              '#${snapshot.data![index].id.toString()}',
                              style: AppTextStyles.NUNITO_400_LOW
                                  .copyWith(color: AppColors.POKE_BLUE),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
