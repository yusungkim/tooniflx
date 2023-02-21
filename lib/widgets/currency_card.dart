import 'package:flutter/material.dart';

const yOffset = -20;

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final int index;

  const CurrencyCard(
      {super.key,
      required this.name,
      required this.code,
      required this.amount,
      required this.icon,
      this.index = 0});

  @override
  Widget build(BuildContext context) {
    var isInverted = index % 2 != 0;
    var backgroundColor =
        isInverted ? Colors.white : const Color.fromRGBO(40, 40, 40, 1);
    var textColor = isInverted ? Colors.black : Colors.white;

    return Transform.translate(
      offset: Offset(0, yOffset * index.toDouble()),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          fontSize: 20,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          fontSize: 20,
                          color: textColor.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 2.2,
                child: Transform.translate(
                  offset: const Offset(-5, 12),
                  child: Icon(
                    icon,
                    color: textColor,
                    size: 88,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
