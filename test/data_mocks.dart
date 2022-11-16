import 'package:flutter_contact/data/models/user_model.dart';
import 'package:flutter_contact/domain/entities/user_entity.dart';

const userEntity = UserEntity(
  id: "1",
  gender: "Female",
  name: NameEntity(title: "Mm", first: "Evah", last: "Ricka"),
  location: LocationEntity(
      state: "Ille-et-Vilaine",
      country: "France",
      city: "Rennes",
      postcode: 35000,
      street: StreetEntity(
        name: "square de stockholm",
        number: 3,
      )),
  email: "toto@test.com",
  age: 23,
  cell: "08344435353",
  picture: PictureEntity(
      large: "https://randomuser.me/api/portraits/men/65.jpg",
      medium: "https://randomuser.me/api/portraits/med/men/65.jpg",
      thumbnail: "https://randomuser.me/api/portraits/thumb/men/65.jpg"),
);
const userModel = UserModel(
  id: "1",
  gender: "Female",
  name: NameEntity(title: "Mm", first: "Evah", last: "Ricka"),
  location: LocationEntity(
      state: "Ille-et-Vilaine",
      country: "France",
      city: "Rennes",
      postcode: 35000,
      street: StreetEntity(
        name: "square de stockholm",
        number: 3,
      )),
  email: "toto@test.com",
  age: 23,
  cell: "08344435353",
  picture: PictureEntity(
      large: "https://randomuser.me/api/portraits/men/65.jpg",
      medium: "https://randomuser.me/api/portraits/med/men/65.jpg",
      thumbnail: "https://randomuser.me/api/portraits/thumb/men/65.jpg"),
);

const locationModel = LocationEntity(
    state: "Ille-et-Vilaine",
    country: "France",
    city: "Rennes",
    postcode: 35200,
    street: StreetEntity(
      name: "square de stockholm",
      number: 5,
    ));
const locationEntity = LocationEntity(
    state: "Ille-et-Vilaine",
    country: "France",
    city: "Rennes",
    postcode: 35200,
    street: StreetEntity(
      name: "square de stockholm",
      number: 5,
    ));

const nameModel = NameModel(title: "Mr", first: "Eddy", last: "Toky");
const nameEntity = NameEntity(title: "Mr", first: "Eddy", last: "Toky");

const streetModel = StreetModel(
  name: "square de stockholm",
  number: 5,
);

const streetEntity = StreetEntity(
  name: "square de stockholm",
  number: 5,
);

const pictureModel = PictureModel(
  large: "https://randomuser.me/api/portraits/men/65.jpg",
  medium: "https://randomuser.me/api/portraits/med/men/65.jpg",
  thumbnail: "https://randomuser.me/api/portraits/thumb/men/65.jpg",
);

const pictureEntity = PictureEntity(
  large: "https://randomuser.me/api/portraits/men/65.jpg",
  medium: "https://randomuser.me/api/portraits/med/men/65.jpg",
  thumbnail: "https://randomuser.me/api/portraits/thumb/men/65.jpg",
);

const List<UserEntity> usersEntity = [
  UserEntity(
    id: "1",
    gender: "Female",
    name: NameEntity(title: "Mm", first: "Evah", last: "Ricka"),
    location: LocationEntity(
        state: "Ille-et-Vilaine",
        country: "France",
        city: "Rennes",
        postcode: 35000,
        street: StreetEntity(
          name: "square de stockholm",
          number: 3,
        )),
    email: "toto@test.com",
    age: 23,
    cell: "08344435353",
    picture: PictureEntity(
        large: "https://randomuser.me/api/portraits/men/65.jpg",
        medium: "https://randomuser.me/api/portraits/med/men/65.jpg",
        thumbnail: "https://randomuser.me/api/portraits/thumb/men/65.jpg"),
  ),
  UserEntity(
    id: "2",
    gender: "Male",
    name: NameEntity(title: "Mr", first: "Eddy", last: "Toky"),
    location: LocationEntity(
        state: "Ille-et-Vilaine",
        country: "France",
        city: "Rennes",
        postcode: 35200,
        street: StreetEntity(
          name: "square de stockholm",
          number: 5,
        )),
    email: "toto@test.com",
    age: 30,
    cell: "06344435355",
    picture: PictureEntity(
      large: "https://randomuser.me/api/portraits/men/65.jpg",
      medium: "https://randomuser.me/api/portraits/med/men/65.jpg",
      thumbnail: "https://randomuser.me/api/portraits/thumb/men/65.jpg",
    ),
  )
];
const List<UserModel> usersModel = [
  UserModel(
    id: "1",
    gender: "Female",
    name: NameModel(
      title: "Mrs",
      first: "Sandra",
      last: "Meyer",
    ),
    location: LocationModel(
      city: "Dunkerque",
      state: "Corrèze",
      country: "France",
      postcode: 26347,
      street: StreetModel(
        number: 6820,
        name: "Quai Chauveau",
      ),
    ),
    email: "sandra.meyer@example.com",
    cell: "06-98-21-26-53",
    age: 23,
    picture: PictureModel(
        large: "https://randomuser.me/api/portraits/men/65.jpg",
        medium: "https://randomuser.me/api/portraits/med/men/65.jpg",
        thumbnail: "https://randomuser.me/api/portraits/thumb/men/65.jpg"),
  ),
  UserModel(
    id: "2",
    gender: "Male",
    name: NameModel(title: "Mr", first: "Eddy", last: "Toky"),
    location: LocationModel(
        state: "Ille-et-Vilaine",
        country: "France",
        city: "Rennes",
        postcode: 35200,
        street: StreetModel(
          name: "square de stockholm",
          number: 5,
        )),
    email: "toto@test.com",
    age: 30,
    cell: "06344435355",
    picture: PictureModel(
      large: "https://randomuser.me/api/portraits/men/65.jpg",
      medium: "https://randomuser.me/api/portraits/med/men/65.jpg",
      thumbnail: "https://randomuser.me/api/portraits/thumb/men/65.jpg",
    ),
  )
];

