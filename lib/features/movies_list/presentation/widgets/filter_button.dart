import 'package:flutter/material.dart';
import 'package:movie_catalog/core/theme/app_pallete.dart';

class FilterButton extends StatefulWidget {
  final AnimationController filterBottomSheetController;
  final List<String> categoryList;
  final BoxConstraints constraints;
  final Function(bool isActive) onTap;

  const FilterButton({
    super.key,
    required this.filterBottomSheetController,
    required this.categoryList,
    required this.constraints,
    required this.onTap,
  });

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool isFilterActive = false;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        height: widget.constraints.maxHeight,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isFilterActive ? AppPallete.silver : AppPallete.gray,
          ),
          color: AppPallete.gray,
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        child: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: const Icon(
            Icons.filter_list_sharp,
          ),
          onPressed: () async {
            setState(() {
              isFilterActive = !isFilterActive;
              widget.onTap(isFilterActive);
            });

            // await showModalBottomSheet(
            //   backgroundColor: AppPallete.eerieBlack,
            //   showDragHandle: true,
            //   context: context,
            //   builder: (context) => BottomSheet(
            //     backgroundColor: AppPallete.eerieBlack,
            //     animationController: widget.filterBottomSheetController,
            //     onClosing: () {},
            //     builder: (context) => Padding(
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 16.0,
            //       ),
            //       child: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           const VSpacer(24.0),
            //           Text(
            //             'Filter categories:',
            //             style: TextStyle(
            //               color: AppPallete.silver,
            //             ),
            //           ),
            //           const VSpacer(24.0),
            //           Wrap(
            //             spacing: 8.0,
            //             runSpacing: 8.0,
            //             children: widget.categoryList
            //                 .map(
            //                   (category) => Container(
            //                     padding: const EdgeInsets.all(
            //                       8.0,
            //                     ),
            //                     decoration: BoxDecoration(
            //                       color: AppPallete.gray,
            //                       borderRadius: const BorderRadius.all(
            //                         Radius.circular(
            //                           32.0,
            //                         ),
            //                       ),
            //                     ),
            //                     child: Text(
            //                       category,
            //                       style: TextStyle(
            //                         color: AppPallete.silver,
            //                       ),
            //                     ),
            //                   ),
            //                 )
            //                 .toList(),
            //           ),
            //           const VSpacer(64.0),
            //         ],
            //       ),
            //     ),
            //   ),
            // ).then(
            //   (value) => setState(() {
            //     isFilterActive = false;
            //   }),
            // );
          },
        ),
      ),
    );
  }
}
