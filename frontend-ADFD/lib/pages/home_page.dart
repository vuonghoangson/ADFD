import 'package:flutter/material.dart';
import '../models/place.dart';
import '../services/place_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Place> _places = [];
  List<Place> _filtered = [];
  String _search = '';

  @override
  void initState() {
    super.initState();
    loadPlaces();
  }

  void loadPlaces() async {
    final places = await PlaceService.fetchPlaces();
    setState(() {
      _places = places;
      _filtered = places;
    });
  }

  void _filterSearch(String query) {
    setState(() {
      _search = query;
      _filtered = _places
          .where((p) =>
              p.placeName.toLowerCase().contains(query.toLowerCase()) ||
              p.address.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popular Destinations')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: _filterSearch,
              decoration: const InputDecoration(
                hintText: 'Search places...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: _filtered.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _filtered.length,
                    itemBuilder: (context, index) {
                      final place = _filtered[index];
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: place.img,
                            width: 60,
                            height: 60,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          title: Text(place.placeName),
                          subtitle: Text(place.address),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}