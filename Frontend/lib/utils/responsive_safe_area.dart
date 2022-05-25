import 'package:flutter/material.dart';

typedef ResponsiveBuilder = Widget Function(BuildContext context, Size size);

class ResponsiveSafeArea extends StatelessWidget {
  final ResponsiveBuilder? responsiveBuilder;

  const ResponsiveSafeArea({Key? key, @required ResponsiveBuilder? builder})
      : responsiveBuilder = builder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return responsiveBuilder!(context, constraints.biggest);
      }),
    );
  }
}
