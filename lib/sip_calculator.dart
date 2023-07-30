import 'dart:math';

import 'package:flutter/material.dart';

class SipCalculator extends StatefulWidget {
  const SipCalculator({super.key});

  @override
  State<SipCalculator> createState() => _SipCalculatorState();
}

class _SipCalculatorState extends State<SipCalculator> {
  TextEditingController amountController = TextEditingController();
  TextEditingController intersetController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  var amount = 0;
  var interset = 0;
  var time = 0;
  var totalAmount;
  var ci = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sip Calculator',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Text(
                    'Amount(Rs.)',
                    style: TextStyle(fontSize: 20),
                  ),
             const SizedBox(
              width: 26,
            ),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: amountController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Interest(%)'),
                  const SizedBox(
                    width: 26,
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: intersetController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Time(In Years)'),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: timeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                int amount = int.parse(amountController.text);
                int interest = int.parse(intersetController.text);
                int time = int.parse(timeController.text);
                totalAmount = amount * pow((1 + interest / 100), time);
                ci = totalAmount - amount;
                setState(() {});
              },
              child: const Text('Calcuate'),
            ),
            Text(
              'Total Amount=${totalAmount?.toStringAsFixed(2) ?? 0}',
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'CI=${ci?.toStringAsFixed(2) ?? 0}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
