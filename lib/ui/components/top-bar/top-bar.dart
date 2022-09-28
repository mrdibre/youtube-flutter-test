import 'package:flutter/material.dart';
import 'package:youtube_getx/modules/auth/factory/auth-facade.factory.dart';
import 'package:youtube_getx/ui/components/top-bar/sign-in.dart';
import 'package:youtube_getx/ui/routes/route-generator.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _TopBarState extends State<TopBar> {
  bool _loggedIn = false;

  _handleLogout() async {
    await auth().signOut();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Usuário deslogado com sucesso!"))
    );

    _loggedIn = false;
  }

  _showLoginModal() async {
    showModalBottomSheet(
        context: context,
        elevation: 3,
        builder: (BuildContext context) {
          return SignIn(
            onSignIn: () {
              _loggedIn = true;
              Navigator.pop(context);
            },
          );
        }
    );
  }

  _handleUploadVideo() {
    Navigator.pushNamed(context, UPLOAD_VIDEO_ROUTE);
  }

  @override
  void initState() {
    setState(() {
      _loggedIn = auth().isLoggedIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        child: Text("YouTube"),
        onTap: () {
          Navigator.pushReplacementNamed(context, HOME_ROUTE);
        },
      ),
      automaticallyImplyLeading: false,
      actions: [
        PopupMenuButton<String>(
          elevation: 2,
          onSelected: (selected) {
            if (selected == "logout") {
              _handleLogout();
            } else if (selected == "signin") {
              _showLoginModal();
            } else if (selected == "upload-video") {
              _handleUploadVideo();
            }
          },
          itemBuilder: (context) {
            if (_loggedIn) {
              return [
                const PopupMenuItem(child: Text("Conta")),
                const PopupMenuItem(child: Text("Playlists")),
                const PopupMenuItem(value: "upload-video", child: Text("Novo Vídeo")),
                const PopupMenuItem(value: "logout", child: Text("Sair"))
              ];
            }

            return [
              const PopupMenuItem(value: "signin", child: Text("Acessar"))
            ];
          },
        )
      ],
    );
  }
}
