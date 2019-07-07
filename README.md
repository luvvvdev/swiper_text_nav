### Navigation text bar for Swiper
![Preview](https://github.com/babyhell/swiper_text_nav/blob/master/preview.jpg)

### Example

```dart
class Library extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LibraryState();
  }
}

class LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 40, 49, 1.0),
      body: Container(
          padding: EdgeInsets.only(top: 30),
          child: Stack(
            children: <Widget>[
              Container(
                child: Swiper.children(
                  autoplay: false,
                  loop: false,
                  pagination:
                      PaginationTab(titles: ['Movies', 'Series', 'Cartoons']),
                  children: <Widget>[
                    Movies(),
                    Series(),
                    Cartoons(),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
```
