import 'package:flutter/material.dart';
import 'package:frontend/utils/utils.dart';

typedef ResponsiveBuilder = Widget Function(BuildContext context, Size size);

class ResponsiveSafeArea extends StatelessWidget {
  final ResponsiveBuilder? responsiveBuilder;

  const ResponsiveSafeArea({Key? key, @required ResponsiveBuilder? builder})
      : responsiveBuilder = builder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          width: _size.width,
          height: _size.height,
          color: AppColors.whiteColor,
          child: responsiveBuilder!(context, constraints.biggest),
        );
      }),
    );
  }
}
