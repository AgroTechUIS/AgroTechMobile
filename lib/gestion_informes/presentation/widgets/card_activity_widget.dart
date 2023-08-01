import 'package:agrotech/config/colors_theme.dart';
import 'package:flutter/material.dart';

class CardActivityWidget extends StatelessWidget {
  const CardActivityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
      child: Card(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: 100.0,
              height: 100.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://img.freepik.com/free-photo/vertical-shot-orange-fruit-tree_181624-12354.jpg?size=626&ext=jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Labranza',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: colors.green),
                    ),
                    const Text(
                      'Personal asignado:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Carlos Andres barrera',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    const Text(
                      'Carlos Andres barrera',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    const Text(
                      'Carlos Andres barrera',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    const Text(
                      'Carlos Andres barrera',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    const Text(
                      'Carlos Andres barrera',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    const Text(
                      'Carlos Andres barrera',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    const Text(
                      'Carlos Andres barrera',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    const Text(
                      'Plazo:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '7/07/2023 - 8/07/2023',
                      style: TextStyle(
                        fontSize: 16.0,
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
