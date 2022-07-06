import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../AnimationScreen.dart';

class SharedAxisDemo extends StatefulWidget {
  SharedAxisDemo({Key? key}) : super(key: key);

  @override
  State<SharedAxisDemo> createState() => _SharedAxisDemoState();
}

class _SharedAxisDemoState extends State<SharedAxisDemo> {
  int _selectedIndex = 0;

  final List<Color> _colors = [Colors.white, Colors.red, Colors.yellow];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedAxis'),
      ),
      body: PageTransitionSwitcher(
        duration: const Duration(seconds: 1),
        // reverse: true,
        transitionBuilder: (
          Widget child,
          Animation<double> primaryAnimation,
          Animation<double> secondaryAnimation,
        ) {
          //we can use fadethrougtranslation also instaid of this..
          return SharedAxisTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.scaled,
            child: child,
            // fillColor: Colors.grey,
          );
        },
        
        child: Container(
            key: ValueKey<int>(_selectedIndex),
            color: _colors[_selectedIndex],
            child: const Center(
              child: FlutterLogo(size: 300),
            )),
      ),
      floatingActionButton: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        transitionDuration: const Duration(seconds: 1),
        closedElevation: 5,
        closedColor: Colors.blue,
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        closedBuilder: (closedBuilder, openWidget) {
          return FloatingActionButton(
            onPressed: openWidget,
            child: const Icon(Icons.add),
          );
        },
        openBuilder: (context, closeWidget) {
          return const DestinationScreen();
        },
        openColor: Colors.blue,
        // closedShape: ,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'White',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.business),
            label: 'Red',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Yellow',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

// return Scaffold(
//   appBar: AppBar(
//     title: const Text(' A N I M A T I O N S '),
//   ),
//   body: SafeArea(
//     child: Column(
//       children: <Widget>[
//         Expanded(
//           child: PageTransitionSwitcher(
//             transitionBuilder: (
//               Widget child,
//               Animation<double> primaryAnimation,
//               Animation<double> secondaryAnimation,
//             ) {
//               return SharedAxisTransition(
//                 animation: primaryAnimation,
//                 secondaryAnimation: secondaryAnimation,
//                 transitionType: SharedAxisTransitionType.horizontal,
//                 child: child,
//               );
//             },
//             child: isLoggedIn ? MyFirstScreen() : MySecondScreen(),
//           ),
//         )
//       ],
//     ),
//   ),
// );

// import 'package:animations/animations.dart';
// import 'package:flutter/material.dart';

// /// The demo page for [SharedAxisPageTransitionsBuilder].
// class SharedAxisTransitionDemo extends StatefulWidget {
//   /// Creates the demo page for [SharedAxisPageTransitionsBuilder].
//   const SharedAxisTransitionDemo({Key? key}) : super(key: key);

//   @override
//   _SharedAxisTransitionDemoState createState() {
//     return _SharedAxisTransitionDemoState();
//   }
// }

// class _SharedAxisTransitionDemoState extends State<SharedAxisTransitionDemo> {
//   SharedAxisTransitionType? _transitionType =
//       SharedAxisTransitionType.horizontal;
//   bool _isLoggedIn = false;

//   void _updateTransitionType(SharedAxisTransitionType? newType) {
//     setState(() {
//       _transitionType = newType;
//     });
//   }

