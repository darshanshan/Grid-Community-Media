import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostImageWidget extends StatelessWidget {
  const PostImageWidget({super.key, required this.imageList});
  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    final imageWidget = <int, Widget Function()>{
      1: () => oneImage(imageList.first),
      2: () => twoImages(imageList, imageList.length),
      3: () => threeImages(imageList),
      4: () => fourImages(imageList),
      5: () => fiveImages(imageList),
      6: () => moreImages(imageList),
    };

    return Container(
      width: double.infinity,
      height: 400,
      color: Theme.of(context).colorScheme.background,
      child: imageList.length > 5
          ? imageWidget[6]?.call()
          : imageWidget[imageList.length]?.call(),
    );
  }
}

// One Image-------------------

Widget oneImage(String imageUrl) {
  return Image.network(
    imageUrl,
    height: 400,
    width: double.infinity,
    fit: BoxFit.cover,
  );
}

// Two Images-----------------------

Widget twoImages(List<String> imageUrls, int total) {
  return SizedBox(
    width: double.infinity,
    height: 400,
    child: Row(
      children: [
        Expanded(
            child: Image.network(
          imageUrls[0],
          height: 400,
          fit: BoxFit.cover,
        )),
        const SizedBox(
          width: 1,
        ),
        Expanded(
          child: Image.network(
            imageUrls[1],
            height: 400,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}

// Three Images ---------------------------

Widget threeImages(List<String> imageUrls) {
  return SizedBox(
    width: double.infinity,
    height: 400,
    child: Column(
      children: [
        Expanded(
            child: Image.network(
          imageUrls[0],
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        )),
        const SizedBox(
          height: 1,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.network(
                imageUrls[1],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 1,
            ),
            Expanded(
              child: Image.network(
                imageUrls[2],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// Four Images--------------------------------

Widget fourImages(List<String> imageUrls) {
  return SizedBox(
    width: double.infinity,
    height: 400,
    child: Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.network(
                imageUrls[0],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 1,
            ),
            Expanded(
              child: Image.network(
                imageUrls[1],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 1,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.network(
                imageUrls[2],
                height: 199,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 1,
            ),
            Expanded(
              child: Image.network(
                imageUrls[3],
                height: 199,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// Five Images--------------------------------

Widget fiveImages(List<String> imageUrls) {
  return SizedBox(
    width: double.infinity,
    height: 400,
    child: Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.network(
                imageUrls[0],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 1,
            ),
            Expanded(
              child: Image.network(
                imageUrls[1],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 1,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.network(
                imageUrls[2],
                height: 199,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 1,
            ),
            Expanded(
              child: Image.network(
                imageUrls[3],
                height: 199,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 1,
            ),
            Expanded(
              child: Image.network(
                imageUrls[4],
                height: 199,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

//More than Five images---------------------------------------------

Widget moreImages(List<String> imageUrls) {
  int remaining = imageUrls.length - 5;
  return SizedBox(
    width: double.infinity,
    height: 400,
    child: Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.network(
                imageUrls[0],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 1,
            ),
            Expanded(
              child: Image.network(
                imageUrls[1],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 1,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.network(
                imageUrls[2],
                height: 199,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 1,
            ),
            Expanded(
              child: Image.network(
                imageUrls[3],
                height: 199,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 1,
            ),
            Expanded(
              child: Stack(
                children: [
                  Image.network(
                    imageUrls[4],
                    height: 199,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 199,
                    width: double.infinity,
                    color: const Color(0xC3404040),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          remaining.toString(),
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
