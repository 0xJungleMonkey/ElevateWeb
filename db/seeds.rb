# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
# load and parse json file
jsonFile = File.read(Rails.root.join('lib', 'Addresses.json'))
address_parse = JSON.parse(jsonFile)
# create random array

randomarray = Array.new(address_parse['addresses'].count - 1) { |e| e += 1 };
arandom = randomarray.shuffle;
address_counter = 0;
(address_parse['addresses'].count - 1).times do
	
	thisaddress = address_parse['addresses'][arandom[address_counter]]
	Address.create!(
		address_type: ["Home", "Business", "Shipping", "Billing"].sample,
		status: ["verified", "unverified"].sample,
		entity: ["Business", "Personal"].sample,
		number_and_street: thisaddress["address1"],
		suite_or_apartment: thisaddress["address2"],
		city: thisaddress["city"],
		postal_code: thisaddress["postalCode"],
		country: "murica",
		notes: Faker::TvShows::SouthPark.quote,
	)
	address_counter += 1

end

puts "//***************Address Table seeded with #{Address.count} records*****************"


require 'csv'
csvfile = File.read(Rails.root.join('lib', 'seeds', 'EmployeeList.csv'))
# csvfile = File.read(Rails.root.join('lib', 'EmployeeList.csv'))

table = CSV.parse(csvfile, headers: true)
table.each do |row|
  user = User.create(
    email: row['email'],
    password: 'password',
  )

  Employee.create!(
    user: user,
    last_name: row['last_name'],
    title: row['title'],
    first_name: row['first_name'],
    email: row['email'],
  )
  AdminUser.create(
    email: row['email'],
    password: 'password',
  )
end
AdminUser.create!(email: "admin@example.com", password: "password")
require 'faker'
100.times do
  # rand(1..4).times do?
  Lead.create!(
    Full_name_of_the_contact: Faker::FunnyName.two_word_name,
    Bussiness_name: Faker::Games::Fallout.character,
    Email: Faker::Internet.free_email,
    Phone: Faker::Number.number(digits: 10),
    Project_name: Faker::JapaneseMedia::OnePiece.island,
    Project_description: Faker::Movies::HarryPotter.quote,
    Department_incharge: Faker::JapaneseMedia::Naruto.village,
    Message: Faker::JapaneseMedia::OnePiece.quote,
    Attached_file: "fix later",
    Creation_date: Faker::Date.between(from: '2019-11-01', to: '2022-11-01T00:00:00.000Z')
  )
end
require 'faker'
50.times do
  Quote.create!(
    building_type: ["residential", "corporate", "hybrid", "commercial"].sample,
    service_quality: ["standard", "premium", "excelium"].sample,
    number_of_apartments: Faker::Number.between(from: 40, to: 350),
    number_of_floors: Faker::Number.number(digits: 2),
    number_of_businesses: Faker::Number.number(digits: 2),
    number_of_basements: Faker::Number.non_zero_digit,
    number_of_parking: Faker::Number.number(digits: 3),
    number_of_cages: Faker::Number.number(digits: 2),
    number_of_occupants: Faker::Number.number(digits: 4),
    number_of_hours: Faker::Number.within(range: 1..24),
    number_of_elevators_needed: Faker::Number.number(digits: 2),
    price_per_unit: Faker::Number.decimal(l_digits: 2),
    elevator_price: Faker::Number.decimal(l_digits: 3, r_digits: 2),
    installation_fee: Faker::Number.decimal(l_digits: 3, r_digits: 2),
    final_price: Faker::Number.decimal(l_digits: 4, r_digits: 2),
  )
end


