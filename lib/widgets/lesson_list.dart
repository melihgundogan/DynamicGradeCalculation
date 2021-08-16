import 'package:dynamic_grade_calculation/constants/app_constants.dart';
import 'package:dynamic_grade_calculation/helper/data.dart';
import 'package:dynamic_grade_calculation/model/lesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LessonList extends StatelessWidget {
  final Function onElemanCikarildi;
  const LessonList({required this.onElemanCikarildi, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Lesson> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onElemanCikarildi(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.primaryColor,
                        child: Text((tumDersler[index].harfDegeri *
                                tumDersler[index].krediDegeri)
                            .toStringAsFixed(0)),
                      ),
                      subtitle: Text(
                          "${tumDersler[index].krediDegeri} Kredi, Not Değeri ${tumDersler[index].harfDegeri}"),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
                child: Text(
              "Lütfen Ders Ekleyin",
              style: Sabitler.titleStyle,
            )),
          );
  }
}
