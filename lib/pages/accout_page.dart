import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/constant/story_json.dart';
import 'package:instagram_app/theme/colors.dart';

class AccoutPage extends StatefulWidget {
  @override
  _AccoutPageState createState() => _AccoutPageState();
}

class _AccoutPageState extends State<AccoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: black,
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: appBarColor,
      title: Row(children: [
        Text(name),
        SizedBox(
          width: 40,
          child: Icon(Icons.arrow_drop_down_outlined),
        ),
      ]),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(profile), fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                          child: Text(name,
                              style: TextStyle(color: white, fontSize: 17)))
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              Text("20",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 20, color: white)),
                              SizedBox(height: 10),
                              Text("Bài viết",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15, color: white)),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              Text("20",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 20, color: white)),
                              SizedBox(height: 10),
                              Text("Người theo dõi",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15, color: white)),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              Text("20",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 20, color: white)),
                              SizedBox(height: 10),
                              Text("Đang theo dõi",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15, color: white)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: white.withOpacity(0.5),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10),
              Container(
                width: size.width / 2 - 20,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: white.withOpacity(0.5))),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Center(
                    child: Text("Chỉnh sửa trang cá nhân",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15)),
                  ),
                ),
              ),
              Container(
                width: size.width / 2 - 20,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: white.withOpacity(0.5))),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Center(
                    child: Text("Số lần lưu",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15)),
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          SizedBox(height: 15),
          Text("data", style: TextStyle(color: white)),
          Text("data", style: TextStyle(color: white)),
          Text("data", style: TextStyle(color: white)),
          Text("data", style: TextStyle(color: white)),
        ],
      ),
    );
  }
}
