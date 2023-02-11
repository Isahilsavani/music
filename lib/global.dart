import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class Variable {
  static TextEditingController userName = TextEditingController();
  static String user_name = '', pswd = '';
  static TextEditingController password = TextEditingController();
  static GlobalKey<FormState> login = GlobalKey<FormState>();
  static bool rememberMe = false;
  static Duration position = Duration.zero, duration = Duration.zero;
  static AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  static int musicIndex = 0;
  static List<Map<String, dynamic>> audio = [
    {
      'name': 'Meethy Paan Di Galori',
      'singer': 'Nooran Sisters',
      'path': 'asset/Music/song/paan.mp3',
      'image': 'asset/Music/Jpg/paan.jpg',
      'height': 1.4,
      'play': false,
    },
    {
      'name': 'Bandeya',
      'singer': 'Arijit Singh',
      'path': 'asset/Music/song/bandeya.mp3',
      'image': 'asset/Music/Jpg/bandeya.jpg',
      'height': 1.3,
      'play': false,
    },
    {
      'name': 'Dhun Lagi',
      'singer': 'Sachin Jigar',
      'path': 'asset/Music/song/dhun.mp3',
      'image': 'asset/Music/Jpg/dhun.jpg',
      'height': 1,
      'play': false,
    },
    {
      'name': 'Jaan Nisaar',
      'singer': 'Arijit Singh',
      'path': 'asset/Music/song/jaan.mp3',
      'image': 'asset/Music/Jpg/jaan.jpg',
      'height': 1.2,
      'play': false,
    },
    {
      'name': 'Kesariya',
      'singer': 'Arijit Singh',
      'path': 'asset/Music/song/kesariya.mp3',
      'image': 'asset/Music/Jpg/kesariya.jpg',
      'height': 1.5,
      'play': false,
    },
    {
      'name': 'Maan Meri Jaan',
      'singer': 'King',
      'path': 'asset/Music/song/maan.mp3',
      'image': 'asset/Music/Jpg/maan.jpg',
      'height': 1,
      'play': false,
    },
    {
      'name': 'Madhanya',
      'singer': 'Rahul Vaidya',
      'path': 'asset/Music/song/Madhanya.mp3',
      'image': 'asset/Music/Jpg/madhanya.jpg',
      'height': 1.5,
      'play': false,
    },
    {
      'name': 'Jingle Bell',
      'singer': 'Yo Yo Honey Singh',
      'path': 'asset/Music/song/bell.mp3',
      'image': 'asset/Music/Jpg/bell.jpg',
      'height': 1.2,
      'play': false,
    },
    {
      'name': 'Tu Aake Dekhle',
      'singer': 'King',
      'path': 'asset/Music/song/dekhle.mp3',
      'image': 'asset/Music/Jpg/dekhle.jpg',
      'height': 1.4,
      'play': false,
    },
    {
      'name': 'Kehndi Hundi Si',
      'singer': 'Fazilpuria',
      'path': 'asset/Music/song/hundi.mp3',
      'image': 'asset/Music/Jpg/hundi.jpg',
      'height': 1.2,
      'play': false,
    },
    {
      'name': 'Jhoome Jo Pathaan',
      'singer': 'Arijit Singh',
      'path': 'asset/Music/song/jhoome.mp3',
      'image': 'asset/Music/Jpg/jhoome.jpg',
      'height': 1.5,
      'play': false,
    },
    {
      'name': 'Apna Bana Le',
      'singer': 'Arijit Singh',
      'path': 'asset/Music/song/sooraj.mp3',
      'image': 'asset/Music/Jpg/sooraj.jpg',
      'height': 1.5,
      'play': false,
    },
    {
      'name': 'Kyaa baat hai',
      'singer': 'Rahul Vaidya',
      'path': 'asset/Music/song/Kyaa baat hai!!.mp3',
      'image': 'asset/Music/Jpg/kyaa baat.jpg',
      'height': 1.5,
      'play': false,
    },
    {
      'name': 'Oops',
      'singer': 'King',
      'path': 'asset/Music/song/oops.mp3',
      'image': 'asset/Music/Jpg/oops.jpg',
      'height': 1.4,
      'play': false,
    },
  ];

  static List video = [
    {
      'image':
      'https://i.vimeocdn.com/video/1534871554-04395a9a937e020640cb9cf101527b1d647bfa4703fe35d55e9ccfc25a086f28-d_640x360.jpg',
      'video':
      'https://cdn.pixabay.com/vimeo/764361528/Ocean%20-%20135658.mp4?width=1280&hash=f64da4baec74c288939381fc4993230aa8589c80',
    },
    {
      'image':
      'https://i.vimeocdn.com/video/1591248675-b5e2a4eddf08d077681f0e314ba880991c24d997620e53d0055a87754faa4095-d_640x360.jpg',
      'video':
      'https://cdn.pixabay.com/vimeo/778907198/Christmas%20-%20141964.mp4?width=640&hash=85c931219de800ff2e651bf0e82b092b6f6cc1f4',
    },
    {
      'image':
      'https://i.vimeocdn.com/video/1279120270-b54608ac25c4d13ee159592a32ec7667545dcf4f5b88a6d00_640x360.jpg',
      'video':
      'https://cdn.pixabay.com/vimeo/636709154/Skyscrapers%20-%2091744.mp4?width=1280&hash=85febefab25ea65c28efc2a65df07ac41c8a35c0',
    },
    {
      'image':
      'https://i.vimeocdn.com/video/1271763344-f891ebbcaa1456fda074e32457c1e1b975fa2048494bc92b0_640x360.jpg',
      'video':
      'https://cdn.pixabay.com/vimeo/629483574/Aurora%20Borealis%20-%2090877.mp4?width=960&hash=e3b680ed14a44dd77b91f4c628e775f546501865',
    },
    {
      'image':
      'https://media.istockphoto.com/id/1359576900/video/hummingbird-hovering-in-backlighting-sunlight-slow-motion-and-zoom-in-zoom-out.jpg?b=1&s=640x640&k=20&c=b541uRPes8cez6izrcYpAV6URUdl_kYcnTdnGku2eYU=',
      'video':
      'https://media.istockphoto.com/id/1359576900/video/hummingbird-hovering-in-backlighting-sunlight-slow-motion-and-zoom-in-zoom-out.mp4?s=mp4-640x640-is&k=20&c=eBOQ6_3uYGyG9CAZagESNOAcLEqc7xR4EJM3U-ryFrE='
    },
    {
      'image':
      'https://i.vimeocdn.com/video/1278052549-1ca5bb7344b9674770d53ce6061d5840c402618741745a536_640x360.jpg',
      'video':
      'https://cdn.pixabay.com/vimeo/635675488/Mountains%20-%2091545.mp4?width=1280&hash=583fb2d1b01533ce77d3febc67a34b076a8d2d76',
    },
    {
      'image':
      'https://i.vimeocdn.com/video/1008844994-6476435f2dcb0ec69f4dd8fa355fb3eb11d86420d0b985ebf6b26e7916172ba7-d_640x360.jpg',
      'video':
      'https://cdn.pixabay.com/vimeo/487508532/Woman%20-%2058142.mp4?width=640&hash=0d04483bca070b3a8567ac4120a2af09038319ab',
    },
  ];
}