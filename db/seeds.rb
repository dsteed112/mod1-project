VanService.destroy_all
Van.destroy_all
Service.destroy_all
Company.destroy_all

company1 = Company.create(
    user_name: 'Alfred Pennyworth',
    company_name: 'Wayne Enterprises'
)

company2 = Company.create(
    user_name: 'Jarvis',
    company_name: 'Stark Industries'
)

service1 = Service.create(
    name: '5k',
    description: 'Rotate Tires',
    price: 40
)

service2 = Service.create(
    name: '10k',
    description: 'Oil Change and Rotate Tires',
    price: 100
)

service3 = Service.create(
    name: '15k',
    description: 'Rotate Tires and Air Filter',
    price: 70
)

van1 = Van.create(
    nick_name: "Bob's Van",
    year: 2020,
    make: 'Ford',
    model: 'Transit',
    mileage: 2000,
    company_id: company1
)

van2 = Van.create(
    nick_name: "Jim's Van",
    year: 2019,
    make: 'Ford',
    model: 'Transit',
    mileage: 5500,
    company_id: company1
)

van3 = Van.create(
    nick_name: "Billy's Van",
    year: 2020,
    make: 'Ford',
    model: "Transit",
    mileage: 1200,
    company_id: company1
)

van_service1 = VanService.create(
    van_id: van2, 
    service_id: service1
)
