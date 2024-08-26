import 'package:flutter/material.dart';
import 'package:movie_catalog/core/theme/app_pallete.dart';

class SearchBarWidget extends StatefulWidget {
  final FocusNode searchBarFocusNode;
  final Function(String value) onChanged;
  final Function() onClear;

  const SearchBarWidget({
    super.key,
    required this.searchBarFocusNode,
    required this.onChanged,
    required this.onClear,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool hasSearchBarText = false;
  final TextEditingController searchBarTextController = TextEditingController();

  void _updateClearSearchBarButton(value) {
    setState(() => hasSearchBarText = value != '');
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        8.0,
      ),
      child: Container(
        color: AppPallete.gray,
        child: TextField(
          onChanged: (value) {
            widget.onChanged(value);
            _updateClearSearchBarButton(value);
          },
          controller: searchBarTextController,
          textAlignVertical: TextAlignVertical.bottom,
          autofillHints: const [],
          cursorColor: AppPallete.silver,
          focusNode: widget.searchBarFocusNode,
          onTapOutside: (event) => widget.searchBarFocusNode.unfocus(),
          decoration: InputDecoration(
            hintText: 'Buscar',
            fillColor: AppPallete.gray,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppPallete.silver,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            prefixIcon: const Icon(
              Icons.search,
            ),
            suffixIcon: hasSearchBarText
                ? IconButton(
                    icon: const Icon(
                      Icons.close,
                    ),
                    onPressed: () {
                      searchBarTextController.clear();
                      widget.onChanged(searchBarTextController.text);
                      _updateClearSearchBarButton(
                        searchBarTextController.text,
                      );
                      widget.onClear();
                    },
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
