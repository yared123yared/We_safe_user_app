import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.grey),
            backgroundColor: Colors.white,
            title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.grey,size: 20,),
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.grey,size: 20,),
                    onPressed: (){},
                  ),
                ],
              ),
            ],
          ),
            bottom: TabBar(
              labelColor: Colors.grey,
              tabs: [
                Tab( text: "All"),
                Tab( text: "Latest"),
                Tab( text: "Local"),
                Tab( text: "Breaking")
              ],
            ),
          ),
          endDrawer: Drawer(
            backgroundColor: Colors.grey,

            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      UserAccountsDrawerHeader(
                        // decoration: BoxDecoration(
                        //     color: myCustomColors.loginBackgroud),
                        accountName: FutureBuilder<SharedPreferences>(
                            future: SharedPreferences.getInstance(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.none &&
                                  snapshot.hasData == null) {
                                return Container(
                                    height: 10,
                                    child: Center(
                                        child:
                                        CircularProgressIndicator()));
                              }
                              print(
                                  'project snapshot data is: ${snapshot.data}');
                              if (snapshot.data == null) {
                                return Container(
                                    height: 10,
                                    child: Center(
                                        child:
                                        CircularProgressIndicator()));
                              } else {
                                return snapshot.data!.getString('first_name') ==
                                    null
                                    ? Text(
                                  "User Name",
                                )
                                    : Text(snapshot.data!
                                    .getString('first_name')!);
                              }
                            }),
                        accountEmail: FutureBuilder<SharedPreferences>(
                            future: SharedPreferences.getInstance(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.none &&
                                  snapshot.hasData == null) {
                                return Container(
                                    height: 10,
                                    child: Center(
                                        child:
                                        CircularProgressIndicator()));
                              }
                              print(
                                  'project snapshot data is: ${snapshot.data}');
                              if (snapshot.data == null) {
                                return Container(
                                    height: 10,
                                    child: Center(
                                        child:
                                        CircularProgressIndicator()));
                              } else {
                                return snapshot.data!
                                    .getString('email') ==
                                    null
                                    ? Text(
                                  "9484alen@gmail.com",
                                )
                                    : Text(snapshot.data!
                                    .getString('email')!);
                              }
                            }),
                        currentAccountPicture: FutureBuilder<SharedPreferences>(
                            future: SharedPreferences.getInstance(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.none &&
                                  snapshot.hasData == null) {
                                return Container(
                                    height: 10,
                                    child: Center(
                                        child:
                                        CircularProgressIndicator()));
                              }
                              print(
                                  'project snapshot data is: ${snapshot.data}');
                              if (snapshot.data == null) {
                                return Container(
                                    height: 10,
                                    child: Center(
                                        child:
                                        CircularProgressIndicator()));
                              } else {
                                return snapshot.data!
                                    .getString('image') ==
                                    null || snapshot.data!
                                    .getString('image') ==
                                    ""
                                    ? CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                      'assets/images/app_logo.png'),
                                )
                                    : CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(snapshot.data!
                                      .getString('image')!),
                                );
                              }
                            }),
                      ),
                      ListTile(
                        title: Text("Language"),
                      ),
                      ListTile(
                        title: Text("Settings"),
                      ),
                      ListTile(
                        title: Text("Forum"),
                      ),
                      ListTile(
                        title: Text("Report"),
                      )
                    ],
                  ),
                ),
                Divider(),
                ElevatedButton(onPressed: (){}, child: Text("Log Out"))
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FirstScreen(),
              FirstScreen(),
              FirstScreen(),
              FirstScreen(),
            ],
          ),
        ),
      ),
    );
  }

  Widget FirstScreen(){
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width*0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: Image.asset(
                  "assets/images/deer.png",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width*0.4,
                  fit: BoxFit.fill,
                ),
              ),
                Container(
                  height: MediaQuery.of(context).size.width*0.5,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing"
                            " elit. Morbi mollis ornare orci. Maecenas nec"
                            " orci non sem aliquam rutrum in in ipsum.",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10, bottom: 10),
              child: Text('Recent News', textAlign: TextAlign.start, style: TextStyle(
                fontWeight: FontWeight.w600
              ),),
            ),
            Cards(),
            Cards(),
            Cards(),
          ],
        ),
      ),
    );
  }

  Widget Cards(){
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.25,
            height: 70,
            child: Image.asset(
              "assets/images/deer.png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width*0.4,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.7,
            height: 70,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Lorem ipsum", textScaleFactor: 1.1,maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.heart_broken), padding: EdgeInsets.all(0), constraints: BoxConstraints(),color: Colors.red,)
                  ],
                ),
                Text("Lorem ipsum dolor sit amet, amet consectetur adipiscing"
                    " elit. Morbi mollis ornare orci. Maecenas nec", maxLines: 2,style: TextStyle(
                  color: Colors.black45, fontSize: 12
                ), textAlign: TextAlign.justify,),
                Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  child: Text("Dec 21, 2022", maxLines: 1,style: TextStyle(
                      color: Colors.black45, fontSize: 12
                  ), textAlign: TextAlign.right,),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
  Widget SecondScreen(){
    return Container(
      child: Center(
        child: Text('It is a second layout tab, which is responsible for taking pictures from your mobile.',
          style: TextStyle(fontSize: 35.0),
        ),
      ),
    );
  }
}
