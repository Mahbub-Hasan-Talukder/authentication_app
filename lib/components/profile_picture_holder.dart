import 'package:flutter/material.dart';

class ProfilePictureHolder extends StatelessWidget {
  
  final ImageProvider image;
  
  const ProfilePictureHolder({super.key, required this.image});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            width: 85,
            height: 85,

            // padding:const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xFFFFC746),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 0,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xFF24786D),
              ),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
