import 'package:flutter/material.dart';

import '../functions/fetchrates.dart';

class UsdToAny extends StatefulWidget {
  final rates;
  final Map Currencies;
  const UsdToAny({Key? key, required this.rates, required this.Currencies})
      : super(key: key);

  @override
  State<UsdToAny> createState() => _UsdToAnyState();
}

class _UsdToAnyState extends State<UsdToAny> {
  TextEditingController usdController = TextEditingController();
  String dropdownValue = 'INR';
  String answer = 'Converter Currency';
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'USD to Any Currency',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Text('USD to Any Currency'),
            TextFormField(
              key: const Key('usd'),
              controller: usdController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Enter USD',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.grey.shade900,
                    value: dropdownValue,
                    style: const TextStyle(color: Colors.white),
                    icon: const Icon(
                      Icons.arrow_drop_down_rounded,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: widget.Currencies.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        answer = usdController.text +
                            'USD     =   ' +
                            convertusd(widget.rates, usdController.text,
                                dropdownValue) +
                            '' +
                            dropdownValue;
                      });
                    
                    },
                    child: const Text('convert'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade400),
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(
              height: 15,
            ),
            Container(
              child: Text(answer, style: const TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
