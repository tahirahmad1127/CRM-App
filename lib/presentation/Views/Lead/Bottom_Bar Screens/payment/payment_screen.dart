import 'package:crm_app/presentation/Views/Lead/Bottom_Bar%20Screens/payment/add_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String cardNumber = '4532 1234 5678 1234';
  String expiryDate = '12/25';
  String cardHolderName = 'JOHN DOE';
  String cvvCode = '123';
  bool isCvvFocused = false;
  int selectedCardIndex = 0;
  CardType selectedCardType = CardType.visa;
  Color selectedCardColor = Color(0xff1E1E1E);

  List<Map<String, dynamic>> savedCards = [
    {
      'cardType': 'Visa',
      'logoPath': 'assets/images/visa.png',
      'cardNumber': '4532 1234 5678 1234',
      'displayNumber': '4532 **** **** 1234',
      'expiryDate': '12/25',
      'cvv': '123',
      'displayCvv': '***',
      'cardHolderName': 'JOHN DOE',
      'cardTypeEnum': CardType.visa,
      'cardColor': Color(0xff1E1E1E), // Dark Gray/Black
    },
    {
      'cardType': 'Master Card',
      'logoPath': 'assets/images/mastercard.png',
      'cardNumber': '5425 2334 3010 5678',
      'displayNumber': '5425 **** **** 5678',
      'expiryDate': '08/26',
      'cvv': '456',
      'displayCvv': '***',
      'cardHolderName': 'JANE SMITH',
      'cardTypeEnum': CardType.mastercard,
      'cardColor': Color(0xff2C3E50), // Dark Blue
    },
    {
      'cardType': 'American Express',
      'logoPath': 'assets/images/american_express.png',
      'cardNumber': '3782 8224 6310 9012',
      'displayNumber': '3782 **** **** 9012',
      'expiryDate': '03/27',
      'cvv': '7890',
      'displayCvv': '****',
      'cardHolderName': 'MICHAEL BROWN',
      'cardTypeEnum': CardType.americanExpress,
      'cardColor': Color(0xff34495E), // Slate Gray
    },
  ];

  @override
  void initState() {
    super.initState();
    // Initialize with first card
    _selectCard(0);
  }

  void _selectCard(int index) {
    setState(() {
      selectedCardIndex = index;
      cardNumber = savedCards[index]['cardNumber'];
      expiryDate = savedCards[index]['expiryDate'];
      cardHolderName = savedCards[index]['cardHolderName'];
      cvvCode = savedCards[index]['cvv'];
      selectedCardType = savedCards[index]['cardTypeEnum'];
      selectedCardColor = savedCards[index]['cardColor'];
    });
  }

  void _addNewCard(Map<String, dynamic> newCard) {
    setState(() {
      savedCards.add(newCard);
      _selectCard(savedCards.length - 1); // Select the newly added card
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Payment',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCardScreen(),
            ),
          );
          if (result != null && result is Map<String, dynamic>) {
            _addNewCard(result);
          }
        },
        backgroundColor: Color(0xFF80D050),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Credit Card Widget - Full Width
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (CreditCardBrand brand) {},
              cardBgColor: selectedCardColor,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              isSwipeGestureEnabled: true,
              cardType: selectedCardType,
              labelCardHolder: 'CARD HOLDER',
            ),

            // Rest of content with padding
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(20),

                  // My Cards Section
                  Text(
                    'My Cards',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Gap(14),

                  // Card List
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: savedCards.length,
                    separatorBuilder: (context, index) => Gap(12),
                    itemBuilder: (context, index) {
                      return _buildCardTile(
                        cardType: savedCards[index]['cardType'],
                        logoPath: savedCards[index]['logoPath'],
                        cardNumber: savedCards[index]['displayNumber'],
                        expiryDate: savedCards[index]['expiryDate'],
                        cvv: savedCards[index]['displayCvv'],
                        isSelected: selectedCardIndex == index,
                        onTap: () => _selectCard(index),
                      );
                    },
                  ),
                  Gap(30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardTile({
    required String cardType,
    required String logoPath,
    required String cardNumber,
    required String expiryDate,
    required String cvv,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffE3F2FD) : Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Color(0xff2196F3) : Color(0xffE0E0E0),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Type with Logo
            Row(
              children: [
                Container(
                  width: 50,
                  height: 32,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Image.asset(
                    logoPath,
                    fit: BoxFit.contain,
                  ),
                ),
                Gap(12),
                Expanded(
                  child: Text(
                    cardType,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                if (isSelected)
                  Icon(
                    Icons.check_circle,
                    color: Color(0xff2196F3),
                    size: 24,
                  ),
              ],
            ),
            Gap(12),

            // Card Number
            Text(
              cardNumber,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff424242),
                letterSpacing: 1.2,
              ),
            ),
            Gap(10),

            // Expiry Date and CVV
            Row(
              children: [
                // Expiry Date
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Expiry Date',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff7E7E7E),
                      ),
                    ),
                    Gap(4),
                    Text(
                      expiryDate,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff424242),
                      ),
                    ),
                  ],
                ),
                Gap(40),

                // CVV
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CVV',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff7E7E7E),
                      ),
                    ),
                    Gap(4),
                    Text(
                      cvv,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff424242),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}