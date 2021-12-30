library flutter_button;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleAuthButton extends StatefulWidget {
  final VoidCallback onTap;
  final String? title;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? iconColor;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? shadows;
  final double? fontSize;
  final double? iconSize;
  final FontWeight? fontWeight;
  final bool? wOpacity;
  final double? opacityValue;
  final bool? wGradientColors;
  final List<Color>? gradientColors;
  final AlignmentGeometry? beginGradient;
  final AlignmentGeometry? endGradient;

  GoogleAuthButton({
    required this.onTap,
    this.title,
    this.backgroundColor,
    this.titleColor,
    this.iconColor,
    this.borderRadius,
    this.shadows,
    this.fontSize,
    this.iconSize,
    this.wOpacity,
    this.opacityValue,
    this.gradientColors,
    this.wGradientColors,
    this.beginGradient,
    this.endGradient,
    this.fontWeight,
  });
  @override
  _GoogleAuthButtonState createState() => _GoogleAuthButtonState();
}

class _GoogleAuthButtonState extends State<GoogleAuthButton> {
  bool _isTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isTapped = false;
        });
        widget.onTap();
      },
      child: (widget.wOpacity != false && widget.wOpacity != null)
          ? buildButtonWOpacity()
          : buildButton(),
    );
  }

  Opacity buildButtonWOpacity() {
    return Opacity(
      opacity: _isTapped ? widget.opacityValue ?? .7 : 1,
      child: buildButton(),
    );
  }

  Container buildButton() {
    return Container(
      decoration: buildBoxDecoration(),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.google,
              color: (widget.iconColor == null)
                  ? Color(0xff4285F4)
                  : widget.iconColor,
              size: (widget.iconSize != null) ? widget.iconSize : 25,
            ),
            SizedBox(width: 10),

            ///
            Text(
              widget.title ?? "Google",
              style: TextStyle(
                color: (widget.titleColor == null)
                    ? Color(0xff4285F4)
                    : widget.titleColor,
                fontSize: (widget.fontSize != null) ? widget.fontSize : 25,
                fontWeight: (widget.fontWeight != null)
                    ? widget.fontWeight
                    : FontWeight.w500,
              ),
            ),

            ///
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: (widget.borderRadius != null)
          ? widget.borderRadius
          : BorderRadius.circular(10),
      gradient: (widget.wGradientColors == true)
          ? (widget.gradientColors != null)
              ? LinearGradient(
                  colors: widget.gradientColors!,
                  begin: widget.beginGradient ?? Alignment.topRight,
                  end: widget.beginGradient ?? Alignment.bottomLeft,
                )
              : LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.grey,
                    Colors.blue.withOpacity(.3),
                  ],
                )
          : null,
      color: (widget.backgroundColor != null)
          ? widget.backgroundColor
          : Colors.white,
      boxShadow: (widget.shadows != null) ? widget.shadows : [],
    );
  }
}

///
///
///
///
///

class CircularGGAuthButton extends StatefulWidget {
  final VoidCallback onTap;
  final Color? backgorundColor;
  final Color? iconColor;
  final bool? wOpacity;
  final bool? wBorder;
  final Color? borderColor;
  final double? opacityValue;
  final double? size;
  final double? iconSize;
  final List<BoxShadow>? shadows;
  final BorderRadiusGeometry? borderRadius;

  CircularGGAuthButton({
    required this.onTap,
    this.backgorundColor,
    this.iconColor,
    this.wOpacity,
    this.wBorder,
    this.borderColor,
    this.opacityValue,
    this.size,
    this.iconSize,
    this.shadows,
    this.borderRadius,
  });

  @override
  CircularGGAuthButtonState createState() => CircularGGAuthButtonState();
}

class CircularGGAuthButtonState extends State<CircularGGAuthButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isTapped = false;
        });
        widget.onTap();
      },
      child: (widget.wOpacity == null || widget.wOpacity == false)
          ? body()
          : Opacity(
              opacity: _isTapped ? widget.opacityValue ?? .7 : 1,
              child: body(),
            ),
    );
  }

  Container body() {
    return Container(
      height: (widget.size != null) ? widget.size : 50,
      width: (widget.size != null) ? widget.size : 50,
      decoration: buildBoxDecoration(),
      child: buildButtonBody(),
    );
  }

  Center buildButtonBody() {
    return Center(
      child: FaIcon(
        FontAwesomeIcons.google,
        color:
            (widget.iconColor != null) ? widget.iconColor : Color(0xff4285F4),
        size: (widget.iconSize == null) ? 35 : widget.iconSize,
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: (widget.borderRadius == null) ? null : widget.borderRadius,
      color: (widget.backgorundColor != null)
          ? widget.backgorundColor
          : Colors.white,
      border: (widget.wBorder != null && widget.wBorder != false)
          ? Border.all(
              color: widget.borderColor ?? Colors.black,
            )
          : null,
      boxShadow: (widget.shadows == null) ? [] : widget.shadows,
    );
  }
}

///
///
///
///
///

class MagicalGGButton extends StatefulWidget {
  final String title;
  final double? opacityValue;
  final VoidCallback onTap;

  MagicalGGButton({
    required this.title,
    this.opacityValue,
    required this.onTap,
  });

  @override
  _MagicalGGButtonState createState() => _MagicalGGButtonState();
}

class _MagicalGGButtonState extends State<MagicalGGButton> {
  bool _isTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isTapped = false;
        });
        widget.onTap();
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      child: Opacity(
        opacity: _isTapped ? widget.opacityValue ?? .7 : 1,
        child: buildContainer(context),
      ),
    );
  }

  Container buildContainer(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Color(0xffFF6543).withOpacity(.6),
        borderRadius: BorderRadius.circular(30),
      ),
      width: MediaQuery.of(context).size.width - 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildGoogleCard(),
          Text(
            (widget.title != null)
                ? widget.title
                : "Magical Google Auth Button",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Opacity(
            opacity: 0,
            child: buildGoogleCard(),
          )
        ],
      ),
    );
  }

  Container buildGoogleCard() {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffFF7B4E),
            Color(0xffFF6543),
          ],
        ),
      ),
      child: Center(
        child: FaIcon(
          FontAwesomeIcons.google,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
