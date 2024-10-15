// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Travel Planner',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SearchPage(),
//     );
//   }
// }

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   List<String> districts = [
//     'Madurai', 'Chennai', 'Coimbatore', 'Tiruchirappalli', 'Salem',
//     'Tirunelveli', 'Tiruppur', 'Erode', 'Vellore', 'Thoothukudi',
//     'Dindigul', 'Thanjavur', 'Ranipet', 'Tenkasi', 'Kanyakumari',
//     'Nagapattinam', 'Sivaganga', 'Theni', 'Thiruvallur', 'Kanchipuram',
//     'Krishnagiri', 'Dharmapuri', 'Namakkal', 'Perambalur', 'Pudukkottai',
//     'Ramanathapuram', 'Thiruvarur', 'Viluppuram', 'Cuddalore', 'Ariyalur',
//     'Karur', 'Nilgiris', 'Virudhunagar', 'Chengalpattu', 'Mayiladuthurai'
//   ];

//   List<String> filteredDistricts = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredDistricts = districts;
//   }

//   void filterSearchResults(String query) {
//     List<String> dummySearchList = [];
//     dummySearchList.addAll(districts);
//     if (query.isNotEmpty) {
//       List<String> dummyListData = [];
//       dummySearchList.forEach((item) {
//         if (item.toLowerCase().contains(query.toLowerCase())) {
//           dummyListData.add(item);
//         }
//       });
//       setState(() {
//         filteredDistricts.clear();
//         filteredDistricts.addAll(dummyListData);
//       });
//       return;
//     } else {
//       setState(() {
//         filteredDistricts.clear();
//         filteredDistricts.addAll(districts);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Explore')),
//       body: Column(
//         children: [
//           TextField(
//             decoration: InputDecoration(hintText: 'Enter a district'),
//             onChanged: (value) {
//               filterSearchResults(value);
//             },
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredDistricts.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(filteredDistricts[index]),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ExplorationOptions(
//                           district: filteredDistricts[index],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ExplorationOptions extends StatefulWidget {
//   final String district;
//   ExplorationOptions({required this.district});

//   @override
//   _ExplorationOptionsState createState() => _ExplorationOptionsState();
// }

// class _ExplorationOptionsState extends State<ExplorationOptions> {
//   String religion = 'All';
//   bool preferShortestDistance = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Options for ${widget.district}')),
//       body: Column(
//         children: [
//           DropdownButton<String>(
//             value: religion,
//             onChanged: (String? newValue) {
//               setState(() {
//                 religion = newValue!;
//               });
//             },
//             items: <String>['All', 'Hindu', 'Muslim', 'Christian']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//           ),
//           SwitchListTile(
//             title: Text('Prefer Shortest Distance'),
//             value: preferShortestDistance,
//             onChanged: (bool value) {
//               setState(() {
//                 preferShortestDistance = value;
//               });
//             },
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => ItineraryInputPage(
//                           district: widget.district,
//                           religion: religion,
//                           preferShortestDistance: preferShortestDistance,
//                         )),
//               );
//             },
//             child: Text('Next'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // The rest of your code remains unchanged


// class ItineraryInputPage extends StatefulWidget {
//   final String district;
//   final String religion;
//   final bool preferShortestDistance;

//   ItineraryInputPage(
//       {required this.district,
//       required this.religion,
//       required this.preferShortestDistance});

//   @override
//   _ItineraryInputPageState createState() => _ItineraryInputPageState();
// }

// class _ItineraryInputPageState extends State<ItineraryInputPage> {
//   final _formKey = GlobalKey<FormState>();
//   DateTime startDate = DateTime.now();
//   TimeOfDay startTime = TimeOfDay.now();
//   int durationDays = 1;
//   String transportation = 'Car';

//   Future<void> _selectDate() async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: startDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != startDate)
//       setState(() {
//         startDate = picked;
//       });
//   }

//   Future<void> _selectTime() async {
//     final TimeOfDay? picked =
//         await showTimePicker(context: context, initialTime: startTime);
//     if (picked != null && picked != startTime)
//       setState(() {
//         startTime = picked;
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Itinerary Details')),
//       body: Form(
//         key: _formKey,
//         child: ListView(
//           padding: EdgeInsets.all(16.0),
//           children: [
//             ListTile(
//               title: Text("Start Date: ${startDate.toLocal()}".split(' ')[0]),
//               trailing: Icon(Icons.calendar_today),
//               onTap: _selectDate,
//             ),
//             ListTile(
//               title: Text("Start Time: ${startTime.format(context)}"),
//               trailing: Icon(Icons.access_time),
//               onTap: _selectTime,
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: "Duration (in days)"),
//               keyboardType: TextInputType.number,
//               onSaved: (value) {
//                 durationDays = int.parse(value!);
//               },
//             ),
//             DropdownButtonFormField<String>(
//               value: transportation,
//               decoration: InputDecoration(labelText: "Preferred Transportation"),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   transportation = newValue!;
//                 });
//               },
//               items: <String>['Car', 'Bike', 'Bus', 'Walk']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   _formKey.currentState!.save();
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ResultPage(
//                         district: widget.district,
//                         religion: widget.religion,
//                         preferShortestDistance:
//                             widget.preferShortestDistance,
//                         startDate: startDate,
//                         startTime: startTime,
//                         durationDays: durationDays,
//                         transportation: transportation,
//                       ),
//                     ),
//                   );
//                 }
//               },
//               child: Text('Generate Schedule'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ResultPage extends StatelessWidget {
//   final String district;
//   final String religion;
//   final bool preferShortestDistance;
//   final DateTime startDate;
//   final TimeOfDay startTime;
//   final int durationDays;
//   final String transportation;

//   ResultPage({
//     required this.district,
//     required this.religion,
//     required this.preferShortestDistance,
//     required this.startDate,
//     required this.startTime,
//     required this.durationDays,
//     required this.transportation,
//   });

//   // Mock function to generate schedule for a day
//   List<Map<String, String>> generateDaySchedule(int day) {
//     return [
//       {
//         'time': '8:00 AM',
//         'activity': 'Visit Meenakshi Temple',
//         'duration': '2 hours',
//       },
//       {
//         'time': '10:30 AM',
//         'activity': 'Breakfast at Hotel Saravana Bhavan',
//         'duration': '45 mins',
//       },
//       {
//         'time': '11:30 AM',
//         'activity': 'Visit Gandhi Memorial Museum',
//         'duration': '1.5 hours',
//       },
//       {
//         'time': '1:30 PM',
//         'activity': 'Lunch at Murugan Idli Shop',
//         'duration': '1 hour',
//       },
//       {
//         'time': '3:00 PM',
//         'activity': 'Visit Thirumalai Nayakar Mahal',
//         'duration': '2 hours',
//       },
//       {
//         'time': '5:30 PM',
//         'activity': 'Shopping at Puthu Mandapam',
//         'duration': '1.5 hours',
//       },
//       {
//         'time': '7:30 PM',
//         'activity': 'Dinner at Amsavalli Bhavan',
//         'duration': '1 hour',
//       },
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Your Schedule')),
//       body: ListView.builder(
//         itemCount: durationDays,
//         itemBuilder: (context, day) {
//           final schedule = generateDaySchedule(day + 1);
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       'Day ${day + 1}:',
//                       style: TextStyle(
//                           fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   ...schedule.map((item) {
//                     return ListTile(
//                       leading: Icon(Icons.schedule),
//                       title: Text(item['activity']!),
//                       subtitle: Text('${item['time']} - Duration: ${item['duration']}'),
//                     );
//                   }).toList(),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Planner',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(secondary: Colors.amberAccent),
        textTheme: GoogleFonts.poppinsTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SearchPage(),
    );
  }
}

