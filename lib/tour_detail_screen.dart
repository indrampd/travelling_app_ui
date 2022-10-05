import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelling_app/models/tour_model.dart';

class TourDetailScreen extends StatefulWidget {
  final Tour tour;
  const TourDetailScreen({
    super.key,
    required this.tour,
  });

  @override
  State<TourDetailScreen> createState() => _TourDetailScreenState();
}

class _TourDetailScreenState extends State<TourDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.tour.imageUrl,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      child: Image.asset(
                        widget.tour.imageUrl,
                        height:
                            size.width > 600 ? size.height : size.height * 0.45,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.07,
                  child: Container(
                    height: 60,
                    width: 180,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: SvgPicture.asset(
                              'assets/icons/icons8-left-arrow.svg',
                              height: 26,
                              width: 26,
                              color: Colors.blueGrey.shade200,
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 1,
                          color: Colors.blueGrey.shade100,
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.tour.isFavorite =
                                    !widget.tour.isFavorite;
                              });
                            },
                            icon: SvgPicture.asset(
                              widget.tour.isFavorite
                                  ? 'assets/icons/icons8-love-fill.svg'
                                  : 'assets/icons/icons8-love-outline.svg',
                              height: 26,
                              width: 26,
                              color: widget.tour.isFavorite == true
                                  ? Colors.blueAccent
                                  : Colors.blueGrey.shade200,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.tour.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                            ),
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                widget.tour.group,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueGrey.shade400,
                                  height: 1,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    color: Colors.blueGrey.shade400,
                                  ),
                                ),
                              ),
                              Text(
                                '${widget.tour.distance}Km',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueGrey.shade400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/icons8-comment.svg',
                        height: 35,
                        width: 35,
                        color: Colors.blueGrey.shade200,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.blueGrey.shade200,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          Text(
                            widget.tour.rating.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              color: Colors.blueGrey.shade400,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/icons8-star-fill.svg',
                            height: 24,
                            width: 24,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.tour.time,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueAccent,
                        ),
                      ),
                      //// people
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 60),
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundImage: AssetImage(
                                      widget.tour.imageUrl,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 40),
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundImage: AssetImage(
                                      widget.tour.imageUrl,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundImage: AssetImage(
                                      widget.tour.imageUrl,
                                    ),
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundImage: AssetImage(
                                    widget.tour.imageUrl,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${widget.tour.groupSize}+',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              color: Colors.blueGrey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Started in:',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey.shade400,
                        ),
                      ),

                      //// Progress Bar
                      Stack(
                        children: [
                          Container(
                            height: 4,
                            width: 115,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade50,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          Container(
                            height: 4,
                            width: 115 *
                                widget.tour.groupSize /
                                widget.tour.groupSizeMax,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/maps.png'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.radio_button_checked,
                        size: 16,
                        color: Colors.blueGrey.shade400,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        widget.tour.startingPoint,
                        style: TextStyle(
                          color: Colors.blueGrey.shade400,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  // Center
                  Text(
                    ' - - - - -',
                    style: TextStyle(
                      color: Colors.blueGrey.shade200,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                  ),
                  // Ending Point
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/icons8-location-fill.svg',
                        height: 16,
                        width: 16,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        widget.tour.endingPoint,
                        style: const TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: const Center(
                    child: Text('Join This tour',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
