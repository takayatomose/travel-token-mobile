import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/auth/map/map_bloc.dart';

class SuggestItem {
  String name = "";
  LatLng point = LatLng(0, 0);
  SuggestItem(this.name, this.point);
}

List<SuggestItem> listSuggestItems = [
  new SuggestItem("A1", LatLng(13, 77.1)),
  new SuggestItem("A2", LatLng(13.1, 77.2)),
  new SuggestItem("A3", LatLng(13.2, 77.3)),
  new SuggestItem("A4", LatLng(13.3, 77.4)),
  new SuggestItem("A5", LatLng(13, 77.4)),
  new SuggestItem("A6", LatLng(13, 77.3)),
  new SuggestItem("A7", LatLng(13, 77.2)),
];

class CustomMap extends StatefulWidget {
  const CustomMap({Key? key}) : super(key: key);

  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  final PopupController _popupController = PopupController();
  MapController _mapController = MapController();
  double _zoom = 7;
  int activeIndex = 0;
  List<Marker> _markers = [];
  @override
  void initState() {
    _markers = listSuggestItems
        .map((item) => Marker(
              point: item.point,
              width: 60,
              height: 60,
              builder: (context) => Icon(
                Icons.pin_drop,
                size: 60,
                color: Colors.blueAccent,
              ),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapBloc(),
      child: BlocConsumer<MapBloc, MapState>(
        listener: (context, state) {
          print('listener:' + state.selectedIndex.toString());
          // TODO: implement listener
        },
        builder: (context, state) {
          print('map state: ' + state.selectedIndex.toString());
          return Scaffold(
            appBar: AppBar(
              title: Text(state.selectedIndex.toString()),
              actions: [
                IconButton(
                    onPressed: (() {
                      showSearch(
                          context: context, delegate: MySearchDelegate());
                    }),
                    icon: const Icon(Icons.search))
              ],
            ),
            body: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  // center: listSuggestItems[context.watch<MarkerIndexProvider>().index]
                  //     .point,
                  center: listSuggestItems[activeIndex].point,

                  // bounds: LatLngBounds.fromPoints(listSuggestItems),
                  zoom: 13.0,
                  plugins: [
                    MarkerClusterPlugin(),
                  ],
                ),
                layers: [
                  TileLayerOptions(
                    minZoom: 1,
                    maxZoom: 14,
                    backgroundColor: Colors.black,
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerClusterLayerOptions(
                    maxClusterRadius: 190,
                    disableClusteringAtZoom: 16,
                    size: Size(50, 50),
                    fitBoundsOptions: FitBoundsOptions(
                      padding: EdgeInsets.all(50),
                    ),
                    markers: _markers,
                    polygonOptions: PolygonOptions(
                        borderColor: Colors.blueAccent,
                        color: Colors.black12,
                        borderStrokeWidth: 3),
                    popupOptions: PopupOptions(
                        popupSnap: PopupSnap.markerTop,
                        popupController: _popupController,
                        popupBuilder: (_, marker) => Container(
                              color: Colors.amberAccent,
                              child: Text('Popup'),
                            )),
                    builder: (context, markers) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.orange, shape: BoxShape.circle),
                        child: Text('${markers.length}'),
                      );
                    },
                  ),
                ]),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
                setState(() {
                  listSuggestItems.length - 1 > activeIndex
                      ? activeIndex += 1
                      : activeIndex = 0;
                });
                _mapController.move(listSuggestItems[activeIndex].point, 14);
              },
              backgroundColor: Colors.blueAccent,
              child: const Icon(Icons.navigation),
            ),
          );
        },
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) {
    return Center(
        child: Text(query,
            style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w300)));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<SuggestItem> suggestions = listSuggestItems.where((element) {
      final result = element.name.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return BlocProvider(
      create: (context) => MapBloc(),
      child: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: ((context, index) {
            final suggestion = suggestions[index];
            return ListTile(
                title: Text(suggestion.name),
                onTap: () {
                  context.read<MapBloc>().add(SelectSpot(selectedIndex: index));
                  query = index.toString();
                  showResults(context);
                });
          })),
    );
  }
}
