import 'package:flutter/material.dart';

class RotatingImage extends StatefulWidget {
  final String imgPath;

  const RotatingImage({super.key, required this.imgPath});

  @override
  _RotatingImageState createState() => _RotatingImageState();
}

class _RotatingImageState extends State<RotatingImage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 20), 
      vsync: this,
    )..repeat(); 

    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotationAnimation,
      child: Hero(
        tag: widget.imgPath,
        child: Image.asset(
          widget.imgPath,
          fit: BoxFit.cover,
          height: 75.0,
          width: 75.0,
        ),
      ),
    );
  }
}
