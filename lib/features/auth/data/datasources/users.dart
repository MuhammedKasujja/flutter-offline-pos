import '../models/models.dart';

List<UserModel> users = [
  const UserModel(
    id: 'password123',
    firstname: 'Ismail',
    lastname: 'Kimbugwe',
    email: 'ismail@mail.com',
    countryCode: '+256',
    telephone: '+256775262923',
    isVerified: true,
    photoUrl:
        'https://static.vecteezy.com/system/resources/thumbnails/019/900/322/small/happy-young-cute-illustration-face-profile-png.png',
    // for demo purpose only
    gender: 'Male',
  ),
  const UserModel(
    id: 'password123',
    firstname: 'Kasujja',
    lastname: 'Muhammed',
    email: 'kasujja@project.ug',
    countryCode: '+256',
    telephone: '+256774262923',
    isVerified: false,
    // for demo purpose only
    gender: 'Male',
    dateOfBirth: '12/07/1980',
  ),
  const UserModel(
    id: 'password123',
    firstname: 'Nakato',
    lastname: 'Aisha',
    email: 'aisha@mail.com',
    countryCode: '+256',
    telephone: '+256774262923',
    isVerified: false,
    gender: 'Female',
  ),
  const UserModel(
    id: 'password123',
    firstname: 'Nakitto',
    lastname: 'Saidat',
    email: 'saidat@mail.com',
    countryCode: '+256',
    telephone: '+256774262923',
    isVerified: true,
    gender: 'Female',
  ),
];
