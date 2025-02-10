import 'package:flutter/material.dart';

class AnimatedSegmentedButton extends StatefulWidget {
  final double width;

  const AnimatedSegmentedButton({super.key, required this.width});

  @override
  State<AnimatedSegmentedButton> createState() =>
      _AnimatedSegmentedButtonState();
}

class _AnimatedSegmentedButtonState extends State<AnimatedSegmentedButton> {
  int _selectedIndex = 0;
  double _indicatorPosition = 0.0;

  @override
  void initState() {
    _indicatorPosition = _selectedIndex == 0 ? 0.0 : widget.width / 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            left: _indicatorPosition,
            top: 0,
            bottom: 0,
            child: Container(
              width: widget.width / 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSegmentButton(
                index: 0,
                label: 'ir agora',
                width: widget.width / 2,
                icon: Icons.flash_on_rounded,
              ),
              _buildSegmentButton(
                index: 1,
                label: 'ir outro dia',
                width: widget.width / 2,
                icon: Icons.date_range_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentButton({
    required int index,
    required String label,
    required IconData icon,
    required double width,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          _indicatorPosition = index == 0 ? 0.0 : width;
        });
      },
      child: Container(
        width: width,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: _selectedIndex == index
                  ? Theme.of(context).primaryColor
                  : Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: _selectedIndex == index ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
