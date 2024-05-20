import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_app/loading_animated.dart';
import 'package:sliver_app/loading_widget.dart';
import 'package:sliver_app/slide_provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double safeArea = MediaQuery.of(context).padding.top;
    double maxHeight = size.height * 0.28;
    double minHeight = size.height * 0.23;
    double porcentaje =
        Provider.of<SliderProvider>(context).currentSlide / maxHeight;
    print(porcentaje);

    return Scaffold(
      backgroundColor: const Color(0xffE8E8ED),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverCustomHeaderDelegate(
              maxHeight: maxHeight,
              minHeight: minHeight,
              child: Container(
                color: Color.lerp(
                    const Color(0xffE8E8ED), Colors.white, porcentaje),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: safeArea,
                      left: 20,
                      child: const Text(
                        'Mensajes',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: (safeArea + 60) * (1 - porcentaje),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: (size.width * 0.9) +
                            ((size.width * 0.1) * porcentaje),
                        height: 55 + ((maxHeight - 55) * porcentaje),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Transform.translate(
                          offset: Offset(10, -(minHeight / 8) * porcentaje),
                          child: const CustomTextFiled(),
                        ),
                      ),
                    ),
                    Positioned(
                      left: size.width * 0.1,
                      bottom: 20,
                      child: Row(
                        children: [
                          FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: const Text('Todo'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              backgroundColor: const Color(0xffFFFCFF),
                            ),
                            child: const Text(
                              'personal',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              backgroundColor: const Color(0xffFFFCFF),
                            ),
                            child: const Text(
                              'actualizacion',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Positioned(
                    //   top: (safeArea + 60),
                    //   child: Placeholder(
                    //     //color: Colors.transparent,
                    //     child: SizedBox(
                    //       width: size.width * 0.9,
                    //       child: const TextField(
                    //         decoration: InputDecoration(
                    //           prefixIcon: Icon(
                    //             Icons.search,
                    //           ),
                    //           hintText: 'Buscar',
                    //           hintStyle: TextStyle(
                    //             color: Colors.grey,
                    //           ),
                    //           filled: true,
                    //           fillColor: Colors.transparent,
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.all(
                    //               Radius.circular(
                    //                 25.0,
                    //               ),
                    //             ),
                    //             borderSide: BorderSide.none,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
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

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
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
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => Provider.of<SliderProvider>(context, listen: false)
          .currentSlide = shrinkOffset,
    );

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
