import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class PaginationTab extends SwiperPlugin {
  // tabs titles
  final List<String> titles;

  // unactive color
  final Color color;

  // active color
  final Color activeColor;

  // font size of tab title
  final double fontSize;

  // font size when tab is active
  final double activeFontSize;

  // space 
  final double space;

  final FontWeight activeFontWeight;

  final FontWeight unactiveFontWeight;

  final Key key;

  //static TextStyle style = TextStyle(fontSize: 20, color: Colors.amberAccent);

  const PaginationTab(
      {this.titles,
      this.color,
      this.activeColor,
      this.fontSize: 22.0,
      this.activeFontSize: 24.0,
      this.space: 3.0,
      this.activeFontWeight: FontWeight.w800,
      this.unactiveFontWeight: FontWeight.w700,
      this.key});

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    if (config.itemCount > 20) {
      print(
          "The itemCount is too big, we suggest use FractionPaginationBuilder instead of DotSwiperPaginationBuilder in this sitituation");
    }

    //ThemeData themeData = Theme.of(context);
    Color activeColor = this.activeColor ?? Colors.white;
    Color color = this.color ?? Colors.white54;
    double size = this.fontSize ?? 22.0;
    double activeFontSize = this.activeFontSize ?? 24.0;
    double space = this.space ?? 3.0;
    List<String> titles = this.titles;

    if (config.indicatorLayout != PageIndicatorLayout.NONE &&
        config.layout == SwiperLayout.DEFAULT) {
      return new PageIndicator(
        count: config.itemCount,
        controller: config.pageController,
        layout: config.indicatorLayout,
        size: size,
        activeSize: activeFontSize,
        activeColor: activeColor,
        color: color,
        space: space,
      );
    }

    List<Widget> list = [];

    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;

    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      list.add(Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        key: Key("pagination_$i"),
        child: Text(
          titles[i],
          style: TextStyle(
            textBaseline: TextBaseline.alphabetic,
              fontSize: active ? activeFontSize : size,
              color: active ? activeColor : color,
              fontWeight: active ? this.activeFontWeight : this.unactiveFontWeight,
              ),
        ),
      ));
    }
    return new Container(
      padding: EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Row(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      ));
    
  }
}