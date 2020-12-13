User.delete_all
User.create([{ name: 'User', email: 'user.abb@lentilasanything.com', password: "password", remember_created_at: nil, site_id: 1, access: 1 },
{ name: 'Admin', email: 'admin.abb@lentilasanything.com', password: "password", remember_created_at: nil, site_id: 1, access: 2 },
{ name: 'User', email: 'user.tho@lentilasanything.com', password: "password", remember_created_at: nil, site_id: 2, access: 1 },
{ name: 'Admin', email: 'admin.tho@lentilasanything.com', password: "password", remember_created_at: nil, site_id: 2, access: 2 },
{ name: 'User', email: 'user.stk@lentilasanything.com', password: "password", remember_created_at: nil, site_id: 3, access: 1 },
{ name: 'Admin', email: 'admin.stk@lentilasanything.com', password: "password", remember_created_at: nil, site_id: 3, access: 2 },
{ name: 'User', email: 'user.new@lentilasanything.com', password: "password", remember_created_at: nil, site_id: 4, access: 1 },
{ name: 'Admin', email: 'admin.new@lentilasanything.com', password: "password", remember_created_at: nil, site_id: 4, access: 2 }])

Site.delete_all
Site.create([
    { id: 1, name: 'Abbotsford', address: '1/3 St Heliers St, Abbotsford VIC 3067', phone: "(03) 9419 6444"},
    { id: 2, name: 'Thornbury', address: '562-564 High St, Thornbury VIC 3071', phone: "0406 101 181"},
    { id: 3, name: 'St Kilda', address: '41 Blessington St, St Kilda VIC 3182', phone: "0424 345 368"},
    { id: 4, name: 'Newtown', address: '391 King St, Newtown NSW 2042', phone: "(02) 8283 5580"}
])

Category.delete_all
Category.create([
    { id: 1, name: 'Dairy'},
    { id: 2, name: 'Fruits'},
    { id: 3, name: 'Grains'},
    { id: 4, name: 'Meat'},
    { id: 5, name: 'Seafood'},
    { id: 6, name: 'Spices/Herbs'},
    { id: 7, name: 'Vegetables'},
    { id: 8, name: 'Others'}
])

Size.delete_all
Size.create([
    { id: 1, name: 'Kilogram (kg)'},
    { id: 2, name: 'Gram (g)'},
    { id: 3, name: 'Miligram (mg)'},
    { id: 4, name: 'Liter (l)'},
    { id: 5, name: 'Mililiter (ml)'},
    { id: 6, name: 'pcs'}
])

Donator.delete_all
Donator.create([
    { id: 1, name: '', address: '', phone: ''},
    { id: 2, name: 'The Essential Ingredient South Melbourne', address: '266 Coventry St, South Melbourne VIC 3205', phone: '(03) 9682 3414'},
    { id: 3, name: 'Saigon Village', address: '11 Nicholson St, Abbotsford VIC 3067', phone: '(03) 9421 1160'},
    { id: 4, name: 'Coles Northcote', address: 'Northcote Plaza Shopping Centre, Northcote VIC 3070', phone: '(03) 9085 1200'}
])

Transfer.delete_all
Consumption.delete_all
Stock.delete_all
# Stock.create([
#     { id: 1, name: 'Sweet Soy Sauce', quantity: 620, size_id: 5, description: 'in bottle', site_id: 1, category_id: 8, donator_id: 4},
#     { id: 2, name: 'Radish', quantity: 120, size_id: 1, site_id: 1, category_id: 7, donator_id: 4},
#     { id: 3, name: 'Fish', quantity: 200, size_id: 1, site_id: 2, category_id: 5, donator_id: 3},
#     { id: 4, name: 'Milk', quantity: 150, size_id: 4, site_id: 3, category_id: 1, donator_id: 3},
#     { id: 5, name: 'Beaf', quantity: 530, size_id: 1, site_id: 3, category_id: 4, donator_id: 2},
#     { id: 6, name: 'Mutton', quantity: 420, size_id: 1, site_id: 3, category_id: 4, donator_id: 2},
#     { id: 7, name: 'Potato', quantity: 610, size_id: 1, site_id: 1, category_id: 7, donator_id: 4},
#     { id: 8, name: 'Yogurt', quantity: 410, size_id: 4, site_id: 2, category_id: 1, donator_id: 3},
#     { id: 9, name: 'Cheese', quantity: 220, size_id: 4, description: 'Natural and processed cheese products.', site_id: 2, category_id: 1, donator_id: 3},
#     { id: 10, name: 'Peaches', quantity: 350, size_id: 1, site_id: 4, category_id: 2, donator_id: 1},
#     { id: 11, name: 'Bananas', quantity: 110, size_id: 6, site_id: 4, category_id: 2, donator_id: 1},
#     { id: 12, name: 'Blueberries', quantity: 410, size_id: 1, site_id: 4, category_id: 2, donator_id: 1}
# ])

