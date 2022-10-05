import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelling_app/models/destination_model.dart';
import 'package:travelling_app/models/tour_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentIndex = 0;
  double sizeIcon = 25;
  double totalWidthBar = 210;
  List<String> tabName = [
    'Lakes',
    'Jungle',
    'Mountains',
    'Lakes',
    'Jungle',
    'Mountains',
    'Lakes',
    'Jungle',
    'Mountains',
  ];

  List<String> iconList = [
    'assets/icons/icons8-lake-200.png',
    'assets/icons/icons8-forest-200.png',
    'assets/icons/icons8-mountain-200.png',
    'assets/icons/icons8-lake-200.png',
    'assets/icons/icons8-forest-200.png',
    'assets/icons/icons8-mountain-200.png',
    'assets/icons/icons8-lake-200.png',
    'assets/icons/icons8-forest-200.png',
    'assets/icons/icons8-mountain-200.png',
  ];

  List<IconData> icons = [
    Icons.home,
    Icons.search,
    Icons.favorite,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.grey.shade50,
        foregroundColor: Colors.grey,
        elevation: 0,
        title: _titleAppBar(),
        actions: [
          _actionAppBar(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Search Section
            _buildSearchSection(),
            // Scrollable Section
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Scrollable Tab Section
                _buildTabIcon(),
                // Card Section
                _buildCardDestination(size),
                // Card Section 2
                _buildGroupCard(size),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _actionAppBar() {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/icons8-notification.svg',
            height: 25,
            width: 25,
            color: Colors.blueGrey.shade500,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/icons8-dashboard.svg',
            height: 25,
            width: 25,
            color: Colors.blueGrey.shade500,
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  _titleAppBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
          child: Text(
            'Welcome, Indra Mpd',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 20,
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/icons8-location-outline.svg',
                height: 18,
                width: 18,
                color: Colors.blueGrey.shade500,
              ),
              const SizedBox(width: 5),
              Text(
                'Sanfrancisco, USA',
                style: TextStyle(
                  color: Colors.blueGrey.shade500,
                  fontSize: 12,
                  letterSpacing: 0.01,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildSearchSection() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
      child: TextField(
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          color: Colors.blueGrey,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          hintText: 'Search Destination...',
          hintStyle: TextStyle(
            color: Colors.blueGrey.shade200,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          alignLabelWithHint: true,
          filled: true,
          fillColor: Colors.grey.shade100,
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 50,
            maxWidth: 50,
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 50,
            maxWidth: 50,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              'assets/icons/icons8-search.svg',
              height: 20,
              width: 20,
              color: Colors.blueGrey.shade200,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/icons/icons8-filter.svg',
                  color: Colors.blueAccent,
                  height: 25,
                  width: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildTabIcon() {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: tabName.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: (_selectedIndex == index)
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
                    : Colors.blueGrey.shade100,
              ),
            ),
            child: Material(
              color: _selectedIndex == index
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        iconList[index],
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        tabName[index],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: _selectedIndex == index
                              ? Colors.blueGrey.withOpacity(0.9)
                              : Colors.blueGrey.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }

  // ignore: todo
  // TODO : Layouting With Expanded Widget

  _buildCardDestination(Size size) {
    return SizedBox(
      height: 320,
      width: double.infinity,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          Destination destination = destinations[index];
          return Container(
            margin: const EdgeInsets.symmetric(
              vertical: 30,
            ),
            width: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 20,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 20,
                        offset: const Offset(0, 15),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage(
                        destination.imageUrl,
                      ),
                      width: 200,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      destination.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/icons8-location-outline.svg',
                                          height: 16,
                                          width: 16,
                                          color: Colors.blueGrey.shade400,
                                        ),
                                        Expanded(
                                          child: Text(
                                            destination.country,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.blueGrey.shade400,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Column(
                                    children: [
                                      Text(
                                        destination.rating.toString(),
                                        style: TextStyle(
                                          color: Colors.blueGrey.shade400,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        'assets/icons/icons8-star-fill.svg',
                                        height: 16,
                                        width: 16,
                                        color: Colors.amber,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.attach_money_rounded,
                                    size: 16,
                                    color: Colors.blueAccent,
                                  ),
                                  Text(
                                    destination.price.toString(),
                                    style: const TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    ' /Person',
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade400,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SvgPicture.asset(
                                'assets/icons/icons8-right-arrow.svg',
                                height: 16,
                                width: 16,
                                color: Colors.blueGrey.shade200,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
        itemCount: destinations.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }

  _buildGroupCard(Size size) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Group Tours',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    'See More',
                    style: TextStyle(
                      color: Colors.blueGrey.shade200,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset(
                    'assets/icons/icons8-right-arrow.svg',
                    height: 16,
                    width: 16,
                    color: Colors.blueGrey.shade200,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              Tour tour = tours[index];
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(10),
                    height: 180,
                    width: 370,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image
                        Container(
                          width: 120,
                          height: 160,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueAccent.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: const Offset(5, 0),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: AssetImage(
                                tour.imageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Description
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            // color: Colors.red,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // First Column
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.vertical,
                                      children: [
                                        Text(
                                          tour.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          tour.group,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.blueGrey.shade400,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/icons8-love-outline.svg',
                                      height: 25,
                                      width: 25,
                                      color: Colors.blueGrey.shade400,
                                    ),
                                  ],
                                ),
                                // second Column
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Starting Point
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.radio_button_checked,
                                          size: 16,
                                          color: Colors.blueGrey.shade400,
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          tour.startingPoint,
                                          style: TextStyle(
                                            color: Colors.blueGrey.shade400,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    // Center
                                    Text(
                                      ' - - -',
                                      style: TextStyle(
                                        color: Colors.blueGrey.shade200,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 1,
                                    ),
                                    // Ending Point
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/icons8-location-fill.svg',
                                          height: 16,
                                          width: 16,
                                          color: Colors.blueAccent,
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          tour.endingPoint,
                                          style: const TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // Third Column
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 60),
                                                  child: CircleAvatar(
                                                    radius: 14,
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: CircleAvatar(
                                                      radius: 12,
                                                      backgroundImage:
                                                          AssetImage(
                                                        tour.imageUrl,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 40),
                                                  child: CircleAvatar(
                                                    radius: 14,
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: CircleAvatar(
                                                      radius: 12,
                                                      backgroundImage:
                                                          AssetImage(
                                                        tour.imageUrl,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 20),
                                                  child: CircleAvatar(
                                                    radius: 14,
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: CircleAvatar(
                                                      radius: 12,
                                                      backgroundImage:
                                                          AssetImage(
                                                        tour.imageUrl,
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
                                                      tour.imageUrl,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '${tour.groupSize.toString()}+',
                                              style: TextStyle(
                                                color: Colors.blueGrey.shade200,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${(100 * tour.groupSize / tour.groupSizeMax).toStringAsFixed(0)}%',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 4,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.blueGrey.shade50,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                        Container(
                                          height: 4,
                                          width: totalWidthBar *
                                              tour.groupSize /
                                              tour.groupSizeMax,
                                          decoration: BoxDecoration(
                                            color: Colors.blueAccent,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            itemCount: tours.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 10);
            },
          ),
        ),
      ],
    );
  }

  _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.blueGrey.shade200,
      selectedItemColor: Colors.blueAccent,
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _currentIndex == 0
                ? 'assets/icons/icons8-home-fill.svg'
                : 'assets/icons/icons8-home-outline.svg',
            width: sizeIcon,
            height: sizeIcon,
            color: _currentIndex == 0
                ? Colors.blueAccent
                : Colors.blueGrey.shade200,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _currentIndex == 1
                ? 'assets/icons/icons8-compass-fill.svg'
                : 'assets/icons/icons8-compass-outline.svg',
            width: sizeIcon,
            height: sizeIcon,
            color: _currentIndex == 1
                ? Colors.blueAccent
                : Colors.blueGrey.shade200,
          ),
          label: 'Compass',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _currentIndex == 2
                ? 'assets/icons/icons8-ticket-fill.svg'
                : 'assets/icons/icons8-ticket-outline.svg',
            width: sizeIcon,
            height: sizeIcon,
            color: _currentIndex == 2
                ? Colors.blueAccent
                : Colors.blueGrey.shade200,
          ),
          label: 'Ticket',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _currentIndex == 3
                ? 'assets/icons/icons8-account-fill.svg'
                : 'assets/icons/icons8-account-outline.svg',
            width: sizeIcon,
            height: sizeIcon,
            color: _currentIndex == 3
                ? Colors.blueAccent
                : Colors.blueGrey.shade200,
          ),
          label: 'Ticket',
        ),
      ],
    );
  }
}

class BuildBottomNavigation {
  static Widget build(Size size) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(0, -15),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            'assets/icons/icons8-home.svg',
            height: 30,
            width: 30,
            color: Colors.blueGrey.shade500,
          ),
          SvgPicture.asset(
            'assets/icons/icons8-search.svg',
            height: 30,
            width: 30,
            color: Colors.blueGrey.shade500,
          ),
          SvgPicture.asset(
            'assets/icons/icons8-heart.svg',
            height: 30,
            width: 30,
            color: Colors.blueGrey.shade500,
          ),
          SvgPicture.asset(
            'assets/icons/icons8-user.svg',
            height: 30,
            width: 30,
            color: Colors.blueGrey.shade500,
          ),
        ],
      ),
    );
  }
}
