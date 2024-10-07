import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/views/ConatctUspage/contactUsPage.dart';
import 'package:splash_onboarding_test/views/journalPages/journalPage.dart';
import 'package:splash_onboarding_test/views/journalPages/widgets/JournalYearData.dart';

class Journalyearpage extends StatefulWidget {
  final int selectYear;

  const Journalyearpage({super.key, required this.selectYear});

  @override
  _JournalyearpageState createState() => _JournalyearpageState();
}

class _JournalyearpageState extends State<Journalyearpage> {
  // To store the state of expanded tiles
  final Map<int, bool> _isOpen = {};
  Map<int, List<Map<String, dynamic>>> _journalsByMonth =
      {}; // Store journals grouped by month
  bool _isLoading = true; // Add a loading state

  @override
  void initState() {
    super.initState();
    _loadJournals();
  }

  Future<Map<String, dynamic>> fetchJournalsByYear(int year) async {
    final String? token = await getToken();
    final response = await http.post(
      Uri.parse(
          'https://backend-production-19d7.up.railway.app/api/get-journals'),
      headers: {
        'Authorization': token ?? '', // Use your authorization token
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'year': year.toString(),
        'month':
            null, // Sending month as null to fetch all entries for the year
        'day': null, // Setting day to null as well
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load journals');
    }
  }

 void _loadJournals() async {
  try {
    final data = await fetchJournalsByYear(widget.selectYear);
    print("API response: $data"); // Debug: Print raw API response

    // Check if 'months' key exists and is a Map
    if (data.containsKey('months') && data['months'] is Map) {
      if (data['months'].isEmpty) {
        print("The 'months' map is empty.");
      } else {
        _groupJournalsByMonth(data['months']);
      }
    } else {
      print("No journals found or invalid format.");
    }

    setState(() {
      _isLoading = false;
    });
  } catch (e) {
    print('Error loading journals: $e');
  }
}

void _groupJournalsByMonth(Map<String, dynamic> monthsData) {
  monthsData.forEach((month, journals) {
    print('Month: $month, Journals: $journals'); // Debug: Print each month

    try {
      int monthInt = int.parse(month); // Parse month as an integer

      if (!_journalsByMonth.containsKey(monthInt)) {
        _journalsByMonth[monthInt] = [];
      }

      // Iterate over each journal entry for the month
      for (var journalEntry in journals) {
        // Extract the journal details and add it to the corresponding month
        if (journalEntry['entries'] != null && journalEntry['entries'] is List) {
          for (var entry in journalEntry['entries']) {
            _journalsByMonth[monthInt]!.add({
              'title': entry['title'],
              'date': journalEntry['date'], // Use the outer 'date'
            });
          }
        }
      }
    } catch (e) {
      print("Error processing journals for month $month - Error: $e");
    }
  });

  print('Journals by month: $_journalsByMonth'); // Debug: Final grouped data
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                color: PriamryColor,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 40),
                        _buildHeader(context),
                        const SizedBox(height: 15),
                        _buildSearchBar(),
                        const SizedBox(height: 30),
                        _buildJournalList(),
                      ],
                    ),
                    Positioned(
                      bottom: 5,
                      right: MediaQuery.of(context).size.width * 0.15,
                      left: MediaQuery.of(context).size.width * 0.15,
                      child: const BarButton(),
                    ),
                  ],
                ),
              ));
  }

  Widget _buildJournalList() {
    return Flexible(
      child: ListView(
        padding: const EdgeInsets.only(bottom: 80),
        children: List.generate(12, (index) {
          String month = _getMonthName(index + 1);
          return _customExpansionTile(
            title: month,
            index: index,
            children: _buildJournalEntriesForMonth(index + 1),
          );
        }),
      ),
    );
  }

  List<Widget> _buildJournalEntriesForMonth(int month) {
    List<Map<String, dynamic>>? journals = _journalsByMonth[month];
    if (journals == null || journals.isEmpty) {
      return [
        Text("No journals available", style: TextStyle(color: Colors.white))
      ];
    }

    return journals.map((journal) {
      return JournalYearData(
        title: journal['title'],
        date: journal['date'],
      );
    }).toList();
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 320, top: 5),
                width: 35.0,
                height: 35.0,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JournalPage()),
                    );
                  },
                  iconSize: 25.0,
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 9),
                  splashRadius: 25.0,
                  tooltip: "Back",
                ),
              ),
              Center(
                child: Text(
                  "${widget.selectYear}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontFamily: "LEDGER",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width * 1,
      child: TextFormField(
        cursorColor: Colors.white,
        decoration: InputDecoration(
          fillColor: const Color(0xff537F5C),
          filled: true,
          prefixIcon: const Icon(Icons.search, color: Colors.white),
          suffixIcon: const Icon(Icons.mic_none, color: Colors.white),
          hintText: 'Search for test',
          hintStyle: const TextStyle(
            color: Color(0xffD9D9D9),
            fontFamily: 'Ledger',
            fontSize: 18,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Color(0xffD9D9D9),
              width: 1.2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Color(0xffD9D9D9),
              width: 1.2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Color(0xffD9D9D9),
              width: 1.2,
            ),
          ),
        ),
      ),
    );
  }

  // Method to create a custom ExpansionTile
  Widget _customExpansionTile({
    required String title,
    required int index,
    required List<Widget> children,
  }) {
    return ExpansionTile(
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "Ledger",
          color: Colors.white,
          fontSize: 30,
        ),
      ),
      // Custom icon changes based on expansion state
      trailing: Icon(
        _isOpen[index] ?? false ? Icons.expand_more : Icons.chevron_right,
        color: Colors.white,
      ),
      onExpansionChanged: (bool expanded) {
        setState(() {
          _isOpen[index] = expanded;
        });
      },
      children: children,
    );
  }

  // Helper method to get the name of the month
  String _getMonthName(int monthNumber) {
    List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return months[monthNumber - 1];
  }
}
