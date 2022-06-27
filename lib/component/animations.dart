import 'package:flutter/material.dart';

class Animations {
  // slide animation from right to left
  // we need animation of type double
  static SlideTransition fromLeft(Animation<double> _animation,
      Animation<double> _secondaryAnimation, Widget _child) {
    return SlideTransition(
      child: _child,
      position: Tween<Offset>(end: Offset.zero, begin: const Offset(1.0, 0.0))
          .animate(_animation),
    );
  }

  // slide animation from left to right
  static SlideTransition fromRight(Animation<double> _animation,
      Animation<double> _secondaryAnimation, Widget _child) {
    return SlideTransition(
      child: _child,
      position: Tween<Offset>(end: Offset.zero, begin: const Offset(-1.0, 0.0))
          .animate(_animation),
    );
  }

  // slide animation from top to bottom
  static SlideTransition fromTop(Animation<double> _animation,
      Animation<double> _secondaryAnimation, Widget _child) {
    return SlideTransition(
      child: _child,
      position: Tween<Offset>(end: Offset.zero, begin: const Offset(0.0, -1.0))
          .animate(_animation),
    );
  }

  // slide animation from bottom to top
  static SlideTransition fromBottom(Animation<double> _animation,
      Animation<double> _secondaryAnimation, Widget _child) {
    return SlideTransition(
      child: _child,
      position: Tween<Offset>(end: Offset.zero, begin: const Offset(0.0, 1.0))
          .animate(_animation),
    );
  }

  // slide animation with grow effect
  static ScaleTransition grow(Animation<double> _animation,
      Animation<double> _secondaryAnimation, Widget _child) {
    return ScaleTransition(
      child: _child,
      scale: Tween<double>(end: 1.0, begin: 0.0).animate(CurvedAnimation(
          parent: _animation,
          curve: const Interval(0.00, 1.00, curve: Curves.bounceOut))),
    );
  }

  // slide animation with shrink effect
  static ScaleTransition shrink(Animation<double> _animation,
      Animation<double> _secondaryAnimation, Widget _child) {
    return ScaleTransition(
      child: _child,
      scale: Tween<double>(end: 1.0, begin: 1.2).animate(CurvedAnimation(
          parent: _animation,
          curve: const Interval(0.50, 1.00, curve: Curves.linear))),
    );
  }
}
