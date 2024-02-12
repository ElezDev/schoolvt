import 'package:flutter/material.dart';

class PagosPage extends StatefulWidget {
  const PagosPage({Key? key}) : super(key: key);

  @override
  _PagosPageState createState() => _PagosPageState();
}

class _PagosPageState extends State<PagosPage> {
  Map<String, Map<String, dynamic>> _selectedProducts = {
    'Carnet': {'selected': false, 'price': 100},
    'Comida': {'selected': false, 'price': 150},
    'Vicio': {'selected': false, 'price': 250},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Pagos Pendientes',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DataTable(
              columns: const [
                DataColumn(
                  label: Text(
                    'Producto',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Método de Pago',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Seleccionar',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
              rows: _selectedProducts.keys.map((String producto) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(producto),
                    ),
                    DataCell(
                      Row(
                        children: [
                          Image.asset('assets/images/pse.png',
                              width: 40, height: 40),
                          const SizedBox(width: 10),
                          const Text('PSE'),
                        ],
                      ),
                    ),
                    DataCell(
                      Checkbox(
                        value: _selectedProducts[producto]!['selected'],
                        onChanged: (bool? value) {
                          setState(() {
                            _selectedProducts[producto]!['selected'] = value!;
                          });
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                double total = 0; // Cambiar a double
                _selectedProducts.forEach((producto, detalles) {
                  if (detalles['selected']) {
                    total += detalles['price']; // Simplemente sumar el precio
                  }
                });

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Total a pagar'),
                      content:
                          Text('El total seleccionado es: ${total.toString()}'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cerrar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Calcular Total'),
            ),
          ],
        ),
      ),
    );
  }
}
