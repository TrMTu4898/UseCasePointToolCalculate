import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class TextEditing extends StatefulWidget {
  final String title;
  String content;
  bool isEditingState;
  bool isTitle;
  bool isContainer;
  TextEditing({
    Key? key,
    required this.title,
    required this.content,
    required this.isEditingState,
    required this.isTitle,
    required this.isContainer,
  }) : super(key: key);
  @override
  _TextEditing createState() => _TextEditing();
}

class _TextEditing extends State<TextEditing> {
  late TextEditingController _textController;
  bool _isEditing = false;
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.content);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
      if (!_isEditing) {
        // Save the edited content
        widget.content = _textController.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
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
          widget.isTitle
              ? Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )
              : const SizedBox(),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: _isEditing
                ? TextFormField(
                    controller: _textController,
                    autocorrect: true,
                    autofocus: true,
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
        widget.isTitle
            ? Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )
            : const SizedBox(),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: _isEditing
              ? TextFormField(
            controller: _textController,
            autocorrect: true,
            autofocus: true,
          )
              : Text(
            widget.content,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.normal),
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
    );
  }
}
