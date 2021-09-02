import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../../../../core/domain/enums/control_state_enum.dart';
import '../../../../core/presentation/widgets/circular_loader.dart';
import '../../../../core/utils/extensions/screen_extension.dart';
import '../controller/home_controller.dart';
import 'movie_poster_card_widget.dart';
import 'search_input_widget.dart';

class HomePersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final HomeController controller = Modular.get();

  @override
  double get maxExtent => 400.scale;

  @override
  double get minExtent => 110.scale;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: theme.colorScheme.background,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 32.scale,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.scale),
              child: SearchInput(
                controller: controller,
                theme: theme,
              ),
            ),
          ),
          Positioned(
            top: 100.scale,
            child: Opacity(
              opacity: opacity(shrinkOffset * 2.5).clamp(0.0, 1.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.scale),
                child: Text(
                  'Top 10',
                  style: TextStyle(
                    color: theme.colorScheme.onBackground.withOpacity(.87),
                    fontSize: 16.scale,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Observer(
            builder: (_) {
              switch (controller.state) {
                case ControlState.start:
                case ControlState.loading:
                  return Positioned(
                    top: 150.scale,
                    left: (size.width / 2.5).scale,
                    child: CircularLoader(
                      isPrimaryColor: true,
                    ),
                  );
                case ControlState.sucess:
                  return Positioned(
                    top: 132.scale,
                    child: Opacity(
                      opacity: opacity(shrinkOffset * 2.5).clamp(0.0, 1.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width,
                        height: 220.scale,
                        child: ScrollSnapList(
                          itemCount: controller.top10Movies.length,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          listController: controller.listPosterController,
                          itemSize: 145.scale,
                          scrollPhysics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics(),
                          ),
                          onItemFocus: (int) {},
                          dynamicItemSize: true,
                          itemBuilder: (context, index) {
                            return MoviePosterCard(
                              movie: controller.top10Movies[index],
                            );
                          },
                        ),
                      ),
                    ),
                  );
                case ControlState.empty:
                case ControlState.failure:
                  return Positioned(
                    top: 142.scale,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.scale),
                      child: Text(controller.stateMessage),
                    ),
                  );
              }
            },
          ),
          Positioned(
            top: (380.scale * position(shrinkOffset * 0.8))
                .clamp(90.scale, 380.scale),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.scale),
              child: Text(
                'All Movies',
                style: TextStyle(
                  color: theme.colorScheme.onBackground.withOpacity(.87),
                  fontSize: 16.scale,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;

  double opacity(double shrinkOffset) {
    return 1.0 - max(0.0, shrinkOffset) / (maxExtent - minExtent);
  }

  double position(double shrinkOffset) {
    return 1.0 - max(0.0, shrinkOffset) / (maxExtent - minExtent);
  }
}