const errorMessage =
    """ {"error": "Uh oh, something has gone wrong. Please tweet us @randomapi about the issue. Thank you."}""";

const userString = """ 
{
  "name": {
    "title": "Mr",
    "first": "Auguste",
    "last": "Barbier"
  },
  "location": {
    "street": {
      "number": 540,
      "name": "Place Paul-Duquaire"
    },
    "city": "Amiens",
    "state": "Haut-Rhin",
    "country": "France",
    "postcode": 70164,
    "coordinates": {
      "latitude": "-74.8124",
      "longitude": "30.9913"
    },
    "timezone": {
      "offset": "-7:00",
      "description": "Mountain Time (US & Canada)"
    }
  },
  "email": "auguste.barbier@example.com",
  "dob": {
    "date": "1965-11-23T00:49:48.067Z",
    "age": 56
  },
  "cell": "06-50-92-32-36",
  "id": {
    "name": "INSEE",
    "value": "1651052127081 69"
  },
  "picture": {
    "large": "https://randomuser.me/api/portraits/men/11.jpg",
    "medium": "https://randomuser.me/api/portraits/med/men/11.jpg",
    "thumbnail": "https://randomuser.me/api/portraits/thumb/men/11.jpg"
  }
}

""";
const usersString = """ 
{
  "results": [
    {
     "gender":"male",
      "name": {
        "title": "Mr",
        "first": "Malo",
        "last": "Louis"
      },
      "location": {
        "street": {
          "number": 6556,
          "name": "Avenue Joliot Curie"
        },
        "city": "Dijon",
        "state": "Tarn-et-Garonne",
        "country": "France",
        "postcode": 30461,
        "coordinates": {
          "latitude": "76.4753",
          "longitude": "-132.7636"
        },
        "timezone": {
          "offset": "+8:00",
          "description": "Beijing, Perth, Singapore, Hong Kong"
        }
      },
      "email": "malo.louis@example.com",
      "dob": {
        "date": "1944-12-06T11:26:07.873Z",
        "age": 77
      },
      "cell": "06-57-71-51-76",
      "id": {
        "name": "INSEE",
        "value": "1441156099298 77"
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/4.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/4.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/4.jpg"
      }
    },
    {
      "gender":"male",
      "name": {
        "title": "Mr",
        "first": "Auguste",
        "last": "Barbier"
      },
      "location": {
        "street": {
          "number": 540,
          "name": "Place Paul-Duquaire"
        },
        "city": "Amiens",
        "state": "Haut-Rhin",
        "country": "France",
        "postcode": 70164,
        "coordinates": {
          "latitude": "-74.8124",
          "longitude": "30.9913"
        },
        "timezone": {
          "offset": "-7:00",
          "description": "Mountain Time (US & Canada)"
        }
      },
      "email": "auguste.barbier@example.com",
      "dob": {
        "date": "1965-11-23T00:49:48.067Z",
        "age": 56
      },
      "cell": "06-50-92-32-36",
      "id": {
        "name": "INSEE",
        "value": "1651052127081 69"
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/11.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/11.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/11.jpg"
      }
    }
  ],
  "info": {
    "seed": "1937613e8c5a7e55",
    "results": 2,
    "page": 1,
    "version": "1.4"
  }
}


 """;
