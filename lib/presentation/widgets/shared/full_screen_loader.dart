import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Cargando peliculas',
      'Comprando palomitas de maíz',
      'Cargando a tu vieja GAAA',
      'Ya pero, eres o no?',
      'Especialista eres no?',
      'Esto está tardando mas de lo esperado :c.'
    ];

    return Stream
            .periodic(const Duration(milliseconds: 1200), (step) {
              return messages[step];
            })
            .take( messages.length );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Text('Espere por favor'),
          const SizedBox(height: 30),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              
              if ( !snapshot.hasData ) return const Text('Cargando ...');

              return Text( snapshot.data! );

            },
          )
          
        ],
      ),
    );
  }
}
