import 'package:flutter/material.dart';
import 'package:goorm/mentor/home.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  radius: 20, // 반지름 크기
                  backgroundColor: Colors.grey, // 배경색
                  child: Icon(Icons.person,
                      size: 30,
                      color: Colors.white), // 프로필 아이콘
                ),
              ),
              Container(child: Text("홍길동"),),
              Container(child: Text("애월의 아름다운 해변가에서 \n 카페를 운영하고 있는 홍길동 이라고 합니다."),)

            ],
          ),
        ),
        Container(
          child: Column(children: const [
            Text("대표 서비스"),
            Text("카페&베이커리")
          ],),
        ),
        Container(child: Column(children: const [
          Text("활동 지역"),
          Text("애월")
        ],),),

      ],
    );
  }
}


class ProfileFix extends StatefulWidget {
  const ProfileFix({Key? key}) : super(key: key);

  @override
  State<ProfileFix> createState() => _ProfileFixState();
}

class _ProfileFixState extends State<ProfileFix> {
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
          profileFixTitle,
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
              child: Text("다음으로"))
        ],
      ),
    );
  }
}

var profileFixTitle = Column(
  children: [
    Container(
      child: const Text("프로필을 수정하고 싶군요!"),
    ),
    Container(
      child: const Text("어떤일로"),
    ),
    Container(
      child: const Text("바꿔 드릴까요?"),
    )
  ],
);

