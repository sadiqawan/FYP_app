import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  late TextEditingController tiltleC = TextEditingController(),
      desC = TextEditingController();

  @override
  void initState() {
    tiltleC;
    desC;
    super.initState();
  }

  @override
  void dispose() {
    tiltleC.dispose();
    desC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: tiltleC,
          decoration: const InputDecoration(
            hintText: 'Title of the product',
            suffixIcon: Icon(Icons.short_text_sharp),
          ),
        ),
        const Gap(16),
        TextField(
          controller: desC,
          decoration: InputDecoration(
              hintText: 'Description........',
              suffixIcon: const Icon(Icons.file_present_sharp),
              prefixIcon: IconButton(
                  onPressed: () {

                  }, icon: const Icon(Icons.image_outlined)),
          ),
        ),
        const Gap(16),
      ],
    );
  }
}
