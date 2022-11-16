import 'package:flutter/material.dart';

class OrderListTile extends StatefulWidget {
  final Widget title;
  final ValueChanged<bool> onChangedOrder;
  const OrderListTile({
    Key? key,
    required this.title,
    required this.onChangedOrder,
  }) : super(key: key);

  @override
  State<OrderListTile> createState() => _OrderListTileState();
}

class _OrderListTileState extends State<OrderListTile> {
  bool isAsc = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.title,
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                onPressed: () {
                  setState(() {
                    isAsc = !isAsc;
                    widget.onChangedOrder(isAsc);
                  });
                },
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                icon: Icon(
                  isAsc ? Icons.arrow_downward : Icons.arrow_upward_outlined,
                ),
                label: const Text(
                  "Ages",
                  textAlign: TextAlign.start,
                ),
              ),
            )
          ]),
    );
  }
}
