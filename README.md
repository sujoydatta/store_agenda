# README

To setup the project(run the commands simultaneously):

1. bundle install
2. rails db:migrate
3. rails db:seed


## API Documentation:
### 1. GET    /api/stores:

This API allows listing the existing items in the store

**output**: array of items in store with attribute id, code, name, price

**sample input**:`curl --location --request GET 'http://localhost:3000/api/stores'`

**success output**:
```
[
    {
        "id": 1,
        "code": "MUG",
        "name": "Reedsy Mug",
        "price": 6.0
    },
    ...
]
```

### 2. PUT    /api/stores/:id:

This API allows update of the existing item in the store

**body param**: product(hash): price attribute

**success output**: updated item with attribute id, code, name, price

**failed output**: error code and error message

**sample input**:
```
curl --location --request PUT 'http://localhost:3000/api/stores/2' \
--header 'Content-Type: application/json' \
--data-raw '{
    "product": {
        "price": "10.0"
    }
}'
```

**success output**:
```
{
    "id": 2,
    "code": "TSHIRT",
    "name": "Reedsy T-shirt",
    "price": 10.0
}
```

**failed output**:
```
{
    "error": {
        "code": 404,
        "message": "Product not found"
    }
}
```
### 3. GET    /api/stores/check_price

This API allows update of the existing item in the store

**query param**: items(array)

**success output**: price attribute(which give the total price of all the items)

**failed output**: error code and error message

**sample input**:
`curl --location -g --request GET 'http://localhost:3001/api/stores/check_price?items[]=MUG&items[]=TSHIRT&items[]=MUG&items[]=MUG' \`

**success output**:
```
{
    "price": 33.0
}
```

**failed output**:
```
{
    "error": {
        "code": 400,
        "message": "Items param not found"
    }
}
```
