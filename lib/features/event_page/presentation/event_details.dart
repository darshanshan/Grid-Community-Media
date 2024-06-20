import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grid/core/widgets/appBar/tertiary_app_bar.dart';
import 'package:grid/core/widgets/button/cancel_button.dart';
import 'package:grid/core/widgets/button/main_button.dart';
import 'package:grid/core/widgets/button/save_button.dart';

class Eventdetails extends StatelessWidget {
  const Eventdetails({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle? subtitle = Theme.of(context).textTheme.displaySmall;
    final TextStyle? subValue = Theme.of(context).textTheme.labelMedium;
    return Scaffold(
        appBar: const TertiaryAppBarWidget(
          title: 'Event Details',
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                const Gap(15),
                Image.network(
                  'https://media.istockphoto.com/id/174771982/photo/the-first-sunlight-of-planet-earth.jpg?s=612x612&w=0&k=20&c=Bew8eTVva42p5PIPi0gekfJggC1Co_Hp87QCybQck_Y=',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                const Gap(16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              height: 100,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.calendar_today),
                                      const Gap(5),
                                      Text(
                                        'Date',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                  const Gap(15),
                                  Text(
                                    '5/7/2020',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              height: 100,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.access_time_rounded),
                                      const Gap(5),
                                      Text(
                                        'Starts on',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                  const Gap(15),
                                  Text(
                                    '10.00 am',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(16),
                      Row(
                        children: [
                          Text(
                            'Registrations : ',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          Text(
                            'Open',
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Text(
                            'Closed',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      const Gap(16),
                      Text(
                        'Event Name',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Text(
                            'Event Type : ',
                            style: subtitle,
                          ),
                          Text(
                            'Aritificial Intelligence',
                            style: subValue,
                          ),
                        ],
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Text(
                            'Location : ',
                            style: subtitle,
                          ),
                          Text(
                            'Auditorium',
                            style: subValue,
                          ),
                        ],
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Text(
                            'Website : ',
                            style: subtitle,
                          ),
                          Text(
                            'www.event.com',
                            style: subValue,
                          ),
                        ],
                      ),
                      const Gap(10),
                      Text(
                        'Description : ',
                        style: subtitle,
                      ),
                      const Gap(10),
                      Text(
                        'event description',
                        style: subValue,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: MainButton(
                      hintText: 'Register', onPressed: () {}, isLoading: false),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: CancelButton(
                              labelText: 'Manage', onPressed: () {})),
                      const Gap(20),
                      Expanded(
                          child: SaveButton(
                              labelText: 'Send Message',
                              onPressed: () {},
                              isLoading: false)),
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
