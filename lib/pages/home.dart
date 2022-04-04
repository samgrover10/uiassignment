import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> modes = ["Insomnia", "Depression", "Baby Sleep"];
  Map<Color, Color> recColors = {
    
    Color(0xff13DEA0): Color(0xff06B782),
    Color(0xffFC67A7): Color(0xffF6815B),
    Color(0xffFFD541): Color(0xffF0B31A),
    Color(0xff441DFC): Color(0xff4E81EB),
  };
  List<String> recentItems = [
    "Calming Sounds",
    "Insomnia",
    "For Children",
    "Tips for sleeping"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121421),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        
        scrollDirection: Axis.vertical,
      
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discover',
                    style: TextStyle(
                        fontSize: 32.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.search,
                    size: 30.0,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 2.0,
                width: 50.0,
                color: const Color(0xff4A80F0),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Container(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(
                      modes.length, (index) => ModeItem(modes[index])),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended",
                    style:
                        TextStyle(color: const Color(0xff343A52), fontSize: 16.0),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(color: Color(0xff3C67C2), fontSize: 12.0),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RecommendedItem(const Color(0xff441DFC), recColors),
                    RecommendedItem(const Color(0xffFFD541), recColors)
                  ],
                ),
              ),
            ),
           const Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Recent",
                style: TextStyle(color: const Color(0xff343A52), fontSize: 16.0),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            GridView.builder(
              shrinkWrap: true,
              padding:const EdgeInsets.symmetric(horizontal: 8.0),
                itemCount: recentItems.length,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4/3,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0),
                itemBuilder: (_, index) {
                  return RecentItem(recColors,
                      recColors.keys.elementAt(index % 4), recentItems[index]);
                })
          ],
        ),
      ),
    );
  }
}

class ModeItem extends StatefulWidget {
  final title;
  const ModeItem(this.title);
  @override
  State<ModeItem> createState() => _ModeItemState();
}

class _ModeItemState extends State<ModeItem> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color:
                          isSelected ? const Color(0xff4A80F0) : Colors.black,
                      blurRadius: 5.0)
                ],
                borderRadius: BorderRadius.circular(10.0),
                color: isSelected
                    ? const Color(0xff4A80F0)
                    : const Color(0xff1C2031)),
          ),
        ),
      ),
    );
  }
}

class RecommendedItem extends StatefulWidget {
  final Color color;
  final Map<Color, Color> recColor;
  const RecommendedItem(this.color, this.recColor);

  @override
  State<RecommendedItem> createState() => _RecommendedItemState();
}

class _RecommendedItemState extends State<RecommendedItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      width: MediaQuery.of(context).size.width * 0.7,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(colors: [
            widget.color,
            widget.recColor[widget.color] ?? Colors.black,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sleep Meditation",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.0),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            "7 day audio series",
            style: TextStyle(color: const Color(0xffACA9F9), fontSize: 18.0),
          ),
         const SizedBox(
            height: 60.0,
          ),
          Row(
            children: [
              Icon(
                Icons.headphones,
                size: 20.0,
                color: Colors.white,
              ),
              const SizedBox(
                width: 12.0,
              ),
              Icon(
                Icons.message,
                size: 20.0,
                color: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}

class RecentItem extends StatefulWidget {
  final Map<Color, Color> recColors;
  final Color color;
  final String title;
  const RecentItem(this.recColors, this.color, this.title);

  @override
  State<RecentItem> createState() => _RecentItemState();
}

class _RecentItemState extends State<RecentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.width * 0.25,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(colors: [
            widget.color,
            widget.recColors[widget.color] ?? Colors.black
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: AutoSizeText(
            widget.title,
            maxLines: 2,
            maxFontSize: 20.0,
            minFontSize: 16.0,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white),
          )),
          
          Icon(
            Icons.headphones,
            size: 20.0,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
