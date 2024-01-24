import 'package:flutter/material.dart';

import 'package:machine_task/controller/homepage_controller.dart';
import 'package:machine_task/views/view_screen.dart';
import 'package:machine_task/widgets/catwidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final obj = Provider.of<HomePageController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: const Row(
          children: [
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundImage: AssetImage("assets/dp.png"),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CatWidgets(
                title: "Trending",
                color: Colors.orange,
              ),
              CatWidgets(
                title: "Relationship",
                color: Colors.grey,
              ),
              CatWidgets(
                title: "SelfCare",
                color: Colors.grey,
              )
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: obj.loadPosts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        surfaceTintColor: Colors.white,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ViewScreen(
                                    title: snapshot.data![index]['title'],
                                    post: snapshot.data![index]['body']);
                              },
                            ));
                          },
                          subtitle: const Row(
                            children: [
                              Icon(
                                Icons.thumb_up,
                                color: Colors.orange,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text("2"),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(
                                Icons.comment,
                                color: Colors.grey,
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              Icon(
                                Icons.share,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          leading: const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/profile.png")),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data![index]['body']),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Text("No data");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
