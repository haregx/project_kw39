import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:project_kw39/components/gallery_item.dart';
import 'package:project_kw39/constants/routes.dart';
import 'package:project_kw39/data/gallery_data.dart';
import 'package:project_kw39/screens/aboutme.dart';

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
     double cardPadding = 4;

     double screenWidth = MediaQuery.of(context).size.width;
     double tmpCardWidth = math.min(screenWidth, baseCardWidth);
     int rows = (screenWidth.toInt()) ~/ (tmpCardWidth.toInt());
     rows = rows > 0 ? rows : 1;

     Widget galleryBody = SafeArea(
       child: GridView.builder(
         padding: EdgeInsets.all(8.0),
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
              context.go(AppRouteConstants.details, extra: item);
             /*  Navigator.of(context).push(
                 MaterialPageRoute(
                   builder: (context) => DetailsPage(item: item),
                 ),
               );*/
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
         centerTitle: true,
       ),
       body: _selectedIndex == 0 ? galleryBody : aboutMeBody,
       bottomNavigationBar: NavigationBar(
         selectedIndex: _selectedIndex,
         onDestinationSelected: _onNavBarTapped,
         destinations: const [
           NavigationDestination(
             icon: Icon(LucideIcons.image),
             label: 'Bildergalerie',
           ),
           NavigationDestination(
             icon: Icon(LucideIcons.user),
             label: 'Über mich ...',
           ),
         ],
       ),
     );
   }
}

