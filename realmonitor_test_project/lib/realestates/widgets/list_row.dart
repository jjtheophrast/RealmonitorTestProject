import 'package:flutter/material.dart';
import 'package:realmonitor_test_project/realestates/models/realestatemodel.dart';

class RealEstateCard extends StatefulWidget {
  //
  final RealEstate realEstate;

  const RealEstateCard({super.key, required this.realEstate});

  @override
  State<RealEstateCard> createState() => _RealEstateCardState();
}

class _RealEstateCardState extends State<RealEstateCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          //TODO: implemnent card tapping, start navigation to search list
        },
        child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(),
                  _buildSubTitle(),
                  _buildDetails(),
                  _buildActionRow()
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.realEstate.name,
      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
    );
  }

  Widget _buildSubTitle() {
    String subtitle = 'eladó Ház';
    return Text(
      subtitle,
      style: const TextStyle(fontSize: 16),
    );
  }

  Widget _buildDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        color: Colors.blueGrey.shade50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _detailsLocationRow("Zabar, Csesznek"),
            const Divider(height: 1),
            _detailsSingleRowParamValue("Ár", "69-420 millió Ft"),
            _detailsSingleRowParamValue("Alapterület", "80+ m2")
          ],
        ),
      ),
    );
  }

  Widget _detailsLocationRow(String locationString) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Text(
          locationString,
          style: const TextStyle(fontSize: 16),
        ));
  }

  Widget _detailsSingleRowParamValue(String paramString, String valueString) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(
                paramString,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Text(
              valueString,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ));
  }

  Widget _buildActionRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Implement delete method here")
                ));


              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.blue.shade900,
                  size: 36.0,
                ),
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  widget.realEstate.isNotificationEnabled =
                      !widget.realEstate.isNotificationEnabled;
                });

                // TODO: notify the backend about the change
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  widget.realEstate.isNotificationEnabled
                      ? Icons.notifications
                      : Icons.notifications_off_outlined,
                  color: widget.realEstate.isNotificationEnabled
                      ? Colors.blue.shade900
                      : Colors.grey,
                  size: 36.0,
                ),
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Start edit tedail page here"),
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.edit,
                  color: Colors.blue.shade900,
                  size: 36.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
