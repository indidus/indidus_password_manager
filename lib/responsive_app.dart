import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indidus_password_manager/components/text_field/text_field_widget.dart';
import 'package:indidus_password_manager/providers/note_provider.dart';
import 'package:indidus_password_manager/src/lib/utils.dart';
import 'package:indidus_password_manager/src/rust/models/notes.dart';
import 'package:responsive_builder/responsive_builder.dart';

// Wrap your app with providers
class RiverpodApp extends StatelessWidget {
  const RiverpodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MyResponsiveApp(),
    );
  }
}

class MyResponsiveApp extends StatefulWidget {
  const MyResponsiveApp({super.key});

  @override
  State<MyResponsiveApp> createState() => _MyResponsiveAppState();
}

class _MyResponsiveAppState extends State<MyResponsiveApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Indidus Password Manager',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout.builder(
        breakpoints: const ScreenBreakpoints(
          desktop: 1200,
          tablet: 650,
          watch: 300,
        ),
        mobile: (mobileContext) => const Mobile(),
        tablet: (mobileContext) => const Tablet(),
        // Currently we will only support mobile and tablet, but we will use tablet as desktop for now
        desktop: (mobileContext) => const Tablet(),
      ),
    );
  }
}

class Tablet extends StatefulWidget {
  const Tablet({super.key});

  @override
  State<Tablet> createState() => _TabletState();
}

class _TabletState extends State<Tablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: const Row(
        children: [
          AppNavigationRail(),
          Expanded(
            flex: 6,
            child: AllNotes(),
          ),
          Expanded(
            flex: 11,
            child: NoteView(),
          ),
        ],
      ),
    );
  }
}

class AppNavigationRail extends StatefulWidget {
  const AppNavigationRail({
    super.key,
  });

  @override
  State<AppNavigationRail> createState() => _AppNavigationRailState();
}

class _AppNavigationRailState extends State<AppNavigationRail> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      // extended: MediaQuery.of(context).size.width > 1000.0 ? true : false,
      // labelType: MediaQuery.of(context).size.width > 1000.0
      //     ? NavigationRailLabelType.none
      //     : NavigationRailLabelType.all,
      // leading: const Icon(Icons.menu),
      leading: const Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://cdn-icons-png.flaticon.com/512/147/147144.png',
            ),
          ),
          SizedBox(
            height: 24,
          )
        ],
      ),
      labelType: NavigationRailLabelType.all,
      groupAlignment: -1,
      useIndicator: true,
      destinations: const <NavigationRailDestination>[
        // navigation destinations
        NavigationRailDestination(
          icon: Icon(Icons.favorite_border),
          selectedIcon: Icon(Icons.favorite),
          label: Text('Wishlist'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person_outline_rounded),
          selectedIcon: Icon(Icons.person),
          label: Text('Account'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.shopping_cart_outlined),
          selectedIcon: Icon(Icons.shopping_cart),
          label: Text('Cart'),
        ),
      ],
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}

class Mobile extends StatefulWidget {
  const Mobile({super.key});

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  @override
  Widget build(BuildContext context) {
    // Add a bottom navigation bar to the screen

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, _) => [
          SliverAppBar.large(
            pinned: true,
            floating: false,
            automaticallyImplyLeading: false,
            title: const Text('Notes'),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () async {},
                icon: const Icon(
                  Icons.search,
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0.0,
          )
        ],
        body: const Center(
          child: AllNotes(),
        ),
      ),
    );
  }
}

class AllNotes extends ConsumerWidget {
  const AllNotes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    final AsyncValue<List<Note>> notes = ref.watch(getAllNotesProvider);
    return notes.when(
      data: (data) {
        var id = ref.watch(viewNoteProvider);
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              tileColor:
                  deviceType != DeviceScreenType.mobile && id == data[index].id
                      ? Colors.blue
                      : null,
              title: Text(data[index].name),
              subtitle: Text(data[index].note ?? ""),
              onTap: () async {
                ref.read(viewNoteProvider.notifier).set(data[index].id);
              },
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text(error.toString())),
    );
  }
}

class NoteView extends ConsumerWidget {
  // final String id;
  const NoteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(viewNoteProvider);
    final AsyncValue<Note?> note = ref.watch(selectNoteProvider(id));
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ModalBottomSheetHeaderText(level: "View Note"),
          const Divider(),
          Expanded(
            child: note.when(
              data: (data) => SingleChildScrollView(
                child: data == null
                    ? Container()
                    : Column(
                        children: [
                          TextFieldWidget(
                            fieldName: 'Name',
                            fieldValue: data.name,
                            isThreeLine: true,
                          ),
                          TextFieldWidget(
                            fieldName: 'Note',
                            fieldValue: data.note,
                            isThreeLine: true,
                          )
                        ],
                      ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stack) => Center(
                child: Text(error.toString()),
              ),
            ),
          ),
          const Divider(),
          Container(
            padding: getModalBottomSheetFooterPadding(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => {},
                  child: const Text("edit"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreateNote extends ConsumerWidget {
  const CreateNote({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text("Create Note"),
    );
  }
}
