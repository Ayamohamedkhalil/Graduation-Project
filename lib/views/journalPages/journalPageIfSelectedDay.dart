import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/views/journalPages/journalPage.dart';
import 'package:splash_onboarding_test/views/journalPages/widgets/JournalData.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class JournalPageDay extends StatefulWidget {
  @override
  _JournalPageDayState createState() => _JournalPageDayState();
  JournalPageDay({required this.selectDay});
  final DateTime selectDay;
}

class _JournalPageDayState extends State<JournalPageDay> {
  CalendarFormat calendarFormat = CalendarFormat.month;

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    DateTime selectedDay = widget.selectDay;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        color: const Color(0xff537F5C),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  //
                  //BackButton
                  //
                  Container(
                    margin: const EdgeInsets.only(right: 320),
                    width: 35.0,
                    height: 35.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JournalPage()),
                        );
                      },
                      iconSize: 25.0,
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 9),
                      splashRadius: 25.0,
                      tooltip: "Next",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //
                  //SearchBar
                  //
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        fillColor: const Color(0xff537F5C),
                        filled: true,
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.white),
                        suffixIcon:
                            const Icon(Icons.mic_none, color: Colors.white),
                        hintText: 'Search for test',
                        hintStyle: const TextStyle(
                            color: Color(0xffD9D9D9),
                            fontFamily: 'Ledger',
                            fontSize: 18),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 2.0),
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
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //
                  //calender
                  //
                  TableCalendar(
                    daysOfWeekStyle: DaysOfWeekStyle(
                        dowTextFormatter: (date, locale) {
                          switch (DateFormat('E', locale).format(date)) {
                            case "Sun":
                              return "S";

                            case "Mon":
                              return "M";

                            case "Tue":
                              return "T";

                            case "Wed":
                              return "W";

                            case "Thu":
                              return "T";

                            case "Fri":
                              return "F";

                            case "Sat":
                              return "S";

                            default:
                              return DateFormat('E', locale).format(date);
                          }
                        },
                        weekdayStyle: const TextStyle(color: Colors.white),
                        weekendStyle: const TextStyle(color: Colors.white)),
                    calendarStyle: CalendarStyle(
                        todayTextStyle: const TextStyle(color: Colors.white),
                        todayDecoration: BoxDecoration(
                            color: const Color.fromARGB(68, 217, 217, 217),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(100)),
                        selectedTextStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        selectedDecoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        defaultTextStyle: const TextStyle(color: Colors.white),
                        outsideTextStyle: const TextStyle(
                            color: Color.fromARGB(85, 255, 255, 255)),
                        weekendTextStyle: const TextStyle(color: Colors.white)),
                    headerStyle: HeaderStyle(
                      rightChevronIcon: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                      leftChevronIcon: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                      titleTextFormatter: (date, locale) =>
                          DateFormat('MMM : yyyy', locale).format(date),
                      leftChevronMargin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1),
                      rightChevronMargin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.1),
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle:
                          const TextStyle(fontSize: 23, color: Colors.white),
                      leftChevronVisible: true,
                      rightChevronVisible: true,
                    ),
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Month',
                    },
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2050, 12, 31),
                    focusedDay: focusedDay,
                    calendarFormat: calendarFormat,
                    //
                    //to mark on day that selcted only
                    //
                    selectedDayPredicate: (day) {
                      return day == selectedDay ? true : false;
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        selectedDay = selectedDay;
                        focusedDay = focusedDay;
                      });
                      //
                      // go to the second Page
                      //
                    },
                    onPageChanged: (focusedDay) {
                      focusedDay = focusedDay;
                    },
                    onHeaderTapped: (Date) {
                      //
                      //go to third Page
                      //
                    },
                  ),
                  //
                  //
                  //
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Day Journals",
                              style: TextStyle(
                                fontFamily: "Ledger",
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            GestureDetector(
                              child: const Text(
                                "See All",
                                style: TextStyle(
                                    color: Color(0xffD1CEA1),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return JournalData(title: "Day one", date: "14/1/2024");
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 5,
                left: MediaQuery.of(context).size.width * 0.15,
                right: MediaQuery.of(context).size.width * 0.15,
                child: const BarButton())
          ],
        ),
      ),
    );
  }
}
