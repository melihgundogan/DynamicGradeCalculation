import 'package:dynamic_grade_calculation/constants/app_constants.dart';
import 'package:dynamic_grade_calculation/widgets/grade_show.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_grade_calculation/helper/data.dart';

class GradeCalculation extends StatefulWidget {
  const GradeCalculation({Key? key}) : super(key: key);

  @override
  _GradeCalculationState createState() => _GradeCalculationState();
}

class _GradeCalculationState extends State<GradeCalculation> {
  var formKey = GlobalKey<FormState>();
  double secilenHarfDeger = 4;
  double secilenKrediDeger = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            Sabitler.titleText,
            style: Sabitler.titleStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: _buildForm()),
              Expanded(
                flex: 1,
                child: GradeShow(average: 5, numberOfLessons: 0),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: Text("Liste buraya gelecek"),
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(padding: Sabitler.yatayPadding8, child: _buildTextFormField(),),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8, 
                    child: _buildHarfler(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8, 
                    child: _buildKrediler(),
                ),
              ),
              
              IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.primaryColor,
                iconSize: 30,  
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Matematik",
        border: OutlineInputBorder(borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.primaryColor.shade100.withOpacity(0.3),
      ),
    );
  }

  _buildHarfler() {
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
          });
        },
        underline: Container(),
        items: DataHelper.tumDersHarfleri(),
      ),
    );
  }

  _buildKrediler() {
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
          });
        },
        underline: Container(),
        items: DataHelper.tumKrediler(),
      ),
    );
  }
}
