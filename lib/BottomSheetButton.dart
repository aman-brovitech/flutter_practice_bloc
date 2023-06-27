// ignore: file_names
import 'package:flutter/material.dart';

class BottomSheetButton extends StatefulWidget {
  const BottomSheetButton({Key? key}) : super(key: key);
  @override
  State<BottomSheetButton> createState() => _BottomSheetButtonState();
}

class _BottomSheetButtonState extends State<BottomSheetButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Sheet'),
      ),
      body: Builder(
        builder: (context) => Center(
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext mContext) {
                  return Container(
                    child: Wrap(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.home),
                          title: TextButton(
                            onPressed: () {},
                            child: const Text('Home'),
                          ),
                        ),
                        const ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Settings'),
                        ),
                        const ListTile(
                          leading: Icon(Icons.logout),
                          title: Text('Logout'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Text('BottomSheet'),
          ),
        ),
      ),
    );
  }
}
