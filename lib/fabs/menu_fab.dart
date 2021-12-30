import 'package:flutter/material.dart';

class MenuFAB extends StatefulWidget {
  final Widget firstItem;
  final Widget seccondItem;
  final Widget thirdItem;
  final AnimatedIconData? animatedIcon;
  final Color? activeColor;
  final Color? inactiveColor;
  final Curve? curve;

  MenuFAB({
    required this.firstItem,
    required this.seccondItem,
    required this.thirdItem,
    this.animatedIcon,
    this.activeColor,
    this.inactiveColor,
    this.curve,
  });

  @override
  _MenuFABState createState() => _MenuFABState();
}

class _MenuFABState extends State<MenuFAB> with SingleTickerProviderStateMixin {
  bool isOpened = false;
  late AnimationController _animationController;
  late Animation<Color?> _buttonColor;
  late Animation<double> _animateIcon;
  late Animation<double> _translateButton;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: widget.inactiveColor ?? Colors.blue,
      end: widget.activeColor ?? Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: 56,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        1.0,
        curve: widget.curve ?? Curves.ease,
      ),
    ));

    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget first() {
    return Container(child: widget.firstItem);
  }

  Widget seccond() {
    return Container(child: widget.seccondItem);
  }

  Widget third() {
    return Container(child: widget.thirdItem);
  }

  Widget fab() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Menu',
        child: AnimatedIcon(
          icon: widget.animatedIcon ?? AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 3.0,
            0.0,
          ),
          child: third(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: seccond(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: first(),
        ),
        fab(),
      ],
    );
  }
}
