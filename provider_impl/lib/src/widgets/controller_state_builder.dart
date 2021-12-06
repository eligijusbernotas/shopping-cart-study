import 'package:flutter/material.dart';
import 'package:provider_impl/src/utils/controller_state.dart';

class ControllerStateBuilder extends StatelessWidget {
  const ControllerStateBuilder({
    Key? key,
    required this.state,
    required this.initial,
    this.loading,
    this.loaded,
    this.error,
  }) : super(key: key);

  final ControllerState state;
  final WidgetBuilder initial;
  final WidgetBuilder? loading;
  final WidgetBuilder? loaded;
  final WidgetBuilder? error;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ControllerState.loading:
        return loading?.call(context) ?? initial(context);
      case ControllerState.loaded:
        return loaded?.call(context) ?? initial(context);
      case ControllerState.error:
        return error?.call(context) ?? initial(context);
      case ControllerState.initial:
        return initial(context);
    }
  }
}
