import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:project_kw39/components/gallery_item.dart';
import 'package:project_kw39/data/gallery_data.dart';
import 'package:project_kw39/screens/aboutme.dart';
import 'package:project_kw39/screens/details.dart';

class HomePage extends StatefulWidget {
	const HomePage({
    super.key
  });

	@override
	State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
	
    int _selectedIndex = 0;

    void _onNavBarTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

   @override
   Widget build(BuildContext context) {
     double baseCardWidth = 180;
     double cardPadding = 8;

     double screenWidth = MediaQuery.of(context).size.width;
     double tmpCardWidth = math.min(screenWidth, baseCardWidth);
     int rows = (screenWidth.toInt()) ~/ (tmpCardWidth.toInt());
     rows = rows > 0 ? rows : 1;

     Widget galleryBody = SafeArea(
       child: GridView.builder(
         padding: EdgeInsets.all(cardPadding / 2),
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: rows,
           crossAxisSpacing: cardPadding,
           mainAxisSpacing: cardPadding,
           childAspectRatio: 1,
         ),
         itemCount: galleryData.length,
         itemBuilder: (context, index) {
           final item = galleryData[index];
           return GestureDetector(
             onTap: () {
               Navigator.of(context).push(
                 MaterialPageRoute(
                   builder: (context) => DetailsPage(item: item),
                 ),
               );
             },
             child: GalleryItemCard(
               imageTitle: item.imageTitle,
               imageDate: item.imageDate,
               imageDescription: item.imageDescription,
               imagePath: item.imagePath,
               // size: effectiveCardWidth,
             ),
           );
         },
       ),
     );

     Widget aboutMeBody = const AboutMePage();

     return Scaffold(
       appBar: AppBar(
         foregroundColor: Theme.of(context).colorScheme.onPrimary,
         backgroundColor: Theme.of(context).colorScheme.primary,
         title: Text(_selectedIndex == 0 ? 'Bildergalerie' : 'Über mich ...'),
       ),
       body: _selectedIndex == 0 ? galleryBody : aboutMeBody,
       bottomNavigationBar: BottomNavigationBar(
         currentIndex: _selectedIndex,
         onTap: _onNavBarTapped,
         items: const [
           BottomNavigationBarItem(
             icon: Icon(Icons.photo_library),
             label: 'Bildergalerie',
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.account_circle),
             label: 'Über mich',
           ),
         ],
       ),
     );
   }
}

