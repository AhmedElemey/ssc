import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => ServicesPageState();
}

class ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/main_bg.png",
            width: screenWidth,
            height: screenHeight,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                buildAppBarRow(),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child:
                      buildText("Apply", Colors.white, FontWeight.w800, 18.0),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: buildText("Climate Data Request",
                      Colors.white.withOpacity(0.9), FontWeight.w600, 18.0),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 5,
                ),
                buildWeatherContainer(screenWidth, screenHeight),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: buildText('Terms & Conditions', Colors.white,
                      FontWeight.w700, 15.0),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: screenWidth,
                  height: screenHeight * 0.07,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.black12,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        primary: const Color(0xff3C7CBF),
                        onSurface: const Color(0xff3C7CBF),
                      ),
                      child: Text(
                        "Submit",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row buildAppBarRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/White_logo.png",
          height: 75,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/search.png",
                height: 26,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/notification_icon.png",
                height: 30,
              ),
            )
          ],
        )
      ],
    );
  }

  Center buildWeatherContainer(double screenWidth, double screenHeight) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: screenWidth * 0.88,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildText(
                      'Station Details', Colors.white, FontWeight.w700, 17.0),
                  Container(
                    width: screenHeight * .05,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.remove,
                            color: Color(
                                0xff2A4663), // You can set your desired color
                            size: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * .15,
                child: ListView(
                  children: checklistItems.map((String item) {
                    return ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      leading: Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          value: checkedItems[item] ?? false,
                          onChanged: (bool? value) {
                            setState(() {
                              checkedItems[item] = value!;
                            });
                          },
                          side: const BorderSide(color: Color(0xff768DAC)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                          ),
                          fillColor: MaterialStateProperty.all(
                              const Color(0xff768DAC)),
                          hoverColor: const Color(0xff768DAC),
                          focusColor: const Color(0xff768DAC),
                          visualDensity: VisualDensity.comfortable,
                        ),
                      ),
                      title: buildText(item, Colors.white.withOpacity(0.9),
                          FontWeight.w600, 15.0),
                    );
                  }).toList(),
                ),
              ),
              TextFormField(
                // controller: userNameController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  filled: true,
                  fillColor: const Color(0xff768DAC),
                  isCollapsed: true,
                  suffixIconConstraints: const BoxConstraints(maxWidth: 45),
                  alignLabelWithHint: true,
                  contentPadding:
                      const EdgeInsets.only(top: 15, bottom: 15, right: 20),
                  //  suffixIcon: widget.suffixIcon,
                  hintText: "Station classification",

                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                  prefix: const Padding(padding: EdgeInsets.only(left: 20.0)),
                ),
              ),
              SizedBox(
                height: screenHeight * .015,
              ),
              TextFormField(
                // controller: userNameController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  filled: true,
                  fillColor: const Color(0xff768DAC),
                  isCollapsed: true,
                  suffixIconConstraints: const BoxConstraints(maxWidth: 45),
                  alignLabelWithHint: true,
                  contentPadding:
                      const EdgeInsets.only(top: 15, bottom: 15, right: 20),
                  //  suffixIcon: widget.suffixIcon,
                  hintText: "Station class",

                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                  prefix: const Padding(padding: EdgeInsets.only(left: 20.0)),
                ),
              ),
              SizedBox(
                height: screenHeight * .015,
              ),
              TextFormField(
                // controller: userNameController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  filled: true,
                  fillColor: const Color(0xff768DAC),
                  isCollapsed: true,
                  suffixIconConstraints: const BoxConstraints(maxWidth: 45),
                  alignLabelWithHint: true,
                  contentPadding:
                      const EdgeInsets.only(top: 15, bottom: 15, right: 20),
                  //  suffixIcon: widget.suffixIcon,
                  hintText: "Proposed station location",

                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                  prefix: const Padding(padding: EdgeInsets.only(left: 20.0)),
                ),
              ),
              SizedBox(
                height: screenHeight * .015,
              ),
              TextFormField(
                // controller: userNameController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  filled: true,
                  fillColor: const Color(0xff768DAC),
                  isCollapsed: true,
                  suffixIconConstraints: const BoxConstraints(maxWidth: 45),
                  alignLabelWithHint: true,
                  contentPadding:
                      const EdgeInsets.only(top: 15, bottom: 15, right: 20),
                  //  suffixIcon: widget.suffixIcon,
                  hintText: "Station coordinates",

                  suffixIcon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                  prefix: const Padding(padding: EdgeInsets.only(left: 20.0)),
                ),
              ),
              SizedBox(
                height: screenHeight * .015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildText(
                      'Title Dead Type', Colors.white, FontWeight.w700, 15.0),
                ],
              ),
              SizedBox(
                  height: screenHeight * .1,
                  width: screenWidth,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: checklistItemsRow.length,
                    itemBuilder: (context, index) {
                      String item = checklistItemsRow[index];

                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                value: checkedItemsRow[item] ?? false,
                                onChanged: (bool? value) {
                                  setState(() {
                                    checkedItemsRow[item] = value!;
                                  });
                                },
                                side:
                                    const BorderSide(color: Color(0xff768DAC)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                fillColor: MaterialStateProperty.all(
                                    const Color(0xff768DAC)),
                                hoverColor: const Color(0xff768DAC),
                                focusColor: const Color(0xff768DAC),
                                visualDensity: VisualDensity.comfortable,
                              ),
                            ),
                            buildText(
                              item,
                              Colors.white.withOpacity(0.9),
                              FontWeight.w600,
                              15.0,
                            ),
                          ],
                        ),
                      );
                    },
                  )),
              SizedBox(
                height: screenHeight * .015,
              ),
              TextFormField(
                // controller: userNameController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  filled: true,
                  fillColor: const Color(0xff768DAC),
                  isCollapsed: true,
                  suffixIconConstraints: const BoxConstraints(maxWidth: 45),
                  alignLabelWithHint: true,
                  contentPadding:
                      const EdgeInsets.only(top: 15, bottom: 15, right: 20),
                  //  suffixIcon: widget.suffixIcon,
                  hintText: "Station Type",

                  suffixIcon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                  prefix: const Padding(padding: EdgeInsets.only(left: 20.0)),
                ),
              ),
              SizedBox(
                height: screenHeight * .015,
              ),
              TextFormField(
                maxLines: 4,
                // controller: userNameController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  filled: true,
                  fillColor: const Color(0xff768DAC),
                  isCollapsed: true,
                  suffixIconConstraints: const BoxConstraints(maxWidth: 45),
                  alignLabelWithHint: true,
                  contentPadding:
                      const EdgeInsets.only(top: 15, bottom: 15, right: 20),
                  //  suffixIcon: widget.suffixIcon,
                  hintText: "Station Address",

                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                  prefix: const Padding(padding: EdgeInsets.only(left: 20.0)),
                ),
              ),
              SizedBox(
                height: screenHeight * .05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildText('Delegation', Colors.white, FontWeight.w700, 17.0),
                ],
              ),
              SizedBox(
                height: screenHeight * .015,
              ),
              TextFormField(
                // controller: userNameController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  filled: true,
                  fillColor: const Color(0xff768DAC),
                  isCollapsed: true,
                  suffixIconConstraints: const BoxConstraints(maxWidth: 45),
                  alignLabelWithHint: true,
                  contentPadding:
                      const EdgeInsets.only(top: 15, bottom: 15, right: 20),
                  //  suffixIcon: widget.suffixIcon,
                  hintText: "Delegate Name",

                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                  prefix: const Padding(padding: EdgeInsets.only(left: 20.0)),
                ),
              ),
              SizedBox(
                height: screenHeight * .015,
              ),
              TextFormField(
                // controller: userNameController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  filled: true,
                  fillColor: const Color(0xff768DAC),
                  isCollapsed: true,
                  suffixIconConstraints: const BoxConstraints(maxWidth: 45),
                  alignLabelWithHint: true,
                  contentPadding:
                      const EdgeInsets.only(top: 15, bottom: 15, right: 20),
                  //  suffixIcon: widget.suffixIcon,
                  hintText: "Id Number",

                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                  prefix: const Padding(padding: EdgeInsets.only(left: 20.0)),
                ),
              ),
              SizedBox(
                height: screenHeight * .015,
              ),
              TextFormField(
                // controller: userNameController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  filled: true,
                  fillColor: const Color(0xff768DAC),
                  isCollapsed: true,
                  suffixIconConstraints: const BoxConstraints(maxWidth: 45),
                  alignLabelWithHint: true,
                  contentPadding:
                      const EdgeInsets.only(top: 15, bottom: 15, right: 20),
                  //  suffixIcon: widget.suffixIcon,
                  hintText: "Authorization Reference Number",

                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                  prefix: const Padding(padding: EdgeInsets.only(left: 20.0)),
                ),
              ),
              SizedBox(
                height: screenHeight * .015,
              ),
              TextFormField(
                // controller: userNameController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  filled: true,
                  fillColor: const Color(0xff768DAC),
                  isCollapsed: true,
                  suffixIconConstraints: const BoxConstraints(maxWidth: 45),
                  alignLabelWithHint: true,
                  contentPadding:
                      const EdgeInsets.only(top: 15, bottom: 15, right: 20),
                  //  suffixIcon: widget.suffixIcon,
                  hintText: "Signature Digital",
                  suffixIcon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.attachment_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                  prefix: const Padding(padding: EdgeInsets.only(left: 20.0)),
                ),
              ),
              SizedBox(
                height: screenHeight * .015,
              ),
              TextFormField(
                // controller: userNameController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff768DAC)),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  filled: true,
                  fillColor: const Color(0xff768DAC),
                  isCollapsed: true,
                  suffixIconConstraints: const BoxConstraints(maxWidth: 45),
                  alignLabelWithHint: true,
                  contentPadding:
                      const EdgeInsets.only(top: 15, bottom: 15, right: 20),
                  //  suffixIcon: widget.suffixIcon,
                  hintText: "Upload Document",
                  suffixIcon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.attachment_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                  prefix: const Padding(padding: EdgeInsets.only(left: 20.0)),
                ),
              ),
              SizedBox(
                height: screenHeight * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildText('Application Details', Colors.white,
                      FontWeight.w700, 17.0),
                  Container(
                    width: screenHeight * .05,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(
                                0xff2A4663), // You can set your desired color
                            size: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * .015,
              ),
              Divider(
                color: Colors.indigo.shade400,
                thickness: 1,
              ),
              SizedBox(
                height: screenHeight * .015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildText(
                      'National Address', Colors.white, FontWeight.w700, 17.0),
                  Container(
                    width: screenHeight * .05,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(
                                0xff2A4663), // You can set your desired color
                            size: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * .015,
              ),
              Divider(
                color: Colors.indigo.shade400,
                thickness: 1,
              ),
              SizedBox(
                height: screenHeight * .015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildText(
                      'Contract Details', Colors.white, FontWeight.w700, 17.0),
                  Container(
                    width: screenHeight * .05,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(
                                0xff2A4663), // You can set your desired color
                            size: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * .03,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> checklistItems = [
    'Weather Station under construction ',
    'List of weather stations',

    // Add more items as needed
  ];
  List<String> checklistItemsRow = [
    'Weather ',
    'List ',

    // Add more items as needed
  ];
  Map<String, bool> checkedItems = {};
  Map<String, bool> checkedItemsRow = {};
  Text buildText(text, color, fontWeight, size) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: size),
    );
  }
}
