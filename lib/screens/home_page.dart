import 'package:app_store/screens/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int initialIndex = 1;

  bool isIOS = false;

  PageController pageController = PageController();
  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return (isIOS)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 100,
                  title: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    Switch(
                        value: isIOS,
                        onChanged: (val) {
                          setState(() {
                            isIOS = val;
                          });
                        }),
                  ],
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                        text: "For You",
                      ),
                      Tab(
                        text: "Top Charts",
                      ),
                      Tab(
                        text: "Apps",
                      ),
                      Tab(
                        text: "Games",
                      ),
                    ],
                  ),
                  backgroundColor: Colors.white30,
                ),
                body: PageView(
                  controller: pageController,
                  onPageChanged: (i) {
                    setState(() {
                      tabController!.animateTo(i);
                    });
                  },
                  children: [
                    TabBarView(
                      controller: tabController,
                      children: [
                        ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: Global.games.map((e) {
                                      return Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 110,
                                              height: 110,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black12,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    "${e["image"]}",
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${e["name"]}",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "${e["ratting"]}",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: Global.apps.map((e) {
                                      return Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 110,
                                              height: 110,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black12,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    "${e["image"]}",
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${e["name"]}",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "${e["ratting"]}",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: Global.allApps.map((e) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            Global.topGame.length.toString(),
                                          ),
                                          Container(
                                            width: 85,
                                            height: 85,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  "${e["image"]}",
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${e["name"]}",
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                "${e["ratting"]}",
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                        ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: Global.apps.map((e) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            Global.apps.length.toString(),
                                          ),
                                          Container(
                                            width: 85,
                                            height: 85,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  "${e["image"]}",
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${e["name"]}",
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "${e["ratting"]}",
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                        ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: Global.games.map((e) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            Global.apps.length.toString(),
                                          ),
                                          Container(
                                            width: 85,
                                            height: 85,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  "${e["image"]}",
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${e["name"]}",
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "${e["ratting"]}",
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: initialIndex,
                  onTap: (val) {
                    setState(() {
                      initialIndex = val;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.videogame_asset_sharp,
                        color: Colors.black,
                      ),
                      label: "Games",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.grid_view_outlined,
                        color: Colors.black,
                      ),
                      label: "Apps",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.local_movies_outlined,
                        color: Colors.black,
                      ),
                      label: "Movies",
                    ),
                  ],
                ),
              ),
            ),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                backgroundColor: CupertinoColors.white,
                trailing: CupertinoSwitch(
                    activeColor: CupertinoColors.white,
                    thumbColor: CupertinoColors.activeBlue,
                    value: isIOS,
                    onChanged: (val) {
                      setState(() {
                        isIOS = val;
                      });
                    }),
              ),
              child: CupertinoTabScaffold(
                tabBar: CupertinoTabBar(
                  items: const [
                    BottomNavigationBarItem(
                      label: "Today",
                      icon: Icon(
                        CupertinoIcons.today,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Games",
                      icon: Icon(
                        CupertinoIcons.gamecontroller_fill,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Apps",
                      icon: Icon(
                        CupertinoIcons.app_fill,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Search",
                      icon: Icon(
                        CupertinoIcons.search,
                      ),
                    ),
                  ],
                ),
                tabBuilder: (context, i) {
                  return IndexedStack(
                    index: i,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Today",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "https://i.pinimg.com/736x/b5/15/33/b51533e74b734cf2cfb7d9609a631800.jpg",
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 15,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: Image(
                                image: AssetImage(
                                  "images/today images/todays images.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: Image(
                                image: AssetImage(
                                  "images/today images/today images2.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: Image(
                                image: AssetImage(
                                  "images/today images/today images3.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Today",
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      "https://i.pinimg.com/736x/b5/15/33/b51533e74b734cf2cfb7d9609a631800.jpg",
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "NEW GAME",
                                style: TextStyle(
                                  color: CupertinoColors.activeBlue,
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: Global.games.map((e) {
                                    return Container(
                                      padding: const EdgeInsets.all(10),
                                      width: 200,
                                      height: 250,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${e["name"]}",
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                "${e["ratting"]}",
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 200,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black12,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  "${e["image"]}",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Divider(),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "Discover AR Gaming",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                      Text(
                                        "See All",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CupertinoColors.activeBlue,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: Global.games.map((e) {
                                      return Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    "${e["image"]}",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${e["name"]}",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "${e["ratting"]}",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Today",
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      "https://i.pinimg.com/736x/b5/15/33/b51533e74b734cf2cfb7d9609a631800.jpg",
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "NEW GAME",
                                style: TextStyle(
                                  color: CupertinoColors.activeBlue,
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: Global.apps.map((e) {
                                    return Container(
                                      padding: const EdgeInsets.all(10),
                                      width: 200,
                                      height: 250,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${e["name"]}",
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                "${e["ratting"]}",
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Image(
                                            image: AssetImage(
                                              "${e["image"]}",
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Divider(),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "12 Great Apps for ios 12",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                      Text(
                                        "See All",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CupertinoColors.activeBlue,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: Global.apps.map((e) {
                                      return Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 90,
                                              height: 90,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    "${e["image"]}",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${e["name"]}",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "${e["ratting"]}",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: const Text(
                                                "GET",
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CupertinoTextField(
                          prefix: const Icon(
                            CupertinoIcons.search,
                            color: CupertinoColors.black,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
  }
}
