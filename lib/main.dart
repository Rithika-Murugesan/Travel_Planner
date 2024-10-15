import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'home.dart';  // Import the file where needed

void main() => runApp(ProviderScope(child: MyApp()));  // Wrap with ProviderScope for Riverpod

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'International Travel App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Montserrat',
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/home.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                    ).createShader(bounds),
                    child: Icon(Icons.flight_takeoff, size: 100.0, color: Colors.white),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Welcome Back, Explorer!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                  _buildTextField(icon: Icons.email, hintText: 'Username or Email'),
                  SizedBox(height: 20.0),
                  _buildTextField(icon: Icons.lock, hintText: 'Password', isPassword: true),
                  SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3949AB),
                      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      'Start Your Journey',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text(
                      'New here? Create an account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({required IconData icon, required String hintText, bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white.withOpacity(0.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextField(
        obscureText: isPassword,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/home.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [Colors.green, Colors.teal],
                    ).createShader(bounds),
                    child: Icon(Icons.explore, size: 100.0, color: Colors.white),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Join the Adventure!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                  _buildTextField(icon: Icons.person, hintText: 'Full Name'),
                  SizedBox(height: 20.0),
                  _buildTextField(icon: Icons.email, hintText: 'Email'),
                  SizedBox(height: 20.0),
                  _buildTextField(icon: Icons.lock, hintText: 'Password', isPassword: true),
                  SizedBox(height: 20.0),
                  _buildTextField(icon: Icons.lock, hintText: 'Confirm Password', isPassword: true),
                  SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3949AB),
                      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Already have an account? Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({required IconData icon, required String hintText, bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white.withOpacity(0.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextField(
        obscureText: isPassword,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        ),
      ),
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
      body: Container(
       decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
           // colors: [Color(0xFFE1BEE7), Color(0xFFD1C4E9)],
          colors: [
      Colors.indigo.shade200,  // Very light indigo
      Colors.indigo.shade100, // Light indigo
    ],
          ),
        ),
      
      child: CustomScrollView(
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
      backgroundColor: Colors.indigo.shade100,
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
      backgroundColor: Colors.indigo.shade100,
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
      backgroundColor: Colors.indigo.shade100,
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

