import 'package:flutter/material.dart';

class DeviceSection extends StatelessWidget {
  const DeviceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 14.0,
                ),
                const Text(
                  'Living Room',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  color: Colors.black54,
                  icon: const Icon(Icons.more_vert),
                )
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: GridView.count(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
                  crossAxisCount: 3,
                  children: [
                    GridTile(
                      child: Container(
                        color: Colors.indigo,
                      ),
                    ),
                    GridTile(
                      child: Container(
                        color: Colors.amber,
                      ),
                    ),
                    GridTile(
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                    GridTile(
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                    GridTile(
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                    GridTile(
                      child: Container(
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
