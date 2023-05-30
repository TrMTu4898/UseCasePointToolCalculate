import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class TextEditing extends StatefulWidget {
  String title;
  bool isTitle;
  String content;
  bool isEditingState;
  bool isContainer;
  void Function(String) onChanged;
  TextEditing({
    Key? key,
    required this.isTitle,
    required this.title,
    required this.content,
    required this.isEditingState,
    required this.isContainer,
    required this.onChanged
  }) : super(key: key);
  @override
  _TextEditing createState() => _TextEditing();
}

class _TextEditing extends State<TextEditing> {
  bool _isEditing = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    return widget.isContainer ? Container(
      height: 50,
      width: screenWidth - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const SizedBox(width: 15,),
          widget.isTitle ? Text(
            widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ): const SizedBox(),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: _isEditing
                ? TextFormField(
                    initialValue: widget.content,
                    autocorrect: true,
                    autofocus: true,
                    onChanged: widget.onChanged,
                  )
                : Text(
                    widget.content,
                    style: const TextStyle(
                      color: Colors.grey,
                        fontSize: 18, fontWeight: FontWeight.normal),
                  ),
          ),
          widget.isEditingState
              ? IconButton(
                  onPressed: _toggleEditing,
                  icon: _isEditing
                      ? const Icon(
                          Boxicons.bxs_save,
                          size: 20,
                        )
                      : const Icon(
                          IconlyLight.edit,
                          size: 20,
                        ),
                )
              : const SizedBox(),
        ],
      ),
    ): Row(
      children: [
        Text(
          widget.content,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
