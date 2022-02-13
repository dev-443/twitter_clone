import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/views/timeline/timeline_controller.dart';

class Timeline extends ConsumerWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _controller = ref.watch(timelineControllerProvider);
    final users = _controller.users;

    return Scaffold(
        appBar: AppBar(
          title: const Text('タイムライン'),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: ((context, index) => TweetTile(
                name: users[index].name,
                color: users[index].color,
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(timelineControllerProvider).addHousei();
          },
          child: const Icon(Icons.add),
        ));
  }
}

class TweetTile extends StatelessWidget {
  const TweetTile({
    Key? key,
    required this.name,
    required this.color,
  }) : super(key: key);
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 0.6,
        ),
      )),
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'ツイートの内容です。ツイートの内容です。ツイートの内容です。ツイートの内容です。',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
