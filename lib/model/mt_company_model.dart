class CompanyModel {
  String? companyName;
  String? industry;
  String? location;
  String? ratings;
  String? ratingCount;
  String? experienceRequired;
  String? availablePositions;
  String? salaryRange;
  String? image;

  CompanyModel({
    this.companyName,
    this.industry,
    this.location,
    this.ratings,
    this.ratingCount,
    this.experienceRequired,
    this.availablePositions,
    this.salaryRange,
    this.image,
  });
}

List<CompanyModel> allCompanies = [
  CompanyModel(
      companyName: 'Comtug',
      industry: 'Software Development',
      location: 'San Francisco, USA',
      ratings: '4.5',
      ratingCount: '120',
      experienceRequired: '3+ years',
      availablePositions: 'Software Engineer, Data Scientist',
      salaryRange: '\$80,000 - \$120,000',
      image: 'assets/images/comtug.png'
  ),
  CompanyModel(
      companyName: 'Digital corporation',
      industry: 'Artificial Intelligence',
      location: 'New York, USA',
      ratings: '4.7',
      ratingCount: '98',
      experienceRequired: '5+ years',
      availablePositions: 'AI Engineer, ML Researcher',
      salaryRange: '\$90,000 - \$150,000',
      image: 'assets/images/digital corporation.png'
  ),
  CompanyModel(
      companyName: 'Sofwhere',
      industry: 'Healthcare',
      location: 'London, UK',
      ratings: '4.2',
      ratingCount: '55',
      experienceRequired: '2+ years',
      availablePositions: 'Health Data Analyst, Project Manager',
      salaryRange: '\$60,000 - \$100,000',
      image: 'assets/images/softwhere.jpg'
  ),
  CompanyModel(
      companyName: 'Denside',
      industry: 'Finance/Tech',
      location: 'Tokyo, Japan',
      ratings: '4.6',
      ratingCount: '75',
      experienceRequired: '4+ years',
      availablePositions: 'Financial Analyst, Blockchain Developer',
      salaryRange: '\$70,000 - \$110,000',
      image: 'assets/images/denside.png'
  ),
  CompanyModel(
      companyName: 'TraceTerra',
      industry: 'Design & Marketing',
      location: 'Paris, France',
      ratings: '4.3',
      ratingCount: '40',
      experienceRequired: '1+ years',
      availablePositions: 'UI/UX Designer, Marketing Specialist',
      salaryRange: '\$50,000 - \$80,000',
      image: 'assets/images/trackterra.jpg'
  ),
  CompanyModel(
      companyName: 'MyUi',
      industry: 'Environmental Tech',
      location: 'Berlin, Germany',
      ratings: '4.8',
      ratingCount: '85',
      experienceRequired: '3+ years',
      availablePositions: 'Environmental Engineer, Data Scientist',
      salaryRange: '\$60,000 - \$100,000',
      image: 'assets/images/myui.png'
  ),
];