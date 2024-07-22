import 'package:flutter/material.dart';
import 'package:utip/widgets/bill_amount_field.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tip_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _personCount = 1;
  double _tipPercentage = 0.0;

  //Methods
  void increment() {
    setState(() {
      _personCount = _personCount + 1;
    });
  }

  void decrement() {
    setState(() {
      if (_personCount > 1) {
        _personCount = _personCount - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);
    return Scaffold(
        appBar: AppBar(
          title: const Text('UTip'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Total per person: ",
                        style: style,
                      ),
                      Text(
                        "\$23.98",
                        style: style.copyWith(
                            color: theme.colorScheme.primary,
                            fontSize: theme.textTheme.displaySmall?.fontSize),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border:
                        Border.all(color: theme.colorScheme.primary, width: 2)),
                child: Column(
                  children: [
                    BillAmountField(
                      onChanged: (value) {
                        print("Amount: $value");
                      },
                      billAmount: "100",
                    ),
                    //Split Bill Area
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Split",
                          style: theme.textTheme.titleMedium,
                        ),
                        PersonCounter(
                            theme: theme,
                            personCount: _personCount,
                            onIncrement: increment,
                            onDecrement: decrement),
                      ],
                    ),
                    // TİP SECTİON
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tip",
                          style: theme.textTheme.titleMedium,
                        ),
                        Text(
                          "\$20",
                          style: theme.textTheme.titleMedium,
                        )
                      ],
                    ),
                    // Slider Text
                    Text("${(_tipPercentage * 100).round()}%"),
                    // Tip Slider
                    TipSlider(
                      tipPercentage: _tipPercentage,
                      onChanged: (double value) {
                        setState(() {
                          _tipPercentage = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
