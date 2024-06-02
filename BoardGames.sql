CREATE TABLE `boardgames`(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	name varchar(255) NOT NULL,
	price decimal(8, 2) NOT NULL,
	min_player INT UNSIGNED,
	max_player INT UNSIGNED,
	full_description varchar(255),
	mini_description varchar(255),
	rules varchar(255),
	game_series_id int UNSIGNED,
	release_date date,
	available boolean DEFAULT false NOT NULL,
	updated_at timestamp
);

CREATE TABLE `genres`(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	name varchar(255) NOT NULL
);

CREATE TABLE `boardgames_genres`(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	boardgame_id int UNSIGNED NOT NULL,
	genre_id int UNSIGNED NOT NULL
);

CREATE TABLE `users` (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	name varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	password varchar(255) NOT NULL,
	cart_id int UNSIGNED NOT NULL,
	count_bonuses decimal(8, 2),
	deleted_at timestamp
);

CREATE TABLE `cart_items`(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	cart_id int UNSIGNED NOT NULL,
	boardgame_id int UNSIGNED NOT NULL,
	amount INT UNSIGNED NOT NULL,
	price INT UNSIGNED NOT NULL
);

CREATE TABLE `orders` (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	user_id int UNSIGNED NOT NULL,
	address varchar(255),
	is_done boolean,
	created_at timestamp
);

CREATE TABLE `cart` (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	user_id int UNSIGNED NOT NULL
);


CREATE TABLE `orders_items` (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	order_id int UNSIGNED NOT NULL,
	boardgame_id int UNSIGNED NOT NULL,
	amount INT UNSIGNED NOT NULL,
	price INT UNSIGNED NOT NULL
);


CREATE TABLE `boardgames_images` (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	boardgame_id int UNSIGNED NOT NULL,
	`path` varchar(255) NOT NULL
);

CREATE TABLE `boardgame_series` (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	name varchar(255) NOT NULL
);

CREATE TABLE `history_purchase` (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	user_id int UNSIGNED NOT NULL,
	boardgame_id int UNSIGNED NOT NULL,
	amount INT NOT NULL,
	price INT NOT NULL,
	purchased_at timestamp NOT NULL
);

CREATE TABLE `reviews` (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	boardgame_id INT NOT NULL,
	`text` varchar(255),
	mark tinyint(2) NOT NULL,
	user_id int UNSIGNED NOT NULL,
	created_at timestamp NOT NULL
);