final districtListProvider = StateNotifierProvider<DistrictListNotifier, List<String>>((ref) {
  return DistrictListNotifier();
});

class DistrictListNotifier extends StateNotifier<List<String>> {
  DistrictListNotifier() : super([
    'Madurai', 'Chennai', 'Coimbatore', 'Tiruchirappalli', 'Salem',
    'Tirunelveli', 'Tiruppur', 'Erode', 'Vellore', 'Thoothukudi',
    'Dindigul', 'Thanjavur', 'Ranipet', 'Sivaganga', 'Tenkasi',
  ]);

  void filter(String query) {
    if (query.isEmpty) {
      state = [
        'Madurai', 'Chennai', 'Coimbatore', 'Tiruchirappalli', 'Salem',
        'Tirunelveli', 'Tiruppur', 'Erode', 'Vellore', 'Thoothukudi',
        'Dindigul', 'Thanjavur', 'Ranipet', 'Sivaganga', 'Tenkasi',
      ];
    } else {
      state = state.where((district) =>
          district.toLowerCase().contains(query.toLowerCase())).toList();
    }
  }
}

class SearchPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredDistricts = ref.watch(districtListProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Explore Tamil Nadu'),
              background: Image.asset(
          'assets/image.png',
          fit: BoxFit.cover,
        ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search districts',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onChanged: (value) => ref.read(districtListProvider.notifier).filter(value),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(filteredDistricts[index]),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExplorationOptions(
                            district: filteredDistricts[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              childCount: filteredDistricts.length,
            ),
          ),
        ],
      ),
    );
  }
}

class ExplorationOptions extends StatefulWidget {
  final String district;
  ExplorationOptions({required this.district});

  @override
  _ExplorationOptionsState createState() => _ExplorationOptionsState();
}

