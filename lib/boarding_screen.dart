import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelling_app/home_screen.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({
    super.key,
  });

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // HeaderImage
            _headerImage(width, height),
            // Description and Buttons
            _buildDescription(width, height, context),
          ],
        ),
      ),
    );
  }

  _buildDescription(double width, double height, BuildContext context) {
    return SizedBox(
      height: (width.toInt() >= 600)
          ? height.toInt() * 0.4 + 100
          : height.toInt() * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Travel Anywhere In The World Without Any Hassle',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.8)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'If you like to travel a lot, this is your place! Here you can travel with your favorite tour and enjoy...',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey.withOpacity(0.8),
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Skip Button to Home Screen
                const BoardingButtonDisabled(
                  text: 'Skip',
                  screen: HomeScreen(),
                ),
                // Next Button for Image Slider
                Material(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(30),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (currentPage < 3) {
                          currentPage++;
                          if (currentPage < 4) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          }
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const HomeScreen(),
                            ),
                          );
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            FontAwesomeIcons.arrowRightLong,
                            color: Colors.white,
                            size: 14,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _headerImage(double width, double height) {
    return SizedBox(
      height: (width.toInt() >= 600)
          ? height.toInt() * 0.6 + 100
          : height.toInt() * 0.7,
      child: Stack(
        children: <Widget>[
          // Image Content
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            controller: _pageController,
            children: const [
              CreatePage(
                image: 'assets/images/discover.jpg',
              ),
              CreatePage(
                image: 'assets/images/braies-lake.png',
              ),
              CreatePage(
                image: 'assets/images/myrtle-beach.jpg',
              ),
              CreatePage(
                image: 'assets/images/bali-indonesia.jpg',
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildIndicator(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(2),
      height: isActive ? 10 : 6,
      width: isActive ? 10 : 6,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(milliseconds: 150),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 4; i++) {
      indicators.add(
        i == currentPage ? _indicator(true) : _indicator(false),
      );
    }
    return indicators;
  }
}

class CreatePage extends StatelessWidget {
  final String image;
  const CreatePage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              offset: const Offset(0, 5),
              blurRadius: 15,
            ),
          ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Image(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Boarding Button Disabled For Skip
class BoardingButtonDisabled extends StatelessWidget {
  final String text;
  final Widget screen;
  const BoardingButtonDisabled({
    super.key,
    required this.text,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
        ),
        color: Colors.white.withOpacity(0.5),
      ),
      child: Material(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => screen,
              ),
            );
          },
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey.withOpacity(0.9),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
