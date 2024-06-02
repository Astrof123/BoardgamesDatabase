# BoardgamesDatabase

# Описание таблиц и связей:

## boardgames

* id: Уникальный идентификатор игры (первичный ключ)
* name: Название игры
* price: Цена игры
* min_player: Минимальное количество игроков
* max_player: Максимальное количество игроков
* full_description: Полное описание игры
* mini_description: Краткое описание игры
* rules: Правила игры
* game_series_id: Идентификатор серии игр (внешний ключ, ссылается на таблицу `boardgame_series`)
* release_date: Дата выпуска игры
* available: Доступность игры (true/false)
* updated_at: Дата последнего обновления записи

### Связи:
* Связана с таблицей boardgames_genres через внешний ключ game_series_id
* Связана с таблицей cart_items через внешний ключ boardgame_id
* Связана с таблицей history_purchase через внешний ключ boardgame_id
* Связана с таблицей orders_items через внешний ключ boardgame_id
* Связана с таблицей reviews через внешний ключ boardgame_id

## genres

* id: Уникальный идентификатор жанра (первичный ключ)
* name: Название жанра

### Связи:
* Связана с таблицей boardgames_genres через внешний ключ genre_id

## boardgames_genres

* id: Уникальный идентификатор связи (первичный ключ)
* boardgame_id: Идентификатор игры (внешний ключ, ссылается на таблицу boardgames)
* genre_id: Идентификатор жанра (внешний ключ, ссылается на таблицу genres)

### Связи:
* Связывает таблицы boardgames и genres

## users

* id: Уникальный идентификатор пользователя (первичный ключ)
* name: Имя пользователя
* email: Электронная почта пользователя
* password: Пароль пользователя
* cart_id: Идентификатор корзины пользователя (внешний ключ, ссылается на таблицу cart)
* count_bonuses: Количество бонусов пользователя
* deleted_at: Дата удаления записи

### Связи:
* Связана с таблицей cart через внешний ключ cart_id
* Связана с таблицей orders через внешний ключ user_id
* Связана с таблицей history_purchase через внешний ключ user_id
* Связана с таблицей reviews через внешний ключ user_id

## cart

* id: Уникальный идентификатор корзины (первичный ключ)
* user_id: Идентификатор пользователя (внешний ключ, ссылается на таблицу users)

### Связи:
* Связана с таблицей users через внешний ключ user_id
* Связана с таблицей cart_items через внешний ключ cart_id

## cart_items

* id: Уникальный идентификатор элемента корзины (первичный ключ)
* cart_id: Идентификатор корзины (внешний ключ, ссылается на таблицу cart)
* boardgame_id: Идентификатор игры (внешний ключ, ссылается на таблицу boardgames)
* amount: Количество игры в корзине
* price: Цена игры в корзине

### Связи:
* Связывает таблицы cart и boardgames
* Связана с таблицей orders_items через внешний ключ boardgame_id

## orders

* id: Уникальный идентификатор заказа (первичный ключ)
* user_id: Идентификатор пользователя (внешний ключ, ссылается на таблицу users)
* address: Адрес доставки заказа
* is_done: Статус выполнения заказа (true/false)
* created_at: Дата создания заказа

### Связи:
* Связана с таблицей users через внешний ключ user_id
* Связана с таблицей orders_items через внешний ключ order_id

## orders_items

* id: Уникальный идентификатор элемента заказа (первичный ключ)
* order_id: Идентификатор заказа (внешний ключ, ссылается на таблицу orders)
* boardgame_id: Иденти
фикатор игры (внешний ключ, ссылается на таблицу boardgames)
* amount: Количество игры в заказе
* price: Цена игры в заказе

### Связи:
* Связывает таблицы orders и boardgames
* Связана с таблицей cart_items через внешний ключ boardgame_id

## boardgames_images

* id: Уникальный идентификатор изображения (первичный ключ)
* boardgame_id: Идентификатор игры (внешний ключ, ссылается на таблицу boardgames)
* path: Путь к изображению

### Связи:
* Связана с таблицей boardgames через внешний ключ boardgame_id

## boardgame_series

* id: Уникальный идентификатор серии игр (первичный ключ)
* name: Название серии игр

### Связи:
* Связана с таблицей boardgames через внешний ключ game_series_id

## history_purchase

* id: Уникальный идентификатор покупки (первичный ключ)
* user_id: Идентификатор пользователя (внешний ключ, ссылается на таблицу users)
* boardgame_id: Идентификатор игры (внешний ключ, ссылается на таблицу boardgames)
* amount: Количество купленной игры
* price: Цена покупки
* purchased_at: Дата покупки

### Связи:
* Связана с таблицей users через внешний ключ user_id
* Связана с таблицей boardgames через внешний ключ boardgame_id

## reviews

* id: Уникальный идентификатор отзыва (первичный ключ)
* boardgame_id: Идентификатор игры (внешний ключ, ссылается на таблицу boardgames)
* text: Текст отзыва
* mark: Оценка игры (от 1 до 5)
* user_id: Идентификатор пользователя (внешний ключ, ссылается на таблицу users)
* created_at: Дата создания отзыва

### Связи:
* Связана с таблицей boardgames через внешний ключ boardgame_id
* Связана с таблицей users через внешний ключ user_id
