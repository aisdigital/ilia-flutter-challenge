import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/utils/extensions/screen_extension.dart';
import '../controller/home_controller.dart';

class SearchInput extends StatelessWidget {
  SearchInput({
    Key? key,
    required this.controller,
    required this.theme,
  }) : super(key: key);

  final HomeController controller;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          width: 305.scale,
          child: TextFormField(
            autocorrect: true,
            controller: controller.searchController,
            cursorColor: theme.colorScheme.onBackground,
            focusNode: controller.searchFocusNode,
            keyboardAppearance: Brightness.dark,
            cursorHeight: 24.scale,
            onChanged: (value) => controller.debouncerSearch.run(() {
              controller.setSearchText(value);
            }),
            style: TextStyle(
              color: theme.colorScheme.onBackground.withOpacity(.87),
              fontSize: 18.scale,
              fontWeight: FontWeight.w400,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: 'Buscar...',
              prefixIcon: Icon(
                Icons.search,
                color: theme.colorScheme.onBackground.withOpacity(
                  controller.isSearching ? .87 : .6,
                ),
              ),
              suffixIcon: controller.isSearching
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50.scale),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: controller.handleClearSearch,
                          child: Icon(
                            Icons.close,
                            color:
                                theme.colorScheme.onBackground.withOpacity(.87),
                          ),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }
}
