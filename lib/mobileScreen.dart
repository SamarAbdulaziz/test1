import 'package:flutter/material.dart';

class MobilScreen extends StatelessWidget {
  const MobilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: Container(
            color: Colors.purple,
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              children: [
                Text(
                  'Login with your account ',
                  style: TextStyle(
                    fontSize: 30.0
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'hint text',
                    // label: Text(
                    //   'label',
                    // ),
                    labelText: 'label text or label ',
                    helperText: 'helper text',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
