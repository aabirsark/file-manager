import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i/app/contansts.dart';
import 'package:i/meta/preview.page.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.more,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.search_normal,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.setting,
                color: Colors.black,
              )),
        ],
      ),
      body: Stack(
        children: [
          const HomeWidget(),
          FadeInUpBig(child: const RecentsSheet())
        ],
      ),
    );
  }
}

class RecentsSheet extends StatelessWidget {
  const RecentsSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: .2,
      minChildSize: .2,
      maxChildSize: 1,
      builder: (context, scrollController) => Container(
        padding: const EdgeInsets.only(top: 12.0, left: 10.0, right: 10.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const DraggableBar(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Recents",
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  children: const [
                    RecentSubjects(
                      iconData: CupertinoIcons.down_arrow,
                      label: "Downloads",
                      recentPath: "assets/recents/image.jpeg",
                    ),
                    RecentSubjects(
                      iconData: Iconsax.cloud,
                      label: "Cloud Store",
                      recentPath: "assets/recents/image2.jpg",
                    ),
                    RecentSubjects(
                      iconData: Iconsax.home,
                      label: "Home",
                      recentPath: "assets/recents/image3.jpeg",
                    ),
                    RecentSubjects(
                      iconData: Iconsax.trash,
                      label: "Trash",
                      recentPath: "assets/recents/image4.jpeg",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RecentSubjects extends StatelessWidget {
  const RecentSubjects(
      {Key? key,
      required this.iconData,
      required this.label,
      required this.recentPath})
      : super(key: key);

  final IconData iconData;
  final String label;
  final String recentPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: Center(
                  child: Icon(
                    iconData,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                label,
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewPage(path: recentPath),
                    ));
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade100,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Hero(
                        tag: recentPath,
                        child: Image.asset(
                          recentPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text("Last activity at today 18:27"),
                    const SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DraggableBar extends StatelessWidget {
  const DraggableBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 60,
      decoration:
          const ShapeDecoration(shape: StadiumBorder(), color: Colors.grey),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            ZoomIn(child: const Header()),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: const [
                  Text(
                    "Quick Access",
                  ),
                  Spacer(),
                  Text(
                    "See all",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            const QuikAccessButton(),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: const [
                  Text(
                    "Storage Medium",
                  ),
                  Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 15),
            FadeInUp(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                ),
                child: const StorageMediumCardItems(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            )
          ],
        ),
      ),
    );
  }
}

class StorageMediumCardItems extends StatelessWidget {
  const StorageMediumCardItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Iconsax.mobile,
            color: Colors.blue,
          ),
          title: const Text(
            "Internal Storage",
            style: TextStyle(color: Colors.white),
          ),
          trailing: Text(
            "10GB free of 64GB",
            style: TextStyle(color: Colors.grey.shade400, fontSize: 10),
          ),
        ),
        const Divider(
          color: Colors.white12,
        ),
        ListTile(
          leading: const Icon(
            Iconsax.driver,
            color: Colors.redAccent,
          ),
          title: const Text(
            "OTG",
            style: TextStyle(color: Colors.white),
          ),
          trailing: Text(
            "10GB free of 64GB",
            style: TextStyle(color: Colors.grey.shade400, fontSize: 10),
          ),
        ),
      ],
    );
  }
}

class QuikAccessButton extends StatelessWidget {
  const QuikAccessButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 30,
      spacing: 30,
      children: iconPaths
          .map((e) => ZoomIn(
                duration: const Duration(milliseconds: 1200),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Icon(
                      e,
                      color: Colors.white,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      // height: MediaQuery.of(context).size.height * .15,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: buttonColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Iconsax.mobile,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Internal Storage",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                height: 5,
                width: MediaQuery.of(context).size.width * 0.65,
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  color: scaffoldColor,
                ),
              ),
              const Spacer(),
              const Text(
                "85%",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Text(
            "10GB(s) free of 64GB(s)",
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          )
        ],
      ),
    );
  }
}

List iconPaths = [
  Iconsax.cloud,
  Iconsax.home,
  Iconsax.document_download,
  Iconsax.document,
  Iconsax.music,
  Iconsax.play,
  Iconsax.bookmark,
  Iconsax.trash
];
