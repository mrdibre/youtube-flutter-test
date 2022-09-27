import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:youtube_getx/modules/auth/domain/user.dart';
import 'package:youtube_getx/modules/auth/factory/auth-facade.factory.dart';
import 'package:youtube_getx/modules/video-adm/facade/video-adm.facade.interface.dart';
import 'package:youtube_getx/modules/video-adm/factory/video-adm-facade.factory.dart';
import 'package:youtube_getx/ui/components/top-bar/top-bar.dart';
import 'package:youtube_getx/ui/components/video-player/video-player.dart';

class VideoUploader extends StatefulWidget {
  const VideoUploader({Key? key}) : super(key: key);

  @override
  State<VideoUploader> createState() => _VideoUploaderState();
}

class _VideoUploaderState extends State<VideoUploader> {
  late User _currentUser;
  File? _file = null;
  int _uploadProgress = 0;
  bool _uploadingVideo = false;
  VideoPlayerController? _videoController;
  TextEditingController _videoNameController = TextEditingController();

  _selectFile() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? xFile = await _picker.pickVideo(source: ImageSource.gallery);

    if (xFile != null) {
      File file = File(xFile.path);

      _videoController = VideoPlayerController.file(file)..initialize().then((_) {
        setState(() {
          _file = file;
        });

        _videoController!.play();
        _videoNameController.text = xFile.name;
      });
    }
  }

  _handleVideoUpload() async {
    try {
      setState(() {
        _uploadingVideo = true;
      });

      await videoAdm().saveVideo(
        SaveVideoInputDTO(
          file: _file!,
          channelId: _currentUser.id,
          name: _videoNameController.text,
          duration: _videoController!.value.duration.inSeconds,
        )
      );

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Vídeo enviado com sucesso!"))
      );

      setState(() {
        _videoNameController.text = "";
        _uploadingVideo = false;
        _uploadProgress = 0;
        _videoController = null;
        _file = null;
      });
    } catch(e) {
      setState(() {
        _uploadingVideo = false;
      });
    }
  }

  @override
  void initState() {
    auth().getCurrentUser().then((value) {
      setState(() {
        _currentUser = value!;
      });
    });
  }

  Widget _getFileUploaderWidget() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Center(
        child: OutlinedButton(
          child: Text("Selecionar Vídeo"),
          onPressed: _selectFile,
          style: OutlinedButton.styleFrom(
              minimumSize: Size.fromHeight(40)
          ),
        ),
      ),
    );
  }

  Widget _getDetails() {
    return Column(
      children: [
        Player(controller: _videoController),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                controller: _videoNameController,
                decoration: InputDecoration(
                  label: Text("Nome do vídeo")
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: OutlinedButton(
                  child: Text(_uploadingVideo ? "Enviando Vídeo... (${_uploadProgress}%)" : "Enviar Vídeo"),
                  onPressed: _uploadingVideo ? null : _handleVideoUpload,
                  style: OutlinedButton.styleFrom(
                      minimumSize: Size.fromHeight(40)
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: SingleChildScrollView(
        child: Container(
          child: _videoController?.value.isInitialized == true ? _getDetails() : _getFileUploaderWidget(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _videoController?.dispose();
  }
}
