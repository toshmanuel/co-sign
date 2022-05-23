import 'package:flutter/material.dart';

class Height extends StatelessWidget {
  const Height({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * height;
    return SizedBox(height: _height);
  }
}

class Height3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 3);
  }
}

class Height5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 5);
  }
}

class Height10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 10);
  }
}

class Height15 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 15);
  }
}

class Height20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 20);
  }
}

class Height25 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 25);
  }
}

class Height30 extends StatelessWidget {
  const Height30({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 30);
  }
}

class Height35 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 35);
  }
}

class Height40 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 40);
  }
}

class Height45 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 45);
  }
}

class Height50 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 50);
  }
}

class Width5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 5);
  }
}

class Width10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 10);
  }
}

class Width15 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 15);
  }
}

class Width20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 20);
  }
}

class Width25 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 25);
  }
}

class Width30 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 30);
  }
}

class Width40 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 40);
  }
}

class Width100 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 100);
  }
}
