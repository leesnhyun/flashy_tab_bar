import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class FlashyTabBar extends StatelessWidget {
  final int selectedIndex;
  final double height;

  final double iconSize;
  final Color backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final Curve animationCurve;
  final List<BoxShadow> shadows;

  final List<FlashyTabBarItem> items;
  final ValueChanged<int> onItemSelected;

  FlashyTabBar({
    Key key,
    this.selectedIndex = 0,
    this.height = 60,
    this.showElevation = true,
    this.iconSize = 20,
    this.backgroundColor,
    this.animationDuration = const Duration(milliseconds: 170),
    this.animationCurve = Curves.linear,
    this.shadows = const [
      const BoxShadow(
        color: Colors.black12,
        blurRadius: 3,
      ),
    ],
    @required this.items,
    @required this.onItemSelected,
  }) {
    assert(items != null);
    assert(height >= 55 && height <= 100);
    assert(items.length >= 2 && items.length <= 5);
    assert(onItemSelected != null);
  }

  @override
  Widget build(BuildContext context) {
    final bg = (backgroundColor == null)
        ? Theme.of(context).bottomAppBarColor
        : backgroundColor;

    return Container(
      decoration: BoxDecoration(
        color: bg,
        boxShadow: showElevation
            ? shadows
            : [],
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: this.height,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((item) {
              var index = items.indexOf(item);
              return Expanded(
                child: GestureDetector(
                  onTap: () => onItemSelected(index),
                  child: _FlashTabBarItem(
                    item: item,
                    tabBarHeight: this.height,
                    iconSize: iconSize,
                    isSelected: index == selectedIndex,
                    backgroundColor: bg,
                    animationDuration: animationDuration,
                    animationCurve: animationCurve,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class FlashyTabBarItem {
  final Icon icon;
  final Text title;

  Color activeColor;
  Color inactiveColor;

  FlashyTabBarItem({
    @required this.icon,
    @required this.title,
    this.activeColor = const Color(0xff272e81),
    this.inactiveColor = const Color(0xff9496c1),
  }) {
    assert(icon != null);
    assert(title != null);
  }
}

class _FlashTabBarItem extends StatelessWidget {
  final double tabBarHeight;
  final double iconSize;

  final FlashyTabBarItem item;

  final bool isSelected;
  final Color backgroundColor;
  final Duration animationDuration;
  final Curve animationCurve;

  const _FlashTabBarItem(
      {Key key,
      @required this.item,
      @required this.isSelected,
      @required this.tabBarHeight,
      @required this.backgroundColor,
      @required this.animationDuration,
      @required this.animationCurve,
      @required this.iconSize})
      : assert(isSelected != null),
        assert(item != null),
        assert(backgroundColor != null),
        assert(animationDuration != null),
        assert(animationCurve != null),
        assert(iconSize != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: backgroundColor,
        height: double.maxFinite,
        child: Stack(
          overflow: Overflow.clip,
          alignment: Alignment.center,
          children: <Widget>[
            AnimatedAlign(
              duration: animationDuration,
              child: AnimatedOpacity(
                  opacity: isSelected ? 1.0 : 1.0,
                  duration: animationDuration,
                  child: IconTheme(
                    data: IconThemeData(
                        size: iconSize,
                        color: isSelected
                            ? item.activeColor.withOpacity(1)
                            : item.inactiveColor == null
                                ? item.activeColor
                                : item.inactiveColor),
                    child: item.icon,
                  )),
              alignment: isSelected ? Alignment.topCenter : Alignment.center,
            ),
            AnimatedPositioned(
              curve: animationCurve,
              duration: animationDuration,
              top: isSelected ? -2.0 * iconSize : tabBarHeight / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: iconSize,
                    height: iconSize,
                  ),
                  CustomPaint(
                    child: Container(
                      width: 80,
                      height: iconSize,
                    ),
                    painter: _CustomPath(backgroundColor),
                  )
                ],
              ),
            ),
            AnimatedAlign(
                alignment:
                    isSelected ? Alignment.center : Alignment.bottomCenter,
                duration: animationDuration,
                curve: animationCurve,
                child: AnimatedOpacity(
                    opacity: isSelected ? 1.0 : 0.0,
                    duration: animationDuration,
                    child: DefaultTextStyle.merge(
                      style: TextStyle(
                        color: item.activeColor,
                        fontWeight: FontWeight.bold,
                      ),
                      child: item.title,
                    ))),
            Positioned(
                bottom: 0,
                child: CustomPaint(
                  child: Container(
                    width: 80,
                    height: iconSize,
                  ),
                  painter: _CustomPath(backgroundColor),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedOpacity(
                  duration: animationDuration,
                  opacity: isSelected ? 1.0 : 0.0,
                  child: Container(
                    width: 5,
                    height: 5,
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: item.activeColor,
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  )),
            )
          ],
        ));
  }
}

class _CustomPath extends CustomPainter {
  final Color backgroundColor;

  _CustomPath(this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.lineTo(0, 0);
    path.lineTo(0, 2.0 * size.height);
    path.lineTo(1.0 * size.width, 2.0 * size.height);
    path.lineTo(1.0 * size.width, 1.0 * size.height);
    path.lineTo(0, 0);
    path.close();

    paint.color = this.backgroundColor;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
