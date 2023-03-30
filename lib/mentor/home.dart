// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import '../firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:goorm/mentor/help.dart';
import 'package:goorm/mentor/profile.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

// WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('Handling a background message ${message.messageId}');
// }
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<bool> _isSelected = [false, false, false, false, false, false, false];
  List<Widget> job = [
    Text('농사'),
    Text('어업'),
    Text('카페&베이커리'),
    Text('게스트하우스'),
    Text('식당'),
    Text('편집샵'),
    Text('프리랜서')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          homeTitle,
          Column(
            children: List<Widget>.generate(
              7,
              (int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: ToggleButtons(
                    isSelected: [_isSelected[index]],
                    onPressed: (int newIndex) {
                      setState(() {
                        _isSelected[index] = true;
                        for (int i = 0; i < 7; i++) {
                          if (i != index) {
                            _isSelected[i] = false;
                          }
                        }
                      });

                      print(index);
                    },
                    children: [job[index]],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (c) => Region()));
              },
              child: Text("시작하기"))
        ],
      ),
    );
  }
}

var homeTitle = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      margin: EdgeInsets.fromLTRB(20.0, 36.0, 226.0, 9.0),
      child: const Text("제주선배이시군요!"),
    ),
    Container(
      margin: EdgeInsets.fromLTRB(20.0, 0.0, 173.0, 33.0),
      child: const Text("어떤일을\n하고 계신가요?"),
    ),
  ],
);

class Region extends StatelessWidget {
  const Region({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 36.0, 109.0, 66.0),
            child: Text("제주의 어느 지역에서\n활동하시나요?",
              style: TextStyle(
                color: Color(0xFF1A1A1B),
                fontSize: 28,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0.0, 20.0, 0.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: '예) 애월',
                border: OutlineInputBorder(),
              ),
              onChanged: (String value) {
                print('현재 입력된 값: $value');
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 400, 20.0, 20.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => Bottle()));
                },
                child: Text("시작하기")),
          )
        ],
      ),
    );
  }
}


class Bottle extends StatefulWidget {
  const Bottle({Key? key}) : super(key: key);

  @override
  State<Bottle> createState() => _BottleState();
}

class _BottleState extends State<Bottle> {
  bool selected = false;
  int _selectedIndex = 0;
  var tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: [
        AppBar(title: Text("도움을 기다리는 후배")),
        AppBar(
          title: Text("홍길동 선배"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => ProfileFix()));
                },
                icon: Icon(Icons.add_box_outlined),
                iconSize: 30)
          ],
        ),
        AppBar(title: Text("후배와의 채팅"))
      ][tab],
      body: [HelpHome(), Profile(), Profile()][tab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (i) {
          print(i);
          setState(() {
            tab = i;
            _selectedIndex = i;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: '도와줘요'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: '프로필'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: '채팅하기')
        ],
      ),
    );
  }
}
