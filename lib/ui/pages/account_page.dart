part of 'pages.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // note: HEADER
        Container(
          decoration: BoxDecoration(
              color: accentColor1,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
          child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
            if (userState is UserLoaded) {
              if (imageFileToUpload != null) {
                uploadImage(imageFileToUpload).then((downloadURL) {
                  imageFileToUpload = null;

                  context
                      .bloc<UserBloc>()
                      .add(UpdateData(profileImage: downloadURL));
                });
              }
              return Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xFF5F558B), width: 1)),
                    child: Stack(
                      children: <Widget>[
                        SpinKitFadingCircle(
                          color: accentColor2,
                          size: 50,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: (userState.user.profilePicture == ""
                                      ? AssetImage("assets/user_pic.png")
                                      : NetworkImage(
                                          userState.user.profilePicture)),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin -
                            78,
                        child: Text(
                          userState.user.name,
                          style: whiteTextFont.copyWith(fontSize: 18),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Text(
                        userState.user.site,
                        style: whiteTextFont.copyWith(fontSize: 18),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  )
                ],
              );
            } else {
              return SpinKitFadingCircle(
                color: accentColor3,
                size: 50,
              );
            }
          }),
        ),

        // note : ABOUT APP
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 10),
              decoration: BoxDecoration(
                  border: Border.all(color: mainColor),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: ListTile(
                leading: Icon(Icons.info, color: mainColor),
                trailing: Icon(Icons.arrow_forward_ios, color: mainColor),
                title: Text("About App", style: blackTextFont),
                onTap: () async {
                  PackageInfo packageInfo = await PackageInfo.fromPlatform();
                  showDialog(
                      builder: (context) => AlertDialog(
                            title: Text("B Service Parking System",
                                style: blackTextFont.copyWith(
                                    fontWeight: FontWeight.bold)),
                            content: Container(
                              height: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    " Aplikasi ini diperuntukan untuk bagian Parking\n\nB Service Indonesia\n\n",
                                    style: blackTextFont,
                                  ),
                                  Text(
                                      "Versi  " +
                                          packageInfo.appName +
                                          "  " +
                                          packageInfo.version +
                                          "  " +
                                          packageInfo.buildNumber,
                                      style:
                                          blackTextFont.copyWith(fontSize: 15)),
                                ],
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(style: BorderStyle.none),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                      context: context);
                },
              ),
            ),

            // note : Logout
            Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
              decoration: BoxDecoration(
                  border: Border.all(color: mainColor),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: ListTile(
                leading: Icon(Icons.exit_to_app, color: mainColor),
                title: Text("Log Out", style: blackTextFont),
                onTap: () {
                  context.bloc<UserBloc>().add(SignOut());
                  AuthServices.signOut();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