INSERT INTO Boardgames (name, price, min_player, max_player, full_description, mini_description, rules, game_series_id, release_date, available, updated_at) VALUES
('Монополия', 500, 2, 6, 'Классическая настольная игра на тему покупки и торговли недвижимостью', 'Покупай дома, строй отели, обанкроть противников', 'бросай кубики, совершай сделки...', 1, '1935-03-19', true, '2023-08-03 08:29:32'),
('Каркассон', 600, 2, 5, 'Стратегическая игра на составление карты средневекового ландшафта из тайлов', 'Выкладывай тайлы, составляй дороги, города и монастыри', 'правила достаточно простые и позволяют быстро влиться в процесс', 2, '2000-06-29', true, '2023-07-12 13:37:19'),
('Шакал', 400, 2, 4, 'Пиратская приключенческая игра с захватом сокровищ на необитаемом острове', 'Ищи сокровища, захватывай корабли и избегай ловушек', 'бросай кубик, двигай пирата, сражайся с другими', 3, '1998-09-15', true, '2023-07-05 12:13:47'),
('Колонизаторы', 700, 3, 4, 'Экономическая стратегия на освоение острова Катан', 'Строй поселения, добывай ресурсы и торгуй с другими игроками', 'бросай кубики, получай ресурсы, строй поселения', 4, '1995-10-19', true, '2023-06-29 17:42:11'),
('Пандемия', 650, 2, 4, 'Кооперативная игра на борьбу с глобальной пандемией', 'Исследуй мир, лечи болезни и предотвращай вспышки', 'используй уникальные способности персонажей, обменивайся картами', 5, '2008-09-10', true, '2023-08-07 14:03:09'),
('Тикет ту райд', 500, 2, 5, 'Стратегическая игра на строительство железных дорог по карте США','Собирай карты вагонов, строй маршруты и зарабатывай очки', 'бросай кубики, бери карты, строй пути', 6, '2004-03-15', true, '2023-07-26 04:39:18'),
('7 чудес', 600, 2, 7, 'Драфтовая игра на строительство чудес света', 'Выбирай карты, развивай цивилизацию и строй величественные сооружения', 'выбери карту, передай руку следующему игроку', 7, '2010-10-10', true, '2023-06-12 18:27:25'),
('Взрывные котята', 450, 2, 5, 'Юмористическая карточная игра на выживание', 'Тяни карты из колоды, избегай взрывающихся котят', 'тяни карты, используй специальные карты, взрывайся', 8, '2015-07-12', true, '2023-07-19 02:09:12'),
('Имаджинариум', 650, 3, 7, 'Ассоциативная игра на угадывание изображений', 'Выбирай карты по ассоциациям и угадывай карты других игроков', 'выбери карту с картинкой, подбери к ней ассоциацию', 9, '2001-03-01', true, '2023-08-05 06:33:37'),
('Зельеварение', 400, 2, 4, 'Семейная игра на приготовление зелий и волшебство','Комбинируй ингредиенты, создавай уникальные зелья и получай победные очки', 'бросай кубики, собирай ингредиенты, вари зелья', 10, '2018-04-10', true, '2023-07-08 03:19:06'),
('Сквозь века', 800, 2, 4, 'Цивилизационная стратегия на развитие и завоевание', 'Исследуй технологии, строй города и расширяй границы своей империи', 'бросай кубики, получай ресурсы, совершай действия', 11, '2019-01-15', true, '2023-06-20 21:31:30'),
('Древний ужас', 750, 1, 8, 'Кооперативная игра на борьбу с древними богами', 'Исследуй мир, сражайся с монстрами и запечатывай врата в другие измерения', 'бросай кубики, перемещайся по карте, атакуй монстров', 12, '2011-07-26', true, '2023-07-24 12:02:23'),
('Кланк!', 600, 2, 4, 'Приключенческая игра на исследование подземелья и сбор сокровищ', 'Спускайся в шахту, добывай драгоценности и уходи до обвала', 'бросай кубики, двигай мипла, покупай карты', 13, '2016-08-15', true, '2023-08-06 11:06:39'),
('Каверна: пещерные фермеры', 700, 2, 7, 'Экономическая стратегия на развитие фермы в пещере', 'Обустраивай жилье, выращивай скот и расширяй свою семью', 'бросай кубики, получай ресурсы, совершай действия', 14, '2013-09-10', true, '2023-07-04 08:26:43'),
('Агрикола', 850, 2, 5, 'Экономическая стратегия на развитие фермы в средневековую эпоху', 'Засевай поля, разводи животных и обустраивай свой дом', 'бросай кубики, получай ресурсы, совершай действи
я', 15, '2007-06-01', true, '2023-06-27 16:34:03'),
('Космические дальнобойщики', 650, 2, 4, 'Экономическая стратегия на космические перевозки', 'Покупай и продавай товары, путешествуй по галактике и зарабатывай деньги', 'бросай кубики, получай ресурсы, совершай действия', 16, '2019-03-01', true, '2023-07-30 01:46:49'),
('Серп', 800, 2, 5, 'Стратегическая игра на контроль территории и развитие технологий', 'Строй мехов, захватывай территории и борись за господство', 'бросай кубики, получай ресурсы, совершай действия', 17, '2016-10-01', true, '2023-06-19 14:30:44');

INSERT INTO boardgame_series (name) VALUES
('Монополия'),
('Каркассон'),
('Шакал'),
('Колонизаторы'),
('Пандемия'),
('Тикет ту райд'),
('7 чудес'),
('Взрывные котята'),
('Имаджинариум'),
('Зельеварение');


INSERT INTO genres (name) VALUES
('Стратегия'),
('Семейная'),
('Приключенческая'),
('Экономическая'),
('Кооперативная'),
('Драфтовая'),
('Ассоциативная'),
('Юмористическая'),
('Цивилизационная'),
('Подземелье');


INSERT INTO boardgames_genres (boardgame_id, genre_id) VALUES
(1, 1),
(2, 1),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 6),
(8, 8),
(9, 1),
(10, 2);


