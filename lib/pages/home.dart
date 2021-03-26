import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_app/constant/post_json.dart';
import 'package:instagram_app/constant/story_json.dart';
import 'package:instagram_app/theme/colors.dart';
import 'package:instagram_app/widget/story_iem.dart';
import '../screens/personal_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/images/camera_icon.svg",
            width: 30,
          ),
          Text(
            "Instagram",
            style: TextStyle(fontFamily: 'Billabong', fontSize: 35),
          ),
          SvgPicture.asset(
            "assets/images/message_icon.svg",
            width: 30,
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Column(
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          child: Stack(
                            children: [
                              Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(profile),
                                        fit: BoxFit.cover)),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 19,
                                  height: 19,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: white,
                                  ),
                                  child: Icon(
                                    Icons.add_circle,
                                    color: buttonFollowColor,
                                    size: 19,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 70,
                          child: Center(
                            child: Text(name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: white,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: List.generate(
                          stories.length,
                          (index) => StoryItem(
                            img: stories[index]["img"],
                            name: stories[index]["name"],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: white.withOpacity(0.5),
            ),
            Column(
              children: List.generate(
                  posts.length,
                  (index) => PostItem(
                        name: posts[index]["name"],
                        profileImg: posts[index]["profileImg"],
                        postImg: posts[index]["postImg"],
                        caption: posts[index]["caption"],
                        isLoved: posts[index]["isLoved"],
                        commentCount: posts[index]["commentCount"],
                        likedBy: posts[index]["likedBy"],
                        timeAgo: posts[index]["timeAgo"],
                      )),
            ),
          ],
        ),
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final String name;
  final String profileImg;
  final String postImg;
  final String caption;
  final isLoved;
  final String commentCount;
  final String likedBy;
  final String timeAgo;

  const PostItem(
      {Key key,
      this.name,
      this.profileImg,
      this.postImg,
      this.caption,
      this.commentCount,
      this.isLoved,
      this.likedBy,
      this.timeAgo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PersonalPage(
                              namePersonal: name,
                              profileImg: profileImg,
                            )),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          image: DecorationImage(
                              image: NetworkImage(profileImg),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        name,
                        style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "...",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, color: white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          // width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(postImg), fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5, left: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 55,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        isLoved
                            ? "assets/images/loved_icon.svg"
                            : "assets/images/love_icon.svg",
                        width: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 55,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/images/comment_icon.svg",
                        width: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 55,
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/images/message_icon.svg",
                        width: 30,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 55,
                child: InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    "assets/images/save_icon.svg",
                    width: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "Like by ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: "$likedBy",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: " and outher",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ])),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "$name",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: "$caption",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ])),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "View $commentCount comments",
              style: TextStyle(fontSize: 15, color: white.withOpacity(0.5)),
            ),
          ])),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(profile), fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Thêm bình luận...",
                        style: TextStyle(
                            fontSize: 15, color: white.withOpacity(0.5)),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "😍",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "🤩",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.add_circle,
                      color: white.withOpacity(0.5),
                      size: 18,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [
              Text(
                "$timeAgo",
                style: TextStyle(
                  color: white.withOpacity(0.5),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
