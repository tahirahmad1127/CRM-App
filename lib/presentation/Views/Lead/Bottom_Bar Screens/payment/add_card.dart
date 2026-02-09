import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(' ');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class CardExpiryInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != text.length) {
        buffer.write('/');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  String? selectedCardType = 'Visa';
  final List<String> cardTypes = ['Visa', 'Master Card', 'American Express'];

  final Map<String, String> cardTypeLogos = {
    'Visa': 'assets/images/visa_logo.png',
    'Master Card': 'assets/images/mastercard_logo.png',
    'American Express': 'assets/images/amex_logo.png',
  };

  final Map<String, CardType> cardTypeEnums = {
    'Visa': CardType.visa,
    'Master Card': CardType.mastercard,
    'American Express': CardType.americanExpress,
  };

  final Map<String, Color> cardTypeColors = {
    'Visa': Color(0xff1E1E1E),
    'Master Card': Color(0xff2C3E50),
    'American Express': Color(0xff34495E),
  };

  String _maskCardNumber(String number) {
    if (number.length < 8) return number;
    String cleaned = number.replaceAll(' ', '');
    if (cleaned.length < 8) return number;

    String first4 = cleaned.substring(0, 4);
    String last4 = cleaned.substring(cleaned.length - 4);
    return '$first4 **** **** $last4';
  }

  void _saveCard() {
    if (formKey.currentState!.validate()) {
      // Create the card data
      Map<String, dynamic> newCard = {
        'cardType': selectedCardType!,
        'logoPath': cardTypeLogos[selectedCardType]!,
        'cardNumber': cardNumber,
        'displayNumber': _maskCardNumber(cardNumber),
        'expiryDate': expiryDate,
        'cvv': cvvCode,
        'displayCvv': cvvCode.length == 4 ? '****' : '***',
        'cardHolderName': cardHolderName.toUpperCase(),
        'cardTypeEnum': cardTypeEnums[selectedCardType]!,
        'cardColor': cardTypeColors[selectedCardType]!,
      };

      // Return the card data to the previous screen
      Navigator.pop(context, newCard);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Card added successfully!',
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: Color(0xFF80D050),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        title: Text(
          'Add Card',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Credit Card Preview - Full Width
                    CreditCardWidget(
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      showBackView: isCvvFocused,
                      onCreditCardWidgetChange: (CreditCardBrand brand) {},
                      cardBgColor: cardTypeColors[selectedCardType] ?? Color(0xff1E1E1E),
                      obscureCardNumber: false,
                      obscureCardCvv: false,
                      isHolderNameVisible: true,
                      isSwipeGestureEnabled: true,
                      cardType: cardTypeEnums[selectedCardType] ?? CardType.visa,
                      labelCardHolder: 'CARD HOLDER',
                    ),

                    // Rest of the form with padding
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(20),

                          // Card Type Dropdown
                          Text(
                            'Card Type',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                            ),
                          ),
                          Gap(8),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Color(0xffE0E0E0),
                                width: 1,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedCardType,
                                isExpanded: true,
                                icon: Icon(Icons.keyboard_arrow_down, color: Color(0xff424242)),
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff424242),
                                ),
                                items: cardTypes.map((String type) {
                                  return DropdownMenuItem<String>(
                                    value: type,
                                    child: Text(type),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCardType = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                          Gap(20),

                          // Custom Card Form
                          Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Card Number
                                Text(
                                  'Card Number',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                Gap(8),
                                TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      cardNumber = value;
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(16),
                                    CardNumberInputFormatter(),
                                  ],
                                  decoration: InputDecoration(
                                    hintText: 'XXXX XXXX XXXX XXXX',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Color(0xffBDBDBD),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xffF5F5F5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Color(0xffE0E0E0)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Color(0xffE0E0E0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Color(0xff2196F3), width: 2),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter card number';
                                    }
                                    if (value.replaceAll(' ', '').length < 13) {
                                      return 'Please enter valid card number';
                                    }
                                    return null;
                                  },
                                ),
                                Gap(16),

                                // Card Holder Name
                                Text(
                                  'Card Holder Name',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                Gap(8),
                                TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      cardHolderName = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Enter card holder name',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Color(0xffBDBDBD),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xffF5F5F5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Color(0xffE0E0E0)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Color(0xffE0E0E0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Color(0xff2196F3), width: 2),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter card holder name';
                                    }
                                    return null;
                                  },
                                ),
                                Gap(16),

                                // Expiry Date and CVV Row
                                Row(
                                  children: [
                                    // Expiry Date
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Expiry Date',
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                          Gap(8),
                                          TextFormField(
                                            onChanged: (value) {
                                              setState(() {
                                                expiryDate = value;
                                              });
                                            },
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              LengthLimitingTextInputFormatter(4),
                                              CardExpiryInputFormatter(),
                                            ],
                                            decoration: InputDecoration(
                                              hintText: 'MM/YY',
                                              hintStyle: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: Color(0xffBDBDBD),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xffF5F5F5),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: BorderSide(color: Color(0xffE0E0E0)),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: BorderSide(color: Color(0xffE0E0E0)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: BorderSide(color: Color(0xff2196F3), width: 2),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Required';
                                              }
                                              if (value.length < 5) {
                                                return 'Invalid date';
                                              }
                                              return null;
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap(16),

                                    // CVV
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'CVV',
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                          Gap(8),
                                          TextFormField(
                                            onChanged: (value) {
                                              setState(() {
                                                cvvCode = value;
                                              });
                                            },
                                            onTap: () {
                                              setState(() {
                                                isCvvFocused = true;
                                              });
                                            },
                                            onEditingComplete: () {
                                              setState(() {
                                                isCvvFocused = false;
                                              });
                                            },
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly,
                                              LengthLimitingTextInputFormatter(4),
                                            ],
                                            decoration: InputDecoration(
                                              hintText: 'XXX',
                                              hintStyle: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: Color(0xffBDBDBD),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xffF5F5F5),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: BorderSide(color: Color(0xffE0E0E0)),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: BorderSide(color: Color(0xffE0E0E0)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: BorderSide(color: Color(0xff2196F3), width: 2),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Required';
                                              }
                                              if (value.length < 3) {
                                                return 'Invalid';
                                              }
                                              return null;
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Gap(30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Save Button
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _saveCard,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF80D050),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Save Card',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}