import 'package:flutter/material.dart';

import '../../configurations/frontend_configs.dart';

class MySwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const MySwitch({super.key, required this.value, required this.onChanged});

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 65,
        height: 32,
        decoration: BoxDecoration(
          color: widget.value ? const Color(0xFFF5BDB1).withValues(alpha: 0.4) : const Color(0xFFE4E4E4),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              color: widget.value ? FrontendConfigs.kBlackColor.withValues(alpha: 0.1) : FrontendConfigs.kBlackColor.withValues(alpha: 0.25)
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            alignment: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: widget.value ? const Color(0xFFF5BDB1) : Color(0xffA7A7A7),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 0.02,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}