import 'package:flutter/material.dart';

class ModalContainer extends StatefulWidget {
  const ModalContainer({super.key, required this.child, this.padding});

  final EdgeInsets? padding;
  final Widget child;

  @override
  State<ModalContainer> createState() => _ModalContainerState();
}

class _ModalContainerState extends State<ModalContainer> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scrollbar(
    thumbVisibility: true,
    controller: _scrollController,
    child: SingleChildScrollView(
      padding: widget.padding,
      controller: _scrollController,
      child: widget.child,
    ),
  );
}
