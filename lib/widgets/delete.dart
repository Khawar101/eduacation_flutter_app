// import 'package:flip_card/flip_card.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CustomScrollViewPage extends StatefulWidget {
//   const CustomScrollViewPage({super.key, required List<SliverAppBar> slivers});

//   @override
//   State<CustomScrollViewPage> createState() => _CustomScrollViewPageState();
// }

// class _CustomScrollViewPageState extends State<CustomScrollViewPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body:CustomScrollView(
//       slivers:[
//         const SliverAppBar(
//        //   expandedHeight: 400,
//             elevation: 0,
//            // leading: Container(),
//             backgroundColor: Colors.orange,
//             title:  Padding(
//               padding: EdgeInsets.only(bottom: 20.0),
//               child: Column(
//                 children: [
//                   Text(
//                     "mDrive",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 32,
//                         height: 1.2,
//                         fontWeight: FontWeight.w400,
//                         fontFamily: ""),
//                   ),
              
                  
//                 ],
//               ),
//             ),
//             centerTitle: true,
           
//         ),
//         SliverAppBar(
//           expandedHeight: 300,
//         floating: true,
//         pinned: true,
//         primary: false,
//         collapsedHeight: 150,
       
//           flexibleSpace:LayoutBuilder(
//               builder: (BuildContext context, BoxConstraints constraints) {
//                  if (constraints.maxHeight > 200) {
//             return  Container(
//               height: 200,width: double.infinity,color: Colors.white,
//             child: FlipCard(
//             fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
//           //  direction: FlipDirection.HORIZONTAL, // default
//             side: CardSide.FRONT, // The side to initially display.
//             front: Container(
//               height: 200,
//           color: Colors.yellow,
//               child:Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: _buildTile(context),
//               ),
//             ),
//             back: Container(
//               child: Text('Back'),
//             ),
//           ),);
//           } else{
//             return Container(height: 150,color: Colors.black87,);
//           }
//               }),
//           //   child: Container(
//           //     height: 200,width: double.infinity,color: Colors.white,
//           //   child: FlipCard(
//           //   fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
//           // //  direction: FlipDirection.HORIZONTAL, // default
//           //   side: CardSide.FRONT, // The side to initially display.
//           //   front: Container(
//           //     height: 200,
//           // color: Colors.yellow,
//           //     child:Padding(
//           //       padding: const EdgeInsets.all(8.0),
//           //       child: _buildTile(context),
//           //     ),
//           //   ),
//           //   back: Container(
//           //     child: Text('Back'),
//           //   ),
//           // ),),
//           // ),

//           scrolledUnderElevation: 2.0,
        
//         ),

//        SliverList(delegate: SliverChildBuilderDelegate(( context , index){
//          return Column(
//            children: [
//             Container(height: 200,width: double.infinity,color: Colors.red,),
//             Container(height: 200,width: double.infinity,color: Colors.green,),
//             Container(
//               height: 800,
//               child: ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                       itemCount: 20 ,
//                       itemBuilder: (BuildContext context, int index) {
//               return Container(
//                 width: double.infinity,
//                 child: ListTile(
//                     leading: const Icon(Icons.list),
//                     trailing: const Text(
//                       "GFG",
//                       style: TextStyle(color: Colors.green, fontSize: 15),
//                     ),
//                     title: Text("List item $index")),
//               );
//                       }),
//             ),
//            ],
//          );
//        },
//        childCount: 1
//         ),),



//       ]
//     ),
    
//     );
//   }

//   Widget _buildTile(BuildContext context,  ){
//    return Stack(
//       children: [
//         Align(
//           alignment: Alignment.topCenter,
//           child: Container(
            
//             margin: const EdgeInsets.only(top: 0, bottom: 0),
//             height: MediaQuery.of(context).size.width / 2.1,
//             width: MediaQuery.of(context).size.width / 1.1,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white
//                 // image: DecorationImage(
//                 //     image: AssetImage(
//                 //      'assets/images/tree.jpg'
//                 //     ),
//                 //     fit: BoxFit.fill)
//                     ),
//           ),
//         ),
//         Container(
//            height: MediaQuery.of(context).size.width / 2.1,
//             width: MediaQuery.of(context).size.width / 1.1,
//           margin: const EdgeInsets.only(top: 0, left: 28, right: 28, bottom: 1),
//           // height: MediaQuery.of(context).size.height * 0.26,
//           // width: MediaQuery.of(context).size.width * 0.9,
//           decoration: BoxDecoration(
//             color: Colors.transparent,
//             border: Border.all(
//                 color: Colors.transparent, //primaryColor.withOpacity(0.1),
//                 width: 0.0),
//             borderRadius: BorderRadius.circular(10),
//           ),

//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // ClipRRect(
//                     //   borderRadius: BorderRadius.circular(25),
//                     //   child: Image.asset('assets/images/tree.jpg')
//                     // ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         left: 10.0,
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.34,
//                             child: Text(
//                               "name",
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: GoogleFonts.notoSans(
//                                   fontSize: 14,
//                                  color: Colors.black,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 0,
//                           ),
//                           Text(
//                             "ali zafr",
//                             style: GoogleFonts.notoSans(
//                                color: Colors.black,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w300),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.02,
//                 ),
//                 Text(
//                   "My Wallet",
//                   style: GoogleFonts.notoSans(
//                       fontSize: 18,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w800),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.009,
//                 ),
//                 Text(
//                   "Balance",
//                   style: GoogleFonts.notoSans(
//                       fontSize: 12,
//                      color: Colors.black,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 const SizedBox(
//                   height: 0,
//                 ),
//                 Text(
//                   "25000",
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: GoogleFonts.notoSans(
//                       fontWeight: FontWeight.w800,
//                       color: Colors.black,
//                       fontSize: 20),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

// }

