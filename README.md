# flashy_tab_bar
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/Cuberto/flashy-tabbar-android/master/LICENSE)

One another nice animated tabbar (Inspired by Cuberto)

![Animation](https://raw.githubusercontent.com/leesnhyun/flashy_tab_bar/master/docs/animation.gif)

## Preview
| Android              | iOS                  |
| :------------------- | -------------------: |
| ![Android](https://raw.githubusercontent.com/leesnhyun/flashy_tab_bar/master/docs/emulator-android.gif)  | ![iOS](https://raw.githubusercontent.com/leesnhyun/flashy_tab_bar/master/docs/emulator-ios.gif) |


## Getting Started

Add the dependency at pubspec.yaml:

```yaml
dependencies:
  ...
  flashy_tab_bar: ^0.0.1
```

## Basic Usage

```dart
bottomNavigationBar: FlashyTabBar(
     selectedIndex: _selectedIndex,
     showElevation: true,
     onItemSelected: (index) => setState(() {
       _selectedIndex = index;
     }),
     items: [
       FlashyTabBarItem(
           icon: Icon(Icons.event),
       title: Text('Events'),
       ),
       FlashyTabBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
        ),
        FlashyTabBarItem(
          icon: Icon(Icons.highlight),
          title: Text('Highlights'),
        ),
        FlashyTabBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
        ),
        FlashyTabBarItem(
          icon: Icon(Icons.settings),
          title: Text('한국어'),
        ),
      ],
),
```