INSERT INTO users (name, email, password, cart_id, count_bonuses, deleted_at) VALUES
('Иван Иванов', 'ivan@example.com', '123456', 1, 5099, null),
('Петр Петров', 'petr@example.com', '654321', 2, 155, null),
('Мария Сидорова', 'maria@example.com', 'qwerty', 3, 0, null),
('Сергей Кузнецов', 'sergey@example.com', 'asdfgh', 4, 0, null),
('Екатерина Васильева', 'ekaterina@example.com', 'zxcvbn', 5, 7532, null),
('Александр Александров', 'alexander@example.com', '1qaz2wsx', 6, 453, null),
('Наталья Николаева', 'natalya@example.com', '3edc4rfv', 7, 834, null),
('Михаил Михайлов', 'mikhail@example.com', '5tgb6yhn', 8, 543, null),
('Дарья Соловьева', 'darya@example.com', '7ujm8ik,', 9, 913, null),
('Алексей Алексеев', 'alexey@example.com', '9ol341', 10, 572, null);

INSERT INTO cart (user_id) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);


INSERT INTO orders (user_id, address, is_done, created_at) VALUES
(1, 'Ульяновская область, город Клин, проезд Ленина, 23', true, '2023-08-07 14:03:09'),
(2, 'Псковская область, город Ступино, пер. Бухарестская, 69', true, '2023-07-26 04:39:18'),
(3, 'Брянская область, город Озёры, въезд Ломоносова, 87', true, '2023-06-12 18:27:25'),
(4, 'Кемеровская область, город Раменское, пр. Космонавтов, 52', true, '2023-07-19 02:09:12'),
(5, 'Ивановская область, город Серебряные Пруды, спуск Сталина, 54', true, '2023-08-05 06:33:37'),
(6, 'Ростовская область, город Талдом, въезд Чехова, 40', true, '2023-07-08 03:19:06'),
(7, 'Саратовская область, город Чехов, бульвар Балканская, 67', true, '2023-06-20 21:31:30'),
(8, 'Ульяновская область, город Домодедово, бульвар Бухарестская, 89', true, '2023-07-24 12:02:23'),
(9, 'Ростовская область, город Клин, спуск 1905 года, 01', true, '2023-08-06 11:06:39'),
(10, 'Читинская область, город Серебряные Пруды, пл. Ломоносова, 05', true, '2023-07-04 08:26:43');


INSERT INTO cart_items (cart_id, boardgame_id, amount, price) VALUES
(1, 1, 2, 1000),
(1, 2, 1, 600),
(2, 3, 3, 1200),
(2, 4, 2, 1400),
(3, 5, 1, 650),
(3, 6, 1, 500),
(4, 7, 2, 1200),
(4, 8, 3, 1350),
(5, 9, 4, 2600),
(5, 10, 1, 400);


INSERT INTO orders_items (order_id, boardgame_id, amount, price) VALUES
(1, 1, 2, 1000),
(1, 2, 1, 600),
(2, 3, 3, 1200),
(2, 4, 2, 1400),
(3, 5, 1, 650),
(3, 6, 1, 500),
(4, 7, 2, 1200),
(4, 8, 3, 1350),
(5, 9, 4, 2600),
(5, 10, 1, 400);


INSERT INTO boardgames_images (boardgame_id, path) VALUES
(1, 'monopoly.jpg'),
(2, 'carcassonne.jpg'),
(3, 'jackal.jpg'),
(4, 'settlers.jpg'),
(5, 'pandemic.jpg'),
(6, 'ticket_to_ride.jpg'),
(7, '7_wonders.jpg'),
(8, 'exploding_kittens.jpg'),
(9, 'imaginarium.jpg'),
(10, 'potion_explosion.jpg');


INSERT INTO history_purchase (user_id, boardgame_id, amount, price, purchased_at) VALUES
(1, 1, 2, 1000, '2023-08-07 14:03:09'),
(1, 2, 1, 600, '2023-07-26 04:39:18'),
(2, 3, 3, 1200, '2023-06-12 18:27:25'),
(2, 4, 2, 1400, '2023-07-19 02:09:12'),
(3, 5, 1, 650, '2023-08-05 06:33:37'),
(3, 6, 1, 500, '2023-07-08 03:19:06'),
(4, 7, 2, 1200, '2023-06-20 21:31:30'),
(4, 8, 3, 1350, '2023-07-24 12:02:23'),
(5, 9, 4, 2600, '2023-08-06 11:06:39'),
(5, 10, 1, 400, '2023-07-04 08:26:43');


