# Тестовое задание Nest JS

## Запуск
1. Переименовать .env.example в .env (данные можно не вставлять, данные для БД прописаны в docker)
2. Запуск docker

Windows:
```
  docker-compose up --bild -d
```

Linux:
```
  docker compose up --build -d
```

## Ссылки
1. Документация Swagger - http://localhost:3000/api/docs ( GET )
2. Получение стран - http://localhost:3000/api/countries ( GET )
3. Получение items - http://localhost:3000/api/items ( GET )
4. Получение item по Id - http://localhost:3000/api/{id} ( GET )
5. Создание заказа - http:localhost:3000/api/orders ( POST )