import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';

class TeachersCard extends StatelessWidget {
  const TeachersCard({
    Key? key,
    required this.img,
    required this.teacherName,
    required this.subject,
    required this.location,
    required this.onPressed,
  }) : super(key: key);

  final String img;
  final String teacherName;
  final String subject;
  final String location;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          color: Theme.of(context).colorScheme.onPrimary,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: ListTile(
              leading: FittedBox(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(img),
                  radius: 70,
                ),
              ),
              title: Container(
                margin: EdgeInsets.only(right: 5),
                child: Text(
                  teacherName,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: lightColorScheme.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (location.isNotEmpty )
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20,
                          color: Theme.of(context).colorScheme.onErrorContainer,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            location,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 6.h),
                  if (subject.isNotEmpty) // Check if subject is not empty
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            subject,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: lightColorScheme.secondary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