class _ExplorationOptionsState extends State<ExplorationOptions> {
  String selectedReligion = 'All';
  bool preferShortestDistance = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Explore ${widget.district}')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Religion Preference',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        children: [
                          ChoiceChip(
                            label: Text('All'),
                            selected: selectedReligion == 'All',
                            onSelected: (bool selected) {
                              setState(() {
                                selectedReligion = 'All';
                              });
                            },
                          ),
                          ChoiceChip(
                            label: Text('Hindu'),
                            selected: selectedReligion == 'Hindu',
                            onSelected: (bool selected) {
                              setState(() {
                                selectedReligion = 'Hindu';
                              });
                            },
                          ),
                          ChoiceChip(
                            label: Text('Muslim'),
                            selected: selectedReligion == 'Muslim',
                            onSelected: (bool selected) {
                              setState(() {
                                selectedReligion = 'Muslim';
                              });
                            },
                          ),
                          ChoiceChip(
                            label: Text('Christian'),
                            selected: selectedReligion == 'Christian',
                            onSelected: (bool selected) {
                              setState(() {
                                selectedReligion = 'Christian';
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Route Preference',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SwitchListTile(
                        title: Text('Prefer Shortest Distance'),
                        value: preferShortestDistance,
                        onChanged: (bool value) {
                          setState(() {
                            preferShortestDistance = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItineraryInputPage(
                        district: widget.district,
                        religion: selectedReligion,
                        preferShortestDistance: preferShortestDistance,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Next', style: TextStyle(fontSize: 18)),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItineraryInputPage extends StatefulWidget {
  final String district;
  final String religion;
  final bool preferShortestDistance;

  ItineraryInputPage({
    required this.district,
    required this.religion,
    required this.preferShortestDistance,
  });

  @override
  _ItineraryInputPageState createState() => _ItineraryInputPageState();
}

class _ItineraryInputPageState extends State<ItineraryInputPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime startDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  int durationDays = 1;
  String transportation = 'Car';

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != startDate)
      setState(() {
        startDate = picked;
      });
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: startTime,
    );
    if (picked != null && picked != startTime)
      setState(() {
        startTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plan Your Trip')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Card(
              child: InkWell(
                onTap: _selectDate,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Date',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, color: Theme.of(context).primaryColor),
                          SizedBox(width: 8),
                          Text(
                            DateFormat('MMMM d, y').format(startDate),
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              child: InkWell(
                onTap: _selectTime,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Time',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.access_time, color: Theme.of(context).primaryColor),
                          SizedBox(width: 8),
                          Text(
                            startTime.format(context),
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Duration',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      initialValue: durationDays.toString(),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixText: 'days',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        durationDays = int.parse(value!);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the duration';
                        }
                        if (int.tryParse(value) == null || int.parse(value) < 1) {
                          return 'Please enter a valid number of days';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preferred Transportation',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: transportation,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          transportation = newValue!;
                        });
                      },
                      items: <String>['Car', 'Bike', 'Bus', 'Walk']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        district: widget.district,
                        religion: widget.religion,
                        preferShortestDistance: widget.preferShortestDistance,
                        startDate: startDate,
                        startTime: startTime,
                        durationDays: durationDays,
                        transportation: transportation,
                      ),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Generate Schedule', style: TextStyle(fontSize: 18)),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ResultPage extends StatelessWidget {
  final String district;
  final String religion;
  final bool preferShortestDistance;
  final DateTime startDate;
  final TimeOfDay startTime;
  final int durationDays;
  final String transportation;

  ResultPage({
    required this.district,
    required this.religion,
    required this.preferShortestDistance,
    required this.startDate,
    required this.startTime,
    required this.durationDays,
    required this.transportation,
  });

  // Mock function to generate schedule for a day
  List<Map<String, String>> generateDaySchedule(int day) {
    return [
      {
        'time': '8:00 AM',
        'activity': 'Visit Meenakshi Temple',
        'duration': '2 hours',
      },
      {
        'time': '10:30 AM',
        'activity': 'Breakfast at Hotel Saravana Bhavan',
        'duration': '45 mins',
      },
      {
        'time': '11:30 AM',
        'activity': 'Visit Gandhi Memorial Museum',
        'duration': '1.5 hours',
      },
      {
        'time': '1:30 PM',
        'activity': 'Lunch at Murugan Idli Shop',
        'duration': '1 hour',
      },
      {
        'time': '3:00 PM',
        'activity': 'Visit Thirumalai Nayakar Mahal',
        'duration': '2 hours',
      },
      {
        'time': '5:30 PM',
        'activity': 'Shopping at Puthu Mandapam',
        'duration': '1.5 hours',
      },
      {
        'time': '7:30 PM',
        'activity': 'Dinner at Amsavalli Bhavan',
        'duration': '1 hour',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Schedule')),
      body: ListView.builder(
        itemCount: durationDays,
        itemBuilder: (context, day) {
          final schedule = generateDaySchedule(day + 1);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Day ${day + 1}:',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...schedule.map((item) {
                    return ListTile(
                      leading: Icon(Icons.schedule),
                      title: Text(item['activity']!),
                      subtitle: Text('${item['time']} - Duration: ${item['duration']}'),
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

