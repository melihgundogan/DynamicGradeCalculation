import 'package:dynamic_grade_calculation/constants/app_constants.dart';
import 'package:dynamic_grade_calculation/model/lesson.dart';
import 'package:dynamic_grade_calculation/widgets/grade_show.dart';
import 'package:dynamic_grade_calculation/widgets/harf_dropdown_widget.dart';
import 'package:dynamic_grade_calculation/widgets/kredi_dropdown_widget.dart';
import 'package:dynamic_grade_calculation/widgets/lesson_list.dart';
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
  String girilenDersAdi = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                child: GradeShow(
                    average: DataHelper.ortalamaHesapla(),
                    numberOfLessons: DataHelper.tumEklenenDersler.length),
              ),
            ],
          ),
          Expanded(child: LessonList(
            onElemanCikarildi: (index) {
              DataHelper.tumEklenenDersler.removeAt(index);
              print("Eleman çıkarıldı index: $index");
              setState(() {});
            },
          )),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: HarfDropDownWidget(
                    onHarfSecildi: (harf) {
                      secilenHarfDeger = harf;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: KrediDropDownWidget(
                    onKrediSecildi: (kredi) {
                      secilenKrediDeger = kredi;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: _dersEkleveOrtalamaHesapla,
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
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return "Ders Adını Giriniz";
        } else
          return null;
      },
      decoration: InputDecoration(
        hintText: "Matematik",
        border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.primaryColor.shade100.withOpacity(0.3),
      ),
    );
  }

  void _dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Lesson(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDeger,
          krediDegeri: secilenKrediDeger);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
