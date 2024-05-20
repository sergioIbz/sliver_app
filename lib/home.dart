import 'package:flutter/material.dart';
import 'package:sliver_app/loading_animated.dart';
import 'package:sliver_app/loading_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double safeArea = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: const Color(0xffE8E8ED),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverCustomHeaderDelegate(
              maxHeight: size.height * 0.3,
              minHeight: size.height * 0.25,
              child: Container(
                color: Colors.red,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: safeArea,
                      left: 20,
                      child: const Text(
                        'Messages',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: safeArea + 60,
                      child: Container(
                        width: size.width * 0.9,
                        height: 55,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                    Positioned(
                      top: safeArea + 60,
                      child: Placeholder(
                        // color: Colors.transparent,
                        child: SizedBox(
                          width: size.width * 0.9,
                          child: const TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                              ),
                              hintText: 'Buscar',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    25.0,
                                  ),
                                ),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(
                15,
                (index) => LoadingAnimated(
                  LoadingWidget(width: size.width),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.maxHeight,
    required this.minHeight,
    required this.child,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent;
  }
}