INSERT INTO reviews (boardgame_id, `text`, mark, user_id, created_at) VALUES
(1, 'Отличная игра для всей семьи', 8, 1, '2023-08-07 14:03:09'),
(2, 'Очень интересная и захватывающая стратегия', 9, 2, '2023-07-26 04:39:18'),
(3, 'Весёлая и азартная игра для компании', 7, 3, '2023-06-12 18:27:25'),
(4, 'Немного сложная, но очень увлекательная игра', 8, 4, '2023-07-19 02:09:12'),
(5, 'Отличная кооперативная игра для любителей зомби-тематики', 9, 5, '2023-08-05 06:33:37'),
(6, 'Простая и весёлая игра для детей и взрослых', 7, 6, '2023-07-08 03:19:06'),
(7, 'Красивая и элегантная игра для любителей стратегий', 8, 7, '2023-06-20 21:31:30'),
(8, 'Очень смешная и непредсказуемая игра', 9, 8, '2023-07-24 12:02:23'),
(9, 'Увлекательная игра для любителей ассоциаций', 8, 9, '2023-08-06 11:06:39'),
(10, 'Чудесная игра для развития воображения', 7, 10, '2023-07-04 08:26:43'),
(1, 'Чудесная игра для развития воображения', 7, 10, '2023-07-04 08:26:43');



# Функции, процедуры и триггеры:

# 1) Триггер: При добавлении нового пользователя автоматически создаётся корзина. 
# 2) Процедура: Перенос игр из корзины в заказы. 
# 3) Функция: Получить среднюю оценку по id игры.  
# 4) Процедура: Вывести все игры по genre_id. 
# 5) Процедура: Составить топ 10 игр по оценкам. 
# 6) Процедура: Вывести все игры в границах цен. 
# 7) Процедура: Вывести все игры по количеству игроков. 
# 8) Триггер: При выполнении заказа, игры отправляются в history_purchase, и обновляются количество бонусов пользователя. 
# 9) Процедура: Вывести все фото по id игры.
# 10) Триггер: При удалении пользователя удалить корзину. 
# 11) Процедура: Вывести все игры в корзине пользователя. 
# 12) Функция: Получить полную стоимость всех покупок в корзине. 
# 13) Процедура: Вывести все игры по game_series_id.



# 1) Триггер: При добавлении нового пользователя автоматически создаётся корзина. 

DELIMITER //

CREATE TRIGGER `create_cart` AFTER INSERT ON `users` FOR EACH ROW
BEGIN
	INSERT INTO cart(user_id) VALUES
	(NEW.id);
END//

DELIMITER ;


# 2) Процедура: Перенос игр из корзины в заказы. 

DELIMITER //

CREATE PROCEDURE bringToOrders(cartId INT UNSIGNED, orderId INT UNSIGNED)
BEGIN
	DECLARE n INT DEFAULT 0;
	DECLARE i INT DEFAULT 0;
	DECLARE amountBuf INT UNSIGNED;
	DECLARE boardgame_idBuf INT UNSIGNED;
	DECLARE priceBuf decimal(8,2);
	SET i=0;
	SELECT COUNT(*) FROM cart_items WHERE cart_id = cartId INTO n;

	WHILE i<n DO
		SELECT boardgame_id, amount, price FROM cart_items WHERE cart_id = cartId LIMIT 1 OFFSET i INTO boardgame_idBuf, amountBuf, priceBuf;
		INSERT INTO orders_items(order_id, boardgame_id, amount, price) VALUES
		(orderId, boardgame_idBuf, amountBuf, priceBuf);

		SET i = i + 1;
	END WHILE;
	
END//

DELIMITER ;


# 3) Функция: Получить среднюю оценку по id игры.  

DELIMITER //

CREATE FUNCTION getGameAvgMark(boardgameId INT UNSIGNED) RETURNS decimal(10,5)
DETERMINISTIC LANGUAGE SQL
BEGIN
	DECLARE answer decimal(10,5);
	SELECT AVG(mark)
	FROM reviews
	WHERE boardgame_id = boardgameId INTO answer;

	RETURN answer;
END//

DELIMITER ;


# 4) Процедура: Вывести все игры по genre_id. 

DELIMITER //

CREATE PROCEDURE getGamesByGenre(genreId INT UNSIGNED)
BEGIN
	SELECT b.name
	FROM boardgames_genres AS bg
	JOIN boardgames AS b ON b.id = bg.boardgame_id
	WHERE genre_id = genreId;
END//

DELIMITER ;


