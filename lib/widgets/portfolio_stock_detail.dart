import 'package:flutter/material.dart';

class PortfolioStockDetail extends StatelessWidget {
  final int qty;
  final double stockPrice;
  final String stockName;
  const PortfolioStockDetail(this.qty, this.stockPrice, this.stockName,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            color: Colors.grey.shade100,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '$qty Qty.',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          'Avg. $stockPrice',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13),
                        )
                      ],
                    ),
                    const Text(
                      '-21.62%',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                    )
                  ],
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      stockName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const Text(
                      '-2931.75',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Invested',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          (stockPrice * qty).toStringAsFixed(2),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13),
                        )
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          'LTP 708.55',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '(-0.51%)',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const Divider(
          height: 25,
          color: Colors.grey,
        )
      ],
    );
  }
}