record = 1
counter = 0
add_id = record + counter
34.times do
    user = User.create(
        email: Faker::Internet.email,
        password: 'password',
    )
    Customer.create!(
        user: user,
        CustomerCreationDate: Faker::Date.between(from: 3.years.ago, to: Date.today),
        CompanyName: (Faker::Company.name + Faker::Company.suffix),
        address_id: record + counter,
        FullNameOfCompanyContact: Faker::Name.unique.name,
        CompanyContactPhone: Faker::PhoneNumber.cell_phone,
        CompanyContactEMail: Faker::Internet.email,
        FullNameServiceTechAuth: Faker::Name.unique.name,
        TechAuthPhoneService: Faker::PhoneNumber.cell_phone,
        TechManagerEmailService: Faker::Internet.email,
    )
    counter += 1
end

puts "//***************Customer Table seeded with #{Customer.count} records*****************"


Customer.all.each do |cust|
  rand(1..2).times do
    Building.create!(
        address_id: cust.address_id,
        customer: cust,
        FullNameOfBuildingAdmin: Faker::Name.unique.name,
        EmailOfAdminOfBuilding: Faker::Internet.email,
        PhoneNumOfBuildingAdmin: Faker::PhoneNumber.cell_phone,
        FullNameOfTechContactForBuilding: Faker::Name.unique.name,
        TechContactEmailForBuilding: Faker::Internet.email,
        TechContactPhoneForBuilding: Faker::PhoneNumber.cell_phone,
    )
    counter += 1
	# add_id += 1

    end

end


puts "//***************Building Table seeded with #{Building.count} records*****************"

Building.all.each do |bob|
  rand(1..3).times do
    Battery.create!(
      employee_id: Faker::Number.between(from: Employee.first.id, to: (Employee.first.id + Employee.count - 1)),
      building: bob,
      Type: ["residential", "corporate", "hybrid", "commercial"].sample,
      Status: ["online", "online","online","online","online","online","online","online","online","intervention"].sample,
      CommissionDate: Faker::Date.between(from: 3.years.ago, to: Date.today),
      LastInspectionDate: Faker::Date.between(from: 1.years.ago, to: Date.today),
      OperationsCert: Faker::Demographic.educational_attainment,
      Information: Faker::Quote.matz,
      Notes: Faker::Quotes::Shakespeare.hamlet_quote,
    )
  end
end

puts "//***************Battery Table seeded with #{Battery.count} records*****************"

Battery.all.each do |bat|
  rand(1..3).times do
    Column.create!(
      battery: bat,
      Type: ["residential", "corporate", "hybrid", "commercial"].sample,
      NumOfFloorsServed: Faker::Number.within(range: 1..24),
      Status: ["online", "online","online","online","online","online","online","online","online","intervention"].sample,
      Information: Faker::Quote.matz,
      Notes: Faker::Quotes::Shakespeare.hamlet_quote,
    )
  end
end

puts "*(*******************Column Table seeded with #{Column.count} records ********************* "

Column.all.each do |col|
  rand(1..5).times do
    Elevator.create!(
      column: col,
      SerialNumber: Faker::Number.number(digits: 7),
      Model: ["standard", "premium", "excelium"].sample,
      Type: ["residential", "corporate", "hybrid", "commercial"].sample,
      Status: ["online", "online","online","online","online","online","online","online","online","intervention"].sample,
      CommisionDate: Faker::Date.between(from: 3.years.ago, to: Date.today),
      LastInspectionDate: Faker::Date.between(from: 1.years.ago, to: Date.today),
      InspectionCert: Faker::Demographic.educational_attainment,
      Information: Faker::Quote.matz,
      Notes: Faker::Quotes::Shakespeare.hamlet_quote,
    )
  end
end
puts "*(*******************Elevator Table seeded with #{Elevator.count} records ********************* "

Building.all.each do |bob|
  rand(1..4).times do
    BuildingDetail.create!(
      building: bob,
      InformationKey: ["floors", "max_occupants", "Construction_year"].sample,
      Value: [rand(), Faker::Date.between(from: 2.years.ago, to: Date.today)].sample,
    )
  end
end

puts "*(*******************BuildingDetail Table seeded with #{BuildingDetail.count} records********************* "
