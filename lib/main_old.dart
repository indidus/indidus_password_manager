import 'package:flutter/material.dart';
import 'package:indidus_password_manager/src/rust/api/simple.dart';
import 'package:indidus_password_manager/src/rust/frb_generated.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('flutter_rust_bridge quickstart'),
        //   actions: const [
        //     Icon(Icons.settings),
        //     Icon(Icons.settings),
        //   ],
        // ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('Logins'),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: SizedBox(
                  height: 48,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // flexibleSpace: const Padding(
              //   padding: EdgeInsets.only(top: 100.0),
              //   child: Text('Hello World'),
              // ),
              expandedHeight: 180,
              pinned: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings_accessibility),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings),
                  ),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                  Text(
                    'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                  ),
                ],
              ),
            ),
          ],
        ),
        //    Text(
        //       'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`'),
        // ),
      ),
    );
  }
}
