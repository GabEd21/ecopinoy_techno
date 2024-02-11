import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ManufacturerPage(),
  ));
}

class ManufacturerPage extends StatefulWidget {
  const ManufacturerPage({Key? key}) : super(key: key);

  @override
  _ManufacturerPageState createState() => _ManufacturerPageState();
}

class _ManufacturerPageState extends State<ManufacturerPage> {
  TextEditingController weightController = TextEditingController();
  int numberOfBlocks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plastics Manufacturer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hollow Blocks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Enter weight in kilograms:'),
            SizedBox(height: 10),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter weight',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement calculation logic here
                double weight = double.tryParse(weightController.text) ?? 0;
                int blocks = (weight / 0.2).floor();
                setState(() {
                  numberOfBlocks = blocks;
                });
              },
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Text(
              'Result:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Number of Hollow Blocks: $numberOfBlocks',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Other Plastics',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  PlasticItem(name: 'Plastic Chairs'),
                  PlasticItem(name: 'Plastic Tables'),
                  // Add more PlasticItem widgets as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    weightController.dispose();
    super.dispose();
  }
}

class PlasticItem extends StatelessWidget {
  final String name;

  const PlasticItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        name,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
