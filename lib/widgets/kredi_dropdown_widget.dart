import 'package:dynamic_grade_calculation/constants/app_constants.dart';
import 'package:dynamic_grade_calculation/helper/data.dart';
import 'package:flutter/material.dart';

class KrediDropDownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  KrediDropDownWidget({required this.onKrediSecildi, Key? key})
      : super(key: key);

  @override
  _KrediDropDownWidgetState createState() => _KrediDropDownWidgetState();
}

class _KrediDropDownWidgetState extends State<KrediDropDownWidget> {
  double secilenKrediDeger = 1;
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
        value: secilenKrediDeger,
        elevation: 16,
        iconEnabledColor: Sabitler.primaryColor.shade200,
        onChanged: (deger) {
          setState(() {
            secilenKrediDeger = deger!;
            widget.onKrediSecildi(secilenKrediDeger);
          });
        },
        underline: Container(),
        items: DataHelper.tumKrediler(),
      ),
    );
  }
}
