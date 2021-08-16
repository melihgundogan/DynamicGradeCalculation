import 'package:dynamic_grade_calculation/constants/app_constants.dart';
import 'package:dynamic_grade_calculation/helper/data.dart';
import 'package:flutter/material.dart';

class HarfDropDownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  HarfDropDownWidget({required this.onHarfSecildi, Key? key}) : super(key: key);

  @override
  _HarfDropDownWidgetState createState() => _HarfDropDownWidgetState();
}

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
  double secilenHarfDeger = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.primaryColor.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        value: secilenHarfDeger,
        elevation: 16,
        iconEnabledColor: Sabitler.primaryColor.shade200,
        onChanged: (deger) {
          setState(() {
            secilenHarfDeger = deger!;
            widget.onHarfSecildi(secilenHarfDeger);
          });
        },
        underline: Container(),
        items: DataHelper.tumDersHarfleri(),
      ),
    );
  }
}
