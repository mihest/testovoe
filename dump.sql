--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

CREATE DATABASE testovoe WITH ENCODING='UTF8' OWNER postgres;
\c testovoe

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "countryId" uuid NOT NULL,
    title character varying NOT NULL,
    price integer NOT NULL,
    image character varying NOT NULL,
    description character varying NOT NULL,
    duration integer NOT NULL
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    count integer NOT NULL,
    "itemId" uuid NOT NULL,
    "orderId" uuid NOT NULL
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    phone character varying(20) NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, title) FROM stdin;
45fb3f53-b9a1-4a1a-b320-a302dd01b87c	Франция
75078e4b-784f-4196-a9da-547938798c2b	Россия
9fcd9161-a9c9-49bc-b465-d110df535c80	Тайланд
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, "countryId", title, price, image, description, duration) FROM stdin;
7657e32c-e3e7-402a-8286-a8580b0b9043	45fb3f53-b9a1-4a1a-b320-a302dd01b87c	Париж	150000	paris.jpg	<p>Париж, город любви и искусства, манит путешественников своими романтичными улочками, величественной архитектурой и богатой историей. Этот тур предоставляет уникальную возможность глубже узнать столицу Франции и насладиться её красотами.</p>\\n<h4><strong>День 1: Прибытие в Париж</strong></h4>\\n<p>Встреча в аэропорту и трансфер в отель.</p>\\n<p>Прогулка по району Монмартр: площадь Тертр, Базилика Сакре-Кёр и вечерний ужин в атмосфере уютного кафе.</p>\\n<p>Ночная прогулка по берегу Сены с видом на подсвеченные достопримечательности.</p>\\n<h4><strong>День 2: Знакомство с историей и культурой</strong></h4>\\n<p>Обзорная экскурсия по Парижу: Эйфелева башня, Триумфальная арка, Елисейские поля.</p>\\n<p>Посещение Лувра: знаменитая Мона Лиза и другие шедевры искусства.</p>\\n<p>Ужин на круизном катере по Сене с живой музыкой и великолепными панорамными видами.</p>\\n<h4><strong>День 3: Искусство и архитектура</strong></h4>\\n<p>Экскурсия по Нотр-Дам, а затем прогулка по Латинскому кварталу с его историческими улицами и атмосферными кафе.</p>\\n<p>Посещение Mus&eacute;e d'Orsay, где представлены произведения импрессионистов.</p>\\n<p>Вечером &mdash; свободное время для ужина в одном из традиционных французских ресторанов.</p>\\n<h4><strong>День 4: Королевская роскошь</strong></h4>\\n<p>Однодневная поездка в Версаль: экскурсия по великолепным дворцам и садам короля Людовика XIV.</p>\\n<p>Возможность пообедать в местном ресторане и насладиться французской кухней.</p>\\n<p>Возвращение в Париж и вечерняя прогулка по набережной.</p>\\n<h4><strong>День 5: Современный Париж</strong></h4>\\n<p>Посещение современного района Ла Дефанс и его небоскребов.</p>\\n<p>Свободное время для шопинга на бульваре Осман или отдых в одном из парижских парков, таких как Люксембургский сад.</p>\\n<p>Вечером посещение кабаре \\"Мулен Руж\\" с захватывающим шоу (по желанию).</p>\\n<h4><strong>День 6: Заключительный день</strong></h4>\\n<p>Утром можно посетить один из местных рынков или кафе на завтрак.</p>\\n<p>Трансфер в аэропорт для вылета.</p>\\n<p>Что включено в тур:</p>\\n<ul>\\n<li>Проживание в 4-звёздочном отеле.</li>\\n<li>Трансферы и экскурсии с гидом.</li>\\n<li>Питание: завтраки включены, некоторые ужины и специальные мероприятия.</li>\\n<li>Билеты в музеи и на экскурсии.</li>\\n</ul>\\n<p>Дополнительные опции: Возможность организовать экскурсии за пределами Парижа, включая это в планы поездки: например, в Диснейленд или в Шартр.</p>\\n<p>Париж ждет вас! Приготовьтесь к захватывающим открытиям и незабываемым впечатлениям в этом чудесном городе!</p>\\n	6
fdb9661f-3be3-46ef-b27e-ba0facd04867	75078e4b-784f-4196-a9da-547938798c2b	Москва	200000	moscow.jpg	<p>Приглашаем вас в увлекательное путешествие по столице России &mdash; Москве. Этот тур охватывает как исторические, так и современные достопримечательности, позволяя вам познакомиться с культурным богатством и многообразием города.</p>\\n<h4><strong>День 1: Прибытие в Москву</strong></h4>\\n<p>- Встреча в аэропорту и трансфер в отель.</p>\\n<p>- Обзорная экскурсия по городу: Красная площадь, Кремль, Храм Василия Блаженного.</p>\\n<p>- Ужин в традиционном русском ресторане с блюдами русской кухни.</p>\\n<h4><strong>День 2: Историческое наследие</strong></h4>\\n<p>- Экскурсия по Московскому Кремлю: посещение Собора Успения и Оружейной палаты.</p>\\n<p>- Прогулка по Александровскому саду и смотровая площадка на Воробьевых горах.</p>\\n<p>- Вечером &mdash; посещение театра на выбор: Большой театр или Московский драматический театр.</p>\\n<h4><strong>День 3: Современная Москва</strong></h4>\\n<p>- Поездка на одной из московских станций метро, известного своим уникальным дизайном.</p>\\n<p>- Посещение района Арбат с возможностью покупки сувениров и местных угощений.</p>\\n<p>- Ужин на круизном катере по Москве-реке с прекрасными видами на ночную столицу.</p>\\n<h4><strong>День 4: Культура и искусство</strong></h4>\\n<p>- Посещение Третьяковской галереи с самой большой коллекцией русского искусства.</p>\\n<p>- Экскурсия по Царицыно или Коломенскому парку, знакомство с русской архитектурой и природой.</p>\\n<p>- Вечером свободное время для изучения местной кухни в уютных кафе.</p>\\n<h4><strong>День 5: Заключительный день и выезд</strong></h4>\\n<p>- Утром свободное время для самостоятельных прогулок: посещение магазинов, галерей или художественных выставок.</p>\\n<p>- Трансфер в аэропорт для вылета.</p>\\n<p><strong>Что включено в тур:</strong></p>\\n<ul>\\n<li>-Проживание в 4-звёздочном отеле.</li>\\n<li>-Трансферы и экскурсии с опытными гидами.</li>\\n<li>-Питание: завтраки включены, ужины в ресторанах.</li>\\n</ul>\\n<p><strong>Дополнительные опции:</strong> Возможность организовать экскурсии за пределами Москвы, такие как Сергиев Посад или Носовые побрякушка.</p>\\n<p>Москва ждет вас с открытыми дверями, готовая рассказать свои истории и показать все свои лицо!</p>\\n<p><br /><br /></p>	5
3396d936-66d2-4cb6-ae89-1193c6ada64d	9fcd9161-a9c9-49bc-b465-d110df535c80	Бангкок	50000	bangkok.jpg	<p>Погрузитесь в атмосферу Бангкока &mdash; города, где современность встречается с традицией. Этот тур предлагает уникальную возможность познакомиться с богатой культурой, историей и гастрономией столицы Таиланда.</p>\\n<h4><strong>День 1: Прибытие в Бангкок</strong></h4>\\n<p>Встреча в аэропорту и трансфер в отель.</p>\\n<p>Прогулка по главной улице Каосан Роуд: возможность познакомиться с местной атмосферой и попробовать уличную еду.</p>\\n<p>Ужин в тайском ресторане с традиционными блюдами.</p>\\n<h4><strong>День 2: Классика тайской культуры</strong></h4>\\n<p>Экскурсия по Большому дворцу и Храму Изумрудного Будды (Wat Phra Kaew).</p>\\n<p>Посещение Храма Лежащего Будды (Wat Pho) с уникальной статуей Будды, размер которой впечатляет.</p>\\n<p>Прогулка по старинным районам города на традиционном лодочном такси по рекам и каналам.</p>\\n<p>Вечером свободное время для шопинга на местных рынках или в торговых центрах.</p>\\n<h4><strong>День 3: Тайская энергия</strong></h4>\\n<p>Экскурсия на остров Тау, где вы попробуете традиционные тайские массажи и спа-процедуры.</p>\\n<p>Посещение рынка Чатучак &mdash; одного из крупнейших рынков в мире, где вы найдете множество уникальных товаров.</p>\\n<p>Вечером &mdash; кулинарный мастер-класс, где вы научитесь готовить тайские блюда под руководством опытного шеф-повара.</p>\\n<h4><strong>День 4: Вокруг Бангкока</strong></h4>\\n<p>Однодневная поездка в Аюттайю &mdash; древнюю столицу Таиланда. Посещение исторических парков и храмов, занесенных в список Всемирного наследия ЮНЕСКО.</p>\\n<p>Обед в местном ресторане и возможность попробовать местные деликатесы.</p>\\n<p>Возвращение в Бангкок, вечер свободного времени.</p>\\n<h4><strong>День 5: Современный Бангкок</strong></h4>\\n<p>Посещение района Силом и современных небоскребов, таких как Байок Скай.</p>\\n<p>Прогулка по парку Лумпини, где можно отдохнуть и насладиться красотой природы.</p>\\n<p>Вечером &mdash; прогулка по улице Сукхумвит, известной своими ресторанами, барами и ночной жизнью.</p>\\n<h4><strong>День 6: Тайская культура и традиции</strong></h4>\\n<p>Участие в церемонии &ldquo;Тайская аллея&rdquo; с традиционным угощением.</p>\\n<p>Визит в Ват Арун (Храм Утренней Зари) &mdash; красивый храм с уникальной архитектурой.</p>\\n<p>Свободное время для шопинга и отдыха. Рекомендуем посетить один из местных торговых центров или рынков.</p>\\n<h4><strong>День 7: Заключительный день</strong></h4>\\n<p>Утренний завтрак в отеле и время для последних покупок.</p>\\n<p>Трансфер в аэропорт для вылета.</p>\\n<p><strong>Что включено в тур:</strong></p>\\n<ul>\\n<li>Проживание в 4-звёздочном отеле.</li>\\n<li>Трансферы и экскурсии с профессиональными гидами.</li>\\n<li>Питание: завтраки включены, некоторые обеды и ужины.</li>\\n<li>Входные билеты на экскурсии и мероприятия.</li>\\n</ul>\\n<p><strong>Дополнительные опции:</strong> Возможность организовать экскурсии в другие регионы Таиланда, такие как Паттайя или Чианг Май, а также приключения, такие как сплав по рекам или поездка на слонах.</p>\\n<p>Бангкок ждет вас! Откройте для себя его яркие контрасты, культуру и удивительные традиции в этом волшебном городе!</p>\\n<p><br /><br /><br /></p>	7
32cfe301-7003-465f-a043-7312412e175e	9fcd9161-a9c9-49bc-b465-d110df535c80	Пхукет	60000	phuket.jpg	Пхукет — это настоящий рай на Земле, известный своими белоснежными пляжами, лазурным морем и экзотической природой. Этот тур предоставит вам возможность насладиться красотой острова, его культурой и разнообразными активностями.\\n\\nДень 1: Прибытие на Пхукет\\nВстреча в аэропорту и трансфер в отель.\\nСвободное время для отдыха и акклиматизации.\\nВечерняя прогулка по пляжу Патонг с его развитой инфраструктурой, ресторанами и яркой ночной жизнью.\\n\\nДень 2: Исследуем остров\\nОбзорная экскурсия по Пхукету: посещение Храма Большого Будды и смотровой площадки на холме Карон.\\nПрогулка по старому городу Пхукета с его яркой архитектурой и рынками.\\nУжин в местном ресторане с традиционной тайской кухней.\\n\\nДень 3: Пляжный отдых\\nДень на пляже Ката или Карон: возможность отдохнуть, позагорать и поплавать в море.\\nВодные активности: сноркелинг, подводное плавание или катание на водных мотоциклах (оплачивается дополнительно).\\nВечером свободное время для прогулок или шопинга на пляже.\\n\\nДень 4: Экскурсия на острова\\nОднодневная экскурсия на острова Пхи-Пхи: посещение знаменитых пляжей, плавание в кристально чистых водах и сноркелинг.\\nОбед на острове и время для отдыха на берегу.\\nВозвращение на Пхукет и вечер свободного времени.\\n\\nДень 5: Культура и традиции\\nУтренний визит на рынок, где можно попробовать свежие местные продукты.\\nУчастие в мастер-классе по приготовлению тайских блюд с местным шеф-поваром.\\nСвободное время для отдыха и шопинга.\\n\\nДень 6: Живописные пейзажи\\nПоездка на слонах в джунгли: возможность насладиться красотой природы и увидеть местных животных.\\nПосещение водопадов и тропических садов.\\nВечером — прощальный ужин в ресторане на берегу моря с видом на закат.\\n\\nДень 7: Заключительный день\\nУтренний завтрак в отеле, свободное время для последних покупок или купания.\\nТрансфер в аэропорт для вылета.\\n\\nЧто включено в тур:\\nПроживание в 4-звёздочном отеле на берегу моря.\\nТрансферы и экскурсии с профессиональными гидами.\\nПитание: завтраки включены, некоторые обеды и ужины.\\nВходные билеты на экскурсии и мероприятия.\\nДополнительные опции: Возможность организовать экскурсии на другие близлежащие острова, такие как Симиланские острова, или участвовать в активных развлечениях, таких как дайвинг, каякинг и другие.\\n\\nПхукет ждет вас! Откройте для себя его потрясающие пляжи, уникальную культуру и незабываемые впечатления в этом тропическом раю!	7
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
1	1744360309507	Init1744368201627
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, count, "itemId", "orderId") FROM stdin;
d822a091-acb8-4fcd-b1ad-16a3a54e2335	2	fdb9661f-3be3-46ef-b27e-ba0facd04867	cd1e5f02-7bb1-4c5f-a77a-658f1e84a759
7d43d7ac-18cc-4f61-87e8-3c62d94a8a4a	3	7657e32c-e3e7-402a-8286-a8580b0b9043	cd1e5f02-7bb1-4c5f-a77a-658f1e84a759
45b84f09-33b7-4339-9094-b3c68b311faa	2	fdb9661f-3be3-46ef-b27e-ba0facd04867	cfca2aa0-0f55-4c5a-88b2-c1d7e74272fe
00a53cb5-1372-41d9-88db-ff7ee003bc08	3	7657e32c-e3e7-402a-8286-a8580b0b9043	cfca2aa0-0f55-4c5a-88b2-c1d7e74272fe
d69e1572-721e-4407-9853-a514478eebdc	2	fdb9661f-3be3-46ef-b27e-ba0facd04867	d0cc6e53-0e07-44a4-abc6-6d73f7b01971
ba8e6bb7-3dab-488e-a70e-ad4ac9fa0124	3	7657e32c-e3e7-402a-8286-a8580b0b9043	d0cc6e53-0e07-44a4-abc6-6d73f7b01971
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, name, phone) FROM stdin;
cd1e5f02-7bb1-4c5f-a77a-658f1e84a759	Mikhail	+79991111111
cfca2aa0-0f55-4c5a-88b2-c1d7e74272fe	Danil	+79588441320
d0cc6e53-0e07-44a4-abc6-6d73f7b01971	Danil	+79588441320
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, true);