# 5) Процедура: Составить топ 10 игр по оценкам. 

DELIMITER //

CREATE PROCEDURE getTopGame()
BEGIN
	SELECT b.name, AVG(mark)
	FROM reviews as r
	JOIN boardgames AS b ON b.id = r.boardgame_id
	GROUP BY b.name
	ORDER BY AVG(mark) DESC
	LIMIT 10;
END//

DELIMITER ;


# 6) Процедура: Вывести все игры в границах цен. 

DELIMITER //

CREATE PROCEDURE getGamesByPrice(leftPrice INT UNSIGNED, rightPrice INT UNSIGNED)
BEGIN
	SELECT name
	FROM boardgames
	WHERE leftPrice <= price and price <= rightPrice;
END//

DELIMITER ;


# 7) Процедура: Вывести все игры по количеству игроков. 

DELIMITER //

CREATE PROCEDURE getGamesByPlayers(leftPlayers INT UNSIGNED, rightPlayers INT UNSIGNED)
BEGIN
	SELECT name
	FROM boardgames
	WHERE min_player <= leftPlayers and rightPlayers <= max_player;
END//

DELIMITER ;


# 8) Триггер: При выполнении заказа, игры отправляются в history_purchase, и обновляются количество бонусов пользователя. 

DELIMITER //

CREATE TRIGGER `orderDone` AFTER UPDATE ON `orders`
FOR EACH ROW
BEGIN
   	DECLARE n INT DEFAULT 0;
	DECLARE i INT DEFAULT 0;
	DECLARE amountBuf INT UNSIGNED;
	DECLARE boardgame_idBuf INT UNSIGNED;
	DECLARE priceBuf decimal(8,2);
	DECLARE allItems decimal(8,2);

	IF (NEW.is_done = true and OLD.is_done = false) THEN
		SET i=0;
		SELECT COUNT(*) FROM orders_items WHERE order_id = NEW.id INTO n;

		WHILE i<n DO
			SELECT boardgame_id, amount, price FROM orders_items WHERE order_id = NEW.id LIMIT 1 OFFSET i INTO boardgame_idBuf, amountBuf, priceBuf;

			INSERT INTO history_purchase(user_id, boardgame_id, amount, price, purchased_at) VALUES
			(NEW.user_id, boardgame_idBuf, amountBuf, priceBuf, NOW());

			SET i = i + 1;
		END WHILE;
	END IF;

	# обновляются количество бонусов пользователя
	SELECT SUM(price)
	FROM orders_items
	WHERE order_id = NEW.id INTO allItems;

	UPDATE users SET count_bonuses = count_bonuses + (allItems * 0.05) WHERE id = NEW.user_id;	

END;//

DELIMITER ;


# 9) Процедура: Вывести все фото по id игры.

DELIMITER //

CREATE PROCEDURE getPhotosByGame(boardgameId INT UNSIGNED)
BEGIN
	SELECT `path`
	FROM boardgames_images
	WHERE boardgame_id = boardgameId;
END//

DELIMITER ;


# 10) Триггер: При удалении пользователя удалить корзину. 

DELIMITER //

CREATE TRIGGER `delete_cart` AFTER DELETE ON `users` FOR EACH ROW
BEGIN
	DELETE FROM cart
	WHERE user_id = OLD.id;
END//

DELIMITER ;


# 11) Процедура: Вывести все игры в корзине пользователя. 

DELIMITER //

CREATE PROCEDURE getGamesByCart(cartId INT UNSIGNED)
BEGIN
	SELECT boardgame_id, amount, price 
	FROM cart_items
	WHERE cart_id = cartId;
END//

DELIMITER ;


# 12) Функция: Получить полную стоимость всех покупок в корзине. 

DELIMITER //

CREATE FUNCTION getFullPriceCart(cartId INT UNSIGNED) RETURNS decimal(10,5)
DETERMINISTIC LANGUAGE SQL
BEGIN
	DECLARE answer decimal(10,5);

	SELECT SUM(price)
	FROM cart_items
	WHERE cart_id = cartId INTO answer;

	RETURN answer;
END//

DELIMITER ;


# 13) Процедура: Вывести все игры по game_series_id.

DELIMITER //

CREATE PROCEDURE getGamesBySeries(seriesId INT UNSIGNED)
BEGIN
	SELECT name
	FROM boardgames
	WHERE game_series_id = seriesId;
END//

DELIMITER ;
