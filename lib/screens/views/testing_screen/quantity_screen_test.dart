import 'package:flutter/material.dart';

class QuantityInput extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int> onQuantityChanged;

  const QuantityInput({
    Key? key,
    this.initialValue = 1,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  _QuantityInputState createState() => _QuantityInputState();
}

class _QuantityInputState extends State<QuantityInput> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialValue;
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
      widget.onQuantityChanged(_quantity);
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
        widget.onQuantityChanged(_quantity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: _decrementQuantity,
          icon: const Icon(Icons.remove),
        ),
        Text('$_quantity'),
        IconButton(
          onPressed: _incrementQuantity,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
