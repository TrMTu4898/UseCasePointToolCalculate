import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomCard extends StatefulWidget {
  final String titleText;
  final String subtitleText;
  final String weightText;
  final String dropdownValue;
  final List<String> dropdownItems;
  final void Function(String?) onDropdownChanged;

  const CustomCard({
    Key? key,
    required this.titleText,
    required this.subtitleText,
    required this.weightText,
    required this.dropdownValue,
    required this.dropdownItems,
    required this.onDropdownChanged,
  }) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  String? selectedValue;
  @override
  void initState() {
    super.initState();
    selectedValue = widget.dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 100,
      ),
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.titleText,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: screenWidth - 150,
                    child: Text(
                      widget.subtitleText,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 110,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFB2EBF2),
                    ),
                    child: SizedBox(
                        width: 100,
                        height: 30,
                        child: Center(
                          child: Text(
                            widget.weightText,
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      customButton: Container(
                          width: 113,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF00BCD4),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10, right: 0),
                                child: Text('Ratting:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5, right: 0),
                                child: Text('$selectedValue'),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 0, right: 10),
                                child: Icon(Icons.arrow_drop_down),
                              ),


                            ],
                          )),
                      value: selectedValue,
                      items: widget.dropdownItems
                          .map((String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (value) {
                        widget.onDropdownChanged(value);
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                  )
                  // DecoratedBox(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: const Color(0xFF00BCD4),
                  //   ),
                  //   // child: SizedBox(
                  //   //   width: 130,
                  //   //   height: 30,
                  //   //   child: Row(
                  //   //     mainAxisSize: MainAxisSize.max,
                  //   //     children: [
                  //   //       DropdownButtonHideUnderline(
                  //   //         child: DropdownButton2<String>(
                  //   //           customButton: Row(
                  //   //             mainAxisSize: MainAxisSize.max,
                  //   //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   //             children: [
                  //   //               Text('Ratting $selectedValue'),
                  //   //               const Icon(Icons.arrow_drop_down),
                  //   //             ],
                  //   //           ),
                  //   //           value: selectedValue,
                  //   //           items: widget.dropdownItems
                  //   //               .map((String value) =>
                  //   //               DropdownMenuItem<String>(
                  //   //                 value: value,
                  //   //                 child: Text(value),
                  //   //               ))
                  //   //               .toList(),
                  //   //           onChanged: (value){
                  //   //             widget.onDropdownChanged(value);
                  //   //             setState(() {
                  //   //               selectedValue = value;
                  //   //             });
                  //   //           },
                  //   //         ),
                  //   //       ),
                  //   //     ],
                  //   //   ),
                  //   // ),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
