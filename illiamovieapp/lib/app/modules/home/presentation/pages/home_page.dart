import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:illiamovieapp/app/modules/home/presentation/widgets/home_page/home_page_failure_widget.dart';
import 'package:illiamovieapp/app/modules/home/presentation/widgets/home_page/home_page_success_widget.dart';

import '../../../../core/domain/enums/control_state_enum.dart';
import '../../../../core/utils/extensions/brightness_extension.dart';
import '../../../../core/utils/keyboard_visibility_utils.dart';
import '../controller/home_controller.dart';
import '../widgets/home_persistent_header_delegate_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: theme.colorScheme.background,
        statusBarBrightness: theme.brightness.opposite,
        statusBarIconBrightness: theme.brightness,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: theme.colorScheme.background,
          body: GestureDetector(
            onTap: () {
              if (controller.searchFocusNode.hasFocus)
                controller.searchFocusNode.unfocus();
            },
            onVerticalDragStart: (detail) {
              if (controller.searchFocusNode.hasFocus)
                controller.searchFocusNode.unfocus();
            },
            child: KeyboardVisibility(
              onVisibilityChange: controller.setIsVisibleKeyboard,
              child: NotificationListener(
                onNotification: (ScrollNotification scrollNotification) {
                  return controller
                      .onNotificationSnapEffect(scrollNotification);
                },
                child: RefreshIndicator(
                  onRefresh: controller.pipeline,
                  child: CustomScrollView(
                    controller: controller.scrollController,
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    slivers: [
                      SliverPersistentHeader(
                        delegate: HomePersistentHeaderDelegate(),
                        floating: false,
                        pinned: true,
                      ),
                      SliverToBoxAdapter(
                        child: Observer(
                          builder: (_) {
                            switch (controller.state) {
                              case ControlState.start:
                              case ControlState.loading:
                              case ControlState.sucess:
                                return HomePageSuccess();
                              case ControlState.empty:
                              case ControlState.failure:
                                return HomePageFailure();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
