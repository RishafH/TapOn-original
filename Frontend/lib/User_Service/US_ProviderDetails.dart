import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tap_on/User_Service/US_Booking.dart';
import 'package:tap_on/User_Service/US_PreBooking.dart';

class US_ProviderDetails extends StatelessWidget {
  final Map<String, dynamic> provider;
  const US_ProviderDetails({super.key, 
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Service Details', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding( 
      padding: EdgeInsets.symmetric(horizontal: 16),     
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service provider info
            Row(
              children: [
                provider['image'] != null
                    ? CircleAvatar(
                        radius: 20,
                        backgroundImage: MemoryImage(
                          base64Decode(provider['image']),
                        ))
                    : CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.black,
                        child: Icon(Icons.person),
                      ),
                SizedBox(width: 10),
                Text(provider['name'] ?? 'Name',
                    style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 15),

            // Service name and description
            Text(provider['service_category'] ?? 'Service',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Center(
                  child: provider['image'] != null && provider['image'].isNotEmpty
                      ? Image.memory(
                          base64Decode(provider['image']),
                          height: 100, // Set a height for the image if needed
                          width: 100, // Set a width for the image if needed
                          fit: BoxFit.cover, // Adjust fit as needed
                        )
                      : Icon(Icons.image, size: 100),
                ), // Fallback icon
                SizedBox(height: 8),
                // make border to description
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    provider['description'] ?? 'Description',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              
              ],
            ),
            SizedBox(height: 8),

            // Reviews
            Text('Reviews',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Column(
              children: const [
                ReviewCard(),
                
              ],
            ),
            Spacer(),

            // Action buttons
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => US_Booking(provider: provider),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.yellow,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    child: Text('Booking Request'),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                US_PreBooking(provider: provider)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.yellow,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    child: Text('Pre Booking'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 16,
          child: Icon(Icons.person, size: 16),
        ),

        title: Text('Mohammed Rishaf', style: TextStyle(fontSize: 14)),
        subtitle: Text('Great service! did an amazing job with my service. The team was professional, efficient, and exceeded my expectations. I highly recommend them!'),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.star, color: Colors.amber, size: 14),
            Icon(Icons.star, color: Colors.amber, size: 14),
            Icon(Icons.star, color: Colors.amber, size: 14),
            Text('4.9', style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
