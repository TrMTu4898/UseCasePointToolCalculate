import 'package:flutter/material.dart';

class WidgetHistoryCard extends StatefulWidget {
  final String nameText;
  final String dateCreated;
  final String information;
  final String numericalOrder;

  const WidgetHistoryCard({
    Key? key,
    required this.nameText,
    required this.dateCreated,
    required this.information,
    required this.numericalOrder,
  }) : super(key: key);

  @override
  _WidgetHistoryCard createState() => _WidgetHistoryCard();
}

class _WidgetHistoryCard extends State<WidgetHistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        borderOnForeground:false ,
        elevation: 0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.nameText,
                            style: const TextStyle(
                              color: Color(0xFF50C2C9),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.information,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(111, 102, 255, 0.15),
                      ),
                      child: SizedBox(
                        width: 100,
                        height: 35,
                        child: Center(
                          child: Text(
                            widget.dateCreated,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFB2EBF2),
                ),
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: Center(
                    child: Text(
                      widget.numericalOrder,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