//   void _toggleLoginStatus() {
//     setState(() {
//       _isLoggedIn = !_isLoggedIn;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(title: const Text('Shared axis')),
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: PageTransitionSwitcher(
//                 duration: const Duration(milliseconds: 300),
//                 reverse: !_isLoggedIn,
//                 transitionBuilder: (
//                   Widget child,
//                   Animation<double> animation,
//                   Animation<double> secondaryAnimation,
//                 ) {
//                   return SharedAxisTransition(
//                     child: child,
//                     animation: animation,
//                     secondaryAnimation: secondaryAnimation,
//                     transitionType: _transitionType!,
//                   );
//                 },
//                 child: _isLoggedIn ? _CoursePage() : _SignInPage(),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   TextButton(
//                     onPressed: _isLoggedIn ? _toggleLoginStatus : null,
//                     child: const Text('BACK'),
//                   ),
//                   ElevatedButton(
//                     onPressed: _isLoggedIn ? null : _toggleLoginStatus,
//                     child: const Text('NEXT'),
//                   ),
//                 ],
//               ),
//             ),
//             const Divider(thickness: 2.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Radio<SharedAxisTransitionType>(
//                   value: SharedAxisTransitionType.horizontal,
//                   groupValue: _transitionType,
//                   onChanged: (SharedAxisTransitionType? newValue) {
//                     _updateTransitionType(newValue);
//                   },
//                 ),
//                 const Text('X'),
//                 Radio<SharedAxisTransitionType>(
//                   value: SharedAxisTransitionType.vertical,
//                   groupValue: _transitionType,
//                   onChanged: (SharedAxisTransitionType? newValue) {
//                     _updateTransitionType(newValue);
//                   },
//                 ),
//                 const Text('Y'),
//                 Radio<SharedAxisTransitionType>(
//                   value: SharedAxisTransitionType.scaled,
//                   groupValue: _transitionType,
//                   onChanged: (SharedAxisTransitionType? newValue) {
//                     _updateTransitionType(newValue);
//                   },
//                 ),
//                 const Text('Z'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _CoursePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
//         Text(
//           'Streamling your courses',
//           style: Theme.of(context).textTheme.headline5,
//           textAlign: TextAlign.center,
//         ),
//         const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10.0),
//           child: Text(
//             'Bundled categories appear as groups in your feed. '
//             'You can always change this later.',
//             style: TextStyle(
//               fontSize: 12.0,
//               color: Colors.grey,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         const _CourseSwitch(course: 'Arts & Crafts'),
//         const _CourseSwitch(course: 'Business'),
//         const _CourseSwitch(course: 'Illustration'),
//         const _CourseSwitch(course: 'Design'),
//         const _CourseSwitch(course: 'Culinary'),
//       ],
//     );
//   }
// }

// class _CourseSwitch extends StatefulWidget {
//   const _CourseSwitch({
//     required this.course,
//   });

//   final String course;

//   @override
//   _CourseSwitchState createState() => _CourseSwitchState();
// }

// class _CourseSwitchState extends State<_CourseSwitch> {
//   bool _value = true;

//   @override
//   Widget build(BuildContext context) {
//     final String subtitle = _value ? 'Bundled' : 'Shown Individually';
//     return SwitchListTile(
//       title: Text(widget.course),
//       subtitle: Text(subtitle),
//       value: _value,
//       onChanged: (bool newValue) {
//         setState(() {
//           _value = newValue;
//         });
//       },
//     );
//   }
// }

// class _SignInPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         final double maxHeight = constraints.maxHeight;
//         return Column(
//           children: <Widget>[
//             Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 20)),
//             Image.asset(
//               'assets/avatar_logo.png',
//               width: 80,
//             ),
//             Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
//             Text(
//               'Hi David Park',
//               style: Theme.of(context).textTheme.headline5,
//             ),
//             Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
//             const Text(
//               'Sign in with your account',
//               style: TextStyle(
//                 fontSize: 12.0,
//                 color: Colors.grey,
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 const Padding(
//                   padding: EdgeInsets.only(
//                     top: 40.0,
//                     left: 15.0,
//                     right: 15.0,
//                     bottom: 10.0,
//                   ),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       suffixIcon: Icon(
//                         Icons.visibility,
//                         size: 20,
//                         color: Colors.black54,
//                       ),
//                       isDense: true,
//                       labelText: 'Email or phone number',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   child: TextButton(
//                     onPressed: () {},
//                     child: const Text('FORGOT EMAIL?'),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   child: TextButton(
//                     onPressed: () {},
//                     child: const Text('CREATE ACCOUNT'),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// import 'package:animations/animations.dart';

// import 'package:flutter/material.dart';

// class TestingSharedAxis extends StatefulWidget {
//   @override
//   _TestingSharedAxisState createState() => _TestingSharedAxisState();
// }
// class _TestingSharedAxisState extends State<TestingSharedAxis> {
//   bool _onFirstPage = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   ElevatedButton(
//                       onPressed: _onFirstPage == true
//                           ? null
//                           : () {
//                               setState(() {
//                                 _onFirstPage = true;
//                               });
//                             },
//                       child: Text(
//                         "First Page",
//                         style: TextStyle(
//                             color: _onFirstPage == true
//                                 ? Colors.blue.withOpacity(0.5)
//                                 : Colors.blue),
//                       )),
//                   ElevatedButton(
//                       onPressed: _onFirstPage == false
//                           ? null
//                           : () {
//                               setState(() {
//                                 _onFirstPage = false;
//                               });
//                             },
//                       child: Text(
//                         "Second Page",
//                         style: TextStyle(
//                             color: _onFirstPage == false
//                                 ? Colors.red.withOpacity(0.5)
//                                 : Colors.red),
//                       ))
//                 ],
//               ),
//             ),
//             Expanded(
//               child: PageTransitionSwitcher(
//                 duration: const Duration(milliseconds: 300),
//                 reverse: !_onFirstPage,
//                 transitionBuilder: (Widget child, Animation<double> animation,
//                     Animation<double> secondaryAnimation) {
//                   return SharedAxisTransition(
//                     child: child,
//                     animation: animation,
//                     secondaryAnimation: secondaryAnimation,
//                     transitionType: SharedAxisTransitionType.horizontal,
//                   );
//                 },
//                 child: _onFirstPage
//                     ? Container(
//                         key: UniqueKey(),
//                         color: Colors.blue,
//                         child: Align(
//                           alignment: Alignment.topCenter,
//                           child: Text("FIRST PAGE"),
//                         ),
//                       )
//                     : Container(
//                         key: UniqueKey(),
//                         color: Colors.red,
//                         child: Align(
//                           alignment: Alignment.topCenter,
//                           child: Text("SECOND PAGE"),
//                         ),
//                       ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