--
-- Name: order_items PK_005269d8574e6fac0493715c308; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT "PK_005269d8574e6fac0493715c308" PRIMARY KEY (id);


--
-- Name: orders PK_710e2d4957aa5878dfe94e4ac2f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "PK_710e2d4957aa5878dfe94e4ac2f" PRIMARY KEY (id);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: countries PK_b2d7006793e8697ab3ae2deff18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT "PK_b2d7006793e8697ab3ae2deff18" PRIMARY KEY (id);


--
-- Name: items PK_ba5885359424c15ca6b9e79bcf6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT "PK_ba5885359424c15ca6b9e79bcf6" PRIMARY KEY (id);


--
-- Name: countries UQ_f0ab39b0865e4939e37308fe0a7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT "UQ_f0ab39b0865e4939e37308fe0a7" UNIQUE (title);


--
-- Name: items FK_d843f85f7a5ae6a8eeff64ebdac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT "FK_d843f85f7a5ae6a8eeff64ebdac" FOREIGN KEY ("countryId") REFERENCES public.countries(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_items FK_e253fbd572683bcc785a70cbca7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT "FK_e253fbd572683bcc785a70cbca7" FOREIGN KEY ("itemId") REFERENCES public.items(id) ON DELETE CASCADE;


--
-- Name: order_items FK_f1d359a55923bb45b057fbdab0d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT "FK_f1d359a55923bb45b057fbdab0d" FOREIGN KEY ("orderId") REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

