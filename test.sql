
-- Есть таблицы users, carts, orders, items
-- Реализовать связь этих таблиц.
-- Написать запрос создания всех 4 таблиц со связями.
create table users
(
    id   bigserial    not null
        constraint users_pkey
            primary key,
    name varchar(255) not null
);

-- корзина
create table carts
(

    id      bigserial not null
        constraint carts_pkey
            primary key,
    user_id bigint    not null
        constraint carts_user_id_foreign
            references users
            on delete cascade

);

-- заказы
create table orders
(

    id         bigserial not null
        constraint orders_pkey
            primary key,
    user_id    bigint    not null
        constraint orders_user_id_foreign
            references users
            on delete cascade,
    created_at timestamp(0) default CURRENT_TIMESTAMP
);

-- товары
create table items
(

    id   bigserial    not null
        constraint items_pkey
            primary key,
    name varchar(255) not null
);

create table cart_item
(
    cart_id     bigint            not null
        constraint cart_item_cart_id_foreign
            references carts
            on delete cascade,
    item_id     bigint            not null
        constraint cart_item_item_id_foreign
            references items
            on delete cascade,
    count_items integer default 1 not null,
    constraint cart_item_cart_id_item_id_unique
        unique (cart_id, item_id)
);

create table item_order
(
    item_id     bigint            not null
        constraint item_order_item_id_foreign
            references items
            on delete cascade,
    order_id    bigint            not null
        constraint item_order_order_id_foreign
            references carts
            on delete cascade,
    count_items integer default 1 not null,
    constraint item_order_item_id_order_id_unique
        unique (order_id, item_id)
);

-- Написать запрос добавления тестовых данных в эти таблицы.
INSERT INTO users (name)
VALUES ('Mark'),
       ('Bob');

INSERT INTO items (name)
VALUES ('Apple'),
       ('Raspberry');

INSERT INTO carts (user_id)
SELECT id
FROM users;

INSERT INTO cart_item (cart_id, item_id)
    (SELECT carts.id, items.id
     FROM carts,
          items
     ORDER BY RANDOM()
         LIMIT 3);

INSERT INTO orders (user_id)
SELECT id
FROM users
ORDER BY RANDOM()
    LIMIT 2;

INSERT INTO item_order (item_id, order_id)
    (SELECT items.id, orders.id
     FROM items,
          orders
     ORDER BY RANDOM()
         LIMIT 3);

-- Написать запрос для вывода одной таблицы, которая содержит эти данные:
-- users.id , users.name , orders.id , items.id, items.name, orders.created_at
SELECT users.id, users.name, orders.id, items.id, items.name, orders.created_at
FROM users
         join orders on users.id = orders.user_id
         join item_order io on orders.id = io.order_id
         join items on io.item_id = items.id;

-- Написать запрос удаления. Запрос должен удалять пользователя, корзину и все его заказы. DELETE FROM users WHERE id = 1;
-- Так как записи в таблицах с каскадным удалением, запрос удалит пользователя, корзину и все его заказы.
DELETE FROM users WHERE id = 1;