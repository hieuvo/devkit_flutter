import 'package:flutter/material.dart';

class WithoutSafeAreaPage extends StatefulWidget {
  const WithoutSafeAreaPage({super.key});

  @override
  State<WithoutSafeAreaPage> createState() => _WithoutSafeAreaPageState();
}

class _WithoutSafeAreaPageState extends State<WithoutSafeAreaPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.pinkAccent,
          child: const Text(
              'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                  'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                  'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                  'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                  'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                  'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                  'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                  'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                  'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                  'a b c d e f g h i j k l m n o p q r s t u v w x y z'
          ),
        )
    );
  }
}
