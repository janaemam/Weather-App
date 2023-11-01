


class City{

  String name;
  String country;

  City({
    required this.name,
    required this.country,

});

  static List<City> cities =[
    City(name: 'Algiers', country: 'Algeria'),
    City(name: 'Canberra', country: 'Australia'),
    City(name: 'Vienna', country: 'Austria'),
    City(name: 'Manama', country: 'Bahrain'),
    City(name: 'Brussels', country: 'Belgium'),
    City(name: 'Brasília', country: 'Brazil'),
    City(name: 'Sofia', country: 'Bulgaria'),
    City(name: 'Ottawa', country: 'Canada'),
    City(name: 'Beijing', country: 'China'),
    City(name: 'Copenhagen', country: 'Denmark'),
    City(name: 'Cairo', country: 'Egypt'),
    City(name: 'Helsinki', country: 'Finland'),
    City(name: 'Berlin', country: 'Germany'),
    City(name: 'Reykjavik', country: 'Iceland'),
    City(name: 'Mumbai', country: 'India'),
    City(name: 'Tokyo', country: 'Japan'),
    City(name: 'Beirut', country: 'Lebanon'),
    City(name: 'Rabat', country: 'Morocco'),
    City(name: 'Amsterdam', country: 'Netherlands'),
    City(name: 'Muscat', country: 'Oman'),
    City(name: 'Jerusalem', country: 'Palestine'),
    City(name: 'Doha', country: 'Qatar'),
    City(name: 'Moscow', country: 'Russia'),
    City(name: 'Madrid', country: 'Spain'),
    City(name: 'Ankara', country: 'Turkey'),
    City(name: 'New York', country: 'USA'),
    City(name: 'Caracas', country: 'Venezuela'),
    City(name: 'Sanaa', country: 'Yemen'),
    City(name: 'Lusaka', country: 'Zambia'),

  ];


  static List<City> getCities(){
    return cities;
  }
  static City getCity(String name){
    return cities.firstWhere((element)=> element.name== name);
  }
}