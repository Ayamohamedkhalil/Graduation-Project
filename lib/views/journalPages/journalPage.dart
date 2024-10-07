import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/views/ConatctUspage/contactUsPage.dart';
import 'package:splash_onboarding_test/views/journalPages/journal1.dart';
import 'package:splash_onboarding_test/views/journalPages/widgets/JournalData.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  DateTime selectedYear = DateTime.now();

  List<dynamic> journals = []; // List to store fetched journals
  String errorMessage = ''; // Variable to store error messages

  @override
  void initState() {
    super.initState();
    _fetchJournals( year: "",
                      month: "",
                      day: "",); // Fetch all journals when the page loads
  }

  Future<void> _fetchJournals(
      {String? year, String? month, String? day}) async {
    final String? token = await getToken();

    setState(() {
      errorMessage = ''; // Reset error message on every fetch attempt
    });

    try {
      final response = await http.post(
        Uri.parse(
            'https://backend-production-19d7.up.railway.app/api/get-journals'),
        headers: {
          'Authorization': token ?? '',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'year': year,
          'month': month,
          'day': day,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          if (day != null) {
            // When a specific day is provided, handle 'journals' response
            journals = data['journals'] ?? [];
            if (journals.isEmpty) {
              errorMessage = 'No journals found for the selected date.';
            }
          } else {
            // When 'day' is null, handle 'days' dictionary
            final days = data['days'] ?? {};
            journals = []; // Clear existing journals

            days.forEach((key, value) {
              // Combine entries for the month
              for (var entry in value) {
                journals.add(entry);
              }
            });

            if (journals.isEmpty) {
              errorMessage = 'No journals found for the selected month.';
            }
          }
        });
      } else {
        setState(() {
          errorMessage = 'Failed to fetch journals.';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        color: const Color(0xff537F5C),
        child: Stack(children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              children: [
                const SizedBox(height: 50),
                // SearchBar
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      fillColor: const Color(0xff537F5C),
                      filled: true,
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      suffixIcon:
                          const Icon(Icons.mic_none, color: Colors.white),
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
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                          color: Color(0xffD9D9D9),
                          width: 1.2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                          color: Color(0xffD9D9D9),
                          width: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Welcome Text
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Welcome John!",
                          style: TextStyle(
                            color: Color(0xffAFAC7F),
                            fontSize: 29,
                            fontFamily: 'Ledger',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewJournalEntryPage(
                                    currentDate: selectedDay),
                              ),
                            );
                          },
                          child: Icon(
                            FontAwesomeIcons.penToSquare,
                            size: 30,
                            color: Color(0xffAFAC7F),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    Padding(
                      padding: EdgeInsets.only(left: 7),
                      child: Text(
                        "Malaz thinks you are about to make something great",
                        softWrap: true,
                        style: TextStyle(
                          color: Color.fromARGB(216, 255, 255, 255),
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                // Calendar
                TableCalendar(
                  daysOfWeekStyle: DaysOfWeekStyle(
                    dowTextFormatter: (date, locale) {
                      return DateFormat('E', locale).format(date)[0];
                    },
                    weekdayStyle: const TextStyle(
                        color: Colors.white, fontFamily: 'Ledger'),
                    weekendStyle: const TextStyle(
                        color: Colors.white, fontFamily: 'Ledger'),
                  ),
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: const Color.fromARGB(68, 217, 217, 217),
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle, // Fixed to use circle shape
                    ),
                    selectedDecoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape
                          .circle, // Circle shape does not need borderRadius
                    ),
                    defaultTextStyle: const TextStyle(color: Colors.white),
                  ),
                  headerStyle: HeaderStyle(
                    titleTextFormatter: (date, locale) =>
                        DateFormat('MMM : yyyy', locale).format(date),
                    leftChevronIcon:
                        const Icon(Icons.chevron_left, color: Colors.white),
                    rightChevronIcon:
                        const Icon(Icons.chevron_right, color: Colors.white),
                    titleTextStyle: const TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontFamily: 'Ledger',
                    ),
                    titleCentered: true,
                    formatButtonVisible: false,
                  ),
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2050, 12, 31),
                  focusedDay: focusedDay,
                  calendarFormat: calendarFormat,
                  selectedDayPredicate: (day) => isSameDay(day, selectedDay),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      this.selectedDay = selectedDay;
                      this.focusedDay = focusedDay;
                    });
                    _fetchJournals(
                      year: selectedDay.year.toString(),
                      month: selectedDay.month.toString().padLeft(2, '0'),
                      day: selectedDay.day.toString().padLeft(2, '0'),
                    );
                  },
                  onHeaderTapped: (date) async {
                    int? result = await showYearMonthDialog(context);
                    if (result != null) {
                      if (result == 1) {
                        print("Year tapped");

                        // Handle the Year tap logic
                      } else {
                        print("Month tapped");
                        setState(() {
                          selectedYear = date;
                        });
                        await _fetchJournals(
                          year: selectedYear.year.toString(),
                          month: selectedYear.month.toString().padLeft(2, '0'),
                        );
                        setState(() {});
                        print(selectedYear.year);
                        print(selectedYear.month);

                        /// Handle the Month tap logic
                      }
                    }
                  },
                  onPageChanged: (focusedDay) {
                    this.focusedDay = focusedDay;
                  },
                ),
                // Displaying Fetched Journals
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Month Journals",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Ledger',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: journals.isEmpty
                      ? Center(
                          child: Text(
                            errorMessage.isNotEmpty
                                ? errorMessage
                                : 'No journals available.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        )
                      : ListView.builder(
                          //padding: const EdgeInsets.only(bottom: 80),
                          itemCount: journals.length,
                          itemBuilder: (context, index) {
                            final journal = journals[index];

                            // Handling multiple entries for a single day
                            if (journal['entries'] != null &&
                                journal['entries'].isNotEmpty) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: journal['entries'].length,
                                    itemBuilder: (context, entryIndex) {
                                      final entry =
                                          journal['entries'][entryIndex];
                                      return JournalData(
                                        title: entry['title'] ?? 'No Title',
                                        date: journal['date'] ?? 'No Date',
                                      );
                                    },
                                  ),
                                ],
                              );
                            } else {
                              return Center(child: Text('No Entries Found'));
                            }
                          },
                        ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            left: MediaQuery.of(context).size.width * 0.15,
            right: MediaQuery.of(context).size.width * 0.15,
            child: const BarButton(),
          ),
        ]),
      ),
    );
  }

  Future<int?> showYearMonthDialog(BuildContext context) async {
    return showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xff537F5C),
          title: Text('Select Year or Month',
              style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(1); // Return 1 when Year is tapped
              },
              child: Text('Year', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(0); // Return 0 when Month is tapped
              },
              child: Text(
                'Month',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
