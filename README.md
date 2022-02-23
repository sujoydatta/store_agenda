# README

To setup the project(run the commands simultaneously):

1. bundle install
2. rails db:migrate
3. rails db:seed


API Documentation:
1. GET    /api/stores:
This API allows listing the existing items in the store
output: array of items in store with attribute id, code, name, price
sample input:curl --location --request GET 'http://localhost:3000/api/stores'
sample output:
[
    {
        "id": 1,
        "code": "MUG",
        "name": "Reedsy Mug",
        "price": 6.0
    },
    ...
]

2. PUT    /api/stores/:id

3. GET    /api/stores/check_price
