import 'package:roomy/feature/tenant_mode_listing/model/option_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

mixin DataTest {
  static final List<OptionModel> sharingWith = [
    OptionModel(false, 'images/tenant_mode/ic_roommate@3x.png', 'Roommate'),
    OptionModel(false, 'images/tenant_mode/ic_landlord@3x.png', 'Landlord'),
  ];
  static final List<OptionModel> gender = [
    OptionModel(false, 'images/tenant_mode/ic_male_filter@3x.png', 'Male'),
    OptionModel(false, 'images/tenant_mode/ic_female_filter@3x.png', 'Female'),
  ];
  static final List<OptionModel> bedroomType = [
    OptionModel(true, 'images/tenant_mode/ic_double_bed@3x.png', 'Double Bed'),
    OptionModel(false, 'images/tenant_mode/ic_single_bed@3x.png', 'Single Bed'),
  ];
  static final List<OptionModel> occupation = [
    OptionModel(
        false, 'images/tenant_mode/ic_professional@3x.png', 'Professionals'),
    OptionModel(false, 'images/tenant_mode/ic_student@3x.png', 'Students'),
  ];
  static final List<OptionModel> advertizing = [
    OptionModel(true, 'images/tenant_mode/ic_roommate@3x.png', 'Roommate'),
    OptionModel(false, 'images/tenant_mode/ic_landlord@3x.png', 'Landlord'),
    OptionModel(false, 'images/landlord_mode/ic_agent@3x.png', 'Agent')
  ];
  static final List<OptionModel> propertyType = [
    OptionModel(true, 'images/log_in/ic_1_step_1@3x.png', 'Room'),
    OptionModel(false, 'images/landlord_mode/ic_house@3x.png', 'House'),
    OptionModel(false, 'images/landlord_mode/ic_studio@3x.png', 'Apartment'),
  ];

  static final List<OptionModel> listAmenitiesModel = [
    OptionModel(
        false, 'images/tenant_mode/ic_washing@3x.png', 'In-unit Washer'),
    OptionModel(false, 'images/tenant_mode/ic_router@3x.png', 'Wifi Included'),
    OptionModel(false, 'images/tenant_mode/ic_armchair@3x.png', 'Furnished'),
    OptionModel(false, 'images/tenant_mode/ic_elevator@3x.png', 'Elevator'),
    OptionModel(false, 'images/tenant_mode/ic_valet@3x.png', 'Doorman'),
    OptionModel(false, 'images/tenant_mode/ic_air_conditioner@3x.png',
        'Air Conditioning'),
    OptionModel(false, 'images/tenant_mode/ic_radiator@3x.png', 'Heating'),
    OptionModel(
        false, 'images/tenant_mode/ic_calendar@3x.png', 'Month-to-Month'),
    OptionModel(false, 'images/tenant_mode/ic_stationary_bike@3x.png', 'Gym'),
    OptionModel(false, 'images/tenant_mode/ic_television@3x.png', 'TV'),
    OptionModel(
        false, 'images/tenant_mode/ic_bathtub@3x.png', 'Private Bathroom'),
    OptionModel(
        false, 'images/tenant_mode/ic_antique_balcony@3x.png', 'Balcony'),
    OptionModel(false, 'images/tenant_mode/ic_dog@3x.png', 'Has Dog'),
    OptionModel(false, 'images/tenant_mode/ic_cat@3x.png', 'Has Cat'),
    OptionModel(false, 'images/tenant_mode/ic_bird@3x.png', 'Has Other Pet')
  ];
  static final List<OptionModel> listRulesModel = [
    OptionModel(false, 'images/tenant_mode/ic_no_smoking@3x.png', 'No Smoking'),
    OptionModel(false, 'images/tenant_mode/ic_no_animals@3x.png', 'No Pets'),
    OptionModel(false, 'images/tenant_mode/ic_marijuana@3x.png', 'No Drugs'),
    OptionModel(false, 'images/tenant_mode/ic_no_drinks@3x.png', 'No Drinking'),
    OptionModel(false, 'images/tenant_mode/ic_dog@3x.png', 'Dogs OK'),
    OptionModel(false, 'images/tenant_mode/ic_cat@3x.png', 'Cats OK'),
    OptionModel(false, 'images/tenant_mode/ic_bird@3x.png', 'Other Pets OK'),
    OptionModel(false, 'images/tenant_mode/ic_couple@3x.png', 'Couple OK'),
  ];

  static final List<Map<String, dynamic>> listMessage = [
    <String, dynamic>{
      'sender': 'me',
      'message': 'Hi, My name is Sandra'
          'Is your room still available?',
      'time': '09:50 AM'
    },
    <String, dynamic>{
      'sender': 'you',
      'message': 'Hello, Yes, room still available',
      'time': '10:00 AM'
    },
    <String, dynamic>{
      'sender': 'me',
      'message':
          'Great. Just cheched out your Facebook and see we have 12 friend in common. We could be greate roommate!',
      'time': '09:50 AM'
    },
    <String, dynamic>{
      'sender': 'you',
      'message': 'Perfect. When would you like to come and see the room?',
      'time': '10:00 AM'
    },
    <String, dynamic>{
      'sender': 'me',
      'message': 'Tomorrow morning work!',
      'time': '10:00 AM'
    },
    <String, dynamic>{
      'sender': 'me',
      'message': 'Tomorrow morning work!',
      'time': '10:00 AM'
    },
    <String, dynamic>{
      'sender': 'you',
      'message': 'Perfect. When would you like to come and see the room?',
      'time': '10:00 AM'
    },
    <String, dynamic>{
      'sender': 'me',
      'message':
          'Great. Just cheched out your Facebook and see we have 12 friend in common. We could be greate roommate!',
      'time': '09:50 AM'
    },
    <String, dynamic>{
      'sender': 'me',
      'message':
          'Great. Just cheched out your Facebook and see we have 12 friend in common. We could be greate roommate!',
      'time': '09:50 AM'
    },
  ];
  static final List<Map<String, dynamic>> listPost = [
    <String, dynamic>{
      'id': 1,
      'imgAvt': 'images/tenant_mode/img_avatar_2@3x.png',
      'name': 'Mokua Lawrence',
      'type': 'Landlord',
      'age': 36,
      'male': true,
      'image': [
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
      ],
      'selected': false,
    },
    <String, dynamic>{
      'id': 2,
      'imgAvt': 'images/tenant_mode/img_avatar_2@3x.png',
      'name': 'Mokua Lawrence',
      'type': 'Landlord',
      'age': 36,
      'male': true,
      'image': [
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
      ],
      'selected': false,
    },
    <String, dynamic>{
      'id': 3,
      'imgAvt': 'images/tenant_mode/img_avatar_2@3x.png',
      'name': 'Mokua Lawrence',
      'type': 'Landlord',
      'age': 36,
      'male': true,
      'image': [
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
      ],
      'selected': false,
    },
    <String, dynamic>{
      'id': 4,
      'imgAvt': 'images/tenant_mode/img_avatar_2@3x.png',
      'name': 'Mokua Lawrence',
      'type': 'Landlord',
      'age': 36,
      'male': true,
      'image': [
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
      ],
      'selected': false,
    },
    <String, dynamic>{
      'id': 5,
      'imgAvt': 'images/tenant_mode/img_avatar_2@3x.png',
      'name': 'Mokua Lawrence',
      'type': 'Landlord',
      'age': 36,
      'male': true,
      'image': [
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
      ],
      'selected': false,
    },
    <String, dynamic>{
      'id': 6,
      'imgAvt': 'images/tenant_mode/img_avatar_2@3x.png',
      'name': 'Mokua Lawrence',
      'type': 'Landlord',
      'age': 36,
      'male': true,
      'image': [
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
      ],
      'selected': false,
    },
    <String, dynamic>{
      'id': 7,
      'imgAvt': 'images/tenant_mode/img_avatar_2@3x.png',
      'name': 'Mokua Lawrence',
      'type': 'Landlord',
      'age': 36,
      'male': true,
      'image': [
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
        'images/tenant_mode/img_landlord_profile@3x.png',
      ],
      'selected': false,
    },
  ];
  static List<Map<String, dynamic>> listOfMarker = [
    <String, dynamic>{
      'id': 1,
      'selected': true,
      'latLng': const LatLng(21.037763, 105.834160),
      'price': '\$650',
      'image': [
        'images/tenant_mode/img_landlord_1@3x.png',
        'images/tenant_mode/img_landlord_1@3x.png',
        'images/tenant_mode/img_landlord_1@3x.png',
        'images/tenant_mode/img_landlord_1@3x.png',
      ],
      'favored': false,
    },
    <String, dynamic>{
      'id': 2,
      'selected': false,
      'latLng': const LatLng(21.047763, 105.834160),
      'price': '\$680',
      'image': [
        'images/tenant_mode/img@3x.png',
        'images/tenant_mode/img@3x.png',
        'images/tenant_mode/img@3x.png',
      ],
      'favored': false,
    },
    <String, dynamic>{
      'id': 3,
      'selected': false,
      'latLng': const LatLng(21.057763, 105.834160),
      'price': '\$690',
      'image': [
        'images/tenant_mode/img_landlord_2@1x.png',
        'images/tenant_mode/img_landlord_2@1x.png',
      ],
      'favored': false,
    },
  ];
}
