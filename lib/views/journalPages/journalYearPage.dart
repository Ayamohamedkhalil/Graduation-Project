import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/views/journalPages/journalPage.dart';
import 'package:splash_onboarding_test/views/journalPages/widgets/JournalYearData.dart';

class Journalyearpage extends StatefulWidget {
  final int selectYear;

  Journalyearpage({required this.selectYear});

  @override
  _JournalyearpageState createState() => _JournalyearpageState();
}

class _JournalyearpageState extends State<Journalyearpage> {
  // To store the state of expanded tiles
  Map<int, bool> _isOpen = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: PriamryColor,
      child: Stack(children: [
        Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            //
            //header
            //
            Row(
              children: [
                Expanded(
                  child: Stack(children: [
                    //
                    //BackButton
                    //
                    Container(
                      margin: const EdgeInsets.only(right: 320, top: 5),
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
                    Center(
                      child: Text(
                        "${widget.selectYear}",
                        style: const TextStyle(
                            fontSize: 30,
                            fontFamily: "LEDGER",
                            color: Colors.white),
                      ),
                    )
                  ]),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            //
            //SearchBar
            //
            SizedBox(
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
                      fontSize: 18),
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
            ),
            const SizedBox(
              height: 30,
            ),
            //
            // Custom Expansion Tiles
            //
            Flexible(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 80),  // Padding added at the bottom
                children: List.generate(12, (index) {
                  String month = _getMonthName(index + 1);
                  return _customExpansionTile(
                    title: month,
                    index: index,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 25, right: 6),
                        decoration: BoxDecoration(
                          color: BackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          height: 240,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return JournalYearData(
                                title: "Day one", 
                                date: "12/3/2024"
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
        Positioned(
            bottom: 5,
            right: MediaQuery.of(context).size.width * 0.15,
            left: MediaQuery.of(context).size.width * 0.15,
            child: const BarButton())
      ]),
    ));
  }

  // Method to create a custom ExpansionTile
  Widget _customExpansionTile(
      {required String title,
      required int index,
      required List<Widget> children}) {
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
      "December"
    ];
    return months[monthNumber - 1];
  }
}