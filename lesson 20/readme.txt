Загрузка данных в монгу.
docker exec -it mongodb bash
mongoimport --host localhost --db OTUS --collection user --type csv --file some_customers.csv --headerline
mongosh
➜  hw40 git:(main) ✗ docker exec -it mongodb bash
mongoimport --host localhost --db OTUS --collection user --type csv --file some_customers.csv --headerline
mongosh
root@629c94964182:/# mongoimport --host localhost --db OTUS --collection user --type csv --file some_customers.csv --headerline
2024-03-02T10:12:46.502+0000    connected to: mongodb://localhost/
2024-03-02T10:12:46.530+0000    1154 document(s) imported successfully. 0 document(s) failed to import.
Переключаемся на базу
test> use OTUS
switched to db OTUS

Поиск всех документов в коллекции 'user'
db.user.find()
Результат:

OTUS> db.user.find()
[
  {
    _id: ObjectId('65e2fb9e19c5026f9f255b5e'),
    title: 'Dr.',
    first_name: 'Danilo',
    last_name: 'Ambrosini',
    correspondence_language: 'IT',
    birth_date: '1900-01-01',
    gender: 'Unknown',
    marital_status: '',
    country: 'IT',
    postal_code: 21100,
    region: '',
    city: 'Varese',
    street: 'Via dolomiti',
    building_number: 13
  }, 
  
  ...
]
Вставка нового документа в коллекцию 'user'
db.user.insertOne({
_id: ObjectId('65e2f9a8b8afc9a23e46ae86'),
title: 'Frau',
first_name: 'Susann',
last_name: 'Wiffler',
correspondence_language: 'DE',
birth_date: '1900-01-01',
gender: 'Female',
marital_status: '',
country: 'DE',
postal_code: 65201,
region: '',
city: 'Wiesbaden',
street: 'Rheingaustr 16',
building_number: ''
})
Результат:

OTUS> db.user.insertOne({
... _id: ObjectId('65e2f9a8b8afc9a23e46ae86'),
... title: 'Frau',
... first_name: 'Susann',
... last_name: 'Wiffler',
... correspondence_language: 'DE',
... birth_date: '1900-01-01',
... gender: 'Female',
... marital_status: '',
... country: 'DE',
... postal_code: 65201,
... region: '',
... city: 'Wiesbaden',
... street: 'Rheingaustr 16',
... building_number: ''
... })
{
  acknowledged: true,
  insertedId: ObjectId('65e2f9a8b8afc9a23e46ae86')
}

более сложные запросы:
db.users.find({_id: ObjectId('65e2f9a8b8afc9a23e46ae86')}, {title: 1, city: 0})
Результат:
{
... title: 'Frau'
}