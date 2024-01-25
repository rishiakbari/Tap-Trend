import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:taptrend/utils/colorz.dart';


class InsightScreen extends StatefulWidget {
  const InsightScreen({super.key});

  static const routeName = '/insights-screen';
  @override
  State<InsightScreen> createState() => _InsightScreenState();
}

class _InsightScreenState extends State<InsightScreen> {
  @override
  Widget build(BuildContext context) {
    var defaultValue="";
    return Scaffold(
      drawer: const NavBarScreen(),
      backgroundColor: Colorz.screenBackground,
     appBar: AppBar(
        backgroundColor: Colorz.appBar,
        iconTheme: const IconThemeData(color: Colorz.main),
      ),
      body: ListView(
        children: [
           Padding(
            padding: const EdgeInsets.symmetric(horizontal:30,),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colorz.main,width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: defaultValue,
                  isExpanded: true,
                  // isDense: true,
                  menuMaxHeight: 350,
                  items: const [
                  DropdownMenuItem (
                  value: "",
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Card",style: TextStyle(color: Colorz.main,fontSize: 18),
                    ),
                   ),
                  ),
                ],
                  onChanged: (value){},
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:40),
            child: Container(
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colorz.textSecondary),
                borderRadius: BorderRadius.circular(30)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/insights.png',scale: 1.3,),
                  const SizedBox(height: 10,),
                  const Text("Tap Streak : 12",style: TextStyle(color: Colorz.textPrimary,fontSize: 22,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  const Text("You've tapped 0 consecutive day",style: TextStyle(color: Colorz.textSecondary,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          const Center(child: Text("Your Insights",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400,color: Colorz.textWhite),)),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                  border: Border.all(color: Colorz.insightGradientborder,width: 0.3),
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                      colors: [
                        Colorz.insightBoxGradient1,
                        Colorz.insightBoxGradient2,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "12",
                                style: Theme.of(context)
                                .textTheme.headlineLarge!
                                .copyWith(
                                color: Colorz.textWhite,
                                fontWeight: FontWeight.w600)
                                ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Icon(
                                    TablerIcons.info_small,
                                    color: Colorz.main,
                                    size: 40,
                                    ),
                                ),
                              ),
                            ),
                          ],
                        ),
                         Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Taps",
                            style: Theme.of(context)
                            .textTheme.titleSmall!
                            .copyWith(
                            color: Colorz.textSecondary,
                            fontWeight: FontWeight.w600),
                            ),
                         ),
                        const Spacer(),
                         Container(
                          height: 60,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/chart.png"))
                           ),
                         )
                      ],
                    ),
                  ),
                   Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                    border: Border.all(color: Colorz.insightGradientborder,width: 0.3),
                    borderRadius: BorderRadius.circular(40),
                    // color: Colorz.insightBoxGradient1,
                     gradient:const LinearGradient(
                      colors: [
                        Colorz.insightBoxGradient1,
                        Colorz.insightBoxGradient2,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                              '0',
                              style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                              color: Colorz.textWhite,
                              fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10,),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Icon(TablerIcons.info_small,color: Colorz.main,size: 40,),
                                ),
                              ),
                            )
                          ],
                         ),
                         Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Link Taps",
                            style: Theme.of(context)
                            .textTheme.titleSmall!
                            .copyWith(
                            color: Colorz.textSecondary,
                            fontWeight: FontWeight.w600),
                            ),
                         ),
                         const Spacer(),
                         Container(
                          height: 60,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/chart.png"))
                          ),
                         )
                      ],
                    ),
                  ),
                   Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colorz.insightGradientborder,width: 0.3),
                    gradient: const LinearGradient(
                      colors: [
                        Colorz.insightBoxGradient1,
                        Colorz.insightBoxGradient2,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                              '0',
                              style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                              color: Colorz.textWhite,
                              fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10,),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Icon(TablerIcons.info_small,color: Colorz.main,size: 40,),
                                ),
                              ),
                            )
                          ],
                         ),
                         Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "New Connections",
                            style: Theme.of(context)
                            .textTheme.titleSmall!
                            .copyWith(
                            color: Colorz.textSecondary,
                            fontWeight: FontWeight.w600),
                            ),
                         ),
                         const Spacer(),
                         Container(
                          height: 60,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/chart.png"))
                          ),
                         ),
                      ]
                    ),
                  ),
                    Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colorz.insightGradientborder,width: 0.3),
                    gradient: const LinearGradient(
                      colors: [
                        Colorz.insightBoxGradient1,
                        Colorz.insightBoxGradient2,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                              '0%',
                              style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                              color: Colorz.textWhite,
                              fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10,),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Icon(TablerIcons.info_small,color: Colorz.main,size: 40,),
                                ),
                              ),
                            )
                          ],
                         ),
                         Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Taps Through Rate",
                            style: Theme.of(context)
                            .textTheme.titleSmall!
                            .copyWith(
                            color: Colorz.textSecondary,
                            fontWeight: FontWeight.w600),
                            ),
                         ),
                         const Spacer(),
                         Container(
                          height: 60,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/chart.png"))
                          ),
                         ),
                      ],
                  ),
                ),
              ],
            ),
              const SizedBox(height: 20,),
              const Column(
                children: [
                  Text(
                  "Link Engagement",
                  style: TextStyle(
                  color: Colorz.textWhite,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
                    )
                  ],
                ) 
              ],
            ),
          )
        ],
      ),
    );
  }
}