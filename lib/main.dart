import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    body: const ButterfliesList(),
    appBar: AppBar(title: const Text("Butterflies")),
  )));
}

class ButterfliesList extends StatefulWidget {
  const ButterfliesList({Key? key}) : super(key: key);

  @override
  _ButterfliesListState createState() => _ButterfliesListState();
}

class _ButterfliesListState extends State<ButterfliesList> {
  final List<String> _butterflies = <String>[
    "Голубянка алексис",
    "Капустница",
    "Крапивница",
    "Переливница большая",
    "Червонец фиолетовый"
  ];

  final List<String> _descriptions = <String>[
    "Размер 13–17 мм. Крылья самцов сверху фиолетово-синие, с чёрной каймой шириной до 1 мм; у самок — бурые, с напылением синих чешуек у корня. Передние крылья снизу с прямым рядом чёрных пятен, образующим резкий излом па четвёртом сверху пятне. Задние крылья снизу по всей прикорневой половине напылены блестящими голубыми чешуйками.",
    "Бабочку назвали в честь одноименного названия овощной культуры – капусты (лат. brassica), которая является основной пищей для данного вида.Размах крыльев взрослой особи самца от 49 до 62 мм, самки 51-63 мм. Окрас крыльев у бабочки белый, на них имеются несколько черных пятен. Внешний угол передних крыльев скруглен фактически до середины и имеет темную оторочку.",
    "Вид распространён в Европе и, после значительного разрыва, на Дальнем Востоке.Размер 34–45 мм. Крылья сверху чёрно-бурые, с контрастными белыми пятнами на передних крыльях и с перевязью на задних крыльях. У самцов под определённым углом имеют сильный фиолетовый отлив. Отличительным признаком от других видов переливниц служит острый зубцевидный выступ белой перевязи на задних крыльях.",
    "Одна из самых ярких и красочных представительниц дневных бабочек. Свое название она получила благодаря пищевым пристрастиям. Эти насекомые не только питаются крапивой, но и дят на листьях данного растения, не боясь быть ужаленными. Иногда их называют «шоколадницами». У этих созданий необычайно красивые и нежные крылья.",
    "Бабочка имеет темно-коричневую общую окраску. Размах крыльев 60—70 мм. Крылья с синим отливом. На передних крыльях расположены белые косые пятна, на задних — такие же пятна образуютчасто си перевязь. На задних крыльях бабочки темный глазок с красно-коричневой окантовкой."
  ];

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
          _selectedIndex == -1
              ? "Nothing selected"
              : " ${_butterflies[_selectedIndex]}",
          style: const TextStyle(fontSize: 30)),
      SizedBox(
          height: 500.0,
          child: Text(_selectedIndex == -1 ? '' : _descriptions[_selectedIndex],
              style: const TextStyle(fontSize: 20))),
      Expanded(
          child: SizedBox(
              height: 100.0,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemExtent: 200,
                  itemCount: _butterflies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) => Card(
                      elevation: 0.5,
                      shape: const Border(
                          right: BorderSide(color: Colors.transparent, width: 0.5)),
                      child: ListTile(
                          leading: const Text("\u{1F98B}"),
                          onTap: () {
                            setState(() {
                              // устанавливаем индекс выделенного элемента
                              _selectedIndex = index;
                            });
                          },
                          title: Text(':butterfly: ' + _butterflies[index],
                              style: const TextStyle(fontSize: 24)),
                          selected: index == _selectedIndex)))))
    ]);
  }
}
