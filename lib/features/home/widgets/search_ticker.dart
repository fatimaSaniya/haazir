import 'dart:async';
import 'package:flutter/material.dart';
import '../../../constants/text_constants.dart';
import '../../../constants/color_constants.dart';

class SuggestionTicker extends StatefulWidget {
  const SuggestionTicker({super.key});

  @override
  State<SuggestionTicker> createState() => _SuggestionTickerState();
}

class _SuggestionTickerState extends State<SuggestionTicker> {
  int _index = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      setState(() {
        _index = (_index + 1) % TextConstants.serviceSuggestions.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = TextConstants.serviceSuggestions[_index];
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      child: Text(
        text,
        key: ValueKey(text),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: ColorConstants.textSecondary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}