import 'package:flutter/material.dart';

typedef KeyboardVisibilityOnChange = void Function(bool value);

class KeyboardVisibility extends StatefulWidget {
  final Widget child;
  final KeyboardVisibilityOnChange? onVisibilityChange;

  const KeyboardVisibility({
    Key? key,
    required this.child,
    this.onVisibilityChange,
  }) : super(key: key);

  @override
  _KeyboardVisibilityState createState() => _KeyboardVisibilityState();
}

class _KeyboardVisibilityState extends State<KeyboardVisibility>
    with
        // ignore: prefer_mixin
        WidgetsBindingObserver {
  var _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance!.window.viewInsets.bottom;
    final newValue = bottomInset > 0.0;
    if (newValue != _isKeyboardVisible) {
      setState(() {
        _isKeyboardVisible = newValue;
        widget.onVisibilityChange?.call(_isKeyboardVisible);
      });
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
