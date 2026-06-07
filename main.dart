import 'package:flutter/material.dart';

void main() {
  runApp(const AgroVApp());
}

class AgroVApp extends StatelessWidget {
  const AgroVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agro V',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> crops = const [
    {
      "name": "Tomato",
      "diseases": [
        {
          "name": "Early Blight",
          "treatment":
              "Remove infected leaves and apply a suitable fungicide."
        },
        {
          "name": "Leaf Spot",
          "treatment":
              "Avoid overhead watering and remove affected leaves."
        }
      ]
    },
    {
      "name": "Rice",
      "diseases": [
        {
          "name": "Blast Disease",
          "treatment":
              "Use resistant varieties and recommended fungicides."
        },
        {
          "name": "Brown Spot",
          "treatment":
              "Improve soil nutrition and maintain proper irrigation."
        }
      ]
    },
    {
      "name": "Chili",
      "diseases": [
        {
          "name": "Powdery Mildew",
          "treatment":
              "Use sulfur-based treatment and improve airflow."
        }
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agro V"),
      ),
      body: ListView.builder(
        itemCount: crops.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.agriculture),
              title: Text(crops[index]["name"]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DiseaseScreen(
                      cropName: crops[index]["name"],
                      diseases: crops[index]["diseases"],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DiseaseScreen extends StatelessWidget {
  final String cropName;
  final List diseases;

  const DiseaseScreen({
    super.key,
    required this.cropName,
    required this.diseases,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cropName),
      ),
      body: ListView.builder(
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(diseases[index]["name"]),
              subtitle: Text(
                diseases[index]["treatment"],
              ),
            ),
          );
        },
      ),
    );
  }
}
