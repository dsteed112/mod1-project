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

company3 = Company.create(
    user_name: 'Bill1987',
    company_name: 'USA Carpet Cleaning'
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
    description: 'Rotate Tires and Replace Air Filter',
    price: 70
)

service4 = Service.create(
    name: '20k',
    description: 'Oil Change and Rotate Tires',
    price: 70
)

service5 = Service.create(
    name: '25k',
    description: 'Rotate Tires',
    price: 70
)

service6 = Service.create(
    name: '30k',
    description: 'Rotate Tires, Oil Change, and Replace Air Filter',
    price: 70
)

service7 = Service.create(
    name: '35k',
    description: 'Rotate Tires',
    price: 70
)

service8 = Service.create(
    name: '40k',
    description: 'Oil Change and Rotate Tires',
    price: 70
)

service9 = Service.create(
    name: '45k',
    description: 'Rotate Tires and Replace Air Filter',
    price: 70
)

service10 = Service.create(
    name: '50k',
    description: 'Oil Change, Rotate Tires, and Replace Brake Fluid',
    price: 70
)

van1 = Van.create(
    nick_name: "Bob's Van",
    year: 2020,
    make: 'Ford',
    model: 'Transit',
    mileage: 2000,
    company_id: company1.id
)

van2 = Van.create(
    nick_name: "Jim's Van",
    year: 2019,
    make: 'Ford',
    model: 'Transit',
    mileage: 5500,
    company_id: company1.id
)

van3 = Van.create(
    nick_name: "Billy's Van",
    year: 2020,
    make: 'Ford',
    model: "Transit",
    mileage: 11000,
    company_id: company1.id
)

van4 = Van.create(
    nick_name: "Frank's Van",
    year: 2020,
    make: 'Mercedes-Benz',
    model: 'Sprinter',
    mileage: 15050,
    company_id: company2.id
)

van5 = Van.create(
    nick_name: "Sue's Van",
    year: 2019,
    make: 'Mercedes-Benz',
    model: 'Sprinter',
    mileage: 500,
    company_id: company2.id
)

van6 = Van.create(
    nick_name: "Sally's Van",
    year: 2019,
    make: 'Mercedes-Benz',
    model: 'Sprinter',
    mileage: 5025,
    company_id: company2.id
)

van7 = Van.create(
    nick_name: "Kat's Van",
    year: 2019,
    make: 'Mercedes-Benz',
    model: 'Sprinter',
    mileage: 5025,
    company_id: company3.id
)

van8 = Van.create(
    nick_name: "Jared's Van",
    year: 2020,
    make: 'Mercedes-Benz',
    model: 'Sprinter',
    mileage: 1421,
    company_id: company3.id
)

van9 = Van.create(
    nick_name: "Daniel's Van",
    year: 2019,
    make: 'Mercedes-Benz',
    model: 'Sprinter',
    mileage: 11383,
    company_id: company3.id
)

van10 = Van.create(
    nick_name: "James' Van",
    year: 2017,
    make: 'Mercedes-Benz',
    model: 'Sprinter',
    mileage: 69420,
    company_id: company3.id
)

van11 = Van.create(
    nick_name: "Ahmed's Van",
    year: 2018,
    make: 'Mercedes-Benz',
    model: 'Sprinter',
    mileage: 33256,
    company_id: company3.id
)

van_service1 = VanService.create(
    van_id: van2.id, 
    service_id: service1.id
)

van_service2 = VanService.create(
    van_id: van3.id, 
    service_id: service2.id
)

van_service3 = VanService.create(
    van_id: van4.id, 
    service_id: service3.id
)

van_service4 = VanService.create(
    van_id: van6.id, 
    service_id: service1.id
)

van_service5 = VanService.create(
    van_id: van7.id, 
    service_id: service1.id
)

van_service6 = VanService.create(
    van_id: van9.id, 
    service_id: service2.id
)

van_service7 = VanService.create(
    van_id: van10.id, 
    service_id: service10.id
)

van_service8 = VanService.create(
    van_id: van11.id, 
    service_id: service6.id
)