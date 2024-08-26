import 'package:flutter/material.dart';

class ElementShrinker extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final bool allowMultiClick;

  const ElementShrinker({
    super.key,
    required this.child,
    this.allowMultiClick = false,
    this.onTap,
  });

  @override
  State<ElementShrinker> createState() => _ElementShrinkerState();
}

class _ElementShrinkerState extends State<ElementShrinker> with SingleTickerProviderStateMixin {
  int clickAnimationDurationMillis = 100;
  double _scaleTransformValue = 1;
  bool isClicked = false;

  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: clickAnimationDurationMillis),
      lowerBound: 0.0,
      upperBound: 0.10,
    )..addListener(() {
        setState(() => _scaleTransformValue = 1 - animationController.value);
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<void> _shrinkButtonSize() async {
    if (animationController.isAnimating || animationController.isCompleted || !animationController.isDismissed) return;

    await animationController.forward();
    isClicked = true;
  }

  Future<void> _restoreButtonSize() async {
    if (!animationController.isAnimating && animationController.isDismissed) return;

    try {
      await animationController.reverse();
    } catch (exception) {
    } finally {
      isClicked = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        if (widget.allowMultiClick) {
          await Future.delayed(
            Duration(milliseconds: clickAnimationDurationMillis * 2),
            () => widget.onTap?.call(),
          );
        } else {
          if (!isClicked) {
            await Future.delayed(
              Duration(milliseconds: clickAnimationDurationMillis * 2),
              () => widget.onTap?.call(),
            );
          }
        }

        await _shrinkButtonSize();
        await _restoreButtonSize();
      },
      onTapDown: (_) async => await _shrinkButtonSize(),
      onTapCancel: () async => await _restoreButtonSize(),
      child: Transform.scale(
        scale: _scaleTransformValue,
        child: widget.child,
      ),
    );
  }
}
