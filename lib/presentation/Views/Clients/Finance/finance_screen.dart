import 'package:crm_app/presentation/Views/Clients/invoice_detail/invoice_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  final List<InvoiceData> invoices = [
    InvoiceData('INV842211', '12 Jul, 2025', '\$400.00', 'Paid'),
    InvoiceData('INV842211', '12 Jul, 2025', '\$400.00', 'Paid'),
    InvoiceData('INV842211', '12 Jul, 2025', '\$400.00', 'Paid'),
    InvoiceData('INV842211', '12 Jul, 2025', '\$400.00', 'Pending'),
    InvoiceData('INV842211', '12 Jul, 2025', '\$400.00', 'Pending'),
    InvoiceData('INV842211', '12 Jul, 2025', '\$400.00', 'Pending'),
    InvoiceData('INV842211', '12 Jul, 2025', '\$400.00', 'Pending'),
    InvoiceData('INV842211', '12 Jul, 2025', '\$400.00', 'Pending'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => InvoiceDetailScreen()));
          }, icon: Icon(Icons.arrow_forward))
        ],
        title: Text(
          "Finance",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Header Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Invoice No#',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Due Date',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Amount',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Status',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Invoice List
          Expanded(
            child: ListView.builder(
              itemCount: invoices.length,
              itemBuilder: (context, index) {
                final invoice = invoices[index];
                return _buildInvoiceRow(
                  invoice.invoiceNo,
                  invoice.dueDate,
                  invoice.amount,
                  invoice.status,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceRow(
      String invoiceNo,
      String dueDate,
      String amount,
      String status,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xff515151), width: 0.4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              invoiceNo,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              dueDate,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              amount,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: _buildStatusWidget(status),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusWidget(String status) {
    Color statusColor;

    switch (status.toLowerCase()) {
      case 'paid':
        statusColor = const Color(0xFF70EB25);
        break;
      case 'pending':
        statusColor = const Color(0xFFEB9F25);
        break;
      case 'rejected':
        statusColor = const Color(0xFFEC1C24);
        break;
      default:
        statusColor = Colors.grey;
    }

    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: statusColor,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          status,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class InvoiceData {
  final String invoiceNo;
  final String dueDate;
  final String amount;
  final String status;

  InvoiceData(this.invoiceNo, this.dueDate, this.amount, this.status);
}