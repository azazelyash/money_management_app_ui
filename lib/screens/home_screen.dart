import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_management_application/constants/color_constant.dart';
import 'package:money_management_application/models/card_model.dart';
import 'package:money_management_application/models/operation_model.dart';
import 'package:money_management_application/models/transaction_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print('Drawer Tapped');
                    },
                    child: SvgPicture.asset('assets/svg/drawer_icon.svg'),
                  ),
                  Container(
                    height: 59,
                    width: 59,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/yash.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                bottom: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Good Morning',
                    style: GoogleFonts.inter(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: kBlackColor,
                    ),
                  ),
                  Text(
                    'Yash Vishwakarma',
                    style: GoogleFonts.inter(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor,
                    ),
                  ),
                ],
              ),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 199,
              child: ListView.builder(
                physics: const PageScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16.0, right: 6.0),
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    height: 199,
                    width: 344,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                      color: Color(cards[index].cardBackground),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: SvgPicture.asset(cards[index].cardElementTop),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child:
                              SvgPicture.asset(cards[index].cardElementBottom),
                        ),
                        Positioned(
                          top: 48,
                          left: 29,
                          child: Text(
                            'CARDNUMBER',
                            style: GoogleFonts.inter(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: kWhiteColor),
                          ),
                        ),
                        Positioned(
                          top: 65,
                          left: 29,
                          child: Text(
                            cards[index].cardNumber,
                            style: GoogleFonts.inter(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: kWhiteColor),
                          ),
                        ),
                        Positioned(
                          right: 29,
                          top: 48,
                          child: Image.asset(
                            cards[index].cardType,
                            height: 35,
                            width: 35,
                          ),
                        ),
                        Positioned(
                          left: 29,
                          bottom: 55,
                          child: Text(
                            'CARD HOLDERNAME',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 29,
                          bottom: 30,
                          child: Text(
                            cards[index].user,
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 29,
                          bottom: 55,
                          child: Text(
                            'EXPIRE TIME',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 29,
                          bottom: 30,
                          child: Text(
                            cards[index].cardExpired,
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                bottom: 13.0,
                top: 29.0,
                right: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Operations',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor,
                    ),
                  ),
                  Row(
                    children: map<Widget>(
                      datas,
                      (index, selected) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: 9,
                          width: 9,
                          margin: const EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: current == index
                                ? kBlueColor
                                : kTwentyBlueColor,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 151,
              child: ListView.builder(
                physics: const PageScrollPhysics(),
                itemCount: datas.length,
                padding: const EdgeInsets.only(left: 16.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: OperationCard(
                      operation: datas[index].name,
                      selectedIcon: datas[index].selectedIcon,
                      unselectedIcon: datas[index].unselectedIcon,
                      isSelected: current == index,
                      context: this,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Transaction Histories',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: kBlackColor,
                ),
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              itemCount: transactions.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  height: 76.0,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 24.0,
                  ),
                  margin: const EdgeInsets.only(
                      bottom: 13.0, left: 16.0, right: 16.0),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: kTenBlackColor.withOpacity(0.05),
                        blurRadius: 12.0,
                        spreadRadius: 2.0,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 62,
                            width: 62,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(transactions[index].photo),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                transactions[index].name,
                                style: GoogleFonts.inter(
                                  fontSize: 16.0,
                                  color: kBlackColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                transactions[index].date,
                                style: GoogleFonts.inter(
                                  fontSize: 14.0,
                                  color: kGreyColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        transactions[index].amount,
                        style: GoogleFonts.inter(
                          fontSize: 14.0,
                          color: kBlueColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OperationCard extends StatefulWidget {
  final String operation;
  final String selectedIcon;
  final String unselectedIcon;
  final bool isSelected;
  _HomeScreenState context;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  OperationCard(
      {required this.operation,
      required this.selectedIcon,
      required this.isSelected,
      required this.unselectedIcon,
      required this.context});

  @override
  State<OperationCard> createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0, bottom: 28.0),
      width: 123,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: kTenBlackColor,
            blurRadius: 10.0,
            spreadRadius: 5.0,
            offset: Offset(8.0, 8.0),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        color: widget.isSelected ? kBlueColor : kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            widget.isSelected ? widget.selectedIcon : widget.unselectedIcon,
          ),
          const SizedBox(
            height: 9.0,
          ),
          Text(
            widget.operation,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                color: widget.isSelected ? kWhiteColor : kBlueColor),
          ),
        ],
      ),
    );
  }
}
