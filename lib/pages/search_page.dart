import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/constant/search_json.dart';
import 'package:instagram_app/theme/colors.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(children: [
          Row(
            children: [
              SizedBox(width: 15),
              Container(
                width: size.width - 30,
                height: 50,
                decoration: BoxDecoration(
                    color: textFieldBackground,
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: white.withOpacity(0.5),
                      )),
                  style: TextStyle(
                    color: white.withOpacity(0.3),
                    fontSize: 20,
                  ),
                  cursorColor: white.withOpacity(0.5),
                ),
              ),
              SizedBox(width: 15),
            ],
          ),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  searchCategories.length,
                  (index) => PopularItem(
                        name: searchCategories[index],
                      )),
            ),
          ),
          SizedBox(height: 20),
          Wrap(
              spacing: 1,
              runSpacing: 1,
              children: List.generate(
                searchImages.length,
                (index) => SearchImage(
                  img: searchImages[index],
                ),
              )),
        ]),
      ),
    );
  }
}

class SearchImage extends StatelessWidget {
  final String img;
  const SearchImage({Key key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: (size.width - 3) / 3,
      height: (size.width - 3) / 3,
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover)),
    );
  }
}

class PopularItem extends StatelessWidget {
  final name;
  const PopularItem({
    Key key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: white.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
          child: Text(
            name,
            style: TextStyle(
                color: white, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
