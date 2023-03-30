// import 'package:flutter/material.dart';
// import 'package:goorm/mentee/sea_bottle_screen.dart';
// import 'package:goorm/mentor/mentor_sea_bottle_screen.dart';
//
// class HelpHome extends StatefulWidget {
//   const HelpHome({Key? key}) : super(key: key);
//
//   @override
//   State<HelpHome> createState() => _HelpHomeState();
// }
//
// class _HelpHomeState extends State<HelpHome> {
//   @override
//   Widget build(BuildContext context) {
//     return SeaBottleScreen();
//   }
// }
//
//
// class Help extends StatefulWidget {
//   @override
//   _HelpState createState() => _HelpState();
// }
//
// class _HelpState extends State<Help> {
//   late int _selectedItemIndex;
//
//   final List<String> _items = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//     'Item 6',
//     'Item 7',
//     'Item 8',
//     'Item 9',
//     'Item 10',
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedItemIndex = -1; // 초기값을 -1로 지정
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(),
//     body: ListView.builder(
//       itemCount: _items.length,
//       itemBuilder: (BuildContext context, int index) {
//         return InkWell(
//           onTap: () {
//             setState(() {
//               _selectedItemIndex = index;
//             });
//           },
//           child: Container(
//             height: _selectedItemIndex == index ? 100.0 : 50.0,
//             color: _selectedItemIndex == index ? Colors.blue : Colors.grey,
//             child: Center(
//               child: _selectedItemIndex == index
//                   ? ElevatedButton(
//                 child: Text('후배에게 도움보내기'),
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (c) => Message()));
//                 },
//               )
//                   : Text(
//                 _items[index],
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20.0,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     ));
//   }
// }
//
// class Message extends StatefulWidget {
//   const Message({Key? key}) : super(key: key);
//
//   @override
//   State<Message> createState() => _MessageState();
// }
//
// class _MessageState extends State<Message> {
//
//   final TextEditingController _controller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           Container(
//             child: Text("조언을 적어보세요."),
//           ),
//           Container(
//             child: Column(
//               children: [
//                 Text("홍길동"),
//                 Text("20.2.2"),
//                 Container(
//                     width: 150,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Flexible(
//                             child: RichText(
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 5,
//                               strutStyle: StrutStyle(fontSize: 16.0),
//                               text: TextSpan(
//                                   text:
//                                   '세계문자 가운데 한글,즉 훈민정음은 흔히들 신비로운 문자라 부르곤 합니다. 그것은 세계 문자 가운데 유일하게 한글만이 그것을 만든 사람과 반포일을 알며, 글자를 만든 원리까지 알기 때문입니다. 세계에 이런 문자는 없습니다. 그래서 한글은, 정확히 말해 [훈민정음 해례본](국보 70호)은 진즉에 유네스코 세계기록유산으로 등재되었습니다. ‘한글’이라는 이름은 1910년대 초에 주시경 선생을 비롯한 한글학자들이 쓰기 시작한 것입니다. 여기서 ‘한’이란 크다는 것을 뜻하니, 한글은 ‘큰 글’을 말한다고 하겠습니다.[네이버 지식백과] 한글 - 세상에서 가장 신비한 문자 (위대한 문화유산, 최준식)',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       height: 1.4,
//                                       fontSize: 16.0,
//                                       fontFamily: 'NanumSquareRegular')),
//                             )),
//                       ],
//                     )
//                 )
//               ],
//             ),
//           ),
//           Container(
//               child: TextFormField(
//                 controller: _controller,
//                 maxLines: null, // 여러 줄 입력 가능하도록 설정
//                 decoration: InputDecoration(
//                   hintText: '후배에게 하고싶은 말을 조언하세요',
//                   alignLabelWithHint: true,
//                   border: OutlineInputBorder(),
//                   contentPadding: EdgeInsets.only(
//                     left: 16.0,
//                     right: 16.0,
//                     top: 24.0,
//                     bottom: 100.0,
//                   ),
//                 ),
//                 textInputAction: TextInputAction.newline, // 엔터 키 누를 때 줄 바꿈
//               ),
//           ),
//           ElevatedButton(onPressed:() {
//             Navigator.pop(context);
//             Navigator.pop(context);
//           }, child: Text("전달하기"))
//         ],
//       ),
//     );
//   }
// }
