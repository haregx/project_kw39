import 'package:flutter/material.dart';
import 'package:project_kw39/components/gallery_item.dart';


class DetailsPage extends StatelessWidget {
	final GalleryItemCard item;

	const DetailsPage({
    super.key, 
    required this.item
  });

		@override
		Widget build(BuildContext context) {
			return Scaffold(
				appBar: AppBar(
					title: Text(item.imageTitle),
          centerTitle: true,
				),
						body: SafeArea(
							child: SingleChildScrollView(
								padding: const EdgeInsets.all(16.0),
								child: Align(
									alignment: Alignment.topCenter,
									child: ConstrainedBox(
										constraints: const BoxConstraints(maxWidth: 600),
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 16,
											children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final maxHeight = MediaQuery.of(context).size.height * 0.5;
                              return ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: maxHeight,
                                  maxWidth: constraints.maxWidth,
                                ),
                                child: Image.asset(
                                  item.imagePath,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),
                        	Text(
													item.imageDate,
													style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
													textAlign: TextAlign.end,
												),
												/*Text(
													item.imageTitle,
													style: Theme.of(context).textTheme.headlineSmall,
													textAlign: TextAlign.center,
												),*/
											
												Text(
													item.imageDescription,
													style: Theme.of(context).textTheme.bodyLarge,
													textAlign: TextAlign.start,
												),
											],
										),
									),
								),
							),
						),
					);
		}
}
