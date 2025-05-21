--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Postgres.app)
-- Dumped by pg_dump version 17.2 (Postgres.app)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: proficiency_level; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.proficiency_level AS ENUM (
    'not yet',
    'hard',
    'good'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: characters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.characters (
    id integer NOT NULL,
    radical character varying(8),
    frequency integer,
    gs_num integer,
    hsk2 character varying(8),
    hsk3 character varying(8),
    stroke_count integer,
    hanzi character varying(8) NOT NULL,
    pinyin character varying(8) NOT NULL,
    meaning text
);


--
-- Name: characters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.characters_id_seq OWNED BY public.characters.id;


--
-- Name: decks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.decks (
    id integer NOT NULL,
    name text NOT NULL,
    user_id integer NOT NULL,
    created_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    quantity integer DEFAULT 0 NOT NULL,
    favorited boolean DEFAULT false NOT NULL,
    memo character varying(100)
);


--
-- Name: decks_flashcards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.decks_flashcards (
    id integer NOT NULL,
    deck_id integer NOT NULL,
    flashcard_id integer NOT NULL,
    added_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: decks_flashcards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.decks_flashcards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: decks_flashcards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.decks_flashcards_id_seq OWNED BY public.decks_flashcards.id;


--
-- Name: decks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.decks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: decks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.decks_id_seq OWNED BY public.decks.id;


--
-- Name: flashcards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flashcards (
    id integer NOT NULL,
    user_id integer NOT NULL,
    character_id integer NOT NULL,
    user_proficiency public.proficiency_level DEFAULT 'not yet'::public.proficiency_level
);


--
-- Name: flashcards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.flashcards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flashcards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.flashcards_id_seq OWNED BY public.flashcards.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: characters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.characters ALTER COLUMN id SET DEFAULT nextval('public.characters_id_seq'::regclass);


--
-- Name: decks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.decks ALTER COLUMN id SET DEFAULT nextval('public.decks_id_seq'::regclass);


--
-- Name: decks_flashcards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.decks_flashcards ALTER COLUMN id SET DEFAULT nextval('public.decks_flashcards_id_seq'::regclass);


--
-- Name: flashcards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flashcards ALTER COLUMN id SET DEFAULT nextval('public.flashcards_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.characters (id, radical, frequency, gs_num, hsk2, hsk3, stroke_count, hanzi, pinyin, meaning) FROM stdin;
1	白 106.3	1	1155	1	1	8	的	de	possessive, adjectival suffix
2	一 1.0	2	1	1	1	1	一	yī	one; a, an; alone
3	日 72.5	3	1479	1	1	9	是	shì	indeed, yes, right; to be; demonstrative pronoun, this, that
4	一 1.3	4	91	1	1	4	不	bù	no, not; un-; negative prefix
5	亅 6.1	5	17	1	1	2	了	le	to finish; particle of completed action
6	土 32.3	6	388	1	1	6	在	zài	be at, in, on; consist in, rest
7	人 9.0	7	10	1	1	2	人	rén	man; people; mankind; someone else
8	月 74.2	8	390	1	1	6	有	yǒu	have, own, possess; exist
9	戈 62.3	9	761	1	1	7	我	wǒ	our, us, i, me, my, we
10	人 9.3	10	277	1	1	5	他	tā	other, another; he, she, it
11	辵 162.4	11	837	1	1	7	这	zhè	this, the, here
12	丨 2.2	12	45	1	1	3	个	gè	numerary adjunct, piece; single
13	人 9.3	13	273	1	1	5	们	men	adjunct pronoun indicate plural
14	丨 2.3	14	113	1	1	4	中	zhōng	central; center, middle; in the midst of; hit (target); attain
15	木 75.3	15	707	1	1	7	来	lái	come, coming; return, returning
16	一 1.2	16	36	1	1	3	上	shàng	top; superior, highest; go up, send up
17	大 37.0	17	32	1	1	3	大	dà	big, great, vast, large, high
18	丶 3.3	18	165	2	2	4	为	wèi	do, handle, govern, act; be
19	口 30.5	19	1131	1	1	8	和	hé	harmony, peace; peaceful, calm
20	囗 31.5	20	1081	1	1	8	国	guó	nation, country, nation-state
21	土 32.3	21	366	3	1	6	地	de	earth; soil, ground; region
22	刀 18.6	22	1063	2	1	8	到	dào	go to, arrive, been to
23	人 9.3	23	182	2	2	4	以	yǐ	by means of; thereby, therefore; consider as; in order to
24	言 149.7	24	1717	1	1	9	说	shuō	speak, say, talk; scold, upbraid
25	日 72.3	25	717	1	1	7	时	shí	time, season; era, age, period
26	襾 146.3	26	1441	2	1	9	要	yào	necessary, essential; necessity
27	尢 43.9	27	2728	2	1	12	就	jiù	just, simply; to come, go to; to approach, near
28	凵 17.3	28	330	1	1	5	出	chū	go out, send out; stand; produce
29	人 9.4	29	486	1	1	6	会	huì	assemble, meet together; meeting
30	口 30.2	30	212	2	2	5	可	kě	may, can, -able; possibly
31	乙 5.2	31	66	2	1	3	也	yě	also; classical final particle of strong affirmation or identity
32	人 9.5	32	782	1	1	7	你	nǐ	you, second person pronoun
33	寸 41.2	33	341	1	1	5	对	duì	correct, right; facing, opposed
34	生 100.0	34	263	1	1	5	生	shēng	life, living, lifetime; birth
35	肉 130.6	35	2146	1	1	10	能	néng	to be able; can, permitted to; ability
36	而 126.0	36	392	3	2	6	而	ér	and; and then; and yet; but
37	子 39.0	37	64	1	1	3	子	zi	offspring, child; fruit, seed of; 1st terrestrial branch
38	邑 163.4	38	564	1	1	6	那	nà	that, that one, those
39	彳 60.8	39	2341	2	1	11	得	dé	obtain, get, gain, acquire
40	二 7.1	40	24	3	2	3	于	yú	in, on, at; go to; surname
41	目 109.6	41	2398	2	1	11	着	zhe	make move, take action
42	一 1.2	42	30	1	1	3	下	xià	under, underneath, below; down; inferior; bring down
43	自 132.0	43	477	3	2	6	自	zì	self, private, personal; from
44	丿 4.3	44	58	4	4	3	之	zhī	marks preceding phrase as modifier of following phrase; it, him her, them; go to
45	干 51.3	45	444	1	1	6	年	nián	year
46	辵 162.3	46	379	2	1	6	过	guò	pass, pass through, go across
47	又 29.3	47	339	3	2	5	发	fā	issue, dispatch, send out; hair
48	口 30.3	48	482	1	1	6	后	hòu	queen, empress, sovereign; (simp. for後) behind, rear, after
49	人 9.5	49	777	1	1	7	作	zuò	make; work; compose, write; act, perform
50	里 166.0	50	721	1	1	7	里	lǐ	unit of distance; village; lane
51	用 101.0	51	283	3	1	5	用	yòng	use, employ, apply, operate; use
52	辵 162.9	52	2745	2	1	12	道	dào	path, road, street; method, way
53	行 144.0	53	483	3	1	6	行	xíng	go; walk; move, travel; circulate
54	戶 63.4	54	1164	2	2	8	所	suǒ	place, location; numerary adjunct
55	火 86.8	55	2723	2	2	12	然	rán	yes, certainly; pledge, promise
56	宀 40.7	56	2099	1	1	10	家	jiā	house, home, residence; family
57	禾 115.4	57	1549	3	3	9	种	zhǒng	seed; race, breed; to plant
58	亅 6.7	58	1038	2	1	8	事	shì	affair, matter, business; to serve; accident, incident
59	戈 62.3	59	401	3	2	6	成	chéng	completed, finished, fixed
60	方 70.0	60	163	3	1	4	方	fāng	a square, rectangle; a region; local
61	夕 36.3	61	507	1	1	6	多	duō	much, many; more than, over
62	糸 120.5	62	1350	2	2	8	经	jīng	classic works; pass through
63	丿 4.2	63	48	1	1	3	么	me	interrogative particle; repetition of a tune small; tender
64	厶 28.3	64	204	1	1	5	去	qù	go away, leave, depart
65	水 85.5	65	1241	3	2	8	法	fǎ	law, rule, regulation, statute; France, French
66	子 39.5	66	1273	1	1	8	学	xué	learning, knowledge; school
67	女 38.3	67	578	3	2	6	如	rú	if, supposing; as if; like, as
68	邑 163.9	68	1801	1	1	10	都	dōu	metropolis, capital; all, the whole; elegant, refined
69	口 30.3	69	427	1	1	6	同	tóng	same, similar; together with
70	玉 96.4	70	949	1	1	8	现	xiàn	appear, manifest, become visible
71	小 42.3	71	418	3	2	6	当	dāng	bear, accept, undertake; just
72	水 85.4	72	867	1	1	7	没	méi	not, have not, none; drown, sink
73	力 19.4	73	353	2	1	6	动	dòng	move, happen; movement, action
74	面 176.0	74	1455	1	1	9	面	miàn	face; surface; plane; side, dimension
75	走 156.3	75	1789	1	1	10	起	qǐ	rise, stand up; go up; begin
76	目 109.4	76	1539	1	1	9	看	kàn	look, see; examine, scrutinize
77	宀 40.5	77	1276	3	2	8	定	dìng	decide, settle, fix
78	大 37.1	78	78	1	1	4	天	tiān	sky, heaven; god, celestial
79	刀 18.2	79	146	1	1	4	分	fēn	divide; small unit of time etc.
80	辵 162.4	80	704	2	1	7	还	hái	still, yet, also, besides
81	辵 162.4	81	605	2	1	7	进	jìn	advance, make progress, enter
82	女 38.3	82	581	1	1	6	好	hǎo	good, excellent, fine; well
83	小 42.0	83	37	1	1	3	小	xiǎo	small, tiny, insignificant
84	邑 163.8	84	2044	4	2	10	部	bù	part, division, section
85	八 12.6	85	996	3	2	8	其	qí	his, her, its, their; that
86	二 7.5	86	1069	1	1	8	些	xiē	little, few; rather, somewhat
87	丶 3.4	87	300	3	2	5	主	zhǔ	master, chief owner; host; lord
88	木 75.6	88	1849	1	1	10	样	yàng	shape, form, pattern, style
89	玉 96.7	89	2157	3	2	11	理	lǐ	reason, logic; manage
90	心 61.0	90	174	3	2	4	心	xīn	heart; mind, intelligence; soul
91	女 38.3	91	582	1	1	6	她	tā	she, her
92	木 75.1	92	210	1	1	5	本	běn	root, origin, source; basis
93	刀 18.7	93	1650	1	1	9	前	qián	in front, forward; preceding
94	廾 55.1	94	76	1	1	4	开	kāi	open; initiate, begin, start
95	人 9.5	95	774	2	2	7	但	dàn	only; but, however, yet, still
96	囗 31.3	96	430	2	2	6	因	yīn	cause, reason; by; because (of)
97	口 30.2	97	246	3	2	5	只	zhǐ	only, just, simply
98	人 9.2	98	142	2	1	4	从	cóng	from, by, since, whence, through
99	心 61.9	99	2867	1	1	13	想	xiǎng	think, speculate, plan, consider
100	宀 40.5	100	1285	3	2	8	实	shí	real, true; honest, sincere
101	日 72.0	101	112	2	1	4	日	rì	sun; day; daytime
102	車 159.2	102	552	5	5	6	军	jūn	army, military; soldiers, troops
103	老 125.4	103	969	3	2	8	者	zhě	that which; he who; those who
104	心 61.9	104	2996	2	2	13	意	yì	thought, idea, opinion; think
105	无 71.0	105	81	4	4	4	无	wú	negative, no, not; KangXi radical 71
106	力 19.0	106	19	3	2	2	力	lì	power, capability, influence
107	宀 40.2	107	314	2	2	5	它	tā	it; other
108	一 1.3	108	34	4	4	3	与	yǔ	and; with; to; for; give, grant
109	長 168.0	109	127	2	2	4	长	zhǎng	long; length; excel in; leader
110	手 64.4	110	655	3	3	7	把	bǎ	hold, take; guard; regard as
111	木 75.2	111	377	1	1	6	机	jī	desk; machine; moment
112	十 24.0	112	4	1	1	2	十	shí	ten, tenth; complete; perfect
113	氏 83.1	113	327	4	3	5	民	mín	people, subjects, citizens
114	竹 118.5	114	2322	2	1	11	第	dì	sequence, number; grade, degree
115	八 12.2	115	148	2	2	4	公	gōng	fair, equitable; public; duke
116	止 77.2	116	411	4	3	6	此	cǐ	this, these; in this case, then
117	己 49.0	117	61	2	2	3	已	yǐ	already; finished; stop
118	工 48.0	118	26	1	1	3	工	gōng	labor, work; worker, laborer
119	人 9.6	119	1139	4	2	8	使	shǐ	cause, send on a mission, order; envoy, messenger, ambassador
120	心 61.8	120	2438	2	2	11	情	qíng	feeling, sentiment, emotion
121	日 72.4	121	1087	1	1	8	明	míng	bright, light, brilliant; clear
122	心 61.5	122	1268	4	3	8	性	xìng	nature, character, sex
123	矢 111.3	123	1122	2	1	8	知	zhī	know, perceive, comprehend
124	入 11.4	124	485	4	2	6	全	quán	maintain, keep whole or intact
125	一 1.2	125	22	1	1	3	三	sān	three
126	又 29.0	126	21	3	2	2	又	yòu	and, also, again, in addition
127	八 12.4	127	532	1	1	6	关	guān	frontier pass; close; relation
128	火 86.5	128	1469	1	1	9	点	diǎn	dot, speck, spot; point, degree
129	止 77.1	129	198	2	1	5	正	zhèng	right, proper, correct
130	一 1.4	130	231	3	2	5	业	yè	profession, business; GB radical 111
131	夕 36.2	131	293	2	1	5	外	wài	out, outside, external; foreign
132	爿 90.6	132	1617	4	3	9	将	jiāng	will, going to, future; general
133	一 1.6	133	697	2	1	7	两	liǎng	two, both, pair, couple; ounce
134	高 189.0	134	2021	1	1	10	高	gāo	high, tall; lofty, elevated
135	門 169.4	135	847	2	1	7	间	jiān	midpoint, space; place, locality
136	田 102.0	136	245	4	2	5	由	yóu	cause, reason; from
137	門 169.3	137	528	2	1	6	问	wèn	ask about, inquire after
138	彳 60.6	138	1584	1	1	9	很	hěn	very, quite, much
139	曰 73.8	139	2614	2	1	12	最	zuì	most, extremely, exceedingly
140	里 166.2	140	1552	3	1	9	重	zhòng	heavy, weighty; double
141	干 51.5	141	531	4	3	6	并	bìng	and, further, more, also, together with; to combine
142	牛 93.4	142	1127	3	2	8	物	wù	thing, substance, creature
143	手 64.0	143	121	2	1	4	手	shǒu	hand
144	广 53.4	144	836	3	2	7	应	yīng	should, ought to, must
145	戈 62.5	145	1468	5	4	9	战	zhàn	war, fighting, battle
146	口 30.3	146	480	3	2	6	向	xiàng	toward, direction, trend
147	大 37.2	147	310	3	2	5	头	tóu	head; top; chief, first; boss
148	文 67.0	148	161	3	1	4	文	wén	literature, culture, writing
149	人 9.5	149	770	2	1	7	体	tǐ	body; group, class, body, unit; inferior
150	攴 66.4	150	1376	5	4	9	政	zhèng	government, political affairs
151	羊 123.3	151	1642	4	3	9	美	měi	beautiful, pretty; pleasing
152	目 109.4	152	1430	3	2	9	相	xiāng	mutual, reciprocal, each other
153	見 147.0	153	118	1	1	4	见	jiàn	see, observe, behold; perceive
154	衣 145.5	154	2118	3	3	10	被	bèi	quilt, by, (indicates passive-voice clauses)
155	刀 18.5	155	763	4	2	7	利	lì	gains, advantage, profit, merit
156	人 9.2	156	129	1	1	4	什	shén	file of ten soldiers; mixed, miscellaneous
157	二 7.0	157	3	1	1	2	二	èr	two; twice
158	竹 118.6	158	2681	2	1	12	等	děng	class, rank, grade, equal to, same as, to wait for
159	立 117.1	159	522	5	3	6	产	chǎn	give birth, bring forth, produce
160	戈 62.4	160	1035	3	2	8	或	huò	or, either, else; perhaps, maybe
161	斤 69.9	161	2994	2	1	13	新	xīn	new, recent, fresh, modern
162	己 49.0	162	60	3	2	3	己	jǐ	self, oneself; personal, private; 6th heavenly stem
163	刀 18.6	163	1121	5	3	8	制	zhì	system; establish; overpower
164	身 158.0	164	786	2	1	7	身	shēn	body; trunk, hull; rad. no. 158
165	木 75.4	165	1079	1	1	8	果	guǒ	fruit; result
166	力 19.3	166	335	3	2	5	加	jiā	add to, increase, augment
167	襾 146.0	167	384	1	1	6	西	xī	west(ern); westward, occident
168	斤 69.8	168	2541	6	7–9	12	斯	sī	this, thus, such; to lop off; emphatic particle
169	月 74.0	169	150	1	1	4	月	yuè	moon; month; KangXi radical 74
170	言 149.6	170	1296	1	1	8	话	huà	speech, talk, language; dialect
171	口 30.3	171	488	4	2	6	合	hé	combine, unite, join; gather
172	囗 31.3	172	438	1	1	6	回	huí	return, turn around; a time
173	牛 93.6	173	1938	3	2	10	特	tè	special, unique, distinguished
174	人 9.3	174	271	5	3	5	代	dài	replace, replacement (of person or generation); era, generation
175	入 11.2	175	116	4	3	4	内	nèi	inside
176	人 9.7	176	1570	3	2	9	信	xìn	trust, believe; letter
177	衣 145.3	177	951	2	2	8	表	biǎo	show, express, manifest, display
178	匕 21.2	178	132	3	3	4	化	huà	change, convert, reform; -ize
179	老 125.0	179	360	1	1	6	老	lǎo	old, aged; experienced
180	糸 120.6	180	1758	2	1	9	给	gěi	give; by, for
181	一 1.4	181	206	3	3	5	世	shì	generation; world; era
182	人 9.5	182	784	3	2	7	位	wèi	throne; position, post; rank, status; seat
183	欠 76.2	183	521	2	1	6	次	cì	order, sequence; next
184	广 53.6	184	1622	4	2	9	度	dù	degree, system; manner; to consider
185	門 169.0	185	55	2	1	3	门	mén	gate, door, entrance, opening
186	人 9.4	186	467	4	3	6	任	rèn	trust to, rely on, appoint; to bear, duty, office; allow
187	巾 50.8	187	2257	2	1	11	常	cháng	common, normal, frequent, regular
188	儿 10.4	188	446	1	1	6	先	xiān	first, former, previous
189	水 85.7	189	2074	4	2	10	海	hǎi	sea, ocean; maritime
190	辵 162.7	190	2145	4	2	10	通	tōng	pass through, common, communicate
191	攴 66.7	191	2179	2	1	11	教	jiào	teach, class
192	儿 10.0	192	12	1	1	2	儿	ér	son, child; KangXi radical 10
193	厂 27.8	193	1868	4	2	10	原	yuán	source, origin, beginning
194	一 1.4	194	225	1	1	5	东	dōng	east, eastern, eastward
195	士 33.4	195	654	3	2	7	声	shēng	sound, voice, noise; tone; music
196	手 64.9	196	2520	3	2	12	提	tí	hold in hand; lift in hand
197	立 117.0	197	302	5	3	5	立	lì	stand; let stand; establish, set
198	又 29.2	198	52	4	3	3	及	jí	extend; reach; come up to; and
199	比 81.0	199	105	2	1	4	比	bǐ	to compare, liken; comparison; than
200	口 30.4	200	737	2	3	7	员	yuán	member; personnel, staff member
201	角 148.6	201	2981	3	3	13	解	jiě	loosen, unfasten, untie; explain
202	水 85.0	202	117	1	1	4	水	shuǐ	water, liquid, lotion, juice
203	口 30.3	203	505	1	1	6	名	míng	name, rank, title, position
204	目 109.5	204	1832	2	1	10	真	zhēn	real, actual, true, genuine
205	言 149.4	205	556	4	2	6	论	lùn	debate; discuss; discourse
206	夂 34.2	206	294	4	2	5	处	chù	place, locale; department
207	走 156.0	207	625	2	1	7	走	zǒu	walk, go on foot; run; leave
208	丿 4.2	208	57	5	3	3	义	yì	right conduct, righteousness
209	口 30.3	209	506	4	3	6	各	gè	each, individually, every, all
210	入 11.0	210	11	4	2	2	入	rù	enter, come in(to), join
211	几 16.0	211	14	1	1	2	几	jǐ	small table
212	口 30.0	212	38	3	1	3	口	kǒu	mouth; open end; entrance, gate
213	言 149.2	213	171	1	1	4	认	rèn	recognize, know, understand
214	木 75.3	214	816	2	1	7	条	tiáo	clause, condition; string, stripe
215	干 51.2	215	222	3	2	5	平	píng	flat, level, even; peaceful
216	糸 120.1	216	825	1	1	7	系	xì	system; line, link, connection
217	气 84.0	217	122	1	1	4	气	qì	steam, vapor; KangXi radical 84
218	頁 181.9	218	3233	2	2	15	题	tí	forehead; title, headline; theme
219	水 85.6	219	1672	4	2	9	活	huó	live, exist, survive; lively
220	小 42.2	220	286	4	5	5	尔	ěr	you; that, those; final particle
221	曰 73.3	221	693	3	2	7	更	gèng	more, still further, much more
222	刀 18.5	222	751	2	1	7	别	bié	separate, other; do not
223	手 64.2	223	196	1	1	5	打	dǎ	strike, hit, beat; fight; attack
224	女 38.0	224	67	1	1	3	女	nǚ	woman, girl; feminine; rad. 38
225	又 29.6	225	1204	3	2	8	变	biàn	change, transform, alter; rebel
226	囗 31.2	226	262	1	1	5	四	sì	four
227	示 113.5	227	1711	5	3	9	神	shén	spirit, god, supernatural being
228	八 12.7	228	1654	3	3	9	总	zǒng	collect; overall, altogether
229	人 9.5	229	771	4	3	7	何	hé	what, why, where, which, how
230	曰 73.1	230	242	1	1	5	电	diàn	electricity; electric; lightning
231	攴 66.9	231	2999	3	2	13	数	shù	number; several, count; fate
232	宀 40.3	232	549	3	2	6	安	ān	peaceful, tranquil, quiet
233	小 42.1	233	110	1	1	4	少	shǎo	few, less, inadequate
234	手 64.4	234	656	2	2	7	报	bào	report, tell, announce
235	手 64.0	235	29	3	2	3	才	cái	talent, ability; just, only
236	糸 120.6	236	1754	3	2	9	结	jié	knot, tie; join, connect
237	又 29.2	237	139	4	3	4	反	fǎn	reverse, opposite, contrary, anti
238	又 29.6	238	1174	4	2	8	受	shòu	receive, accept, get; bear, stand
239	目 109.0	239	236	3	2	5	目	mù	eye; look, see; division, topic
240	大 37.1	240	93	1	1	4	太	tài	very, too, much; big; extreme
241	里 166.5	241	2616	4	2	12	量	liàng	measure, quantity, capacity
242	冂 13.4	242	382	1	1	6	再	zài	again, twice, re-
243	心 61.9	243	2875	3	2	13	感	gǎn	feel, perceive, emotion
244	廴 54.6	244	1302	4	3	8	建	jiàn	build, establish, erect, found
245	夂 34.2	245	297	2	2	5	务	wù	affairs, business; must, should
246	人 9.9	246	2324	1	1	11	做	zuò	work, make; act
247	手 64.8	247	2185	3	2	11	接	jiē	receive; continue; catch; connect
248	心 61.1	248	321	3	2	5	必	bì	surely, most certainly; must
249	土 32.3	249	367	2	1	6	场	chǎng	open space, field, market
250	人 9.4	250	466	2	2	6	件	jiàn	numerary adjunct for article; matter
251	言 149.2	251	168	4	2	4	计	jì	plan, plot; strategem; scheme
252	竹 118.8	252	3123	4	3	14	管	guǎn	pipe, tube, duct; woodwind music
253	月 74.8	253	2542	1	1	12	期	qī	period of time; date; time limit
254	巾 50.2	254	301	3	2	5	市	shì	market, fair; city, town; trade
255	目 109.3	255	1011	3	2	8	直	zhí	straight, erect, vertical
256	彳 60.12	256	3272	5	5	15	德	dé	ethics, morality, virtue
257	貝 154.6	257	2039	4	3	10	资	zī	property; wealth; capital
258	口 30.5	258	1168	4	3	8	命	mìng	life; destiny, fate, luck; an order, instruction
259	山 46.0	259	39	3	1	3	山	shān	mountain, hill, peak
260	金 167.0	260	1166	4	3	8	金	jīn	gold; metals in general; money
261	手 64.6	261	1389	4	3	9	指	zhǐ	finger, toe; point, indicate
262	儿 10.5	262	675	4	2	7	克	kè	gram; overcome; transliteration
263	言 149.4	263	554	4	2	6	许	xǔ	allow, permit; promise; betroth
264	糸 120.6	264	1765	5	4	9	统	tǒng	govern, command, control; unite
265	匸 23.2	265	94	4	3	4	区	qū	area, district, region, ward
266	人 9.7	266	1562	4	3	9	保	bǎo	protect, safeguard, defend, care
267	至 133.0	267	410	4	3	6	至	zhì	reach, arrive; extremely, very
268	阜 170.2	268	180	4	2	4	队	duì	team, group; army unit
269	彡 59.4	269	604	5	3	7	形	xíng	form, shape, appearance
270	示 113.3	270	890	4	3	7	社	shè	god of the soil and altars to him; group of families; company, society
271	人 9.7	271	1556	2	2	9	便	biàn	convenience, ease; expedient
272	穴 116.3	272	1282	3	2	8	空	kōng	empty, hollow, bare, deserted
273	冫 15.4	273	523	3	3	6	决	jué	decide, determine, judge
274	水 85.5	274	1264	5	4	8	治	zhì	govern, regulate, administer
275	尸 44.7	275	2131	4	3	10	展	zhǎn	open, unfold; stretch, extend
276	馬 187.0	276	72	3	1	3	马	mǎ	horse; surname; KangXi radical 187
277	禾 115.4	277	1551	4	2	9	科	kē	section, department, science
278	口 30.2	278	325	2	2	5	司	sī	take charge of, control, manage; officer
279	二 7.2	279	88	1	1	4	五	wǔ	five; surname
280	土 32.8	280	2193	4	3	11	基	jī	foundation, base
281	目 109.6	281	2263	2	2	11	眼	yǎn	eye; eyelet, hole, opening
282	丨 2.3	282	188	1	1	4	书	shū	book, letter, document; writings
283	非 175.0	283	1064	2	1	8	非	fēi	not, negative, non-; oppose
284	刀 18.4	284	440	4	4	6	则	zé	rule, law, regulation; grades
285	口 30.4	285	739	1	1	7	听	tīng	hear; understand; obey, comply
286	白 106.0	286	275	2	1	5	白	bái	white; pure, unblemished; bright
287	卩 26.5	287	658	4	4	7	却	què	still, but; decline; retreat
288	田 102.4	288	1496	3	3	9	界	jiè	boundary, limit; domain; society; the world
289	辵 162.3	289	398	5	3	6	达	dá	arrive at, reach; intelligent; smooth, slippery
290	儿 10.4	290	417	4	3	6	光	guāng	light, brilliant, shine; only
291	攴 66.4	291	1223	3	1	8	放	fàng	put, release, free, liberate
292	弓 57.9	292	2802	5	3	12	强	qiáng	strong, powerful, energetic
293	卩 26.5	293	901	4	4	7	即	jí	promptly, quickly, immediately
294	人 9.12	294	2961	3	2	13	像	xiàng	a picture, image, figure; to resemble
295	又 29.8	295	2147	3	1	10	难	nán	difficult, arduous, hard; unable
296	一 1.4	296	237	3	2	5	且	qiě	moreover, also (post-subject); about to, will soon (pre-verb)
297	木 75.2	297	378	5	4	6	权	quán	power, right, authority
298	心 61.5	298	1500	2	2	9	思	sī	think, consider, ponder; final particle
299	玉 96.0	299	75	5	2	4	王	wáng	king, ruler; royal; surname
300	豕 152.5	300	2361	4	3	11	象	xiàng	elephant; ivory; figure, image
301	宀 40.4	301	877	2	2	7	完	wán	complete, finish, settle; whole
302	言 149.4	302	560	5	3	6	设	shè	build; establish; display
303	弋 56.3	303	349	4	3	6	式	shì	style, system, formula, rule
304	色 139.0	304	509	2	2	6	色	sè	color, tint, hue, shade; form, body; beauty, desire for beauty
305	足 157.6	305	2918	2	1	13	路	lù	road, path, street; journey
306	言 149.3	306	323	3	1	5	记	jì	record; keep in mind, remember
307	十 24.7	307	1422	3	1	9	南	nán	south; southern part; southward
308	口 30.6	308	1503	5	3	9	品	pǐn	article, product, commodity
309	人 9.5	309	783	1	1	7	住	zhù	reside, live at, dwell, lodge; stop
310	口 30.4	310	760	2	1	7	告	gào	tell, announce, inform; accuse
311	大 37.6	311	1646	5	3	9	类	lèi	class, group, kind, category
312	水 85.2	312	690	3	2	7	求	qiú	seek; demand, request; beseech
313	手 64.8	313	2189	3	3	11	据	jù	to occupy, take possession of; a base, position
314	禾 115.7	314	2677	4	3	12	程	chéng	journey, trip; schedule, agenda
315	匕 21.3	315	227	1	1	5	北	běi	north; northern; northward
316	辵 162.2	316	337	2	1	5	边	biān	edge, margin, side, border
317	歹 78.2	317	400	4	3	6	死	sǐ	die; dead; death
318	弓 57.4	318	909	3	3	7	张	zhāng	stretch, extend, expand; sheet
319	言 149.6	319	1300	3	2	8	该	gāi	should, ought to, need to
320	亠 8.4	320	519	4	2	6	交	jiāo	mix; intersect; exchange, communicate; deliver
321	見 147.4	321	952	4	3	8	规	guī	rules, regulations, customs, law
322	一 1.2	322	35	3	2	3	万	wàn	ten thousand; innumerable
323	又 29.6	323	997	4	2	8	取	qǔ	take, receive, obtain; select
324	手 64.5	324	981	4	2	8	拉	lā	pull, drag; seize, hold; lengthen
325	木 75.6	325	1845	4	3	10	格	gé	pattern, standard, form; style
326	月 74.7	326	2394	2	3	11	望	wàng	to look at, look forward; to hope, expect
327	見 147.5	327	1694	1	1	9	觉	jué	to wake up from sleep; conscious
328	木 75.1	328	211	4	3	5	术	shù	art, skill, special feat; method, technique
329	頁 181.5	329	2354	5	3	11	领	lǐng	neck; collar; lead, guide
330	八 12.4	330	371	2	2	6	共	gòng	together with, all, total; to share
331	石 112.7	331	2591	4	2	12	确	què	sure, certain; real, true
332	人 9.4	332	455	4	3	6	传	chuán	summon; propagate, transmit
333	巾 50.3	333	413	1	1	6	师	shī	teacher, master, specialist
334	見 147.2	334	586	4	2	6	观	guān	see, observe, view; appearance
335	水 85.8	335	2410	3	2	11	清	qīng	clear, pure, clean; peaceful
336	人 9.2	336	144	1	1	4	今	jīn	now, today, modern era
337	刀 18.2	337	107	4	3	4	切	qiè	cut, mince, slice, carve
338	阜 170.7	338	1734	1	1	9	院	yuàn	courtyard, yard, court; school
339	言 149.3	339	317	2	2	5	让	ràng	allow, permit, yield, concede
340	言 149.5	340	892	1	1	7	识	shí	recognize, understand, know
341	人 9.8	341	1964	1	1	10	候	hòu	wait; expect; visit; greet
342	巾 50.6	342	1407	3	2	9	带	dài	belt, girdle, band, strap, zone
343	寸 41.3	343	567	4	3	6	导	dǎo	direct, guide, lead, conduct
344	亅 6.5	344	508	4	3	6	争	zhēng	dispute, fight, contend, strive
345	辵 162.4	345	611	2	2	7	运	yùn	run; simplified form of 運 luck, fortune; ship, transport
346	竹 118.4	346	1952	2	1	10	笑	xiào	smile, laugh, giggle; snicker
347	乙 5.2	347	69	1	1	3	飞	fēi	fly; go quickly; dart; high
348	風 182.0	348	154	3	1	4	风	fēng	wind; air; manners, atmosphere
349	止 77.3	349	710	2	3	7	步	bù	step, pace; walk, stroll
350	攴 66.3	350	908	4	2	7	改	gǎi	change, alter; improve, remodel
351	攴 66.2	351	573	4	2	6	收	shōu	gather together, collect; harvest
352	木 75.6	352	1850	3	3	10	根	gēn	root, base(d on); foundation
353	干 51.0	353	23	3	1	3	干	gàn	oppose, offend; invade; dried
354	辵 162.7	354	1940	5	3	10	造	zào	construct, build, make, begin; prepare
355	言 149.0	355	826	4	2	7	言	yán	words, speech; speak, say
356	耳 128.6	356	2544	4	3	12	联	lián	connect, join; associate, ally
357	手 64.6	357	1367	4	3	9	持	chí	sustain, support; hold, grasp
358	糸 120.5	358	1338	5	2	8	组	zǔ	class; section, department
359	毋 80.3	359	767	2	3	7	每	měi	every, each
360	水 85.6	360	1678	4	3	9	济	jì	help, aid, relieve; ferry, cross
361	車 159.0	361	100	1	1	4	车	chē	cart, vehicle; carry in cart
362	立 117.4	362	1631	4	3	9	亲	qīn	relatives, parents; intimate the hazel nut or filbert tree a thorny tree
363	木 75.3	363	687	3	3	7	极	jí	extreme, utmost, furthest, final
364	木 75.4	364	1018	4	4	8	林	lín	forest, grove; surname
365	月 74.4	365	1190	1	1	8	服	fú	clothes; wear, dress
366	心 61.4	366	876	2	1	7	快	kuài	rapid, quick, speedy, fast; soon
367	力 19.2	367	181	3	2	4	办	bàn	manage, do, handle; deal with
368	言 149.3	368	320	3	3	5	议	yì	consult, talk over, discuss
369	彳 60.5	369	1160	2	2	8	往	wǎng	go, depart; past, formerly
370	儿 10.2	370	80	3	1	4	元	yuán	first; dollar; origin; head
371	艸 140.5	371	1006	5	2	8	英	yīng	petal, flower, leaf; brave, a hero; England, English
372	士 33.0	372	28	4	4	3	士	shì	scholar, gentleman; soldier
373	言 149.5	373	885	4	3	7	证	zhèng	prove, confirm, verify; proof
374	辵 162.4	374	791	2	2	7	近	jìn	near, close; approach; intimate
375	大 37.2	375	265	4	3	5	失	shī	lose; make mistake, neglect
376	車 159.4	376	1059	4	3	8	转	zhuǎn	shift, move, turn
377	大 37.1	377	79	2	3	4	夫	fū	man, male adult, husband; those
378	人 9.3	378	282	5	5	5	令	lìng	to order, to command, an order
379	冫 15.8	379	2024	2	1	10	准	zhǔn	approve, allow, permit; in accord
380	巾 50.2	380	218	5	3	5	布	bù	cotton cloth, textiles, linen
381	女 38.5	381	1329	2	3	8	始	shǐ	begin, start; then, only then
382	心 61.5	382	1543	1	1	9	怎	zěn	what? why? how?
383	口 30.5	383	1102	1	1	8	呢	ne	interrogative or emphatic final; (Cant.) this
384	子 39.3	384	391	4	3	6	存	cún	exist, live, be; survive; remain
385	木 75.1	385	192	5	4	5	未	wèi	not yet; 8th terrestrial branch
386	辵 162.4	386	608	2	1	7	远	yuǎn	distant, remote, far; profound
387	口 30.2	387	253	1	1	5	叫	jiào	cry, shout; hail, greet, call
388	口 30.2	388	342	4	3	5	台	tái	platform; unit; term of address
389	八 12.6	389	1232	3	2	8	单	dān	single, individual, only; lone
390	彡 59.12	390	3240	1	1	15	影	yǐng	shadow; image, reflection; photograph
391	八 12.6	391	1077	4	3	8	具	jù	tool, implement; draw up, write
392	网 122.3	392	1108	\N	7–9	8	罗	luō	net for catching birds; gauze
393	子 39.3	393	548	1	1	6	字	zì	letter, character, word
394	爪 87.6	394	1987	1	1	10	爱	ài	love, be fond of, like
395	凵 17.3	395	195	5	5	5	击	jī	strike, hit, beat; attack, fight
396	水 85.6	396	2080	4	2	10	流	liú	flow, circulate, drift; class
397	夂 34.5	397	1200	2	1	8	备	bèi	prepare, ready, perfect
398	八 12.5	398	768	5	4	7	兵	bīng	soldier, troops
399	辵 162.4	399	708	4	3	7	连	lián	join, connect; continuous; even
400	言 149.8	400	2123	3	3	10	调	diào	transfer, move, change; tune
401	水 85.8	401	2432	4	3	11	深	shēn	deep; depth; far; very, extreme
402	口 30.8	402	2391	1	1	11	商	shāng	commerce, business, trade
403	竹 118.8	403	3121	3	2	14	算	suàn	count, calculate, figure; plan
404	厂 27.4	404	1157	4	4	8	质	zhì	matter, material, substance
405	囗 31.3	405	425	5	3	6	团	tuán	sphere, ball, circle; mass, lump
406	隹 172.4	406	2694	5	3	12	集	jí	assemble, collect together
407	白 106.1	407	389	2	1	6	百	bǎi	one hundred; numerous, many
408	雨 173.6	408	3095	3	3	14	需	xū	need, require, must
409	人 9.4	409	469	4	3	6	价	jià	price, value
410	艸 140.4	410	665	3	1	7	花	huā	flower; blossoms
411	儿 10.8	411	1885	6	6	10	党	dǎng	political party, gang, faction
412	十 24.4	412	472	5	3	6	华	huá	flowery; illustrious; Chinese
413	土 32.7	413	1373	3	3	9	城	chéng	castle; city, town; municipality
414	石 112.0	414	216	5	3	5	石	shí	stone, rock, mineral; rad. 112
415	糸 120.3	415	594	3	2	6	级	jí	level, rank, class; grade
416	攴 66.11	416	3333	4	3	16	整	zhěng	orderly, neat, tidy; whole
417	广 53.5	417	1211	5	4	8	府	fǔ	prefecture; prefect; government
418	禸 114.6	418	2035	2	2	10	离	lí	rare beast; strange; elegant
419	冫 15.5	419	830	4	3	7	况	kuàng	condition, situation; furthermore
420	一 1.5	420	373	4	4	6	亚	yà	Asia; second
421	言 149.8	421	2108	1	1	10	请	qǐng	ask, request; invite; please
422	手 64.4	422	615	4	3	7	技	jì	skill, ability, talent, ingenuity
423	阜 170.5	423	911	4	2	7	际	jì	border, boundary, juncture
424	糸 120.3	424	593	4	3	6	约	yuē	treaty, agreement, covenant
425	示 113.0	425	194	4	2	5	示	shì	show, manifest; demonstrate
426	夊 35.6	426	1553	3	2	9	复	fù	return; repeat; repeatedly
427	疒 104.5	427	2027	2	1	10	病	bìng	illness, sickness, disease
428	心 61.6	428	1973	2	1	10	息	xī	rest, put stop to, end, cease
429	穴 116.2	429	881	4	4	7	究	jiū	examine, investigate
430	糸 120.5	430	1336	4	3	8	线	xiàn	line, thread, wire; clue
431	人 9.5	431	481	5	3	6	似	shì	resemble, similar to; as if, seem
432	宀 40.5	432	1281	5	4	8	官	guān	official, public servant
433	火 86.0	433	164	2	1	4	火	huǒ	fire, flame; burn; anger, rage
434	斤 69.7	434	2405	4	3	11	断	duàn	sever, cut off; interrupt
435	米 119.8	435	3153	4	3	14	精	jīng	essence; semen; spirit
436	水 85.10	436	3005	3	2	13	满	mǎn	fill; full, satisfied
437	支 65.0	437	89	4	3	4	支	zhī	disperse, pay; support; branch
438	見 147.4	438	1294	1	1	8	视	shì	look at, inspect, observe, see
439	水 85.7	439	2071	4	3	10	消	xiāo	vanish, die out; melt away
440	走 156.5	440	2514	3	2	12	越	yuè	exceed, go beyond; the more ...
441	口 30.13	441	3348	5	3	16	器	qì	receptacle, vessel; instrument
442	宀 40.7	442	2105	3	3	10	容	róng	looks, appearance; figure, form
443	火 86.9	443	2911	3	2	13	照	zhào	shine, illumine, reflect
444	彡 59.6	444	1585	3	2	9	须	xū	must, have to, necessary
445	乙 5.1	445	15	1	1	2	九	jiǔ	nine
446	土 32.12	446	3204	4	3	15	增	zēng	increase, add to, augment
447	石 112.6	447	1446	4	4	9	研	yán	grind, rub; study, research
448	冖 14.3	448	316	1	1	5	写	xiě	write; draw, sketch; compose
449	禾 115.5	449	1948	5	2	10	称	chēng	call; name, brand; address; say
450	人 9.4	450	490	5	4	6	企	qǐ	plan a project; stand on tiptoe
451	八 12.0	451	9	1	1	2	八	bā	eight; all around, all sides
452	力 19.3	452	202	4	3	5	功	gōng	achievement, merit, good result
453	口 30.3	453	432	1	1	6	吗	ma	final interrogative particle
454	勹 20.3	454	298	3	1	5	包	bāo	wrap, pack, bundle; package
455	片 91.0	455	130	3	2	4	片	piàn	slice, splinter, strip; rad. 91
456	口 30.2	456	248	3	4	5	史	shǐ	history, chronicle, annals
457	女 38.5	457	1133	5	5	8	委	wěi	appoint, send, commission
458	丿 4.4	458	280	3	4	5	乎	hū	interrogative or exclamatory final particle
459	木 75.5	459	1431	3	2	9	查	chá	investigate, examine, seek into
460	車 159.5	460	1463	3	2	9	轻	qīng	light; easy, simple; gentle
461	日 72.4	461	1088	3	3	8	易	yì	change; easy
462	日 72.2	462	419	2	1	6	早	zǎo	early; soon; morning
463	曰 73.8	463	2747	5	3	12	曾	céng	already; sign of past
464	阜 170.7	464	1732	3	3	9	除	chú	eliminate, remove, except
465	冖 14.4	465	558	5	3	6	农	nóng	agriculture, farming; farmer
466	手 64.4	466	621	2	1	7	找	zhǎo	search, seek, look for; find
467	衣 145.6	467	2726	5	2	12	装	zhuāng	dress, clothes, attire; fill
468	广 53.0	468	53	4	2	3	广	guǎng	wide, extensive, broad; rad. 53
469	日 72.5	469	1485	5	3	9	显	xiǎn	manifest, display; evident, clear
470	口 30.4	470	747	2	1	7	吧	ba	emphatic final particle
471	阜 170.5	471	913	3	4	7	阿	ā	prefix used before monosyllabic names, kinship terms etc to indicate familiarity
472	木 75.3	472	688	3	3	7	李	lǐ	plum; judge; surname
1029	木 75.8	1029	2567	4	4	12	森	sēn	forest; luxuriant vegetation
473	木 75.5	473	1424	4	3	9	标	biāo	mark, symbol, label, sign; stand the bole of a tree
474	言 149.8	474	2127	4	3	10	谈	tán	talk; conversation; surname
475	口 30.3	475	429	1	1	6	吃	chī	eat; drink; suffer, endure, bear
476	囗 31.5	476	1119	3	1	8	图	tú	diagram; chart, map, picture
477	心 61.4	477	1177	5	3	8	念	niàn	think of, recall, study
478	八 12.2	478	160	1	1	4	六	liù	number six
479	弓 57.1	479	176	4	4	4	引	yǐn	to pull, draw out, attract; to stretch
480	厂 27.2	480	95	3	3	4	历	lì	history; calendar
481	首 185.0	481	1651	4	3	9	首	shǒu	head; first; leader, chief; a poem
482	匸 23.5	482	700	1	1	7	医	yī	cure, heal; doctor, medical
483	尸 44.4	483	907	4	4	7	局	jú	bureau, office; circumstance
484	穴 116.4	484	1700	3	3	9	突	tū	suddenly, abruptly, unexpectedly
485	一 1.3	485	83	4	3	4	专	zhuān	monopolize, take sole possession
486	貝 154.5	486	1726	4	3	9	费	fèi	expenses, expenditures, fee
487	口 30.2	487	243	1	1	5	号	hào	mark, sign; symbol; number
488	尸 44.3	488	566	4	3	6	尽	jǐn	exhaust, use up; deplete
489	口 30.2	489	256	4	3	5	另	lìng	another, separate, other
490	口 30.5	490	1192	3	2	8	周	zhōu	Zhou dynasty; circumference
491	車 159.6	491	1876	3	3	10	较	jiào	compare; comparatively, more
492	水 85.5	492	1252	3	3	8	注	zhù	concentrate, focus, direct
493	言 149.7	493	1707	1	1	9	语	yǔ	language, words; saying, expression
494	人 9.2	494	136	4	3	4	仅	jǐn	only, merely, solely, just
495	老 125.0	495	358	2	1	6	考	kǎo	examine, test; investigate
496	艸 140.9	496	2557	4	3	12	落	luò	fall, drop; net income, surplus
497	青 174.0	497	947	5	2	8	青	qīng	blue, green, black; young
498	阜 170.10	498	2476	4	2	11	随	suí	follow, listen to, submit to
499	辵 162.6	499	1545	3	2	9	选	xuǎn	choose, select; elect; election
500	刀 18.4	500	399	4	4	6	列	liè	a line; to arrange in order, classify
501	止 77.4	501	946	5	3	8	武	wǔ	military; martial, warlike
502	糸 120.3	502	589	2	2	6	红	hóng	red, vermillion; blush, flush
503	口 30.6	503	1509	3	2	9	响	xiǎng	make sound, make noise; sound
504	虫 142.3	504	1502	2	2	9	虽	suī	although, even if
505	手 64.8	505	2174	4	2	11	推	tuī	push, expel; push forward
506	力 19.6	506	977	5	3	8	势	shì	power, force; tendency
507	厶 28.6	507	1334	3	2	8	参	cān	take part in, intervene; ginseng
508	巾 50.4	508	796	2	3	7	希	xī	rare; hope, expect, strive for
509	口 30.2	509	208	5	3	5	古	gǔ	old, classic, ancient
510	人 9.4	510	491	4	3	6	众	zhòng	multitude, crowd; masses, public
511	木 75.4	511	1029	5	4	8	构	gòu	frame, building, structure
512	戶 63.4	512	1290	2	1	8	房	fáng	house, building; room
513	十 24.3	513	307	3	1	5	半	bàn	half
514	艸 140.2	514	209	3	2	5	节	jié	knot, node, joint; section
515	土 32.0	515	27	5	3	3	土	tǔ	soil, earth; items made of earth
516	手 64.4	516	643	5	4	7	投	tóu	throw, cast, fling, pitch; jump
517	木 75.5	517	1399	5	3	9	某	mǒu	certain thing or person
518	木 75.6	518	2107	4	4	10	案	àn	table, bench; legal case
519	黑 203.0	519	2655	2	2	12	黑	hēi	black; dark; evil, sinister
520	糸 120.8	520	2492	5	4	11	维	wéi	maintain, preserve, safeguard
521	革 177.0	521	1403	5	5	9	革	gé	leather, animal hides; rad. 177
522	刀 18.4	522	407	4	2	6	划	huà	to row or paddle boat; to scratch
523	舌 135.4	523	1942	5	4	10	敌	dí	enemy, foe, rival; resist
524	至 133.3	524	1879	5	4	10	致	zhì	send, deliver, present; cause
525	阜 170.5	525	914	6	7–9	7	陈	chén	exhibit, display; plead; a surname
526	彳 60.6	526	1583	4	4	9	律	lǜ	statute, principle, regulation
527	足 157.0	527	731	2	3	7	足	zú	foot; attain, satisfy, enough
528	心 61.4	528	1052	4	2	8	态	tài	manner, bearing, attitude
529	手 64.4	529	649	3	2	7	护	hù	protect, guard, defend, shelter
530	一 1.1	530	7	1	1	2	七	qī	seven
531	八 12.4	531	544	1	1	6	兴	xìng	thrive, prosper, flourish
532	水 85.6	532	1673	5	3	9	派	pài	school of thought, sect, branch
533	子 39.6	533	1730	2	1	9	孩	hái	baby, child; children
534	馬 187.7	534	2152	4	3	10	验	yàn	test, examine, inspect; verify
535	貝 154.4	535	948	4	3	8	责	zé	duty, responsibility; to reproach, to blame
536	艸 140.8	536	2214	5	3	11	营	yíng	encampment, barracks; manage
537	日 72.5	537	1488	1	1	9	星	xīng	a star, planet; any point of light
538	夕 36.8	538	2362	4	2	11	够	gòu	enough, adequate
539	立 117.6	539	2389	4	3	11	章	zhāng	composition; chapter, section
540	音 180.0	540	1632	3	2	9	音	yīn	sound, tone, pitch, pronunciation
541	足 157.6	541	2920	3	1	13	跟	gēn	heel; to follow, accompany; with
542	心 61.3	542	651	4	3	7	志	zhì	purpose, will, determination; annals
543	广 53.5	543	1212	4	3	8	底	dǐ	bottom, underneath, underside
544	立 117.5	544	2041	2	1	10	站	zhàn	stand up; a stand, station
545	一 1.6	545	671	4	4	7	严	yán	strict, rigorous, rigid; stern
546	己 49.1	546	178	5	4	4	巴	bā	greatly desire, anxiously hope
547	人 9.6	547	1140	4	2	8	例	lì	precedent, example; regulation
548	阜 170.4	548	576	5	3	6	防	fáng	defend; prevent; embankment
549	方 70.7	549	2392	4	3	11	族	zú	a family clan, ethnic group, tribe
550	人 9.6	550	1138	4	4	8	供	gōng	supply, provide for; offer in worship
551	攴 66.6	551	2034	4	3	10	效	xiào	result, effect; effectiveness
552	糸 120.8	552	2488	4	3	11	续	xù	continue, carry on; succeed
553	方 70.5	553	1634	5	4	9	施	shī	grant, bestow; give; act; name
554	田 102.5	554	2009	3	2	10	留	liú	stop, halt; stay, detain, keep
555	言 149.4	555	550	3	2	6	讲	jiǎng	explain; discuss; talk
556	土 32.6	556	1363	5	4	9	型	xíng	pattern, model, type; law; mold
557	斗 68.6	557	2054	3	4	10	料	liào	consider, conjecture; materials, ingredients
558	糸 120.5	558	1344	3	3	8	终	zhōng	end; finally, in the end
559	竹 118.6	559	2687	3	1	12	答	dá	answer, reply; return; assent to
560	糸 120.4	560	1884	4	3	10	紧	jǐn	tense, tight, taut; firm, secure
561	黃 201.0	561	2201	3	2	11	黄	huáng	yellow; surname
562	糸 120.6	562	1762	4	3	9	绝	jué	to cut, sever, break off, terminate
563	大 37.5	563	1050	3	3	8	奇	qí	strange, unusual, uncanny, occult
564	宀 40.11	564	3174	4	3	14	察	chá	examine, investigate; notice
565	毋 80.1	565	345	4	3	5	母	mǔ	mother; female elders; female
566	亠 8.6	566	1205	1	1	8	京	jīng	capital city
567	殳 79.5	567	1555	3	2	9	段	duàn	section, piece, division
568	人 9.6	568	1153	5	4	8	依	yī	rely on, be set in; consent, obey a wish
569	手 64.4	569	622	4	3	7	批	pī	comment, criticize; wholesale
570	羊 123.7	570	3035	5	3	13	群	qún	(same as 羣) group, crowd, multitude, mob
571	頁 181.3	571	1370	5	4	9	项	xiàng	neck, nape of neck; sum; funds
572	攴 66.5	572	1418	3	2	9	故	gù	ancient, old; reason, because
573	手 64.6	573	1395	4	3	9	按	àn	put hand on, press down with hand
574	水 85.5	574	1244	3	2	8	河	hé	river; stream; yellow river
575	米 119.0	575	533	1	1	6	米	mǐ	hulled or husked uncooked rice
576	囗 31.4	576	728	4	3	7	围	wéi	surround, encircle, corral
577	水 85.3	577	538	4	4	6	江	jiāng	large river; yangzi; surname
578	糸 120.5	578	1342	5	5	8	织	zhī	weave, knit; organize, unite
579	宀 40.7	579	2097	3	3	10	害	hài	injure, harm; destroy, kill
580	斗 68.0	580	166	5	4	4	斗	dòu	Chinese peck; liquid measure
581	又 29.2	581	187	3	3	4	双	shuāng	set of two, pair, couple; both
582	土 32.11	582	3061	3	3	14	境	jìng	boundary, frontier; area, region
583	宀 40.6	583	1703	1	1	9	客	kè	guest, traveller; customer
584	糸 120.3	584	595	4	3	6	纪	jì	record, annal, historical account
585	釆 165.1	585	1172	5	3	8	采	cǎi	collect, gather; pick, pluck
586	丶 3.8	586	1693	4	2	9	举	jǔ	raise, lift up; recommend
587	木 75.2	587	487	5	5	6	杀	shā	kill, slaughter, murder; hurt
588	攴 66.3	588	630	6	6	7	攻	gōng	attack, assault; criticize
589	父 88.0	589	141	4	3	4	父	fù	father; KangXi radical 88
590	艸 140.4	590	677	6	6	7	苏	sū	abbr. for Soviet Union; Perilla frutescens (Chinese basil or wild red basil); place name
591	宀 40.8	591	2458	4	4	11	密	mì	dense, thick, close; intimate
592	人 9.5	592	781	4	2	7	低	dī	low; to lower, hang, bend, bow
593	月 74.8	593	2559	5	3	12	朝	cháo	dynasty; morning
594	又 29.2	594	97	1	1	4	友	yǒu	friend, companion; fraternity
595	言 149.5	595	894	2	1	7	诉	sù	accuse; sue; inform; narrate
596	止 77.0	596	109	4	3	4	止	zhǐ	stop, halt, desist; detain
597	糸 120.5	597	1340	4	4	8	细	xì	fine, tiny; slender, thin
598	心 61.10	598	3094	3	2	14	愿	yuàn	sincere, honest, virtuous
599	十 24.1	599	41	2	2	3	千	qiān	thousand; many, numerous; very; (Cant.) a cheater, swindler
600	人 9.8	600	1956	4	3	10	值	zhí	price
601	人 9.2	601	135	4	3	4	仍	réng	yet, still, as ever; again; keep -ing, continuing
602	田 102.2	602	733	2	1	7	男	nán	male, man; son; baron; surname
603	金 167.5	603	1928	1	1	10	钱	qián	money, currency, coins
604	石 112.5	604	1867	4	3	10	破	pò	break, ruin, destroy; rout
605	网 122.0	605	442	3	1	6	网	wǎng	net; network; KangXi radical 122
606	火 86.6	606	1809	1	1	10	热	rè	hot; heat; fever; restless; zeal
607	力 19.5	607	719	2	2	7	助	zhù	help, aid, assist
608	人 9.8	608	1960	4	2	10	倒	dào	fall over; lie down; take turns
609	肉 130.4	609	1225	3	2	8	育	yù	produce, give birth to; educate
610	尸 44.9	610	2800	5	3	12	属	shǔ	class, category, type; belong to
611	土 32.4	611	797	1	1	7	坐	zuò	sit; seat; ride, travel by
612	巾 50.6	612	1633	6	6	9	帝	dì	supreme ruler, emperor; god
613	阜 170.6	613	1323	5	4	8	限	xiàn	boundary, limit, line
614	舟 137.5	614	2345	3	2	11	船	chuán	ship, boat, vessel
615	肉 130.7	615	2359	3	2	11	脸	liǎn	face; cheek; reputation
616	耳 128.5	616	2192	4	3	11	职	zhí	duty, profession; office, post
617	辵 162.7	617	1853	4	3	10	速	sù	quick, prompt, speedy
618	刀 18.6	618	1224	3	2	8	刻	kè	carve, engrave; quarter hour
619	丿 4.4	619	287	2	2	5	乐	lè	happy, glad; enjoyable; music
620	口 30.4	620	703	4	3	7	否	fǒu	not, no, negative; final particle
621	刀 18.4	621	441	3	2	6	刚	gāng	hard, tough, rigid, strong
622	女 38.6	622	1444	5	6	9	威	wēi	pomp, power; powerful; dominate
623	毛 82.0	623	123	4	1	4	毛	máo	hair, fur, feathers; coarse
624	犬 94.3	624	828	5	3	7	状	zhuàng	form; appearance; shape; official
625	玄 95.6	625	2395	5	4	11	率	lǜ	to lead; ratio; rate; limit
626	甘 99.4	626	1400	4	4	9	甚	shén	great extent; considerably
627	犬 94.6	627	1602	5	4	9	独	dú	alone, single, solitary, only
628	玉 96.7	628	2155	2	1	11	球	qiú	ball, sphere, globe; round
629	舟 137.4	629	1980	3	2	10	般	bān	sort, manner, kind, category
630	日 72.8	630	2741	4	2	12	普	pǔ	universal, general, widespread
631	心 61.5	631	1269	3	2	8	怕	pà	to fear, be afraid of; apprehensive
632	弓 57.8	632	2473	4	5	11	弹	dàn	pellet, bullet, shot, shell
633	木 75.6	633	1847	1	1	10	校	xiào	school; military field officer
634	艸 140.5	634	999	4	3	8	苦	kǔ	bitter; hardship, suffering
635	刀 18.4	635	494	5	3	6	创	chuàng	establish, create; knife cut
636	人 9.9	636	2337	3	1	11	假	jiǎ	falsehood, deception; vacation
637	丿 4.2	637	47	3	2	3	久	jiǔ	long time (ago); time passage, grow late
638	金 167.8	638	2936	2	1	13	错	cuò	error, blunder, mistake; wrong
639	手 64.4	639	1315	5	4	8	承	chéng	inherit, receive; succeed
640	卩 26.4	640	285	4	2	5	印	yìn	print, seal, stamp, chop, mark
641	日 72.7	641	2270	2	1	11	晚	wǎn	night, evening; late
642	八 12.3	642	306	\N	7–9	5	兰	lán	orchid; elegant, graceful
643	言 149.6	643	1286	2	1	8	试	shì	test, try, experiment
644	肉 130.4	644	1186	5	6	8	股	gǔ	thighs, haunches, rump; share
645	手 64.6	645	1983	3	1	10	拿	ná	take, hold, grasp; bring; with
646	肉 130.6	646	2001	1	1	10	脑	nǎo	brain
647	頁 181.4	647	2148	4	3	10	预	yù	prepare, arrange; in advance
648	言 149.8	648	2122	1	1	10	谁	shuí	who? whom? whose? anyone?
649	皿 108.5	649	2055	5	4	10	益	yì	profit, benefit; advantage
650	阜 170.4	650	572	3	2	6	阳	yáng	positive (electric.); sun; male principle (Taoism)
651	艸 140.5	651	1002	6	6	8	若	ruò	if, supposing, assuming; similar
652	口 30.7	652	1515	1	1	9	哪	nǎ	which? where? how?
653	彳 60.10	653	2965	4	4	13	微	wēi	small, prefix micro-, trifling
654	尸 44.2	654	326	\N	7–9	5	尼	ní	Buddhist nun; transliteration
655	糸 120.7	655	2153	4	3	10	继	jì	continue, maintain, carry on
656	辵 162.6	656	1645	2	1	9	送	sòng	see off, send off; dispatch, give
657	心 61.5	657	1609	3	2	9	急	jí	quick, quickly; urgent, pressing
658	血 143.0	658	479	5	3	6	血	xuè	blood; radical number 143
659	心 61.8	659	2445	4	4	11	惊	jīng	frighten, surprise, startle
660	人 9.4	660	468	4	3	6	伤	shāng	wound, injury; fall ill from
661	糸 120.4	661	1775	5	6	10	素	sù	white (silk); plain; vegetarian; formerly; normally
662	艸 140.6	662	1423	2	2	9	药	yào	leaf of Dahurian angelica plant; medicine
663	辵 162.6	663	1546	4	2	9	适	shì	go, reach; appropriate, suitable
664	水 85.5	664	1261	6	6	8	波	bō	waves, breakers; undulations
665	夕 36.5	665	1209	5	2	8	夜	yè	night, dark; in night; by night
666	目 109.4	666	1474	4	2	9	省	shěng	province; save, economize
667	刀 18.5	667	889	5	3	7	初	chū	beginning, initial, primary
668	口 30.9	668	2523	1	1	12	喜	xǐ	like, love, enjoy; joyful thing
669	乙 5.2	669	65	4	3	3	卫	wèi	guard, protect, defend
670	水 85.10	670	3008	5	4	13	源	yuán	spring; source, head; surname
671	食 184.0	671	1589	5	2	9	食	shí	eat; meal; food; KangXi radical number 184
672	阜 170.7	672	1733	4	3	9	险	xiǎn	narrow pass, strategic point
673	彳 60.6	673	1580	5	3	9	待	dài	treat, entertain, receive; wait
674	辵 162.5	674	1032	5	4	8	述	shù	narrate, state, express
675	阜 170.5	675	912	5	4	7	陆	lù	land, continental; army
676	冫 15.1	676	70	1	1	3	习	xí	practice; flapping wings
677	网 122.8	677	2931	5	4	13	置	zhì	place, lay out; set aside
678	尸 44.5	678	1308	3	4	8	居	jū	live, dwell, reside, sit
679	力 19.5	679	674	5	5	7	劳	láo	labor, toil, do manual work
680	貝 154.3	680	756	5	4	7	财	cái	wealth, valuables, riches
681	玉 96.4	681	945	3	3	8	环	huán	jade ring or bracelet; ring
682	手 64.8	682	2168	4	2	11	排	pái	row, rank, line
683	示 113.9	683	3033	4	3	13	福	fú	happiness, good fortune, blessing
684	糸 120.4	684	934	5	6	7	纳	nà	admit, take, receive, accept
685	欠 76.2	685	587	1	1	6	欢	huān	happy, pleased, glad; joy; enjoy
686	雨 173.5	686	2884	5	4	13	雷	léi	thunder
687	言 149.13	687	3453	4	3	19	警	jǐng	guard, watch; alert, alarm
688	艸 140.7	688	1827	4	4	10	获	huò	obtain, get, receive; seize
689	木 75.11	689	3078	5	4	14	模	mó	model, standard, pattern; copy
690	儿 10.4	690	525	5	3	6	充	chōng	fill, be full, supply
691	貝 154.2	691	503	4	3	6	负	fù	load, burden; carry, bear
692	二 7.2	692	82	4	2	4	云	yún	say, speak; clouds
693	人 9.9	693	2333	4	2	11	停	tíng	stop, suspend, delay; suitable
694	木 75.0	694	87	5	3	4	木	mù	tree; wood, lumber; wooden
695	水 85.9	695	2766	2	2	12	游	yóu	to swim; float, drift; wander, roam
696	龍 212.0	696	221	5	3	5	龙	lóng	dragon; symbolic of emperor
697	木 75.5	697	1439	3	1	9	树	shù	tree; plant; set up, establish
698	疋 103.9	698	3136	4	4	14	疑	yí	doubt, question, suspect
699	尸 44.4	699	902	3	2	7	层	céng	storey, layer, floor, stratum
700	冫 15.5	700	838	1	1	7	冷	lěng	cold, cool; lonely
701	水 85.6	701	1680	4	7–9	9	洲	zhōu	continent; island; islet
702	冫 15.4	702	511	5	4	6	冲	chōng	soar; pour boiling water over
703	寸 41.7	703	1971	5	5	10	射	shè	shoot, eject, issue forth, emit
704	田 102.6	704	2277	5	6	11	略	lüè	approximately, roughly; outline
705	艸 140.5	705	1010	5	3	8	范	fàn	surname; bee-like insect
706	立 117.6	706	2390	4	4	11	竟	jìng	finally, after all, at last
707	口 30.2	707	288	3	2	5	句	jù	sentence
708	宀 40.6	708	1697	2	2	9	室	shì	room, home, house, chamber
709	廾 55.3	709	568	6	6	6	异	yì	different, unusual, strange
710	水 85.13	710	3379	4	4	16	激	jī	arouse, excite, incite; quickly
711	水 85.2	711	311	1	1	5	汉	hàn	Chinese people; Chinese language
712	木 75.3	712	682	5	3	7	村	cūn	village, hamlet; uncouth, vulgar
713	口 30.6	713	1510	5	3	9	哈	hā	sound of laughter
714	竹 118.6	714	2683	6	6	12	策	cè	scheme, plan; to whip; urge
715	水 85.11	715	3167	4	3	14	演	yǎn	perform, put on; exercise
716	竹 118.7	716	2954	3	3	13	简	jiǎn	simple, terse, succinct, a letter
717	卜 25.3	717	226	3	2	5	卡	kǎ	card, punch card; calorie
718	网 122.8	718	2932	6	6	13	罪	zuì	crime, sin, vice; evil; hardship
719	刀 18.5	719	849	4	3	7	判	pàn	judge; discriminate; conclude
720	手 64.5	720	963	3	4	8	担	dān	carry, bear, undertake
721	巛 47.3	721	535	6	7–9	6	州	zhōu	administrative division, state
722	青 174.6	722	3049	3	2	14	静	jìng	quiet, still, motionless; gentle
723	辵 162.6	723	1720	5	3	9	退	tuì	step back, retreat, withdraw
724	无 71.5	724	1721	4	4	9	既	jì	already; de facto; since; then
725	衣 145.0	725	520	1	1	6	衣	yī	clothes, clothing; cover, skin
726	心 61.7	726	2331	2	1	11	您	nín	you (courteous, as opposed to informal 你)
727	宀 40.5	727	1275	6	6	8	宗	zōng	lineage, ancestry; ancestor, clan
728	禾 115.5	728	1945	4	3	10	积	jī	accumulate, store up, amass
729	人 9.5	729	795	5	4	7	余	yú	I, my, me; surname; surplus
730	疒 104.7	730	2734	5	3	12	痛	tòng	pain, ache; sorry, sad; bitter
731	木 75.7	731	2227	3	2	11	检	jiǎn	check; examine
732	工 48.7	732	1640	3	1	9	差	chà	to differ; different, wrong; nearly, almost; an officer
733	宀 40.9	733	2781	4	3	12	富	fù	abundant, ample; rich, wealthy
734	彐 58.4	734	900	5	6	7	灵	líng	spirit, soul; spiritual world
735	十 24.4	735	383	6	5	6	协	xié	be united; cooperate
736	角 148.0	736	814	3	2	7	角	jiǎo	horn; angle, corner; point
737	卜 25.3	737	228	4	2	5	占	zhàn	divine; observe; versify
738	酉 164.3	738	1858	5	3	10	配	pèi	match, pair; equal; blend
739	彳 60.5	739	1159	5	4	8	征	zhēng	invade, attack, conquer
740	人 9.8	740	1560	4	3	9	修	xiū	study; repair; cultivate
741	皮 107.0	741	336	3	3	5	皮	pí	skin, hide, fur, feather; outer
742	手 64.6	742	1396	5	4	9	挥	huī	direct; wipe away; squander
743	肉 130.5	743	1594	5	3	9	胜	shèng	victory; excel, be better than
744	阜 170.6	744	1321	4	4	8	降	jiàng	descend, fall, drop; lower, down
745	阜 170.4	745	574	5	4	6	阶	jiē	stairs, steps; rank, degree
746	宀 40.5	746	1279	6	6	8	审	shěn	examine, investigate; judge
747	水 85.4	747	871	5	4	7	沉	chén	sink, submerge; addicted to
748	土 32.4	748	712	4	3	7	坚	jiān	hard, strong, firm; resolute
749	口 30.9	749	2738	5	3	12	善	shàn	good, virtuous, charitable, kind
750	女 38.3	750	583	1	1	6	妈	mā	mother, mama
751	刀 18.4	751	517	\N	7–9	6	刘	liú	surname; kill, destroy
752	言 149.8	752	2112	1	1	10	读	dú	read, study; pronounce
753	口 30.8	753	1915	3	2	10	啊	a	exclamatory particle
754	走 156.5	754	2517	3	2	12	超	chāo	jump over, leap over; surpass
755	儿 10.5	755	810	4	4	7	免	miǎn	spare; excuse from; evade
756	厂 27.4	756	385	4	3	6	压	yā	press; oppress; crush; pressure
757	金 167.6	757	2309	3	2	11	银	yín	silver; cash, money, wealth
758	大 37.3	758	588	1	1	6	买	mǎi	buy, purchase; bribe, persuade
759	白 106.4	759	1571	6	6	9	皇	huáng	royal, imperial; ruler, superior
760	八 12.7	760	1641	4	2	9	养	yǎng	raise, rear, bring up; support
761	人 9.4	761	478	\N	7–9	6	伊	yī	third person pronoun; he, she, this, that
762	心 61.4	762	873	4	4	7	怀	huái	bosom, breast; carry in bosom
763	手 64.3	763	363	5	5	6	执	zhí	hold in hand; keep; carry out
764	刀 18.9	764	2234	6	6	11	副	fù	assist; supplement; assistant
765	乙 5.6	765	762	4	3	7	乱	luàn	confusion, state of chaos, revolt
766	手 64.4	766	646	6	6	7	抗	kàng	resist, oppose, defy, reject
767	犬 94.2	767	292	6	6	5	犯	fàn	commit crime, violate; criminal
768	辵 162.6	768	1577	5	3	9	追	zhuī	pursue, chase after; expel
769	巾 50.7	769	1356	2	1	9	帮	bāng	help, assist; defend; shoe upper
770	宀 40.6	770	1695	5	3	9	宣	xuān	declare, announce, proclaim
771	人 9.5	771	789	5	6	7	佛	fú	Buddha; of Buddhism; merciful person; Buddhist image; the dead (Jap.)
772	山 46.3	772	436	1	1	6	岁	suì	year; age; harvest
773	舟 137.4	773	1981	4	4	10	航	háng	sail; navigate; ship, boat
774	人 9.4	774	461	4	3	6	优	yōu	superior, excellent; actor
775	心 61.5	775	1271	3	3	8	怪	guài	strange, unusual, peculiar
776	香 186.0	776	1548	3	3	9	香	xiāng	fragrant, sweet smelling, incense
777	艸 140.8	777	2198	4	4	11	著	zhe	manifest; (Cant.) to wear
778	田 102.0	778	244	6	6	5	田	tián	field, arable land, cultivated
779	金 167.5	779	1932	3	2	10	铁	tiě	iron; strong, solid, firm
780	手 64.8	780	2187	5	5	11	控	kòng	accuse, charge; control
781	禾 115.7	781	2679	5	6	12	税	shuì	taxes
782	工 48.2	782	214	2	1	5	左	zuǒ	left; east; unorthodox, improper
783	口 30.2	783	217	2	1	5	右	yòu	right; west; right-wing
784	人 9.4	784	471	4	2	6	份	fèn	portion, part; duty
785	穴 116.4	785	1701	2	1	9	穿	chuān	penetrate, pierce, drill; wear
786	艸 140.1	786	86	4	3	4	艺	yì	art; talent, ability; craft
787	肉 130.5	787	1467	5	2	9	背	bèi	back; back side; behind; betray
788	阜 170.4	788	571	5	4	6	阵	zhèn	column, row or file of troops
789	艸 140.6	789	1408	3	2	9	草	cǎo	grass, straw, thatch, herbs
790	肉 130.7	790	2355	3	2	11	脚	jiǎo	leg, foot; base, leg, foundation
791	木 75.9	791	2871	4	3	13	概	gài	generally, approximately
792	心 61.6	792	1829	5	4	10	恶	è	evil, wicked, bad, foul
793	土 32.4	793	652	1	1	7	块	kuài	piece, lump; dollar
794	頁 181.4	794	1877	5	3	10	顿	dùn	pause, stop; bow, kowtow; arrange
795	攴 66.8	795	2470	4	3	11	敢	gǎn	to dare, venture; bold, brave
796	宀 40.3	796	546	5	4	6	守	shǒu	defend, protect, guard, conserve
797	酉 164.3	797	2069	3	2	10	酒	jiǔ	wine, spirits, liquor, alcoholic beverage
798	山 46.4	798	820	5	6	7	岛	dǎo	island
799	手 64.3	799	359	5	5	6	托	tuō	to hold up with palm; to support, rely on
800	大 37.2	800	249	6	5	5	央	yāng	center, conclude, run out; beg
801	戶 63.0	801	170	4	4	4	户	hù	door; family
802	火 86.6	802	1871	5	3	10	烈	liè	fiery, violent, vehement, ardent
803	水 85.6	803	1679	4	6	9	洋	yáng	ocean, sea; foreign; western
804	口 30.7	804	1852	2	1	10	哥	gē	elder brother
805	糸 120.4	805	1851	5	5	10	索	suǒ	large rope, cable; rules, laws; to demand, to exact; to search, inquire; isolated
806	肉 130.5	806	1419	5	5	9	胡	hú	recklessly, foolishly; wildly
807	欠 76.8	807	2508	4	5	12	款	kuǎn	item, article; clause; fund
808	非 175.7	808	3259	5	2	15	靠	kào	lean on, trust, depend on; near
809	言 149.5	809	887	4	3	7	评	píng	appraise, criticize, evaluate
810	片 91.4	810	1143	5	5	8	版	bǎn	printing blocks; edition
811	宀 40.5	811	1274	5	4	8	宝	bǎo	treasure, jewel; precious, rare
812	广 53.7	812	2025	4	2	10	座	zuò	seat; stand, base
813	釆 165.5	813	2710	4	4	12	释	shì	interprete, elucidate; release
814	日 72.8	814	2626	4	3	12	景	jǐng	scenery, view; conditions
815	頁 181.4	815	1874	3	2	10	顾	gù	look back; look at; look after
816	弓 57.4	816	854	2	1	7	弟	dì	young brother; junior; i, me
817	癶 105.7	817	2813	4	4	12	登	dēng	rise, mount, board, climb
818	貝 154.4	818	1151	4	4	8	货	huò	goods, commodities, products
819	二 7.2	819	106	4	3	4	互	hù	mutually, reciprocally
820	人 9.3	820	269	4	3	5	付	fù	give, deliver, pay, hand over; entrust
821	人 9.5	821	778	6	7–9	7	伯	bó	father's elder brother; senior
822	心 61.11	822	3169	2	1	14	慢	màn	slow(ly), leisurely, sluggish
823	欠 76.4	823	1053	5	7–9	8	欧	ōu	translit.: Europe; ohm; surname
824	手 64.7	824	1806	3	2	10	换	huàn	change
825	門 169.6	825	1636	3	2	9	闻	wén	hear; smell; make known; news
826	卩 26.4	826	499	4	3	6	危	wēi	dangerous, precarious; high
827	心 61.3	827	543	2	1	6	忙	máng	busy, pressed for time; hustling
828	木 75.6	828	1848	5	5	10	核	hé	seed, kernel, core, nut; atom
829	日 72.9	829	2909	5	4	13	暗	àn	dark; obscure; in secret, covert
830	女 38.5	830	1326	1	1	8	姐	jiě	elder sister, young lady
831	人 9.2	831	140	2	1	4	介	jiè	forerunner, herald, harbinger; to lie between; sea shell; to wear armor
832	土 32.4	832	616	3	1	7	坏	huài	rotten, spoilt, bad, broken down
833	言 149.3	833	315	4	2	5	讨	tǎo	to discuss; ask for, beg; demand; dun; marry
834	丶 3.7	834	699	4	3	7	丽	lì	beautiful, magnificent, elegant
835	艮 138.1	835	884	5	4	7	良	liáng	good, virtuous, respectable
836	广 53.4	836	840	4	4	7	序	xù	series, serial order, sequence
837	十 24.2	837	125	5	3	4	升	shēng	arise, go up; hoist; advance
838	皿 108.5	838	1883	6	6	10	监	jiān	supervise, control, direct
839	丨 2.8	839	1471	5	4	9	临	lín	draw near, approach; descend
840	亠 8.7	840	1621	1	2	9	亮	liàng	bright, brilliant, radiant, light
841	雨 173.12	841	3490	6	6	21	露	lù	dew; bare, open, exposed
842	水 85.1	842	324	4	2	5	永	yǒng	long, perpetual, eternal, forever
843	口 30.5	843	1099	4	4	8	呼	hū	breathe sigh, exhale; call, shout
844	口 30.5	844	1078	4	2	8	味	wèi	taste, smell, odor; delicacy
845	里 166.4	845	2265	6	6	11	野	yě	open country, field; wilderness
846	木 75.5	846	1743	5	3	9	架	jià	rack, stand, prop; prop up
847	土 32.8	847	2164	5	5	11	域	yù	district, region, boundary; land
848	水 85.4	848	860	4	3	7	沙	shā	sand, gravel, pebbles; granulated
849	手 64.8	849	2170	4	2	11	掉	diào	turn, move; shake, wag; drop down
850	手 64.6	850	1383	5	4	9	括	kuò	include, embrace, enclose
851	舟 137.4	851	1978	6	6	10	舰	jiàn	warship
852	魚 195.0	852	1194	2	2	8	鱼	yú	fish; surname; KangXi radical 195
853	木 75.2	853	498	4	3	6	杂	zá	mixed, blended; mix, mingle
854	言 149.7	854	1714	4	3	9	误	wù	err, make mistake; interfere
855	水 85.9	855	2764	6	6	12	湾	wān	bay, cove, inlet, bend of stream
856	口 30.3	856	356	6	6	6	吉	jí	lucky, propitious, good
857	冫 15.9	857	2375	4	4	11	减	jiǎn	decrease, subtract, diminish
858	糸 120.9	858	2822	5	4	12	编	biān	knit, weave; arrange; compile
859	木 75.9	859	2864	3	2	13	楚	chǔ	name of feudal state; clear
860	肉 130.4	860	1067	4	5	8	肯	kěn	willing; consent to, permit
861	水 85.6	861	1670	5	4	9	测	cè	measure, estimate, conjecture
862	貝 154.4	862	1113	4	4	8	败	bài	be defeated, decline, fail
863	尸 44.6	863	1722	5	3	9	屋	wū	house; room; building, shelter
864	足 157.5	864	2631	2	1	12	跑	pǎo	run, flee, leave in hurry
865	木 75.7	865	2221	4	4	11	梦	mèng	dream; visionary; wishful
866	攴 66.8	866	2546	4	3	12	散	sàn	scatter, disperse, break up
867	水 85.9	867	2757	4	2	12	温	wēn	lukewarm
868	囗 31.4	868	734	4	3	7	困	kùn	to surround, beseige; to be surrounded; difficult
869	刀 18.7	869	1587	6	6	9	剑	jiàn	sword, dagger, saber
870	水 85.8	870	2417	5	4	11	渐	jiàn	gradually
871	寸 41.6	871	1366	4	2	9	封	fēng	letter, envelope; feudal
872	攴 66.7	872	2232	5	3	11	救	jiù	save, rescue, relieve; help, aid
873	貝 154.5	873	1495	2	1	9	贵	guì	expensive, costly, valuable
874	木 75.4	874	1027	5	5	8	枪	qiāng	spear, lance; gun, rifle
875	缶 121.4	875	1935	4	3	10	缺	quē	be short of, lack; gap, deficit
876	木 75.9	876	2870	3	1	13	楼	lóu	building of two or more stories
877	厶 28.5	877	720	5	4	7	县	xiàn	county, district, subdivision
878	小 42.5	878	1075	5	4	8	尚	shàng	still, yet; even; fairly, rather
879	毛 82.7	879	2376	5	4	11	毫	háo	fine hair; measure of length
880	禾 115.6	880	2316	5	4	11	移	yí	change place, shift; move about
881	女 38.7	881	2144	5	3	10	娘	niáng	mother; young girl; woman; wife
882	月 74.4	882	1185	1	1	8	朋	péng	friend, pal, acquaintance
883	田 102.3	883	1036	3	2	8	画	huà	a painting, picture, drawing; to draw
884	玉 96.6	884	1774	2	1	10	班	bān	class, group, grade; squad; job
885	日 72.8	885	2670	5	4	12	智	zhì	wisdom, knowledge, intelligence
886	亠 8.4	886	516	6	7–9	6	亦	yì	also, too; likewise
887	耳 128.0	887	369	3	4	6	耳	ěr	ear; merely, only; handle
888	心 61.6	888	1909	6	6	10	恩	ēn	kindness, mercy, charity
889	矢 111.7	889	2669	3	2	12	短	duǎn	short; brief; deficient, lacking
890	手 64.8	890	2610	5	5	12	掌	zhǎng	palm of hand, sole of foot, paw
891	心 61.6	891	1810	4	3	10	恐	kǒng	fear; fearful, apprehensive
892	辵 162.9	892	2633	5	4	12	遗	yí	lose; articles lost; omit
893	囗 31.5	893	1093	5	4	8	固	gù	to become solid, solidify; strength
894	巾 50.7	894	2023	5	4	10	席	xí	seat; mat; take seat; banquet
895	木 75.4	895	1026	4	4	8	松	sōng	pine tree; fir tree
896	禾 115.5	896	1949	5	4	10	秘	mì	secret, mysterious, abstruse
897	言 149.10	897	2795	1	1	12	谢	xiè	thank; decline
898	魚 195.4	898	2717	6	7–9	12	鲁	lǔ	foolish, stupid, rash; vulgar
899	辵 162.9	899	2622	3	4	12	遇	yù	meet, come across, encounter
900	广 53.8	900	2385	3	2	11	康	kāng	peaceful, quiet; happy, healthy
901	心 61.6	901	1882	4	4	10	虑	lǜ	be concerned, worry about
902	干 51.5	902	983	4	3	8	幸	xìng	luck(ily), favor, fortunately
903	土 32.4	903	640	5	4	7	均	jūn	equal, even, fair; all, also
904	金 167.7	904	2659	5	4	12	销	xiāo	melt, fuse; market, sell
905	金 167.4	905	1528	1	2	9	钟	zhōng	clock; bell
906	言 149.6	906	1288	5	4	8	诗	shī	poetry; poem, verse, ode
907	艸 140.14	907	3392	5	6	17	藏	cáng	hide, conceal; hoard, store up
908	走 156.3	908	1788	4	3	10	赶	gǎn	pursue, follow; expel, drive away
909	刀 18.8	909	2132	4	3	10	剧	jù	theatrical plays, opera, drama
910	示 113.6	910	2235	2	1	11	票	piào	slip of paper or bamboo; ticket
911	手 64.7	911	1798	5	5	10	损	sǔn	diminish; impair; injure
912	心 61.4	912	1197	5	2	8	忽	hū	suddenly, abruptly; neglect
913	工 48.2	913	101	5	4	4	巨	jù	large, great, enormous; chief
914	火 86.5	914	1658	5	6	9	炮	pào	large gun, cannon; artillery
915	日 72.1	915	232	3	3	5	旧	jiù	old, ancient; former, past
916	立 117.9	916	3151	6	6	14	端	duān	end, extreme; head; beginning
917	手 64.8	917	2188	6	6	11	探	tàn	find, locate; search, grope for
918	水 85.9	918	2751	6	2	12	湖	hú	a lake; Hubei, Hunan; bluish-green
919	彐 58.5	919	1304	5	3	8	录	lù	copy, write down, record
920	口 30.2	920	238	4	4	5	叶	yè	to harmonize, to rhyme; to unite; (borrowed for) leaf
921	日 72.5	921	1355	3	2	9	春	chūn	spring; wanton
922	幺 52.0	922	73	5	3	3	乡	xiāng	country; rural; village
923	阜 170.5	923	916	3	4	7	附	fù	adhere to, append; rely on near to
924	口 30.4	924	431	4	4	6	吸	xī	inhale, suck in; absorb; attract
925	亅 6.3	925	184	6	6	4	予	yǔ	I, me; to give
926	示 113.1	926	318	3	2	5	礼	lǐ	social custom; manners; courtesy
927	水 85.9	927	2749	6	6	12	港	gǎng	port, harbor; small stream; bay
928	雨 173.0	928	1041	1	1	8	雨	yǔ	rain; rainy; KangXi radical 173
929	口 30.4	929	729	4	4	7	呀	ya	particle used to express surprise or mild emphasis; (Cant.) slurred form of the number ten
930	木 75.4	930	1025	3	2	8	板	bǎn	plank, board; iron or tin plate
931	广 53.7	931	1624	5	2	9	庭	tíng	courtyard; spacious hall or yard
932	女 38.3	932	579	5	4	6	妇	fù	married women; woman; wife
933	彐 58.2	933	234	5	4	5	归	guī	return; return to, revert to
934	目 109.8	934	2895	2	2	13	睛	jīng	eyeball; pupil of eye
935	食 184.4	935	823	1	1	7	饭	fàn	cooked rice; food, meal
936	頁 181.9	936	3304	6	6	15	额	é	forehead; tablet, plaque; fixed
937	口 30.4	937	800	5	4	7	含	hán	hold in mouth; cherish; contain
938	頁 181.3	938	1559	4	2	9	顺	shùn	obey, submit to, go along with
939	車 159.9	939	2890	4	3	13	输	shū	transport, carry, haul
940	手 64.10	940	2841	5	4	13	摇	yáo	wag, swing, wave; shake; scull
941	手 64.5	941	988	4	4	8	招	zhāo	beckon, summon; recruit, levy
942	女 38.8	942	2481	3	3	11	婚	hūn	get married; marriage, wedding
943	肉 130.7	943	2360	4	4	11	脱	tuō	take off
944	衣 145.2	944	888	5	3	7	补	bǔ	mend, patch, fix, repair, restore
945	言 149.9	945	2466	5	4	11	谓	wèi	say, tell; call, name; be called
946	目 109.8	946	2891	6	6	13	督	dū	supervise, oversee, direct
947	毋 80.4	947	1362	5	5	9	毒	dú	poison, venom; poisonous
948	水 85.5	948	1248	4	2	8	油	yóu	oil, fat, grease, lard; paints
949	疒 104.2	949	834	5	4	7	疗	liáo	be healed, cured, recover
950	方 70.6	950	2046	2	2	10	旅	lǚ	trip, journey; travel; traveler
951	水 85.5	951	1263	6	7–9	8	泽	zé	marsh, swamp; grace, brilliance
952	木 75.3	952	681	4	3	7	材	cái	material, stuff; timber; talent
953	火 86.1	953	223	6	6	5	灭	miè	extinguish; wipe out, exterminate
954	辵 162.7	954	1870	5	4	10	逐	zhú	chase, expel; one by one
955	艸 140.7	955	1824	6	7–9	10	莫	mò	do not, is not, can not; negative
956	竹 118.4	956	1951	2	2	10	笔	bǐ	writing brush; write; stroke
957	亠 8.1	957	54	6	6	3	亡	wáng	death, destroyed; lose, perish
958	魚 195.6	958	3135	3	4	14	鲜	xiān	fresh; delicious; attractive
959	言 149.5	959	897	3	2	7	词	cí	words; phrase, expression
960	土 32.2	960	340	6	6	5	圣	shèng	holy, sacred
961	手 64.5	961	992	3	4	8	择	zé	select, choose, pick out
962	彐 58.3	962	563	5	4	6	寻	xún	seek, search, look for; ancient
963	厂 27.0	963	6	5	3	2	厂	chǎng	factory, workshop; radical 27
964	目 109.8	964	2900	1	1	13	睡	shuì	sleep, doze
965	十 24.10	965	2521	4	5	12	博	bó	gamble, play games; wide, broad
966	力 19.9	966	2200	\N	7–9	11	勒	lēi	strangle, tighten
967	火 86.6	967	2062	4	3	10	烟	yān	smoke, soot; opium; tobacco, cigarettes
968	手 64.8	968	2177	4	4	11	授	shòu	give to, transmit; confer
969	言 149.8	969	2111	6	6	10	诺	nuò	promise; assent, approve
970	人 9.4	970	470	6	7–9	6	伦	lún	normal human relationships
971	山 46.5	971	1105	5	5	8	岸	àn	bank, shore; beach, coast
972	大 37.9	972	2701	6	7–9	12	奥	ào	mysterious, obscure, profound
973	口 30.7	973	2037	6	7–9	10	唐	táng	Tang dynasty; Chinese
974	十 24.6	974	1042	2	2	8	卖	mài	sell; betray; show off
975	人 9.7	975	1564	\N	7–9	9	俄	é	sudden(ly), soon; Russian
976	火 86.5	976	1656	5	6	9	炸	zhà	to fry in oil; to scald; to explode
977	戈 62.6	977	1787	5	4	10	载	zài	load; carry; transport, convey
978	水 85.6	978	1676	\N	\N	9	洛	luò	river in Shanxi province; city
979	人 9.9	979	1969	3	2	10	健	jiàn	strong, robust, healthy; strength
980	土 32.8	980	2256	6	2	11	堂	táng	hall; government office
981	方 70.6	981	2045	2	1	10	旁	páng	side; by side, close by, near
982	宀 40.6	982	1698	6	6	9	宫	gōng	palace
983	口 30.9	983	2639	1	1	12	喝	hē	drink; shout, call out
984	人 9.8	984	1955	3	2	10	借	jiè	borrow; lend; make pretext of
985	口 30.4	985	899	6	7–9	7	君	jūn	sovereign, monarch, ruler, chief, prince
986	示 113.8	986	2863	4	4	13	禁	jìn	restrict, prohibit, forbid
987	阜 170.4	987	575	2	2	6	阴	yīn	overcast (weather); cloudy; shady; Yin (the negative principle of Yin and Yang); negative (electric.)
988	囗 31.4	988	726	3	2	7	园	yuán	garden; park, orchard
989	言 149.9	989	2459	6	6	11	谋	móu	plan, scheme; strategem
990	宀 40.4	990	878	\N	7–9	7	宋	sòng	Song dynasty; surname
991	辵 162.13	991	3385	5	4	16	避	bì	avoid; turn aside; escape; hide
992	手 64.4	992	633	5	3	7	抓	zhuā	scratch; clutch, seize, grab
993	艸 140.6	993	1415	5	5	9	荣	róng	glory, honor; flourish, prosper
994	女 38.5	994	1325	5	3	8	姑	gū	paternal aunt, husband's sister
995	子 39.3	995	570	4	4	6	孙	sūn	grandchild, descendent; surname
996	辵 162.6	996	1588	5	5	9	逃	táo	escape, flee; abscond, dodge
997	牙 92.0	997	102	3	4	4	牙	yá	tooth, molars, teeth; serrated
998	木 75.3	998	694	3	3	7	束	shù	bind, control, restrain; bale
999	足 157.6	999	2915	2	3	13	跳	tiào	jump, leap, vault, bounce; dance
1000	頁 181.2	1000	971	5	4	8	顶	dǐng	top, summit, peak; to carry on the head
1001	玉 96.0	1001	190	5	4	5	玉	yù	jade, precious stone, gem
1002	金 167.10	1002	3256	6	6	15	镇	zhèn	town, market place; suppress
1003	雨 173.3	1003	2249	2	2	11	雪	xuě	snow; wipe away shame, avenge
1004	十 24.2	1004	119	1	1	4	午	wǔ	noon; 7th terrestrial branch
1005	糸 120.5	1005	1337	3	2	8	练	liàn	to practice, drill, exercise, train
1006	辵 162.5	1006	1156	5	4	8	迫	pò	coerce, force, compel; urgent
1007	父 88.2	1007	492	3	1	6	爷	yé	father, grandfather
1008	竹 118.9	1008	3268	4	2	15	篇	piān	chapter, section, essay, article
1009	肉 130.0	1009	443	2	1	6	肉	ròu	flesh; meat; KangXi radical 130
1010	口 30.12	1010	3342	3	2	16	嘴	zuǐ	mouth, lips
1011	食 184.8	1011	2373	2	1	11	馆	guǎn	public building
1012	辵 162.9	1012	2788	4	2	12	遍	biàn	everywhere, all over, throughout
1013	几 16.1	1013	50	6	6	3	凡	fán	all, any, every; ordinary, common
1014	石 112.5	1014	1866	4	3	10	础	chǔ	foundation stone, plinth
1015	水 85.6	1015	1669	5	5	9	洞	dòng	cave, grotto; ravine; hole
1016	卩 26.6	1016	1231	5	4	8	卷	juǎn	scroll; curl; make a comeback
1017	土 32.5	1017	962	5	5	8	坦	tǎn	flat, smooth; self-possessed
1018	牛 93.0	1018	120	2	1	4	牛	niú	cow, ox, bull; KangXi radical93
1019	宀 40.2	1019	312	5	4	5	宁	níng	calm, peaceful, serene; healthy
1020	糸 120.4	1020	938	2	2	7	纸	zhǐ	paper
1021	言 149.8	1021	2110	6	6	10	诸	zhū	various, all, these; surname
1022	言 149.3	1022	319	5	3	5	训	xùn	teach, instruct; exegesis
1023	禾 115.2	1023	766	5	5	7	私	sī	private, personal; secret
1024	广 53.3	1024	514	6	6	6	庄	zhuāng	village, hamlet; villa, manor
1025	示 113.5	1025	1710	6	6	9	祖	zǔ	ancestor, forefather; grandfather
1026	一 1.4	1026	347	5	7–9	5	丝	sī	silk; fine thread; wire; strings
1027	羽 124.12	1027	3445	4	4	18	翻	fān	flip over, upset, capsize
1028	日 72.11	1028	3234	6	6	15	暴	bào	violent, brutal, tyrannical
1030	土 32.10	1030	2510	6	6	12	塔	tǎ	tower, spire, tall building
1031	黑 203.4	1031	3352	4	4	16	默	mò	silent; quiet, still; dark
1032	手 64.9	1032	2538	5	3	12	握	wò	grasp, hold fast, take by hand
1033	戈 62.2	1033	584	3	3	6	戏	xì	theatrical play, show
1034	阜 170.9	1034	2480	6	6	11	隐	yǐn	hide, conceal; hidden, secret
1035	火 86.11	1035	3278	4	2	15	熟	shú	well-cooked; ripe; familiar with
1036	骨 188.0	1036	1523	5	4	9	骨	gǔ	bone; skeleton; frame, framework
1037	言 149.4	1037	561	5	3	6	访	fǎng	visit; ask, inquire
1038	弓 57.7	1038	2134	5	4	10	弱	ruò	weak; fragile, delicate
1039	艸 140.10	1039	2859	6	6	13	蒙	méng	cover; ignorant; suffer; mongolia
1040	欠 76.10	1040	3084	2	1	14	歌	gē	song, lyrics; sing, chant; praise
1041	广 53.5	1041	1208	1	1	8	店	diàn	shop, store; inn, hotel
1042	鬼 194.0	1042	1573	5	5	9	鬼	guǐ	ghost; spirit of dead; devil
1043	車 159.4	1043	1062	5	5	8	软	ruǎn	soft, flexible, pliable; weak
1044	八 12.6	1044	1092	3	2	8	典	diǎn	law, canon; documentation; classic, scripture
1045	欠 76.7	1045	2352	6	6	11	欲	yù	desire, want, long for; intend
1046	艸 140.9	1046	2217	\N	7–9	11	萨	sà	Buddhist gods or immortals
1047	人 9.4	1047	475	4	4	6	伙	huǒ	companion, colleague; utensils
1048	辵 162.11	1048	3085	6	6	14	遭	zāo	come across, meet with, encounter
1049	皿 108.6	1049	2343	3	4	11	盘	pán	tray, plate, dish; examine
1050	父 88.4	1050	1171	1	1	8	爸	bà	father, papa
1051	手 64.3	1051	364	5	4	6	扩	kuò	expand, enlarge, stretch
1052	皿 108.6	1052	2400	5	4	11	盖	gài	cover, hide, protect
1053	廾 55.4	1053	600	4	2	7	弄	nòng	do, play or fiddle with; alley
1054	隹 172.4	1054	2596	5	5	12	雄	xióng	male of species; hero; manly
1055	禾 115.9	1055	3118	5	4	14	稳	wěn	stable, firm, solid, steady
1056	心 61.3	1056	844	3	1	7	忘	wàng	forget; neglect; miss, omit
1057	人 9.1	1057	44	5	2	3	亿	yì	hundred million; many
1058	刀 18.6	1058	1039	5	4	8	刺	cì	stab; prick, irritate; prod
1059	手 64.5	1059	974	5	5	8	拥	yōng	embrace, hug, squeeze; crowd
1060	彳 60.7	1060	1975	6	6	10	徒	tú	disciple, follower; go on foot
1061	女 38.5	1061	1330	6	7–9	8	姆	mǔ	woman who looks after small children
1062	木 75.3	1062	689	\N	7–9	7	杨	yáng	willow, poplar, aspen; surname
1063	齊 210.0	1063	518	5	3	6	齐	qí	even, uniform, of equal length
1064	宀 40.11	1064	3172	3	3	14	赛	sài	compete, contend; contest, race
1065	走 156.8	1065	3194	3	4	15	趣	qù	interesting, to interest
1066	曰 73.2	1066	424	6	5	6	曲	qū	crooked, bent; wrong, false
1067	刀 18.0	1067	18	4	3	2	刀	dāo	knife; old coin; measure
1068	广 53.4	1068	831	2	1	7	床	chuáng	bed, couch; framework, chassis
1069	辵 162.4	1069	822	3	2	7	迎	yíng	receive, welcome, greet
1070	冫 15.4	1070	513	3	4	6	冰	bīng	ice; ice-cold
1071	虍 141.5	1071	2253	5	5	11	虚	xū	false
1072	玉 96.4	1072	944	2	1	8	玩	wán	play with, joke, enjoy
1073	木 75.4	1073	1024	5	5	8	析	xī	split wood; break apart; divide
1074	穴 116.7	1074	2786	4	4	12	窗	chuāng	window
1075	酉 164.9	1075	3336	4	4	16	醒	xǐng	wake up; sober up; startle
1076	女 38.5	1076	1056	2	4	8	妻	qī	wife
1077	辵 162.7	1077	1950	5	4	10	透	tòu	penetrate, pass through
1078	貝 154.4	1078	1117	4	4	8	购	gòu	buy, purchase; hire
1079	曰 73.8	1079	2506	5	4	12	替	tì	change, replace, substitute for
1080	土 32.10	1080	3025	6	6	13	塞	sāi	stop up, block, seal, cork; pass, frontier; fortress
1081	力 19.5	1081	924	3	2	7	努	nǔ	to exert, strive, make an effort; to pout
1082	人 9.4	1082	458	2	1	6	休	xiū	rest, stop; retire; do not!
1083	虍 141.2	1083	1071	4	5	8	虎	hǔ	tiger; brave, fierce; surname
1084	手 64.3	1084	368	4	4	6	扬	yáng	scatter, spread; praise
1085	辵 162.7	1085	1982	5	4	10	途	tú	way, road, path, journey; course
1086	人 9.7	1086	1574	6	6	9	侵	qīn	invade, encroach upon, raid
1087	刀 18.4	1087	351	6	7–9	6	刑	xíng	punishment, penalty; law
1088	糸 120.8	1088	2498	3	2	11	绿	lǜ	green; chlorine
1089	儿 10.3	1089	250	5	4	5	兄	xiōng	elder brother
1090	辵 162.3	1090	565	5	4	6	迅	xùn	quick, hasty, rapid, sudden
1091	大 37.7	1091	1869	5	2	10	套	tào	case, cover, wrapper, envelope
1092	貝 154.5	1092	1607	5	5	9	贸	mào	trade, barter; mixed; rashly
1093	比 81.2	1093	409	4	4	6	毕	bì	end, finish, conclude; completed
1094	口 30.8	1094	2288	5	5	11	唯	wéi	only; yes
1095	谷 150.0	1095	798	6	6	7	谷	gǔ	valley, gorge, ravine
1096	車 159.4	1096	1061	5	4	8	轮	lún	wheel; revolve, turn; recur
1097	广 53.4	1097	832	5	5	7	库	kù	armory, treasury, storehouse
1098	辵 162.6	1098	1623	5	7–9	9	迹	jī	traces, impressions, footprints
1099	尢 43.1	1099	98	4	5	4	尤	yóu	especially, particularly
1100	立 117.5	1100	2043	4	5	10	竞	jìng	contend, vie, compete
1101	行 144.6	1101	2702	3	2	12	街	jiē	street, road, thoroughfare
1102	人 9.7	1102	1563	5	4	9	促	cù	urge, press, hurry; close
1103	廴 54.4	1103	464	5	4	6	延	yán	delay, postpone, defer
1104	雨 173.7	1104	3229	5	5	15	震	zhèn	shake, quake, tremor; excite
1105	廾 55.4	1105	842	4	5	7	弃	qì	reject, abandon, discard
1106	田 102.0	1106	239	5	5	5	甲	jiǎ	armor, shell; fingernails; 1st heavenly stem
1107	人 9.4	1107	454	5	3	6	伟	wěi	great, robust; extraordinary
1108	麻 200.0	1108	2379	4	3	11	麻	má	hemp, jute, flax; sesame
1109	巛 47.0	1109	43	6	7–9	3	川	chuān	stream, river; flow; boil
1110	田 102.0	1110	240	4	4	5	申	shēn	to state to a superior, report; extend; 9th terrestrial branch
1111	糸 120.9	1111	2818	5	4	12	缓	huǎn	slow, leisurely; to postpone, delay
1112	水 85.12	1112	3290	6	6	15	潜	qián	hide; hidden, secret, latent
1113	門 169.2	1113	305	5	4	5	闪	shǎn	flash; avoid, dodge, evade
1114	口 30.8	1114	2332	4	4	11	售	shòu	sell
1115	火 86.2	1115	534	3	2	6	灯	dēng	lantern, lamp
1116	金 167.2	1116	757	4	4	7	针	zhēn	needle; pin; tack; acupuncture
1117	口 30.7	1117	1802	5	6	10	哲	zhé	wise, sagacious; wise man, sage
1118	糸 120.6	1118	1761	5	4	9	络	luò	enmesh, wrap around; web, net
1119	手 64.5	1119	975	6	6	8	抵	dǐ	resist, oppose; deny; off-set
1120	木 75.2	1120	445	\N	7–9	6	朱	zhū	cinnabar, vermilion; surname
1121	土 32.7	1121	1814	\N	\N	10	埃	āi	fine dust, dirt
1122	手 64.5	1122	978	4	4	8	抱	bào	embrace, hold in arms, enfold
1123	鼓 207.0	1123	2837	4	5	13	鼓	gǔ	drum; beat, top, strike
1124	木 75.8	1124	2566	4	4	12	植	zhí	plant, trees, plants; grow
1125	糸 120.4	1125	931	5	4	7	纯	chún	pure, clean, simple
1126	夊 35.7	1126	1862	3	2	10	夏	xià	summer; great, grand, big
1127	心 61.3	1127	925	5	5	7	忍	rěn	endure, bear, suffer; forbear
1128	頁 181.0	1128	393	4	1	6	页	yè	page, sheet, leaf; rad. no. 181
1129	木 75.4	1129	1031	6	6	8	杰	jié	hero; heroic, outstanding
1130	竹 118.6	1130	2682	5	5	12	筑	zhù	ancient lute; build
1131	手 64.4	1131	632	4	4	7	折	zhé	break off, snap; bend
1132	邑 163.6	1132	1229	6	7–9	8	郑	zhèng	Zheng state during the Warring States period; surname
1133	貝 154.0	1133	114	5	4	4	贝	bèi	sea shell; money, currency
1134	寸 41.9	1134	2743	4	5	12	尊	zūn	respect, revere, venerate; honor
1135	口 30.4	1135	718	\N	7–9	7	吴	wú	name of warring state; surname
1136	禾 115.2	1136	765	4	4	7	秀	xiù	ear of grain; flowering, luxuriant; refined, elegant, graceful
1137	水 85.8	1137	2420	6	6	11	混	hùn	to mix, blend, mingle; to bumble along
1138	臣 131.0	1138	380	6	7–9	6	臣	chén	minister, statesman, official
1139	隹 172.4	1139	2600	6	7–9	12	雅	yǎ	elegant, graceful, refined
1140	手 64.7	1140	1786	5	5	10	振	zhèn	raise, excite, arouse action
1141	木 75.5	1141	1675	4	5	9	染	rǎn	dye; be contagious; infect
1142	皿 108.7	1142	2247	6	6	11	盛	shèng	abundant, flourishing; contain; fill
1143	心 61.5	1143	1742	6	6	9	怒	nù	anger, rage, passion; angry
1144	舛 136.8	1144	3116	2	3	14	舞	wǔ	dance, posture, prance; brandish
1145	囗 31.7	1145	1922	5	4	10	圆	yuán	circle; round, circular; complete
1146	手 64.10	1146	2842	5	5	13	搞	gǎo	to clear, clarify
1147	犬 94.4	1147	811	5	5	7	狂	kuáng	insane, mad; violent; wild
1148	手 64.8	1148	2162	5	4	11	措	cuò	place; collect, arrange; employ
1149	女 38.5	1149	1327	2	2	8	姓	xìng	family name, surname; to be surnamed
1150	歹 78.5	1150	1460	6	6	9	残	cán	injure, spoil; oppress; broken
1151	禾 115.4	1151	1550	3	2	9	秋	qiū	autumn, fall; year
1152	土 32.8	1152	2184	5	4	11	培	péi	bank up with dirt; cultivate
1153	辵 162.6	1153	1647	4	3	9	迷	mí	bewitch, charm, infatuate
1154	言 149.6	1154	1291	4	4	8	诚	chéng	sincere, honest; true, real
1155	宀 40.7	1155	2098	5	4	10	宽	kuān	broad, wide; spacious, vast
1156	宀 40.3	1156	545	6	6	6	宇	yǔ	house; building, structure; eaves
1157	犬 94.8	1157	2370	6	6	11	猛	měng	violent, savage, cruel; bold
1158	手 64.10	1158	2838	5	4	13	摆	bǎi	put, place; display; swing, sway
1159	木 75.7	1159	2226	\N	6	11	梅	méi	plums; prunes; surname
1160	殳 79.9	1160	2956	6	6	13	毁	huǐ	destroy
1161	人 9.5	1161	775	5	5	7	伸	shēn	extend, stretch out, open up; trust
1162	手 64.11	1162	3279	5	5	15	摩	mó	rub, scour, grind; friction
1163	皿 108.8	1163	2907	6	6	13	盟	méng	swear; oath, covenant, alliance
1164	木 75.1	1164	193	3	2	5	末	mò	final, last, end; insignificant
1165	丿 4.1	1165	20	\N	7–9	2	乃	nǎi	then; really, indeed; as it turned out, after all; namely
1166	心 61.8	1166	2603	5	5	12	悲	bēi	sorrow, grief; sorry, sad
1167	手 64.5	1167	970	5	3	8	拍	pāi	clap, tap, beat; beat or rhythm
1168	一 1.1	1168	5	6	7–9	2	丁	dīng	male adult; robust, vigorous; 4th heavenly stem
1169	走 156.2	1169	1378	\N	7–9	9	赵	zhào	surname; ancient state
1170	石 112.7	1170	2589	5	5	12	硬	yìng	hard, firm, strong; obstinate
1171	麥 199.0	1171	601	5	6	7	麦	mài	wheat, barley, oats; simplified form of KangXi radical number 199
1172	艸 140.9	1172	2555	\N	\N	12	蒋	jiǎng	surname; hydropyrum latifalium
1173	手 64.13	1173	3317	5	4	16	操	cāo	conduct, run, control, manage
1174	耳 128.3	1174	3853	\N	\N	8	耶	yé	used in transliteration
1175	阜 170.5	1175	915	5	4	7	阻	zǔ	impede, hinder, obstruct; oppose
1176	言 149.2	1176	169	5	3	4	订	dìng	draw up agreement; arrange
1177	彡 59.8	1177	2353	4	3	11	彩	cǎi	hue, color; variegated colors
1178	手 64.5	1178	966	4	4	8	抽	chōu	draw out, pull out; sprout
1179	貝 154.12	1179	3355	5	4	16	赞	zàn	help, support, assist, aid
1180	鬼 194.11	1180	3484	6	7–9	20	魔	mó	demon, evil spirits; magic power
1181	糸 120.4	1181	937	5	4	7	纷	fēn	in disorder, scattered, tangled
1182	水 85.5	1182	1250	6	6	8	沿	yán	follow a course, go along
1183	口 30.9	1183	2623	5	2	12	喊	hǎn	shout, call out, yell; howl; cry
1184	辵 162.4	1184	609	5	5	7	违	wéi	disobey, violate, defy; be apart from
1185	女 38.5	1185	1324	2	1	8	妹	mèi	younger sister
1186	水 85.7	1186	2084	4	3	10	浪	làng	wave; wasteful, reckless
1187	水 85.2	1187	309	5	4	5	汇	huì	concourse; flow together, gather
1188	巾 50.1	1188	134	5	3	4	币	bì	currency, coins, legal tender
2053	文 67.8	2053	2505	6	7–9	12	斑	bān	mottled, striped, freckle
1189	丨 2.3	1189	74	4	3	4	丰	fēng	abundant, lush, bountiful, plenty
1190	艸 140.10	1190	2852	3	2	13	蓝	lán	blue; indigo plant; surname
1191	歹 78.6	1191	1872	5	4	10	殊	shū	different, special, unusual
1192	犬 94.9	1192	2861	5	5	13	献	xiàn	offer, present; show, display
1193	木 75.6	1193	1881	1	1	10	桌	zhuō	table, desk, stand
1194	口 30.8	1194	2267	6	6	11	啦	la	final particle of assertion
1195	瓦 98.0	1195	108	6	7–9	4	瓦	wǎ	tile; earthenware pottery; girl
1196	艸 140.7	1196	1822	\N	\N	10	莱	lái	goosefoot, weed; fallow field
1197	手 64.9	1197	2530	6	6	12	援	yuán	aid, assist; lead; cite
1198	言 149.5	1198	898	4	4	7	译	yì	translate; decode; encode
1199	大 37.3	1199	396	6	6	6	夺	duó	take by force, rob, snatch
1200	水 85.4	1200	861	2	1	7	汽	qì	steam, vapor, gas
1201	火 86.6	1201	2060	3	4	10	烧	shāo	burn; bake; heat; roast
1202	足 157.5	1202	2273	4	4	11	距	jù	at a distance of, distance, to be apart
1203	衣 145.6	1203	2532	5	5	12	裁	cái	cut out; decrease
1204	人 9.9	1204	2334	6	6	11	偏	piān	inclined one side; slanting
1205	竹 118.5	1205	2321	4	4	11	符	fú	i.d. tag, tally, symbol, charm
1206	力 19.7	1206	1746	4	4	9	勇	yǒng	brave, courageous, fierce
1207	角 148.6	1207	2980	5	5	13	触	chù	butt, ram, gore; touch
1208	言 149.8	1208	2120	2	1	10	课	kè	lesson; course; classwork
1209	攴 66.9	1209	2553	5	5	12	敬	jìng	respect, honor; respectfully
1210	口 30.7	1210	1907	3	2	10	哭	kū	weep, cry, wail
1211	心 61.13	1211	3300	2	2	15	懂	dǒng	understand, comprehend
1212	土 32.11	1212	3054	5	2	14	墙	qiáng	wall
1213	龍 212.6	1213	2246	6	7–9	11	袭	xí	raid, attack; inherit
1214	口 30.2	1214	334	5	4	5	召	zhào	imperial decree; summon
1215	网 122.4	1215	1519	5	5	9	罚	fá	penalty, fine; punish, penalize
1216	人 9.6	1216	1141	6	7–9	8	侠	xiá	chivalrous person; knight-errant
1217	厂 27.2	1217	90	4	5	4	厅	tīng	hall, central room
1218	手 64.5	1218	1538	4	5	9	拜	bài	do obeisance, bow, kowtow
1219	工 48.2	1219	197	4	3	5	巧	qiǎo	skillful, ingenious, clever
1220	人 9.6	1220	1147	6	6	8	侧	cè	side; incline, slant, lean
1221	韋 178.8	1221	2558	\N	7–9	12	韩	hán	fence; surname; Korea
1222	冂 13.7	1222	1486	3	3	9	冒	mào	risk, brave, dare
1223	人 9.8	1223	1954	6	6	10	债	zhài	debt, loan, liabilities
1224	日 72.7	1224	2268	\N	\N	11	曼	màn	long, extended, vast; beautiful
1225	虫 142.10	1225	3334	6	6	16	融	róng	melt, fuse; blend, harmonize
1226	心 61.8	1226	2450	3	2	11	惯	guàn	habit, custom; habitually, usual
1227	亠 8.6	1227	1206	5	5	8	享	xiǎng	enjoy
1228	戈 62.14	1228	3388	4	4	17	戴	dài	wear on top; support
1229	立 117.7	1229	2735	4	4	12	童	tóng	child, boy, servant boy; virgin
1230	犬 94.4	1230	812	5	5	7	犹	yóu	like, similar to, just like, as
1231	丿 4.9	1231	1941	4	5	10	乘	chéng	ride, ascend; avail oneself of; numerary adjunct for vehicles
1232	手 64.6	1232	1365	4	3	9	挂	guà	hang, suspend; suspense
1233	大 37.6	1233	1618	4	4	9	奖	jiǎng	prize, reward; give award to
1234	糸 120.5	1234	1348	2	1	8	绍	shào	continue, carry on; join
1235	厂 27.7	1235	1449	4	4	9	厚	hòu	thick; substantial; greatly
1236	糸 120.4	1236	936	6	6	7	纵	zòng	indulge in, give free reign to
1237	阜 170.11	1237	3038	6	6	13	障	zhàng	separate; shield; barricade
1238	言 149.3	1238	322	6	6	5	讯	xùn	inquire; ask; examine; reproach
1239	水 85.7	1239	2070	6	6	10	涉	shè	ford stream, wade across
1240	彳 60.4	1240	792	5	4	7	彻	chè	penetrate, pervade; penetrating
1241	刀 18.3	1241	191	6	6	5	刊	kān	publication, periodical; publish
1242	一 1.2	1242	33	2	4	3	丈	zhàng	unit of length equal 3.3 meters; gentleman, man, husband
1243	火 86.15	1243	3471	6	6	19	爆	bào	crackle, pop, burst, explode
1244	丿 4.3	1244	157	6	6	4	乌	wū	crow, rook, raven; black, dark
1245	彳 60.4	1245	793	6	7–9	7	役	yì	service; a servant, laborer; to serve
1246	手 64.9	1246	2163	5	4	11	描	miáo	copy, trace, sketch; depict
1247	水 85.6	1247	1671	2	1	9	洗	xǐ	wash, rinse; clean, purify
1248	玉 96.3	1248	603	\N	\N	7	玛	mǎ	agate; cornelian
1249	心 61.7	1249	2285	6	6	11	患	huàn	suffer, worry about; suffering
1250	女 38.4	1250	919	5	6	7	妙	miào	mysterious, subtle; exquisite
1251	金 167.11	1251	3354	4	4	16	镜	jìng	mirror; lens; glass; glasses
1252	口 30.8	1252	2284	2	1	11	唱	chàng	sing, chant, call; ditty, song
1253	火 86.6	1253	2059	4	3	10	烦	fán	bother, vex, trouble; troublesome
1254	竹 118.7	1254	2953	4	5	13	签	qiān	sign, endorse; slip of paper
1255	人 9.3	1255	272	6	7–9	5	仙	xiān	Taoist super-being, transcendent, immortal
1256	彳 60.5	1256	1162	5	5	8	彼	bǐ	that, there, those
1257	弓 57.2	1257	328	\N	\N	5	弗	fú	not, negative
1258	疒 104.5	1258	2026	6	6	10	症	zhèng	disease, illness, ailment
1259	人 9.4	1259	474	5	5	6	仿	fǎng	imitate, copy; as if
1260	人 9.8	1260	1959	6	6	10	倾	qīng	upset, pour out, overflow
1261	片 91.8	1261	2692	4	3	12	牌	pái	signboard, placard
1262	阜 170.8	1262	2138	6	6	10	陷	xiàn	submerge, sink, plunge; trap
1263	鳥 196.0	1263	296	3	2	5	鸟	niǎo	bird; KangXi radical 196
1264	車 159.4	1264	1057	6	7–9	8	轰	hōng	rumble, explosion, blast
1265	口 30.6	1265	1508	4	2	9	咱	zán	we, us
1266	艸 140.8	1266	2207	1	1	11	菜	cài	vegetables; dish, order; food
1267	門 169.3	1267	527	5	4	6	闭	bì	shut, close; obstruct, block up
1268	大 37.5	1268	1051	4	4	8	奋	fèn	strive, exert effort; arouse
1269	广 53.3	1269	515	5	3	6	庆	qìng	congratulate, celebrate
1270	手 64.12	1270	3203	6	6	15	撤	chè	omit; remove; withdraw
1271	水 85.5	1271	1246	5	4	8	泪	lèi	tears; weep, cry
1272	艸 140.6	1272	1411	1	1	9	茶	chá	tea
1273	疒 104.5	1273	2028	6	6	10	疾	jí	illness, disease, sickness; to hate
1274	糸 120.9	1274	2824	6	6	12	缘	yuán	hem, margin; reason, cause; fate
1275	手 64.12	1275	3199	4	3	15	播	bō	sow, spread; broadcast; cast away, reject
1276	月 74.7	1276	2109	5	5	10	朗	lǎng	clear, bright; distinct
1277	木 75.3	1277	680	6	7–9	7	杜	dù	stop, prevent; restrict; surname
1278	女 38.2	1278	332	2	1	5	奶	nǎi	breast; milk; to breastfeed; mother
1279	子 39.5	1279	1132	3	4	8	季	jì	quarter of year; season; surname
1280	丶 3.3	1280	155	\N	7–9	4	丹	dān	cinnabar (native HgS); vermilion (artificial HgS used as pigment)
1281	犬 94.5	1281	1198	1	2	8	狗	gǒu	dog, canis familiaris
1282	尸 44.4	1282	905	5	4	7	尾	wěi	tail, extremity; end, stern
1283	人 9.3	1283	274	6	6	5	仪	yí	ceremony, rites gifts; admire
1284	人 9.9	1284	2330	5	5	11	偷	tōu	to steal, burglar, thief
1285	大 37.6	1285	1049	6	6	8	奔	bēn	run fast, flee; rush about; run
1286	玉 96.6	1286	1773	6	5	10	珠	zhū	precious stone, gem, jewel, pearl
1287	虫 142.0	1287	423	5	4	6	虫	chóng	insects, worms; KangXi radical 142
1288	馬 187.5	1288	1345	6	6	8	驻	zhù	to be stationed at, reside at; to stop
1289	子 39.1	1289	179	6	7–9	4	孔	kǒng	opening, hole, orifice; great
1290	宀 40.5	1290	1278	2	2	8	宜	yí	suitable, right, fitting, proper
1291	艸 140.2	1291	207	\N	7–9	5	艾	ài	artemisia, mugwort; translit.
1292	木 75.6	1292	1841	4	3	10	桥	qiáo	bridge; beam, crosspiece
1293	水 85.8	1293	2430	5	4	11	淡	dàn	weak, watery; insipid, tasteless
1294	羽 124.12	1294	3435	6	7–9	17	翼	yì	wings; fins on fish; shelter
1295	心 61.6	1295	1692	5	5	9	恨	hèn	hatred, dislike; resent, hate
1296	糸 120.11	1296	3419	5	5	17	繁	fán	complicated, complex, difficult
1297	宀 40.9	1297	2780	4	4	12	寒	hán	cold, wintry, chilly
1298	人 9.5	1298	785	5	4	7	伴	bàn	companion, comrade, partner; accompany
1299	口 30.2	1299	257	6	6	5	叹	tàn	sigh, admire
1300	日 72.1	1300	235	5	5	5	旦	dàn	dawn; morning; day
1301	心 61.9	1301	2966	6	7–9	13	愈	yù	more and more, even more
1302	水 85.12	1302	3292	5	4	15	潮	cháo	tide; moist, wet, damp; flow
1303	米 119.7	1303	2998	5	4	13	粮	liáng	food, grain, provisions
1304	糸 120.11	1304	3188	5	4	14	缩	suō	contract, draw in, reduce
1305	网 122.5	1305	1918	6	6	10	罢	bà	cease, finish, stop; give up
1306	耳 128.8	1306	3065	4	4	14	聚	jù	assemble, meet together, collect
1307	彳 60.5	1307	1163	6	6	8	径	jìng	narrow path; diameter; direct
1308	心 61.6	1308	1690	6	6	9	恰	qià	just, exactly, precisely; proper
1309	手 64.6	1309	1387	5	4	9	挑	tiāo	a load carried on the shoulders; to carry
1310	衣 145.5	1310	2325	4	4	11	袋	dài	pocket, bag, sack, pouch
1311	火 86.2	1311	397	5	5	6	灰	huī	ashes; dust; lime, mortar
1312	手 64.7	1312	1783	6	6	10	捕	bǔ	arrest, catch, seize
1313	彳 60.7	1313	1976	\N	7–9	10	徐	xú	slowly, quietly, calmly; composed, dignified
1314	玉 96.5	1314	1358	5	5	9	珍	zhēn	precious, valuable, rare
1315	巾 50.11	1315	2854	5	5	13	幕	mù	curtain, screen, tent
1316	日 72.5	1316	1487	5	4	9	映	yìng	project; reflect light
1317	衣 145.6	1317	2595	6	6	12	裂	liè	split, crack, break open; rend
1318	水 85.5	1318	1771	6	7–9	10	泰	tài	great, exalted, superior; big
1319	阜 170.10	1319	2805	5	4	12	隔	gé	separate, partition
1320	口 30.4	1320	886	5	5	7	启	qǐ	open; begin, commence; explain
1321	小 42.3	1321	415	6	6	6	尖	jiān	sharp, pointed, acute, keen
1322	心 61.4	1322	1094	6	6	8	忠	zhōng	loyalty, devotion, fidelity
1323	糸 120.5	1323	2282	2	1	11	累	lèi	tired; implicate, involve; bother
1324	火 86.4	1324	1237	6	6	8	炎	yán	flame, blaze; hot
1325	日 72.8	1325	2599	4	5	12	暂	zàn	temporary
1326	人 9.5	1326	769	4	5	7	估	gū	merchant; estimate, guess, presume
1327	水 85.5	1327	865	5	5	7	泛	fàn	to drift, float; careless, reckless
1328	艸 140.6	1328	1412	6	7–9	9	荒	huāng	wasteland, desert; uncultivated
1329	人 9.9	1329	2327	5	5	11	偿	cháng	repay, recompense; restitution
1330	木 75.11	1330	3213	6	6	15	横	héng	across
1331	手 64.5	1331	620	4	5	7	拒	jù	ward off with hand, defend
1332	玉 96.9	1332	2827	\N	7–9	13	瑞	ruì	felicitous omen; auspicious
1333	心 61.1	1333	167	4	5	4	忆	yì	remember, reflect upon; memory
1334	子 39.5	1334	1319	6	6	8	孤	gū	orphan, fatherless; solitary
1335	鼻 209.0	1335	3128	3	5	14	鼻	bí	nose; first; KangXi radical 209
1336	門 169.5	1336	1228	4	4	8	闹	nào	quarrel; dispute hotly
1337	羊 123.0	1337	530	2	3	6	羊	yáng	sheep, goat; KangXi radical 123
1338	口 30.4	1338	722	5	5	7	呆	dāi	dull; dull-minded, simple, stupid
1339	厂 27.3	1339	215	4	5	5	厉	lì	whetstone; grind, sharpen; whet
1340	行 144.10	1340	3363	5	6	16	衡	héng	measure, weigh, judge, consider
1341	肉 130.5	1341	1595	6	6	9	胞	bāo	womb, placenta, fetal membrane
1342	雨 173.5	1342	2885	2	1	13	零	líng	zero; fragment, fraction
1343	穴 116.2	1343	882	4	4	7	穷	qióng	poor, destitute, impoverished
1344	舌 135.2	1344	1165	5	5	8	舍	shě	house, dwelling; dwell, reside
1345	石 112.3	1345	1046	4	4	8	码	mǎ	number, numerals; yard; symbol
1346	赤 155.7	1346	3058	\N	7–9	14	赫	hè	bright, radiant, glowing
1347	女 38.8	1347	2435	5	4	11	婆	pó	old woman; grandmother
1348	鬼 194.4	1348	2830	6	7–9	13	魂	hún	soul, spirit
1349	火 86.3	1349	883	5	5	7	灾	zāi	calamity, disaster, catastrophe
1350	水 85.6	1350	1664	6	6	9	洪	hóng	vast, immense; flood, deluge
1351	肉 130.10	1351	2976	3	2	13	腿	tuǐ	legs, thighs
1352	肉 130.5	1352	1593	5	5	9	胆	dǎn	gall bladder; bravery, courage
1353	水 85.6	1353	1683	6	7–9	9	津	jīn	ferry; saliva; ford
1354	人 9.7	1354	1568	5	4	9	俗	sú	social customs; vulgar, unrefined
1355	辛 160.9	1355	3372	5	4	16	辩	biàn	dispute, argue, debate, discuss
1356	肉 130.6	1356	1996	5	4	10	胸	xiōng	breast, bosom, chest; thorax
1357	日 72.6	1357	1889	6	6	10	晓	xiǎo	dawn, daybreak; clear, explicit
1358	力 19.5	1358	926	5	4	7	劲	jìn	strong, unyielding, tough, power
1359	貝 154.4	1359	1178	6	6	8	贫	pín	poor, impoverished, needy
1360	人 9.2	1360	128	6	7–9	4	仁	rén	humaneness, benevolence, kindness
1361	人 9.9	1361	2328	4	5	11	偶	ǒu	accidentally, coincidently; an idol
1362	車 159.9	1362	2889	5	5	13	辑	jí	gather up, collect; edit, compile
1363	邑 163.4	1363	348	\N	7–9	6	邦	bāng	nation, country, state
1364	心 61.6	1364	1686	5	5	9	恢	huī	restore; big, great, immense, vast
1365	貝 154.9	1365	2872	6	6	13	赖	lài	rely, depend on; accuse falsely
1366	囗 31.8	1366	2302	5	4	11	圈	quān	to circle; a circle; corral
1367	手 64.11	1367	2833	5	4	13	摸	mō	gently touch with hand; caress
1368	人 9.4	1368	473	6	6	6	仰	yǎng	raise the head to look; look up to, rely on, admire
1369	水 85.7	1369	2081	5	5	10	润	rùn	soft, moist; sleek; freshen
1370	土 32.8	1370	2173	5	5	11	堆	duī	heap, pile, crowd; pile up
1371	石 112.8	1371	2880	5	2	13	碰	pèng	collide, bump into
1372	舟 137.7	1372	2706	6	7–9	12	艇	tǐng	small boat, dugout, punt
1373	禾 115.7	1373	2676	4	5	12	稍	shāo	little, slightly; rather
1374	辵 162.4	1374	906	3	4	7	迟	chí	late, tardy; slow; delay
1375	車 159.7	1375	2251	3	2	11	辆	liàng	numerary adjunct for vehicles
1376	广 53.5	1376	1220	5	6	8	废	fèi	abrogate, terminate, discard
1377	冫 15.6	1377	1221	3	1	8	净	jìng	clean, pure; cleanse
1378	凵 17.2	1378	145	6	6	4	凶	xiōng	culprit; murder; bad, sad
1379	网 122.8	1379	2930	6	7–9	13	署	shǔ	public office
1380	土 32.13	1380	3384	5	5	16	壁	bì	partition wall; walls of a house
1381	彳 60.8	1381	2704	6	7–9	12	御	yù	drive, ride; chariot; manage
1382	大 37.5	1382	943	6	6	8	奉	fèng	offer; receive; serve; respect
1383	方 70.7	1383	2393	6	6	11	旋	xuán	revolve, move in orbit; return
1384	冫 15.3	1384	295	3	2	5	冬	dōng	winter, 11th lunar month
1385	石 112.3	1385	1045	4	4	8	矿	kuàng	mine; mineral, ore
1386	手 64.5	1386	993	4	5	8	抬	tái	lift, carry
1387	虫 142.5	1387	2477	2	1	11	蛋	dàn	eggs; term of abuse
1388	日 72.7	1388	2260	6	2	11	晨	chén	early morning, daybreak
1389	人 9.4	1389	460	6	7–9	6	伏	fú	crouch, crawl, lie hidden, conceal
1390	口 30.4	1390	744	5	2	7	吹	chuī	blow; puff; brag, boast
1391	鳥 196.2	1391	928	2	1	7	鸡	jī	chicken
1392	人 9.8	1392	1967	4	4	10	倍	bèi	times, fold, multiple times
1393	米 119.9	1393	3287	5	5	15	糊	hú	paste, stick on with paste
1394	禾 115.5	1394	1772	\N	7–9	10	秦	qín	surname; Qin dynasty (221-207 BC)
1395	目 109.4	1395	1579	5	5	9	盾	dùn	shield, shield-shaped object; currency sign for Dutch guilder
1396	木 75.4	1396	1020	1	1	8	杯	bēi	cup, glass
1397	禾 115.5	1397	1944	1	2	10	租	zū	rent, lease; rental; tax
1398	馬 187.8	1398	2489	3	2	11	骑	qí	ride horseback; mount; cavalry
1399	丿 4.4	1399	147	5	5	4	乏	fá	lack; poor
1400	阜 170.9	1400	2479	6	7–9	11	隆	lóng	prosperous, plentiful, abundant
1401	言 149.5	1401	896	5	5	7	诊	zhěn	examine patient, diagnose
1402	女 38.2	1402	333	6	7–9	5	奴	nú	slave, servant
1403	手 64.10	1403	2832	5	5	13	摄	shè	take in, absorb; act as deputy
1404	十 24.6	1404	1034	6	6	8	丧	sàng	mourning; mourn; funeral
1405	水 85.3	1405	537	4	5	6	污	wū	filthy, dirty, impure, polluted
1406	水 85.9	1406	2765	6	6	12	渡	dù	cross, ferry over; ferry
1407	方 70.10	1407	3152	6	6	14	旗	qí	banner, flag, streamer
1408	甘 99.0	1408	205	6	7–9	5	甘	gān	sweetness; sweet, tasty
1409	而 126.3	1409	1456	4	5	9	耐	nài	endure, bear; resist; patient
1410	几 16.6	1410	1148	5	5	8	凭	píng	lean on, depend on, rely on
1411	手 64.1	1411	85	6	6	4	扎	zhā	pull up; pierce; struggle free
1412	手 64.4	1412	637	5	5	7	抢	qiǎng	plunder, rob, take by force
1413	糸 120.8	1413	2487	5	6	11	绪	xù	end of thread; thread, clue
1414	米 119.5	1414	2403	4	4	11	粗	cū	rough, thick, course; rude
1415	肉 130.4	1415	1289	5	5	8	肩	jiān	shoulders; to shoulder; bear
1416	木 75.7	1416	2436	6	6	11	梁	liáng	bridge; beam; rafters; surname
1417	幺 52.1	1417	189	5	6	4	幻	huàn	illusion, fantasy, mirage
1418	艸 140.8	1418	2202	\N	\N	11	菲	fēi	fragrant, luxuriant; the Philippines
1419	白 106.4	1419	1465	6	7–9	9	皆	jiē	all, every, everybody
1420	石 112.8	1420	2879	5	5	13	碎	suì	break, smash; broken, busted
1421	宀 40.5	1421	1280	6	7–9	8	宙	zhòu	time as concept; infinite time
1422	又 29.6	1422	1065	3	4	8	叔	shū	uncle, father's younger brother; husband's younger brother
1423	山 46.5	1423	1106	6	7–9	8	岩	yán	cliff; rocks; mountain
1424	艸 140.7	1424	1414	6	7–9	9	荡	dàng	pond, pool; wash away, cleanse
1425	糸 120.8	1425	2496	5	4	11	综	zōng	arrange threads for weaving
1426	爪 87.4	1426	1161	3	2	8	爬	pá	crawl, creep; climb; scramble
1427	艸 140.7	1427	1826	\N	7–9	10	荷	hé	lotus, water lily, holland
1428	心 61.7	1428	2351	4	5	11	悉	xī	know, learn about, comprehend
1429	艸 140.9	1429	2556	6	7–9	12	蒂	dì	peduncle or stem of plants
1430	辵 162.4	1430	794	5	5	7	返	fǎn	return, revert to, restore
1431	二 7.2	1431	77	6	6	4	井	jǐng	well, mine shaft, pit
1432	士 33.3	1432	510	6	6	6	壮	zhuàng	big, large; robust; name of tribe
1433	艸 140.13	1433	3326	5	4	16	薄	báo	thin, slight, weak; poor, stingy
1434	心 61.7	1434	2092	5	5	10	悄	qiāo	silent, quiet, still; anxious
1435	手 64.3	1435	365	3	4	6	扫	sǎo	sweep, clear away; exterminate
1436	攴 66.7	1436	2323	5	5	11	敏	mǐn	fast, quick, clever, smart
1437	石 112.8	1437	2876	5	5	13	碍	ài	obstruct, hinder, block, deter
1438	歹 78.8	1438	2594	6	6	12	殖	zhí	breed, spawn; increase; prosper
1439	言 149.6	1439	1301	4	5	8	详	xiáng	detailed, complete, thorough
1440	辵 162.5	1440	1091	\N	7–9	8	迪	dí	enlighten, advance; progress
1441	矛 110.0	1441	343	5	5	5	矛	máo	spear, lance; KangXi radical 110
1442	雨 173.8	1442	3337	6	7–9	16	霍	huò	quickly, suddenly; surname
1443	儿 10.2	1443	183	4	6	4	允	yǔn	to grant, to allow, to consent
1444	巾 50.9	1444	2648	5	5	12	幅	fú	piece, strip, breadth of, hem
1445	手 64.12	1445	3192	6	7–9	15	撒	sā	release, cast away, let go; disperse; relax
1446	刀 18.10	1446	2675	4	5	12	剩	shèng	leftovers, residue, remains
1447	几 16.6	1447	1112	\N	7–9	8	凯	kǎi	triumphant; triumph, victory
1448	頁 181.8	1448	3100	5	5	14	颗	kē	grain, kernel
1449	口 30.6	1449	1505	5	5	9	骂	mà	accuse, blame, curse, scold
1450	貝 154.8	1450	2609	5	4	12	赏	shǎng	reward, grant, bestow; appreciate
1451	水 85.8	1451	2428	6	6	11	液	yè	sap, juice, liquid, fluid
1452	田 102.7	1452	2709	6	6	12	番	fān	to take turns; a turn, a time; to repeat
1453	竹 118.9	1453	3265	3	3	15	箱	xiāng	case, box, chest, trunk
1454	貝 154.5	1454	1521	5	4	9	贴	tiē	paste to, stick on; attached to
1455	水 85.11	1455	3164	4	5	14	漫	màn	overflow of water; spreading
1456	酉 164.7	1456	3089	4	4	14	酸	suān	tart, sour; acid; stiff; spoiled
1457	邑 163.6	1457	1287	6	4	8	郎	láng	gentleman, young man; husband
1458	肉 130.9	1458	2969	5	4	13	腰	yāo	waist; kidney
1459	舌 135.6	1459	2707	3	2	12	舒	shū	open up, unfold, stretch out; comfortable, easy
1460	目 109.4	1460	1729	5	7–9	9	眉	méi	eyebrows; upper margin of book
1461	心 61.4	1461	874	6	6	7	忧	yōu	sad, grieved; grief, melancholy
1462	水 85.7	1462	2077	6	6	10	浮	fú	to float, drift, waft; to exceed; superfluous
1463	辛 160.0	1463	841	4	5	7	辛	xīn	bitter; toilsome, laborious; 8th heavenly stem
1464	心 61.6	1464	2016	5	5	10	恋	liàn	love; long for, yearn for; love
1465	食 184.7	1465	3341	4	2	16	餐	cān	eat, dine; meal; food
1466	口 30.3	1466	422	5	5	6	吓	xià	scare, frighten; intimidate
1467	手 64.7	1467	1382	4	2	9	挺	tǐng	to stand upright, straighten; rigid
1468	力 19.5	1468	702	4	5	7	励	lì	strive; encourage
1469	舌 135.7	1469	2947	5	5	13	辞	cí	words, speech, expression, phrase
1470	舟 137.10	1470	3273	6	7–9	15	艘	sōu	counter for ships, vessels
1471	金 167.8	1471	2943	4	5	13	键	jiàn	door bolt, lock bolt; key
1472	人 9.4	1472	459	6	6	6	伍	wǔ	five, company of five; troops
1473	山 46.7	1473	1921	6	6	10	峰	fēng	peak, summit; hump of camel
1474	尸 44.1	1474	175	5	4	4	尺	chǐ	a Chinese foot, one-third of a meter; a ruler
1475	日 72.5	1475	1489	1	1	9	昨	zuó	yesterday; in former times, past
1476	黍 202.3	1476	3262	6	7–9	15	黎	lí	surname; numerous, many; black
1477	非 175.4	1477	2602	5	5	12	辈	bèi	generation, lifetime; class
1478	貝 154.4	1478	1351	6	6	8	贯	guàn	a string of 1000 coins; to go through
1479	人 9.6	1479	1145	6	7–9	8	侦	zhēn	spy, reconnoiter; detective
1480	水 85.10	1480	2761	5	5	12	滑	huá	slip, slide; slippery, polished
1481	刀 18.6	1481	1230	6	6	8	券	quàn	certificate, ticket; title deeds
1482	山 46.8	1482	2299	6	6	11	崇	chóng	esteem, honor, revere, venerate
1483	手 64.4	1483	618	4	5	7	扰	rǎo	disturb, annoy, agitate
1484	宀 40.6	1484	1699	6	7–9	9	宪	xiàn	constitution, statute, law
1485	糸 120.6	1485	1755	5	5	9	绕	rào	entwine; wind around; surround
1486	走 156.5	1486	2516	5	4	12	趋	qū	hasten, hurry; be attracted to
1487	心 61.10	1487	3002	6	7–9	13	慈	cí	kind, charitable, benevolent
1488	大 37.3	1488	452	\N	7–9	6	乔	qiáo	tall, lofty; proud, stately
1489	門 169.7	1489	2048	4	4	10	阅	yuè	examine, inspect, review, read
1490	水 85.3	1490	536	4	5	6	汗	hàn	perspiration, sweat
1491	木 75.4	1491	1019	6	6	8	枝	zhī	branches, limbs; branch off
1492	手 64.5	1492	968	6	6	8	拖	tuō	drag, tow, haul; delay, prolong
1493	土 32.12	1493	3255	6	6	15	墨	mò	ink; writing
1494	肉 130.4	1494	1191	5	6	8	胁	xié	ribs, armpits; flank; threaten
1495	手 64.9	1495	2526	5	5	12	插	chā	insert, stick into; plant
1496	竹 118.9	1496	3267	6	6	15	箭	jiàn	arrow; type of bamboo
1497	肉 130.8	1497	2712	\N	7–9	12	腊	là	year end sacrifice; dried meat
1498	米 119.4	1498	2053	6	6	10	粉	fěn	powder, face powder; plaster
1499	水 85.5	1499	1258	6	6	8	泥	ní	mud, mire; earth, clay; plaster
1500	氏 83.0	1500	151	6	7–9	4	氏	shì	clan, family; mister
1501	彡 59.9	1501	2524	\N	\N	12	彭	péng	name of ancient country; surname
1502	手 64.5	1502	959	6	5	8	拔	bá	uproot, pull out
1503	馬 187.9	1503	2821	4	5	12	骗	piàn	swindle, cheat out of, defraud
1504	几 16.2	1504	159	\N	7–9	4	凤	fèng	male phoenix; symbol of joy
1505	心 61.11	1505	3189	5	6	15	慧	huì	bright, intelligent; intelligence
1506	女 38.9	1506	2808	5	3	12	媒	méi	go-between, matchmaker; medium
1507	人 9.6	1507	1150	5	7–9	8	佩	pèi	belt ornament, pendant; wear at waist, tie to the belt; respect
1508	心 61.9	1508	2770	6	6	12	愤	fèn	resent, hate; indignant
1509	手 64.2	1509	199	6	6	5	扑	pū	pound, beat, strike; attack
1510	齒 211.5	1510	2893	4	5	13	龄	líng	age; years
1511	馬 187.4	1511	930	6	7–9	7	驱	qū	spur a horse on; expel, drive away
1512	心 61.8	1512	2439	4	5	11	惜	xī	pity, regret, rue, begrudge
1513	豕 152.7	1513	3141	5	5	14	豪	háo	brave, heroic, chivalrous
1514	手 64.8	1514	2166	6	7–9	11	掩	yǎn	to cover (with the hand); shut, conceal; ambush
1515	八 12.8	1515	2056	5	7–9	10	兼	jiān	unite, combine; connect; and
1516	足 157.4	1516	2276	5	6	11	跃	yuè	skip, jump, frolic
1517	尸 44.0	1517	59	6	7–9	3	尸	shī	corpse; to impersonate the dead; to preside; KangXi radical 44
1518	聿 129.4	1518	1303	5	5	8	肃	sù	pay respects; reverently
1519	巾 50.5	1519	1110	\N	7–9	8	帕	pà	turban, kerchief, veil; wrap
1520	馬 187.5	1520	1341	5	5	8	驶	shǐ	sail, drive, pilot; fast, quick
1521	土 32.9	1521	2693	6	7–9	12	堡	bǎo	fort, fortress; town, village
1522	尸 44.5	1522	1309	5	5	8	届	jiè	numerary adjunct for time, term
1523	欠 76.4	1523	1158	5	5	8	欣	xīn	happy, joyous, delighted
1524	心 61.8	1524	2580	5	5	12	惠	huì	favor, benefit, confer kindness
1525	冂 13.3	1525	290	5	5	5	册	cè	book, volume, register, list
1526	人 9.10	1526	2697	6	6	12	储	chǔ	save money, store, reserve; heir
1527	風 182.11	1527	3221	5	7–9	15	飘	piāo	whirlwind, cyclone; floating
1528	木 75.6	1528	2149	6	7–9	10	桑	sāng	mulberry tree; surname
1529	門 169.4	1529	846	5	5	7	闲	xián	fence, guard; defend; idle time
1530	心 61.8	1530	2449	6	6	11	惨	cǎn	sad, pitiful, wretched; cruel
1531	水 85.6	1531	1663	6	6	9	洁	jié	clean, purify, pure
1532	足 157.8	1532	3244	6	7–9	15	踪	zōng	footprints, traces, tracks
1533	力 19.7	1533	1440	6	7–9	9	勃	bó	suddenly, sudden, quick
1534	宀 40.7	1534	2102	2	5	10	宾	bīn	guest, visitor; surname; submit
1535	頁 181.7	1535	2892	5	5	13	频	pín	frequently, again and again
1536	人 9.2	1536	133	6	7–9	4	仇	chóu	enemy, hate, hatred, enmity
1537	石 112.11	1537	3367	6	6	16	磨	mó	grind; polish; rub; wear out; a millstone
1538	辵 162.7	1538	2064	5	4	10	递	dì	hand over, deliver; substitute
1539	邑 163.4	1539	405	\N	7–9	6	邪	xié	wrong, evil, depraved, vicious, perverse, heterodox
1540	手 64.12	1540	3202	5	5	15	撞	zhuàng	knock against, bump into, collide
1541	手 64.5	1541	657	6	7–9	7	拟	nǐ	draft; intend, plan, propose
1542	水 85.11	1542	3015	5	5	13	滚	gǔn	turn
1543	大 37.6	1543	1354	6	6	9	奏	zòu	memorialize emperor; report
1544	巛 47.4	1544	598	6	7–9	6	巡	xún	patrol, go on circuit, cruise
1545	頁 181.9	1545	3285	2	2	15	颜	yán	face, facial appearance
1546	刀 18.6	1546	1216	6	7–9	8	剂	jì	medicinal preparation
1547	糸 120.8	1547	2486	3	2	11	绩	jī	spin; achievements
1548	貝 154.3	1548	627	5	6	7	贡	gòng	offer tribute; tribute, gifts
1549	疒 104.4	1549	1626	5	5	9	疯	fēng	crazy, insane, mentally ill
1550	土 32.5	1550	989	6	6	8	坡	pō	slope, bank, hillside
1551	目 109.12	1551	3402	5	5	17	瞧	qiáo	glance at, look at, see
1552	戈 62.10	1552	3059	6	6	14	截	jié	cut off, stop, obstruct, intersect
1553	火 86.12	1553	3376	5	4	16	燃	rán	burn; light fire, ignite
1554	火 86.8	1554	2695	6	6	12	焦	jiāo	burned, scorched; anxious, vexed
1555	殳 79.9	1555	3036	6	7–9	13	殿	diàn	hall; palace; temple
1556	人 9.4	1556	476	6	7–9	6	伪	wěi	false, counterfeit, bogus
1557	木 75.5	1557	1434	\N	7–9	9	柳	liǔ	willow tree; pleasure
1558	金 167.7	1558	2660	5	5	12	锁	suǒ	lock, padlock; shackles, chains
1559	辵 162.9	1559	2582	6	6	12	逼	bī	compel, pressure, force; bother
1560	頁 181.5	1560	2484	6	7–9	11	颇	pō	lean one side; very, rather
1561	日 72.4	1561	1193	6	6	8	昏	hūn	dusk, nightfall, twilight, dark
1562	力 19.2	1562	186	5	5	4	劝	quàn	recommend, advise, urge
1563	口 30.4	1563	716	6	7–9	7	呈	chéng	submit, show; appear; petition
1564	手 64.9	1564	2528	5	5	12	搜	sōu	search, seek; investigate
1565	力 19.11	1565	2848	5	5	13	勤	qín	industrious, diligent, attentive
1566	戈 62.3	1566	606	5	5	7	戒	jiè	warn, caution, admonish
1567	馬 187.5	1567	1332	5	5	8	驾	jià	to drive, sail, fly; a cart, carriage
1568	水 85.11	1568	3163	1	2	14	漂	piào	float, drift; tossed about
1569	食 184.4	1569	824	3	5	7	饮	yǐn	drink; swallow; kind of drink
1570	曰 73.7	1570	2233	\N	7–9	11	曹	cáo	ministry officials; surname
1571	木 75.2	1571	497	3	5	6	朵	duǒ	cluster of flowers; earlobe
1572	人 9.3	1572	276	4	5	5	仔	zǐ	small thing, child; young animal
1573	木 75.5	1573	1750	5	7–9	9	柔	róu	soft; gentle, pliant
1574	人 9.7	1574	1557	4	4	9	俩	liǎ	two, pair
1575	子 39.5	1575	1316	\N	7–9	8	孟	mèng	first in series; great, eminent
1576	肉 130.8	1576	3144	5	4	14	腐	fǔ	rot, decay, spoil; rotten
1577	幺 52.2	1577	346	5	4	5	幼	yòu	infant, young child; immature
1578	足 157.5	1578	2628	5	6	12	践	jiàn	trample, tread upon, walk on
1579	竹 118.14	1579	3482	4	5	20	籍	jí	record, register, list; census
1580	牛 93.4	1580	1126	6	7–9	8	牧	mù	tend cattle, shepherd
1581	冫 15.8	1581	2040	4	2	10	凉	liáng	cool, cold; disheartened
1582	牛 93.5	1582	1544	6	6	9	牲	shēng	sacrificial animal; animal
1583	人 9.6	1583	1135	6	6	8	佳	jiā	good, auspicious; beautiful; delightful
1584	女 38.7	1584	1741	\N	\N	9	娜	nà	elegant, graceful, delicate
1585	水 85.6	1585	1682	5	4	9	浓	nóng	thick, strong, concentrated
1586	艸 140.4	1586	670	\N	7–9	7	芳	fāng	fragrant; virtuous; beautiful
1587	禾 115.10	1587	3263	6	6	15	稿	gǎo	draft, manuscript, rough copy
1588	竹 118.0	1588	450	5	5	6	竹	zhú	bamboo; flute; KangXi radical 118
1589	肉 130.9	1589	2972	6	7–9	13	腹	fù	stomach, belly, abdomen; inside
1590	足 157.5	1590	2630	6	6	12	跌	diē	stumble, slip, fall down; stamp
1591	辵 162.8	1591	2295	5	5	11	逻	luó	patrol; inspect; watch; patrol
1592	土 32.5	1592	1125	6	7–9	8	垂	chuí	let down; suspend, hand; down
1593	辵 162.12	1593	3288	5	5	15	遵	zūn	obey, comply with, follow; honor
1594	肉 130.6	1594	1597	6	7–9	9	脉	mài	blood vessels, veins, arteries
1595	豸 153.7	1595	3131	4	5	14	貌	mào	countenance, appearance
1596	木 75.5	1596	1432	\N	7–9	9	柏	bǎi	cypress, cedar
1597	犬 94.6	1597	1605	6	7–9	9	狱	yù	prison, jail; case; lawsuit
1598	犬 94.8	1598	2364	4	5	11	猜	cāi	guess, conjecture, suppose; feel
1599	心 61.5	1599	1270	4	5	8	怜	lián	pity, sympathize
1600	心 61.8	1600	2581	6	7–9	12	惑	huò	confuse, mislead, baffle; doubt
1601	阜 170.8	1601	2137	6	7–9	10	陶	táo	pottery, ceramics
1602	八 12.9	1602	2407	6	7–9	11	兽	shòu	beast, animal; bestial
1603	巾 50.4	1603	755	6	7–9	7	帐	zhàng	tent; screen, mosquito net
1604	食 184.5	1604	1201	5	5	8	饰	shì	decorate, ornament, adorn
1605	貝 154.5	1605	1558	5	5	9	贷	dài	lend; borrow; pardon
1606	日 72.4	1606	1084	6	6	8	昌	chāng	light of sun; good, proper
1607	又 29.7	1607	1586	5	7–9	9	叙	xù	express, state, relate, narrate
1608	身 158.8	1608	3270	4	4	15	躺	tǎng	lie down, recline
1609	金 167.4	1609	1529	4	5	9	钢	gāng	steel; hard, strong, tough
1610	水 85.4	1610	868	5	5	7	沟	gōu	ditch, drain, narrow waterway
1611	宀 40.8	1611	2453	4	4	11	寄	jì	send, transmit, mail; rely on
1612	手 64.4	1612	612	5	5	7	扶	fú	support, help; protect; hold on
1613	金 167.7	1613	2657	6	6	12	铺	pù	shop, store; place sleep, bed
1614	邑 163.2	1614	185	\N	7–9	4	邓	dèng	surname
1615	寸 41.4	1615	599	5	5	7	寿	shòu	old age, long life; lifespan
1616	心 61.8	1616	2442	6	7–9	11	惧	jù	fear, be afraid of, dread
1617	言 149.6	1617	1299	5	5	8	询	xún	inquire into, ask about; consult
1618	水 85.3	1618	542	4	3	6	汤	tāng	hot water; soup, gravy, broth
1619	皿 108.6	1619	2388	6	6	11	盗	dào	rob, steal; thief, bandit
1620	肉 130.4	1620	1189	4	4	8	肥	féi	fat, plump, obese; fertile
1621	小 42.6	1621	1476	4	5	9	尝	cháng	taste; experience, experiment
1622	勹 20.3	1622	289	5	7–9	5	匆	cōng	hastily, in haste, hurriedly
1623	小 42.9	1623	2606	6	6	12	辉	huī	brightness, luster, brilliance
1624	大 37.5	1624	1048	5	5	8	奈	nài	but, how; bear, stand, endure
1625	手 64.3	1625	357	6	6	6	扣	kòu	knock, strike, rap, tap; button
1626	廴 54.4	1626	448	\N	7–9	6	廷	tíng	court
1627	水 85.13	1627	3295	\N	7–9	15	澳	ào	inlet, bay; dock, bank
1628	口 30.11	1628	3110	6	6	14	嘛	ma	final exclamatory particle
1629	艸 140.9	1629	2551	6	7–9	12	董	dǒng	direct, supervise; surname
1630	辵 162.3	1630	451	6	6	6	迁	qiān	move, shift, change; transfer; relocate a capital city
1631	冫 15.14	1631	3370	6	7–9	16	凝	níng	coagulate; congeal; freeze
1632	心 61.11	1632	3310	5	5	15	慰	wèi	comfort, console, calm
1633	厂 27.4	1633	386	4	5	6	厌	yàn	dislike, detest, reject; satiate
1634	肉 130.6	1634	1998	4	2	10	脏	zàng	internal organs, viscera; dirty
1635	肉 130.9	1635	2975	6	7–9	13	腾	téng	fly; gallop; run; prance; rise
1636	幺 52.6	1636	1524	4	5	9	幽	yōu	quiet, secluded, tranquil; dark
1637	心 61.5	1637	1608	5	5	9	怨	yuàn	hatred, enmity, resentment
1638	革 177.6	1638	3207	3	2	15	鞋	xié	shoes, footwear in general
1639	一 1.5	1639	447	4	5	6	丢	diū	discard
1640	土 32.7	1640	1794	6	6	10	埋	mái	bury, secrete, conceal
1641	水 85.5	1641	1572	4	4	9	泉	quán	spring, fountain; wealth, money
1642	水 85.7	1642	2089	6	7–9	10	涌	yǒng	surge up, bubble up, gush forth
1643	車 159.10	1643	3096	6	7–9	14	辖	xiá	linchpin of wheel; control
1644	身 158.6	1644	2962	5	5	13	躲	duǒ	hide, secrete; avoid, escape
1645	日 72.6	1645	1828	6	7–9	10	晋	jìn	advance, increase; promote
1646	糸 120.5	1646	2604	5	5	12	紫	zǐ	purple, violet; amethyst; surname
1647	又 29.6	1647	1335	5	5	8	艰	jiān	difficult, hard; distressing
1648	鬼 194.8	1648	3416	\N	7–9	17	魏	wèi	kingdom of Wei; surname
1649	口 30.4	1649	695	\N	\N	7	吾	wú	i, my, our; resist, impede
1650	心 61.10	1650	2771	5	5	12	慌	huāng	nervous, panicky, frantic
1651	示 113.5	1651	1712	4	3	9	祝	zhù	pray for happiness or blessings
1652	邑 163.5	1652	732	3	3	7	邮	yóu	postal, mail; post office
1653	口 30.3	1653	421	5	5	6	吐	tǔ	vomit, spew out, cough up
1654	犬 94.6	1654	1606	6	6	9	狠	hěn	vicious, cruel; severely, extreme
1655	金 167.5	1655	2894	6	6	13	鉴	jiàn	mirror, looking glass; reflect
1656	曰 73.0	1656	111	\N	7–9	4	曰	yuē	say; KangXi radical 73
1657	木 75.7	1657	2219	6	6	11	械	xiè	weapons; implements, instruments
1658	口 30.6	1658	1512	5	5	9	咬	yǎo	bite, gnaw
1659	邑 163.5	1659	801	3	5	7	邻	lín	neighbor; neighborhood
1660	赤 155.0	1660	631	6	7–9	7	赤	chì	red, scarlet; bare, naked
1661	手 64.6	1661	1392	5	5	9	挤	jǐ	crowd, squeeze, push against
1662	弓 57.6	1662	1616	5	4	9	弯	wān	bend, curve
1663	木 75.8	1663	2569	1	2	12	椅	yǐ	chair, seat
1664	阜 170.8	1664	2139	4	5	10	陪	péi	accompany, be with, keep company
1665	刀 18.10	1665	2779	6	7–9	12	割	gē	cut, divide, partition; cede
1666	手 64.9	1666	2522	6	6	12	揭	jiē	raise, lift up; surname
1667	韋 178.0	1667	3509	\N	\N	4	韦	wéi	tanned leather; surname; simplified form of KangXi radical number 178
1668	心 61.7	1668	2091	6	6	10	悟	wù	to apprehend, realize, become aware
1669	耳 128.9	1669	3206	3	5	15	聪	cōng	intelligent, clever, bright
1670	雨 173.5	1670	2886	5	7–9	13	雾	wù	fog, mist, vapor, fine spray
1671	金 167.7	1671	2664	6	6	12	锋	fēng	point of spear, sharp point
1672	木 75.7	1672	2229	3	4	11	梯	tī	ladder, steps, stairs; lean
1673	犬 94.9	1673	2367	1	2	11	猫	māo	cat
1674	示 113.6	1674	2119	6	6	10	祥	xiáng	good luck, good omen; happiness
1675	門 169.9	1675	2737	6	6	12	阔	kuò	broad, ample, wide; be apart
1676	言 149.6	1676	3024	6	6	13	誉	yù	fame, reputation; praise
1677	竹 118.7	1677	2952	6	7–9	13	筹	chóu	chip, tally, token; raise money
1678	一 1.4	1678	281	6	7–9	5	丛	cóng	bush, shrub; thicket; collection
1679	大 37.6	1679	1458	6	6	9	牵	qiān	drag, pull, lead by hand
1680	口 30.5	1680	1100	6	7–9	8	鸣	míng	cry of bird or animal; make sound
1681	水 85.4	1681	870	\N	\N	7	沈	chén	sink, submerge; addicted to; surname
1682	門 169.6	1682	1639	\N	7–9	9	阁	gé	chamber, pavilion; cabinet
1683	禾 115.11	1683	3356	\N	7–9	16	穆	mù	majestic, solemn, reverent; calm
1684	尸 44.5	1684	1311	5	7–9	8	屈	qū	bend, flex; bent, crooked; crouch
1685	日 72.2	1685	501	6	7–9	6	旨	zhǐ	purpose, aim; excellent
1686	衣 145.5	1686	2116	6	6	10	袖	xiù	sleeve; put something in sleeve
1687	犬 94.8	1687	2366	6	7–9	11	猎	liè	hunt; field sports
1688	肉 130.13	1688	3434	6	7–9	17	臂	bì	arm
1689	虫 142.5	1689	2280	5	5	11	蛇	shé	snake
1690	貝 154.5	1690	1744	4	5	9	贺	hè	congratulate; send present
1691	木 75.5	1691	1435	6	6	9	柱	zhù	pillar, post; support; lean on
1692	手 64.4	1692	642	6	7–9	7	抛	pāo	throw (away)
1693	鼠 208.0	1693	2958	5	5	13	鼠	shǔ	rat, mouse; KangXi radical 208
1694	玉 96.9	1694	2825	\N	\N	13	瑟	sè	large stringed musical instrument; dignified, massive; sound of wind
1695	戈 62.0	1695	104	\N	7–9	4	戈	gē	halberd, spear, lance; rad. 62
1696	牛 93.3	1696	880	6	6	7	牢	láo	prison; stable, pen; secure
1697	辵 162.6	1697	1728	6	7–9	9	逊	xùn	humble, modest; yield
1698	辵 162.3	1698	408	6	7–9	6	迈	mài	take a big stride; pass by
1699	欠 76.8	1699	2543	6	6	12	欺	qī	cheat, double-cross, deceive
1700	口 30.4	1700	730	5	5	7	吨	dūn	metric ton; (Cant.) to babble, gibberish
1701	玉 96.8	1701	2501	4	5	12	琴	qín	Chinese lute or guitar
1702	衣 145.4	1702	2019	6	7–9	10	衰	shuāi	decline, falter, decrease; weaken
1703	瓦 98.6	1703	2051	3	2	10	瓶	píng	jug, pitcher, vase, jar, bottle
1704	心 61.6	1704	1691	4	7–9	9	恼	nǎo	angered, filled with hate
1705	火 86.12	1705	3319	\N	7–9	16	燕	yàn	swallow (bird); comfort, enjoy
1706	人 9.4	1706	465	\N	7–9	6	仲	zhòng	middle brother; go between, mediator; surname
1707	言 149.7	1707	1715	6	7–9	9	诱	yòu	persuade, entice, induce; guide
1708	犬 94.7	1708	2005	6	7–9	10	狼	láng	wolf
1709	水 85.3	1709	540	5	5	6	池	chí	pool, pond; moat; cistern
1710	疒 104.5	1710	2031	3	2	10	疼	téng	aches, pains; be fond of; love
1711	卜 25.3	1711	230	\N	\N	5	卢	lú	cottage, hut; surname; black
1712	人 9.3	1712	270	6	7–9	5	仗	zhàng	rely upon; protector; fight; war, weaponry
1713	冖 14.7	1713	1705	5	5	9	冠	guān	cap, crown, headgear
1714	米 119.5	1714	2404	6	7–9	11	粒	lì	grain; small particle
1715	辵 162.9	1715	2967	6	7–9	13	遥	yáo	far away, distant, remote
1716	口 30.3	1716	426	\N	7–9	6	吕	lǚ	surname; a musical note
1717	玄 95.0	1717	304	\N	7–9	5	玄	xuán	deep, profound, abstruse; KangXi radical 95
1718	小 42.3	1718	414	5	7–9	6	尘	chén	dust, dirt, ashes, cinders
1719	馬 187.2	1719	303	\N	7–9	5	冯	féng	surname; gallop; by dint of
1720	手 64.4	1720	613	6	7–9	7	抚	fǔ	pat, console, comfort; pacify
1721	水 85.5	1721	1240	5	4	8	浅	qiǎn	shallow, not deep; superficial
1722	攴 66.8	1722	2729	\N	7–9	12	敦	dūn	esteem; honest, candid, sincere
1723	糸 120.2	1723	344	6	6	5	纠	jiū	investigate, inspect
1724	金 167.5	1724	1930	6	6	10	钻	zuān	drill, bore; pierce; diamond
1725	日 72.8	1725	2620	6	7–9	12	晶	jīng	crystal; clear, bright; radiant
1726	山 46.3	1726	439	6	7–9	6	岂	qǐ	how? what?
1727	山 46.6	1727	1518	6	7–9	9	峡	xiá	gorge, strait, ravine; isthmus
1728	艸 140.4	1728	669	6	7–9	7	苍	cāng	blue; green
1729	口 30.9	1729	2618	5	5	12	喷	pēn	spurt, blow out, puff out
1730	耒 127.4	1730	1768	6	6	10	耗	hào	consume, use up; waste, squander
1731	冫 15.8	1731	2014	5	7–9	10	凌	líng	pure; virtuous; insult; maltreat
1732	攴 66.10	1732	3140	4	5	14	敲	qiāo	strike, beat, pound, hammer; rap
1733	艸 140.8	1733	2205	6	6	11	菌	jūn	mushroom; germ, microbe
1734	貝 154.8	1734	2654	5	5	12	赔	péi	indemnify, suffer loss
1735	水 85.7	1735	2075	5	7–9	10	涂	tú	surname; name of certain rivers
1736	米 119.8	1736	3154	6	7–9	14	粹	cuì	pure; unadulterated; select
1737	戶 63.5	1737	1708	6	6	9	扁	biǎn	flat; tablet, signboard
1738	二 7.1	1738	25	5	5	3	亏	kuī	lose, fail; damage; deficient
1739	宀 40.8	1739	2454	5	7–9	11	寂	jì	still, silent, quiet, desolate
1740	火 86.9	1740	3003	5	5	13	煤	méi	coal, coke, charcoal, carbon
2054	水 85.7	2054	2065	6	7–9	10	涛	tāo	large waves
1741	火 86.10	1741	3185	3	5	14	熊	xióng	a bear; brilliant; bright; surname
1742	心 61.6	1742	1820	5	7–9	10	恭	gōng	respectful, polite, reverent
1743	水 85.9	1743	2756	5	4	12	湿	shī	wet, moist, humid, damp; illness
1744	彳 60.9	1744	2705	6	6	12	循	xún	obey, comply with, follow
1745	日 72.9	1745	2906	4	3	13	暖	nuǎn	warm, genial
1746	米 119.10	1746	3374	4	3	16	糖	táng	sugar; candy; sweets
1747	貝 154.8	1747	2650	6	7–9	12	赋	fù	tax; give; endow; army; diffuse
1748	手 64.4	1748	641	6	7–9	7	抑	yì	press down, repress; curb, hinder
1749	禾 115.5	1749	1947	5	7–9	10	秩	zhì	order; orderly; salary; decade
1750	巾 50.9	1750	2649	3	4	12	帽	mào	hat, cap; cap-like tops
1751	口 30.6	1751	1619	6	7–9	9	哀	āi	sad, mournful, pitiful; pity
1752	宀 40.8	1752	2455	5	5	11	宿	sù	stop, rest, lodge, stay overnight; constellation
1753	足 157.8	1753	3242	6	6	15	踏	tà	step on, trample, tread on, walk
1754	火 86.5	1754	1660	5	5	9	烂	làn	rotten, spoiled, decayed
1755	衣 145.4	1755	1799	\N	7–9	10	袁	yuán	robe; surname
1756	人 9.7	1756	1576	\N	\N	9	侯	hóu	marquis, lord; target in archery
1757	手 64.4	1757	648	5	7–9	7	抖	dǒu	tremble, shake, rouse; give shake
1758	一 1.5	1758	402	5	5	6	夹	jiā	be wedged or inserted between
1759	日 72.4	1759	1080	5	7–9	8	昆	kūn	elder brother; descendants
1760	肉 130.3	1760	803	\N	6	7	肝	gān	liver
1761	手 64.14	1761	3389	4	4	17	擦	cā	wipe, scrub, rub, scour; brush
1762	犬 94.9	1762	2365	5	3	11	猪	zhū	pig, hog, wild boar
1763	火 86.5	1763	1655	3	4	9	炼	liàn	smelt, refine; distill, condense
1764	心 61.6	1764	1685	6	7–9	9	恒	héng	constant, regular, persistent
1765	心 61.10	1765	3023	5	7–9	13	慎	shèn	act with care, be cautious
1766	手 64.10	1766	2840	3	3	13	搬	bān	transfer, move, remove, shift
1767	糸 120.4	1767	942	6	7–9	7	纽	niǔ	knot; button; handle, knob; tie
1768	糸 120.4	1768	939	6	7–9	7	纹	wén	line, streak, stripe; wrinkle
1769	玉 96.5	1769	1361	5	5	9	玻	bō	glass
1770	水 85.8	1770	2425	6	7–9	11	渔	yú	to fish; seize; pursue; surname
1771	石 112.10	1771	3093	6	7–9	14	磁	cí	magnetic; magnetism; porcelain
1772	金 167.6	1772	2306	6	6	11	铜	tóng	copper, brass, bronze
1773	齒 211.0	1773	1068	5	7–9	8	齿	chǐ	teeth; gears, cogs; age; simplified form of the KangXi radical number 211
1774	足 157.6	1774	2913	6	6	13	跨	kuà	straddle, bestride, ride; carry
1775	手 64.5	1775	965	5	5	8	押	yā	mortgage, pledge; deposit; to pawn; to arrest, detain, guard
1776	心 61.5	1776	1267	6	7–9	8	怖	bù	terror, fear; frighten; terrified
1777	水 85.11	1777	3006	5	5	13	漠	mò	desert; aloof, indifferent, cool
1778	疒 104.5	1778	2032	5	7–9	10	疲	pí	feel tired, be exhausted; weak
1779	又 29.7	1779	1644	6	7–9	9	叛	pàn	rebel; rebellion; rebellious
1780	辵 162.10	1780	2921	6	7–9	13	遣	qiǎn	send, dispatch; send off, exile
1781	艸 140.6	1781	1653	\N	7–9	9	兹	zī	now, here; this; time, year
1782	示 113.6	1782	2371	\N	7–9	11	祭	jì	sacrifice to, worship
1783	酉 164.8	1783	3224	5	5	15	醉	zuì	intoxicated, drunk; addicted to
1784	手 64.6	1784	2052	5	7–9	10	拳	quán	fist; various forms of boxing
1785	弓 57.5	1785	1313	6	7–9	8	弥	mí	extensive, full; fill; complete
1786	斗 68.7	1786	2347	5	5	11	斜	xié	slanting, sloping, inclined
1787	木 75.6	1787	1838	5	6	10	档	dàng	shelf; frame, crosspiece
1788	禾 115.7	1788	2678	6	7–9	12	稀	xī	rare, unusual, scarce; sparse
1789	手 64.8	1789	2167	6	7–9	11	捷	jié	win, victory, triumph
1790	肉 130.4	1790	1180	4	5	8	肤	fū	skin; superficial, shallow
1791	疒 104.4	1791	1627	6	7–9	9	疫	yì	epidemic, plague, pestilence
1792	肉 130.4	1792	1183	6	6	8	肿	zhǒng	swell; swollen; swelling
1793	豆 151.0	1793	696	5	4	7	豆	dòu	beans, peas; bean-shaped
1794	刀 18.7	1794	1475	6	7–9	9	削	xuē	scrape off, pare, trim
1795	山 46.4	1795	754	6	6	7	岗	gǎng	post; position
1796	日 72.6	1796	1893	6	7–9	10	晃	huǎng	bright, dazzling; to sway, shake
1797	口 30.4	1797	607	6	6	7	吞	tūn	swallow; absorb, annex, engulf
1798	宀 40.4	1798	879	6	6	7	宏	hóng	wide, spacious, great, vast
1799	疒 104.12	1799	3425	6	7–9	17	癌	ái	cancer; marmoset
1800	肉 130.3	1800	805	4	4	7	肚	dù	belly; abdomen; bowels
1801	隶 171.0	1801	1305	6	7–9	8	隶	lì	subservient; servant; KangXi radical 171
1802	尸 44.12	1802	3312	6	7–9	15	履	lǚ	footwear, shoes; walk on, tread
1803	水 85.7	1803	2086	5	5	10	涨	zhǎng	rise in price
1804	羽 124.14	1804	3476	6	6	20	耀	yào	shine, sparkle, dazzle; glory
1805	手 64.4	1805	653	6	6	7	扭	niǔ	turn, twist, wrench; seize, grasp
1806	土 32.4	1806	614	6	7–9	7	坛	tán	altar; arena, examination hall
1807	手 64.5	1807	991	6	6	8	拨	bō	move; dispel; distribute
1808	水 85.4	1808	862	6	7–9	7	沃	wò	water, irrigate; fertile, rich
1809	糸 120.6	1809	1757	6	6	9	绘	huì	draw, sketch, paint
1810	人 9.4	1810	463	6	7–9	6	伐	fá	cut down, subjugate, attack
1811	土 32.9	1811	2509	6	7–9	12	堪	kān	adequately capable of, worthy of
1812	人 9.2	1812	131	\N	7–9	4	仆	pū	fall forward; lie prostrate, prone; servant
1813	邑 163.8	1813	2022	\N	7–9	10	郭	guō	outer part (of a city); surname
1814	牛 93.6	1814	1939	6	6	10	牺	xī	sacrifice, give up; sacrificial
1815	歹 78.3	1815	706	\N	7–9	7	歼	jiān	annihilate, wipe out, kill off
1816	土 32.11	1816	2853	6	6	13	墓	mù	grave, tomb
1817	隹 172.4	1817	2789	6	7–9	12	雇	gù	employ, to hire
1818	广 53.10	1818	2992	6	7–9	13	廉	lián	upright, honorable, honest
1819	大 37.6	1819	1352	\N	7–9	9	契	qì	deed, contract, bond; engrave
1820	手 64.6	1820	1393	5	5	9	拼	pīn	join together, link, incorporate
1821	心 61.8	1821	2703	6	7–9	12	惩	chéng	punish, reprimand; warn
1822	手 64.7	1822	1795	6	6	10	捉	zhuō	grasp, clutch; catch, seize
1823	襾 146.12	1823	3440	6	7–9	18	覆	fù	cover; tip over; return; reply
1824	刀 18.6	1824	1310	3	4	8	刷	shuā	brush; clean with brush, scrub
1825	力 19.5	1825	660	6	7–9	7	劫	jié	take by force, coerce; disaster
1826	女 38.10	1826	3041	6	6	13	嫌	xián	hate, detest; suspect; criticize
1827	瓜 97.0	1827	279	2	4	5	瓜	guā	melon, gourd, cucumber; rad. 97
1828	欠 76.9	1828	2908	5	5	13	歇	xiē	rest, stop, lodge
1829	隹 172.8	1829	3365	6	7–9	16	雕	diāo	engrave, inlay, carve; exhaust; used for 鵰 an eagle, vulture
1830	門 169.4	1830	848	6	7–9	7	闷	mèn	gloomy, depressed, melancholy
1831	乙 5.7	1831	1175	6	6	8	乳	rǔ	breast, nipples; milk, suckle
1832	丨 2.6	1832	736	6	6	7	串	chuàn	string; relatives; conspire
1833	女 38.6	1833	1735	6	6	9	娃	wá	baby; doll; pretty girl
1834	糸 120.13	1834	3387	6	7–9	16	缴	jiǎo	deliver, submit; hand over
1835	口 30.7	1835	1911	6	7–9	10	唤	huàn	call
1836	亠 8.15	1836	3427	4	3	17	赢	yíng	win; surplus, gain, profit
1837	艸 140.8	1837	1823	\N	7–9	10	莲	lián	lotus, water lily; paradise
1838	雨 173.13	1838	3489	6	7–9	21	霸	bà	rule by might rather than right
1839	木 75.6	1839	1844	5	5	10	桃	táo	peach; marriage; surname
1840	女 38.4	1840	799	6	7–9	7	妥	tuǒ	satisfactory, appropriate
1841	疒 104.10	1841	3147	3	5	14	瘦	shòu	thin, emaciated, lean; meager
1842	手 64.10	1842	2511	6	6	12	搭	dā	join together, attach to; add to
1843	走 156.2	1843	1377	6	7–9	9	赴	fù	go to; attend, be present
1844	山 46.5	1844	1137	6	7–9	8	岳	yuè	mountain peak; surname
1845	口 30.11	1845	3056	5	6	14	嘉	jiā	excellent; joyful; auspicious
1846	舟 137.4	1846	1979	6	7–9	10	舱	cāng	hold of ship; cabin
1847	人 9.7	1847	1578	5	7–9	9	俊	jùn	talented, capable; handsome
1848	土 32.4	1848	623	4	4	7	址	zhǐ	site, location, land for house
1849	广 53.5	1849	1207	6	7–9	8	庞	páng	disorderly, messy; huge, big
1850	耒 127.4	1850	1766	6	7–9	10	耕	gēng	plow, cultivate
1851	金 167.7	1851	2666	6	7–9	12	锐	ruì	sharp, keen, acute, pointed
1852	糸 120.10	1852	3045	6	7–9	13	缝	fèng	sew, mend
1853	心 61.7	1853	2094	4	5	10	悔	huǐ	repent, show remorse, regret
1854	辵 162.13	1854	3362	4	5	16	邀	yāo	invite, welcome; meet, intercept
1855	玉 96.5	1855	1359	\N	\N	9	玲	líng	tinkling of jade
1856	心 61.8	1856	2444	\N	\N	11	惟	wéi	but, however, nevertheless; only
1857	斤 69.1	1857	278	6	7–9	5	斥	chì	to scold, upbraid, accuse, reproach
1858	宀 40.3	1858	547	6	6	6	宅	zhái	residence, dwelling, home; grave
1859	水 85.8	1859	2411	6	6	11	添	tiān	append, add to; increase
1860	手 64.6	1860	1394	6	6	9	挖	wā	dig, dig out, gouge out, scoop
1861	口 30.5	1861	1085	6	7–9	8	呵	ā	scold; laughing sound; yawn
1862	言 149.4	1862	557	6	7–9	6	讼	sòng	accuse; argue, dispute; litigate
1863	气 84.6	1863	1936	6	6	10	氧	yǎng	oxygen
1864	水 85.7	1864	2073	\N	7–9	10	浩	hào	great, numerous, vast, abundant
1865	羽 124.0	1865	585	4	5	6	羽	yǔ	feather, plume; wings; rad. 124
1866	斤 69.0	1866	137	3	2	4	斤	jīn	a catty (approximately 500 g); an axe; keen, shrewd; KangXi radical number 69
1867	酉 164.7	1867	3087	6	6	14	酷	kù	strong, stimulating; very
1868	手 64.8	1868	2182	6	7–9	11	掠	lüè	rob, ransack, plunder; pass by
1869	女 38.4	1869	920	\N	7–9	7	妖	yāo	strange, weird, supernatural
1870	示 113.7	1870	2465	6	7–9	11	祸	huò	misfortune, calamity, disaster
1871	人 9.6	1871	1136	\N	7–9	8	侍	shì	serve, attend upon; attendant, servant; samurai
1872	乙 5.0	1872	2	5	5	1	乙	yǐ	second; 2nd heavenly stem
1873	女 38.4	1873	922	5	7–9	7	妨	fáng	interfere with, impede, obstruct
1874	貝 154.4	1874	1176	6	7–9	8	贪	tān	be greedy, covet; covetous
1875	手 64.6	1875	1391	5	5	9	挣	zhēng	strive, endeavor, struggle
1876	水 85.4	1876	855	\N	7–9	7	汪	wāng	vast, extensive, deep; surname
1877	尸 44.4	1877	904	\N	7–9	7	尿	niào	urine; urinate
1878	艸 140.7	1878	1825	\N	\N	10	莉	lì	white jasmine
1879	心 61.7	1879	2264	6	6	11	悬	xuán	hang, suspend, hoist; be hung
1880	口 30.7	1880	1861	6	7–9	10	唇	chún	lips
1881	羽 124.10	1881	3328	\N	\N	16	翰	hàn	writing brush, pen, pencil
1882	人 9.2	1882	149	6	6	4	仓	cāng	granary; berth; sea
1883	車 159.2	1883	404	6	6	6	轨	guǐ	track, rut, path
1884	木 75.4	1884	1023	6	7–9	8	枚	méi	stalk of shrub, trunk of tree
1885	皿 108.5	1885	1790	4	4	10	盐	yán	salt
1886	見 147.5	1886	1472	5	5	9	览	lǎn	look at, inspect; perceive
1887	人 9.10	1887	2691	4	5	12	傅	fù	tutor, teacher; assist; surname
1888	巾 50.2	1888	233	4	4	5	帅	shuài	commander, commander-in-chief
1889	广 53.5	1889	1210	6	7–9	8	庙	miào	temple, shrine; imperial court
1890	艸 140.4	1890	668	\N	7–9	7	芬	fēn	fragrance, aroma; perfume
1891	尸 44.6	1891	1724	6	6	9	屏	píng	folding screen, shield
1892	寸 41.3	1892	355	6	6	6	寺	sì	court, office; temple, monastery
1893	肉 130.5	1893	1596	3	3	9	胖	pàng	fat, obese; fatty
1894	玉 96.11	1894	3051	5	5	14	璃	lí	glass
1895	心 61.9	1895	2905	6	7–9	13	愚	yú	stupid, doltish, foolish
1896	水 85.11	1896	3165	5	6	14	滴	dī	drip; drop of water
1897	疋 103.7	1897	2804	6	7–9	12	疏	shū	neglect; careless, lax
1898	艸 140.8	1898	2216	\N	7–9	11	萧	xiāo	common artemisia; dejected
1899	女 38.6	1899	1630	5	7–9	9	姿	zī	beauty, disposition, looks, appearance
1900	頁 181.13	1900	3465	6	7–9	19	颤	chàn	shiver, tremble; trembling
1901	一 1.3	1901	177	5	5	4	丑	chǒu	clown, comedian; 2nd terrestrial branch
1902	力 19.4	1902	416	5	7–9	6	劣	liè	bad, inferior; slightly
1903	木 75.5	1903	4141	\N	\N	9	柯	kē	axe-handle; stalk, bough; surname
1904	寸 41.0	1904	31	6	4	3	寸	cùn	inch; small, tiny; KangXi radical 41
1905	手 64.2	1905	203	4	5	5	扔	rēng	throw, hurl; throw away, cast
1906	目 109.2	1906	715	6	7–9	7	盯	dīng	rivet gaze upon, keep eyes on
1907	辰 161.3	1907	1860	6	7–9	10	辱	rǔ	humiliate, insult, abuse
1908	匸 23.2	1908	99	5	5	4	匹	pǐ	bolt of cloth; counter for horses
1909	人 9.8	1909	1962	5	5	10	俱	jù	all, together; accompany
1910	辛 160.9	1910	3371	6	7–9	16	辨	biàn	distinguish, discriminate
1911	食 184.7	1911	2012	3	1	10	饿	è	hungry; greedy for; hunger
1912	虫 142.7	1912	2925	5	7–9	13	蜂	fēng	bee, wasp, hornet
1913	口 30.7	1913	1908	6	7–9	10	哦	ó	oh? really? is that so?
1914	肉 130.8	1914	2715	6	7–9	12	腔	qiāng	chest cavity; hollow in body
1915	邑 163.6	1915	1043	6	7–9	8	郁	yù	sweet smelling, rich in aroma; (Cant.) to move, hit
1916	水 85.9	1916	2759	6	7–9	12	溃	kuì	flooding river; militarily defeat
1917	言 149.11	1917	3030	5	7–9	13	谨	jǐn	prudent, cautious; attentive
1918	米 119.11	1918	3428	5	5	17	糟	zāo	sediment, dregs; pickle
1919	艸 140.9	1919	2550	\N	\N	12	葛	gé	edible bean; surname
1920	艸 140.5	1920	1005	5	7–9	8	苗	miáo	sprouts; Miao nationality
1921	肉 130.3	1921	807	5	5	7	肠	cháng	intestines; emotions; sausage
1922	心 61.3	1922	910	6	7–9	7	忌	jì	jealous, envious; fear
1923	水 85.10	1923	3013	6	7–9	13	溜	liū	slide, glide, slip; slippery
1924	鳥 196.6	1924	2412	\N	\N	11	鸿	hóng	species of wild swan; vast
1925	爪 87.14	1925	3421	\N	7–9	17	爵	jué	feudal title or rank
1926	鳥 196.8	1926	2974	\N	7–9	13	鹏	péng	fabulous bird of enormous size
1927	鳥 196.13	1927	3447	\N	7–9	18	鹰	yīng	falcon; Accipiter species (various)
1928	竹 118.5	1928	2318	6	7–9	11	笼	lóng	cage; cage-like basket
1929	一 1.4	1929	268	6	7–9	5	丘	qiū	hill; elder; empty; a name
1930	木 75.6	1930	1835	\N	7–9	10	桂	guì	cassia or cinnamon
1931	水 85.10	1931	2767	6	7–9	12	滋	zī	grow, multiply, increase; thrive
1932	耳 128.5	1932	2196	3	4	11	聊	liáo	somewhat, slightly, at least
1933	手 64.6	1933	1379	5	5	9	挡	dǎng	obstruct, impede; stop; resist
1934	糸 120.4	1934	933	5	5	7	纲	gāng	heavy rope, hawser; main points
1935	肉 130.2	1935	495	5	5	6	肌	jī	muscle tissue; meat on bones
1936	艸 140.6	1936	4128	\N	\N	9	茨	cí	thatching; caltrop, Tribulus terrestris
1937	士 33.4	1937	650	6	7–9	7	壳	ké	casing, shell, husk
1938	疒 104.6	1938	2383	6	7–9	11	痕	hén	scar; mark; trace
1939	石 112.8	1939	2881	3	2	13	碗	wǎn	bowl, small dish
1940	穴 116.0	1940	313	6	7–9	5	穴	xué	cave, den, hole; KangXi radical 116
1941	肉 130.10	1941	3134	5	7–9	14	膀	bǎng	upper arm; shoulder; wing
1942	十 24.6	1942	1070	6	7–9	8	卓	zhuō	profound, brilliant, lofty
1943	貝 154.4	1943	1074	6	7–9	8	贤	xián	virtuous, worthy, good; able
1944	臣 131.2	1944	1037	5	5	8	卧	wò	lie down; crouch
1945	肉 130.11	1945	3132	6	6	14	膜	mó	membrane; to kneel and worship
1946	殳 79.11	1946	3286	6	7–9	15	毅	yì	resolute, decisive, firm, persist
1947	金 167.8	1947	2942	6	7–9	13	锦	jǐn	brocade, tapestry; embroidered
1948	欠 76.0	1948	153	5	5	4	欠	qiàn	owe, lack, be deficient; KangXi radical number 76
1949	口 30.7	1949	1905	\N	\N	10	哩	lī	mile
1950	凵 17.6	1950	1322	\N	7–9	8	函	hán	correspondence; a case; a box
1951	艸 140.6	1951	1413	6	7–9	9	茫	máng	vast, boundless, widespread
1952	日 72.4	1952	1090	6	7–9	8	昂	áng	rise, raise; proud, bold; upright
1953	艸 140.13	1953	3322	\N	\N	16	薛	xuē	kind of marsh grass; feudal state
1954	皮 107.5	1954	2011	6	7–9	10	皱	zhòu	wrinkles, creases, folds
1955	大 37.3	1955	395	5	7–9	6	夸	kuā	extravagant, luxurious; handsome
1956	豕 152.9	1956	3313	5	5	15	豫	yù	relaxed, comfortable, at ease
1957	肉 130.5	1957	1494	5	5	9	胃	wèi	stomach; gizzard of fowl
1958	舌 135.0	1958	449	6	6	6	舌	shé	tongue; clapper of bell; KangXi radical 135
1959	刀 18.8	1959	2129	6	7–9	10	剥	bō	peel
1960	人 9.11	1960	2690	4	6	12	傲	ào	proud, haughty, overbearing
1961	手 64.6	1961	1386	4	5	9	拾	shí	pick up, collect, tidy up; accounting form of the numeral ten
1962	穴 116.7	1962	2784	6	7–9	12	窝	wō	nest; cave, den; hiding place
1963	目 109.6	1963	2261	5	7–9	11	睁	zhēng	open eyes; stare
1964	手 64.10	1964	2839	6	7–9	13	携	xié	lead by hand, take with; carry
1965	阜 170.8	1965	2135	6	7–9	10	陵	líng	hill, mound; mausoleum
1966	口 30.7	1966	1913	6	7–9	10	哼	hēng	hum; sing softly; groan, moan; (Cant.) an interjecting indicating disapproval
1967	木 75.8	1967	2574	6	6	12	棉	mián	cotton; cotton padded
1968	日 72.8	1968	2611	2	2	12	晴	qíng	clear weather, fine weather
1969	金 167.5	1969	1933	5	5	10	铃	líng	bell
1970	土 32.10	1970	2834	4	4	13	填	tián	fill in, fill up; make good
1971	食 184.5	1971	1203	6	7–9	8	饲	sì	raise animals; feed; nourish
1972	水 85.9	1972	2758	3	1	12	渴	kě	thirsty, parched; yearn, pine
1973	口 30.4	1973	743	5	7–9	7	吻	wěn	kiss; the lips; coinciding
1974	手 64.4	1974	636	4	5	7	扮	bàn	dress up; dress up as
1975	辵 162.6	1975	1652	6	7–9	9	逆	nì	disobey, rebel; rebel, traitor
1976	肉 130.6	1976	1994	5	5	10	脆	cuì	crisp; fragile, frail; brittle
1977	口 30.9	1977	2642	6	7–9	12	喘	chuǎn	pant, gasp, breathe heavily
1978	网 122.8	1978	2933	6	7–9	13	罩	zhào	basket for catching fish; cover
1979	卜 25.0	1979	8	\N	7–9	2	卜	bo	fortune telling; prophesy
1980	火 86.4	1980	1238	6	6	8	炉	lú	fireplace, stove, oven, furnace
1981	木 75.5	1981	1880	5	5	10	柴	chái	firewood, faggots, fuel
1982	心 61.9	1982	2777	4	6	12	愉	yú	pleasant, delightful; please
1983	糸 120.8	1983	2491	5	7–9	11	绳	shéng	rope, string, cord; control
1984	肉 130.5	1984	1598	6	7–9	9	胎	tāi	unborn child, embryo, fetus
1985	艸 140.10	1985	2856	6	7–9	13	蓄	xù	store, save, hoard, gather
1986	目 109.5	1986	1888	5	5	10	眠	mián	close eyes, sleep; hibernate
1987	立 117.9	1987	3150	6	7–9	14	竭	jié	put forth great effort; exhaust
1988	口 30.9	1988	2641	1	2	12	喂	wèi	interjection to call attention
1989	人 9.11	1989	2960	5	5	13	傻	shǎ	foolish, silly, stupid; an imbecile
1990	心 61.11	1990	3066	4	7–9	14	慕	mù	long for, desire; admire
1991	水 85.6	1991	1681	6	7–9	9	浑	hún	muddy, turbid; blend, merge, mix
1992	女 38.3	1992	577	\N	7–9	6	奸	jiān	crafty, villainous, false
1993	戶 63.6	1993	2113	5	5	10	扇	shàn	fan; door panel
1994	木 75.5	1994	1022	5	5	8	柜	guì	cabinet, cupboard; shop counter
1995	心 61.7	1995	2096	6	7–9	10	悦	yuè	pleased, contented, gratified
1996	手 64.5	1996	982	5	7–9	8	拦	lán	obstruct, impede, bar, hinder
1997	言 149.8	1997	1297	6	6	8	诞	dàn	bear children, give birth; birth
1998	食 184.5	1998	1202	3	2	8	饱	bǎo	to eat till full; satisfied
1999	乙 5.10	1999	2215	\N	\N	11	乾	gān	dry; first hexagram; warming principle of the sun, penetrating and fertilizing, heavenly generative principle (male)
2000	水 85.5	2000	1251	6	6	8	泡	pào	bubbles, suds; blister; soak
2001	貝 154.6	2001	1924	6	7–9	10	贼	zéi	thief, traitor; kill
2002	亠 8.7	2002	1620	6	7–9	9	亭	tíng	pavilion; erect
2003	夕 36.0	2003	46	5	5	3	夕	xī	evening, night, dusk; slanted
2004	父 88.6	2004	1985	\N	7–9	10	爹	diē	father, daddy
2005	酉 164.6	2005	2874	6	7–9	13	酬	chóu	toast; reward, recompense
2006	人 9.14	2006	3361	6	7–9	16	儒	rú	Confucian scholar
2007	女 38.6	2007	1738	5	7–9	9	姻	yīn	relatives by marriage
2008	卩 26.5	2008	818	\N	7–9	7	卵	luǎn	egg; ovum; roe; spawn
2009	气 84.4	2009	1124	5	6	8	氛	fēn	gas, vapor, air
2010	水 85.5	2010	1242	6	7–9	8	泄	xiè	leak; vent; flow; reveal
2011	木 75.3	2011	678	6	6	7	杆	gān	pole; shaft of spear
2012	手 64.7	2012	1815	6	6	10	挨	āi	near, close by, next to, towards, against; to wait; to lean on
2013	人 9.12	2013	3127	\N	7–9	14	僧	sēng	Buddhist priest, monk; san of Sanskrit sangha
2014	虫 142.8	2014	3175	5	7–9	14	蜜	mì	honey; sweet; nectar
2015	口 30.4	2015	740	6	\N	7	吟	yín	sing, hum; recite; type of poetry
2016	犬 94.9	2016	2718	\N	7–9	12	猩	xīng	species of orangutan
2017	辵 162.9	2017	2746	\N	7–9	12	遂	suì	comply with, follow along; thereupon
2018	犬 94.6	2018	1600	6	7–9	9	狭	xiá	narrow, limited; narrow-minded
2019	肉 130.3	2019	713	6	7–9	7	肖	xiào	look like, resemble, be like
2020	甘 99.6	2020	2311	3	3	11	甜	tián	sweet, sweetness
2021	雨 173.9	2021	3400	6	7–9	17	霞	xiá	rosy clouds
2022	馬 187.4	2022	935	6	7–9	7	驳	bó	varicolored, variegated; mixed
2023	衣 145.7	2023	2790	6	7–9	12	裕	yù	abundant, rich, plentiful
2024	頁 181.4	2024	1778	6	6	10	顽	wán	obstinate, stubborn; recalcitrant
2025	方 70.4	2025	6716	\N	\N	8	於	yú	in, at, on; interjection alas!
2026	手 64.11	2026	3062	5	5	14	摘	zhāi	pluck, pick; select; specify
2027	矢 111.8	2027	2946	3	4	13	矮	ǎi	short, dwarf; low
2028	禾 115.4	2028	1547	4	5	9	秒	miǎo	beard of grain or corn; a second
2029	卩 26.9	2029	2006	\N	\N	10	卿	qīng	noble, high officer
2030	田 102.5	2030	2047	6	7–9	10	畜	chù	livestock, domestic animals
2031	口 30.6	2031	1504	6	7–9	9	咽	yàn	throat; pharynx
2032	手 64.5	2032	990	5	5	8	披	pī	wear; split; crack
2033	車 159.7	2033	2250	5	5	11	辅	fǔ	cheek bone; protective; assist
2034	勹 20.2	2034	158	6	7–9	4	勾	gōu	hook, join, connect; entice
2035	皿 108.4	2035	1590	5	5	9	盆	pén	basin, tub, pot, bowl
2036	田 102.14	2036	3472	6	7–9	19	疆	jiāng	boundary, border, frontier
2037	貝 154.8	2037	2651	6	6	12	赌	dǔ	bet, gamble, wager; compete
2038	土 32.10	2038	3001	4	4	13	塑	sù	model in clay, sculpt; plastics
2039	田 102.4	2039	1492	6	7–9	9	畏	wèi	fear, dread, awe, reverence
2040	口 30.4	2040	735	5	3	7	吵	chǎo	argue, dispute; disturb, annoy
2041	口 30.19	2041	3496	\N	7–9	22	囊	náng	bag, purse, sack; put in bag
2042	口 30.10	2042	5467	5	\N	13	嗯	ń	final particle
2043	水 85.5	2043	1249	6	7–9	8	泊	pō	anchor vessel; lie at anchor
2044	肉 130.4	2044	1181	6	6	8	肺	fèi	lungs
2045	馬 187.14	2045	3436	5	7–9	17	骤	zhòu	procedure; gallop; sudden(ly)
2046	糸 120.10	2046	3046	6	7–9	13	缠	chán	wrap, wind around; tie, bind
2047	冂 13.2	2047	115	\N	7–9	4	冈	gāng	ridge or crest of hill
2048	羊 123.5	2048	2049	4	7–9	10	羞	xiū	disgrace, shame; ashamed; shy
2049	目 109.12	2049	3406	6	7–9	17	瞪	dèng	stare at
2050	口 30.3	2050	428	6	6	6	吊	diào	condole, mourn, pity; hang
2051	貝 154.6	2051	1856	\N	7–9	10	贾	jiǎ	surname; merchant; buy, trade
2052	水 85.11	2052	3168	5	5	14	漏	lòu	leak, drip; funnel; hour glass
2055	心 61.7	2055	2326	5	7–9	11	悠	yōu	long, far, remote, distant; liesurely
2056	鹿 198.0	2056	2387	\N	7–9	11	鹿	lù	deer; surname; KangXi radical 198
2057	人 9.7	2057	1569	6	7–9	9	俘	fú	prisoner of war; take as prisoner
2058	金 167.8	2058	2938	\N	7–9	13	锡	xī	tin, stannum; bestow, confer
2059	十 24.6	2059	1154	6	7–9	8	卑	bēi	humble, low, inferior; despise
2060	艸 140.9	2060	2548	6	7–9	12	葬	zàng	bury, inter
2061	金 167.6	2061	2307	6	7–9	11	铭	míng	inscribe, engrave
2062	水 85.10	2062	3022	5	7–9	13	滩	tān	bank, a sandbar, shoal; rapids
2063	女 38.10	2063	3042	5	7–9	13	嫁	jià	to marry, give a daughter in marriage
2064	人 9.11	2064	2959	5	7–9	13	催	cuī	press, urge
2065	玉 96.11	2065	5857	\N	\N	15	璇	xuán	beautiful jade; star
2066	羽 124.4	2066	1859	5	7–9	10	翅	chì	wings; fin
2067	皿 108.6	2067	2348	4	5	11	盒	hé	small box or case; casket
2068	虫 142.6	2068	2727	6	7–9	12	蛮	mán	barbarians; barbarous, savage
2069	矢 111.2	2069	927	\N	7–9	7	矣	yǐ	particle of completed action
2070	水 85.12	2070	3296	\N	7–9	15	潘	pān	surname; water in which rice has been rinsed; a river that flows into the Han
2071	止 77.4	2071	1066	6	7–9	8	歧	qí	fork of road; branching off
2072	貝 154.8	2072	2653	\N	7–9	12	赐	cì	give, bestow favors; appoint
2073	魚 195.5	2073	2977	\N	\N	13	鲍	bào	abalone; dried fish; surname
2074	金 167.7	2074	2662	5	5	12	锅	guō	cooking-pot, saucepan
2075	广 53.9	2075	2384	6	7–9	11	廊	láng	corridor, porch, veranda
2076	手 64.5	2076	972	5	5	8	拆	chāi	to break up, split apart, rip open; to destroy
2077	水 85.18	2077	3486	6	7–9	20	灌	guàn	pour; water; irrigate, flood
2078	力 19.7	2078	1599	6	7–9	9	勉	miǎn	endeavor, make effort; urge
2079	目 109.3	2079	1222	6	6	8	盲	máng	blind; unperceptive, shortsighted
2080	宀 40.7	2080	2106	6	7–9	10	宰	zǎi	to slaughter; to rule
2081	人 9.5	2081	772	\N	7–9	7	佐	zuǒ	assist, aid, second; subordinate
2082	口 30.8	2082	2290	6	\N	11	啥	shà	what?
2083	肉 130.4	2083	1184	6	7–9	8	胀	zhàng	swell, inflate, expand
2084	手 64.4	2084	624	6	7–9	7	扯	chě	rip up, tear down; raise; haul
2085	示 113.12	2085	6186	\N	\N	16	禧	xǐ	happiness; congratulations
2086	辵 162.2	2086	331	6	7–9	5	辽	liáo	distant, far
2087	手 64.5	2087	953	6	7–9	8	抹	mǒ	smear, apply, wipe off, erase
2088	竹 118.6	2088	2685	6	7–9	12	筒	tǒng	thick piece of bamboo; pipe
2089	木 75.8	2089	2564	5	7–9	12	棋	qí	chess; any game similar to chess
2090	衣 145.7	2090	2791	3	3	12	裤	kù	trousers, pants
2091	口 30.7	2091	1916	5	7–9	10	唉	āi	alas, exclamation of surprise or pain
2092	木 75.2	2092	376	6	7–9	6	朴	pǔ	simple, unadorned; sincere; surname; a tree
2093	口 30.5	2093	1098	6	7–9	8	咐	fù	instruct, order
2094	子 39.2	2094	338	5	7–9	5	孕	yùn	be pregnant, pregnancy
2095	言 149.7	2095	3060	6	7–9	14	誓	shì	swear, pledge; oath
2096	口 30.9	2096	2643	6	7–9	12	喉	hóu	throat, gullet, larynx; guttural
2097	女 38.3	2097	526	6	7–9	6	妄	wàng	absurd, foolish, reckless; false
2098	手 64.5	2098	976	6	7–9	8	拘	jū	restrain, seize, detain
2099	金 167.7	2099	2658	5	7–9	12	链	liàn	chain, wire, cable; chain, shack
2100	馬 187.3	2100	596	6	7–9	6	驰	chí	go quickly or swiftly; hurry
2101	木 75.5	2101	1437	6	6	9	栏	lán	railing, balustrade; animal pan
2102	辵 162.7	2102	1803	6	7–9	10	逝	shì	pass away; die
2103	穴 116.4	2103	1702	6	7–9	9	窃	qiè	secretly, stealthily; steal; thief
2104	色 139.4	2104	1770	5	5	10	艳	yàn	beautiful, sexy, voluptuous
2105	自 132.4	2105	1970	5	5	10	臭	chòu	smell, stink, emit foul odor
2106	糸 120.3	2106	591	6	7–9	6	纤	xiān	fine, delicate; minute; graceful
2107	玉 96.2	2107	3566	\N	\N	6	玑	jī	pearl that is not quite round
2108	木 75.8	2108	2571	4	4	12	棵	kē	numerary adjunct for trees
2109	走 156.5	2109	2515	5	7–9	12	趁	chèn	take advantage of, avail oneself
2110	匚 22.4	2110	394	\N	7–9	6	匠	jiàng	craftsman, artisan; workman
2111	皿 108.4	2111	1745	6	7–9	9	盈	yíng	fill; full, overflowing; surplus
2112	羽 124.4	2112	1992	\N	7–9	10	翁	wēng	old man; father, father-in-law
2113	心 61.9	2113	2951	5	5	13	愁	chóu	anxiety; to worry about, be anxious
2114	目 109.12	2114	3403	6	7–9	17	瞬	shùn	wink, blink; in a wink, a flash
2115	女 38.8	2115	2301	6	7–9	11	婴	yīng	baby, infant; bother
2116	子 39.4	2116	638	5	7–9	7	孝	xiào	filial piety, obedience; mourning
2117	頁 181.5	2117	2485	6	7–9	11	颈	jǐng	neck, throat
2118	人 9.8	2118	1961	6	7–9	10	倘	tǎng	if, supposing, in event of
2119	水 85.7	2119	2066	\N	7–9	10	浙	zhè	Zhejiang province; river
2120	言 149.8	2120	2125	4	6	10	谅	liàng	excuse, forgive; guess, presume
2121	艸 140.12	2121	3073	6	7–9	14	蔽	bì	cover, hide, conceal; shelter
2122	日 72.4	2122	1086	6	6	8	畅	chàng	smoothly, freely, unrestrained
2123	貝 154.12	2123	3351	6	5	16	赠	zèng	give present; bestow, confer
2124	女 38.5	2124	1328	\N	\N	8	妮	nī	maid, servant girl; cute girl
2125	艸 140.7	2125	4442	\N	\N	10	莎	shā	kind of sedge grass, used anciently for raincoats
2126	寸 41.8	2126	2471	\N	\N	11	尉	wèi	officer, military rank
2127	冫 15.5	2127	827	5	5	7	冻	dòng	freeze; cold, congeal; jelly
2128	足 157.6	2128	2917	6	6	13	跪	guì	kneel
2129	門 169.3	2129	529	5	5	6	闯	chuǎng	rush in, burst in, charge in
2130	艸 140.9	2130	2552	4	5	12	葡	pú	grapes
2131	彳 60.6	2131	\N	\N	\N	9	後	hòu	behind, rear, after; descendents
2132	厂 27.10	2132	2587	4	5	12	厨	chú	kitchen; closet; cupboard
2133	鳥 196.5	2133	1892	4	5	10	鸭	yā	duck; Anas species (various)
2134	頁 181.10	2134	3327	6	7–9	16	颠	diān	top, peak, summit; upset
2135	辵 162.11	2135	3143	6	7–9	14	遮	zhē	cover, shield, protect
2136	言 149.8	2136	2128	4	5	10	谊	yì	friendship; appropriate, suitable
2137	土 32.3	2137	3573	\N	\N	6	圳	zhèn	furrow in field, small drainage ditch
2138	口 30.3	2138	420	6	7–9	6	吁	xū	sh, hush; implore
2139	人 9.2	2139	143	\N	\N	4	仑	lún	logical reasons, logical order
2140	辛 160.6	2140	3037	6	7–9	13	辟	pì	law, rule; open up, develop
2141	疒 104.10	2141	3282	6	7–9	15	瘤	liú	tumor, lump, goiter
2142	女 38.10	2142	2810	6	7–9	12	嫂	sǎo	older brother's wife, sister-in-law
2143	阜 170.5	2143	3803	\N	\N	7	陀	tuó	steep bank, rough terrain
2144	木 75.6	2144	1833	6	7–9	10	框	kuāng	frame; framework; door frame
2145	言 149.12	2145	3177	\N	\N	14	谭	tán	surname
2146	亠 8.5	2146	3755	\N	\N	7	亨	hēng	smoothly, progressing, no trouble
2147	金 167.4	2147	1532	6	7–9	9	钦	qīn	respect, admire; respectful
2148	广 53.8	2148	2386	6	7–9	11	庸	yōng	usual, common, ordinary, mediocre
2149	欠 76.10	2149	3155	4	6	14	歉	qiàn	deficient, lacking, insufficient
2150	艸 140.4	2150	374	\N	7–9	6	芝	zhī	Zoysia pungens
2151	口 30.4	2151	749	6	7–9	7	吼	hǒu	roar, shout; bark, howl
2152	用 101.2	2152	691	\N	\N	7	甫	fǔ	begin; man, father; great; a distance of ten li
2153	衣 145.3	2153	1293	3	3	8	衫	shān	shirt; robe; gown; jacket
2154	手 64.10	2154	2844	6	7–9	13	摊	tān	spread out, open; apportion
2155	宀 40.7	2155	2101	5	6	10	宴	yàn	to entertain, feast; a feast, banquet
2156	口 30.12	2156	3253	6	7–9	15	嘱	zhǔ	order, tell, instruct, leave word
2157	衣 145.4	2157	2020	6	7–9	10	衷	zhōng	inner feelings
2158	女 38.6	2158	1739	6	7–9	9	娇	jiāo	seductive and loveable; tender
2159	阜 170.6	2159	1320	\N	\N	8	陕	shǎn	mountain pass; Shanxi province
2160	矢 111.5	2160	1540	5	7–9	9	矩	jǔ	carpenter's square; rule, regulation
2161	水 85.7	2161	2068	\N	7–9	10	浦	pǔ	bank of river, shore; surname
2162	言 149.4	2162	553	6	7–9	6	讶	yà	express surprise, be surprised
2163	耳 128.4	2163	1984	6	7–9	10	耸	sǒng	urge on; rise up; stir, excite
2164	衣 145.8	2164	3032	\N	7–9	13	裸	luǒ	bare, nude; undress, strip
2165	石 112.9	2165	3050	\N	7–9	14	碧	bì	jade; green, blue
2166	手 64.11	2166	3057	6	7–9	14	摧	cuī	destroy, break, injure
2167	艸 140.13	2167	3325	6	6	16	薪	xīn	fuel, firewood; salary
2168	水 85.8	2168	2413	6	7–9	11	淋	lín	drip, soak, drench; perfectly
2169	耳 128.4	2169	1816	6	7–9	10	耻	chǐ	shame, humiliation; ashamed
2170	肉 130.6	2170	2000	5	5	10	胶	jiāo	glue, gum, resin, rubber; sound; shin bone
2171	尸 44.9	2171	2472	\N	7–9	11	屠	tú	butcher, slaughter, massacre
2172	鳥 196.7	2172	2674	\N	7–9	12	鹅	é	goose
2173	食 184.2	2173	299	6	7–9	5	饥	jī	hunger, starving; hungry; a famine
2174	目 109.4	2174	1480	5	6	9	盼	pàn	look, gaze; expect, hope for
2175	肉 130.7	2175	2356	5	7–9	11	脖	bó	neck
2176	虫 142.3	2176	1497	5	7–9	9	虹	hóng	rainbow
2177	羽 124.8	2177	3184	\N	7–9	14	翠	cuì	color green; kingfisher
2178	山 46.8	2178	2298	6	7–9	11	崩	bēng	rupture, split apart, collapse
2179	貝 154.4	2179	1114	5	6	8	账	zhàng	accounts; bill, debt; credit
2180	艸 140.8	2180	2211	\N	7–9	11	萍	píng	duckweed; wandering, traveling
2181	辵 162.7	2181	2007	6	7–9	10	逢	féng	come upon, happen meet; flatter
2182	貝 154.10	2182	3112	4	6	14	赚	zhuàn	make money, earn; gain, profit
2183	手 64.12	2183	3196	6	6	15	撑	chēng	prop up, support; brace
2184	羽 124.6	2184	2739	6	7–9	12	翔	xiáng	soar, glide, hover; detailed
2185	人 9.8	2185	1963	5	5	10	倡	chàng	guide, leader; lead, introduce
2186	糸 120.8	2186	2493	\N	7–9	11	绵	mián	cotton wad; wool; soft, downy
2187	犬 94.9	2187	2721	5	5	12	猴	hóu	monkey, ape; monkey-like
2188	木 75.5	2188	1427	6	7–9	9	枯	kū	dried out, withered, decayed
2189	工 48.4	2189	686	\N	7–9	7	巫	wū	wizard, sorcerer, witch, shaman
2190	日 72.5	2190	1491	\N	\N	9	昭	zhāo	bright, luminous; illustrious
2191	心 61.5	2191	1265	\N	\N	8	怔	zhēng	a disease resembling neurosis
2192	水 85.8	2192	2423	\N	7–9	11	渊	yuān	surge up, bubble up, gush forth
2193	冫 15.9	2193	2374	6	7–9	11	凑	còu	piece together, assemble
2194	水 85.10	2194	3012	6	7–9	13	溪	xī	mountain stream, creek
2195	虫 142.15	2195	3488	6	7–9	21	蠢	chǔn	wriggle; stupid; silly; fat
2196	示 113.8	2196	2793	\N	7–9	12	禅	chán	dhyana (Sanskrit); Zen; meditation (Buddhism)
2197	門 169.8	2197	2397	6	7–9	11	阐	chǎn	explain, clarify, elucidate
2198	日 72.4	2198	1076	6	6	8	旺	wàng	prosper; prosperous; increase
2199	宀 40.9	2199	2782	5	7–9	12	寓	yù	residence; lodge; dwell
2200	艸 140.15	2200	3439	\N	7–9	18	藤	téng	rattan, cane; creeper plant
2201	匚 22.8	2201	1780	\N	7–9	10	匪	fěi	bandits, robbers, gangsters
2202	人 9.4	2202	493	3	4	6	伞	sǎn	umbrella, parasol, parachute
2203	石 112.8	2203	2878	6	7–9	13	碑	bēi	stone tablet; gravestone
2204	手 64.7	2204	1397	6	7–9	9	挪	nuó	move, shift on one side
2205	玉 96.8	2205	2504	\N	\N	12	琼	qióng	jade; rare, precious; elegant; (Cant.) to coagulate
2206	肉 130.6	2206	1995	6	7–9	10	脂	zhī	fat, grease, lard; grease
2207	言 149.9	2207	2461	6	7–9	11	谎	huǎng	lie
2208	心 61.9	2208	2778	6	7–9	12	慨	kǎi	sigh, regret; generous
2209	艸 140.8	2209	2210	\N	7–9	11	菩	pú	herb, aromatic plant
2210	艸 140.8	2210	2208	4	5	11	萄	táo	grapes
2211	犬 94.6	2211	1601	5	7–9	9	狮	shī	lion
2212	手 64.8	2212	2190	6	7–9	11	掘	jué	dig, excavate; excavate cave
2213	手 64.4	2213	626	5	4	7	抄	chāo	copy, confiscate, seize
2214	山 46.5	2214	1111	\N	7–9	8	岭	lǐng	mountain ridge, mountain peak
2215	日 72.6	2215	1897	5	6	10	晕	yūn	halo in sky; fog; dizzy, faint
2216	辵 162.8	2216	2469	6	7–9	11	逮	dǎi	seize, catch; reach, arrive
2217	石 112.4	2217	1454	5	7–9	9	砍	kǎn	hack, chop, cut, fell
2218	手 64.8	2218	2180	6	6	11	掏	tāo	take out; pull out; clean out
2219	犬 94.4	2219	3746	\N	\N	7	狄	dí	tribe from northern china; surnam
2220	日 72.8	2220	2615	6	7–9	12	晰	xī	clear, evident; clearly
2221	网 122.3	2221	895	6	7–9	7	罕	hǎn	rare, scarce; surname
2222	手 64.7	2222	1807	6	7–9	10	挽	wǎn	pull; pull back, draw back
2223	肉 130.8	2223	2713	4	5	12	脾	pí	spleen, pancreas; disposition
2224	舟 137.0	2224	484	6	7–9	6	舟	zhōu	boat, ship; KangXi radical 137
2225	疒 104.8	2225	2990	\N	7–9	13	痴	chī	foolish, stupid, dumb, silly
2226	艸 140.11	2226	3071	\N	\N	14	蔡	cài	surname; species of tortoise
2227	刀 18.9	2227	2406	5	5	11	剪	jiǎn	scissors; cut, divide, separate
2228	肉 130.6	2228	2033	\N	7–9	10	脊	jí	spine, backbone; ridge
2229	弓 57.0	2229	63	\N	7–9	3	弓	gōng	bow; curved, arched; KangXi radical number 57
2230	心 61.13	2230	3380	4	6	16	懒	lǎn	lazy, languid, listless
2231	又 29.1	2231	71	5	5	3	叉	chā	crotch; fork, prong
2232	手 64.5	2232	967	5	6	8	拐	guǎi	kidnap, abduct; turn
2233	口 30.9	2233	5130	\N	\N	12	喃	nán	keep talking, chattering; mumble
2234	人 9.12	2234	3126	\N	7–9	14	僚	liáo	companion, colleague; officials; bureaucracy; a pretty face
2235	手 64.7	2235	1797	5	6	10	捐	juān	contribute; give up, renounce
2236	女 38.5	2236	921	\N	\N	7	姊	zǐ	elder sister
2237	馬 187.9	2237	2823	6	7–9	12	骚	sāo	harass, bother, annoy, disturb
2238	手 64.5	2238	957	6	7–9	8	拓	tà	expand; open up; support or push
2239	止 77.5	2239	1445	5	7–9	9	歪	wāi	slant; inclined; askewd, awry
2240	米 119.5	2240	2402	5	7–9	11	粘	zhān	viscous, mucous; glutinous
2241	木 75.5	2241	1428	\N	7–9	9	柄	bǐng	handle, lever, knob; authority
2242	土 32.4	2242	645	6	7–9	7	坑	kēng	pit, hole; bury, trap; harry
2243	阜 170.6	2243	1318	5	7–9	8	陌	mò	foot path between rice fields
2244	穴 116.5	2244	2104	5	7–9	10	窄	zhǎi	narrow, tight; narrow-minded
2245	水 85.9	2245	2752	\N	\N	12	湘	xiāng	Hunan province
2246	儿 10.4	2246	489	6	7–9	6	兆	zhào	omen; million; mega; also trillion. China = million; Japan and Taiwan = trillion
2247	山 46.8	2247	2292	6	7–9	11	崖	yá	cliff, precipice; precipitous
2248	馬 187.6	2248	1756	4	6	9	骄	jiāo	spirited horse; haughty
2249	刀 18.6	2249	1167	6	7–9	8	刹	shā	temple, shrine, monastary
2250	革 177.9	2250	3438	5	7–9	18	鞭	biān	whip; whip; string of firecrackers
2251	艸 140.3	2251	372	6	7–9	6	芒	máng	Miscanthus sinensis
2252	竹 118.6	2252	2688	6	7–9	12	筋	jīn	muscles; tendons
2253	耳 128.7	2253	2845	4	6	13	聘	pìn	engage, employ; betroth
2254	金 167.5	2254	1534	6	7–9	9	钩	gōu	hook, barb; sickle; stroke with
2255	木 75.8	2255	2572	6	7–9	12	棍	gùn	stick, cudgel; scoundrel
2256	口 30.17	2256	3480	6	7–9	20	嚷	rǎng	shout, brawl, make uproar, cry
2257	肉 130.9	2257	2973	\N	7–9	13	腺	xiàn	gland
2258	弓 57.5	2258	1314	6	7–9	8	弦	xián	string; hypotenuse, crescent
2259	火 86.8	2259	2748	6	7–9	12	焰	yàn	flame, blaze; glowing, blazing
2260	而 126.3	2260	1457	6	7–9	9	耍	shuǎ	frolic, play, amuse, play with
2261	人 9.8	2261	1966	6	7–9	10	俯	fǔ	bow down, face down, look down
2262	厂 27.7	2262	1448	5	4	9	厘	lí	thousandth part of tael
2263	心 61.9	2263	2774	6	7–9	12	愣	lèng	be in a daze
2264	厂 27.10	2264	2588	5	7–9	12	厦	shà	big building, mansion
2265	心 61.6	2265	2130	5	7–9	10	恳	kěn	sincere, earnest, cordial
2266	食 184.6	2266	1611	6	7–9	9	饶	ráo	bountiful, abundant, plentiful
2267	金 167.2	2267	758	6	7–9	7	钉	dīng	nail, spike; pursue closely
2268	宀 40.11	2268	3173	\N	7–9	14	寡	guǎ	widowed; alone, friendless
2269	心 61.13	2269	3381	5	6	16	憾	hàn	to regret, remorse; dissatisfied
2270	手 64.11	2270	3063	5	5	14	摔	shuāi	fall ground, stumble, trip
2271	又 29.11	2271	3043	6	7–9	13	叠	dié	pile; be piled up; fold up
2272	心 61.9	2272	2547	6	7–9	12	惹	rě	irritate, vex, offend, incite
2273	口 30.9	2273	2644	6	7–9	12	喻	yù	metaphor, analogy; example; like
2274	言 149.12	2274	3181	6	7–9	14	谱	pǔ	list, table; musical score
2275	心 61.10	2275	2776	5	7–9	12	愧	kuì	ashamed, conscience-stricken
2276	火 86.9	2276	3004	6	7–9	13	煌	huáng	bright, shining, luminous
2277	彳 60.14	2277	3420	\N	7–9	17	徽	huī	a badge, insignia
2278	水 85.10	2278	3019	6	7–9	13	溶	róng	to melt, dissolve; overflowing with
2279	土 32.4	2279	917	6	7–9	7	坠	zhuì	fall down, drop, sink, go to ruin
2280	火 86.9	2280	2982	\N	\N	13	煞	shā	malignant deity; baleful, noxious; strike dead
2281	巾 50.0	2281	40	4	4	3	巾	jīn	kerchief; towel; turban; KangXi radical number 50
2282	水 85.10	2282	3010	6	7–9	13	滥	làn	flood, overflow; excessive
2283	水 85.6	2283	1665	5	5	9	洒	sǎ	sprinkle; scatter; pour; to wipe away; to shiver
2284	土 32.9	2284	2161	4	4	11	堵	dǔ	wall; stop, prevent; stop up
2285	瓦 98.6	2285	2038	6	7–9	10	瓷	cí	crockery, porcelain, chinaware
2286	口 30.5	2286	1096	\N	\N	8	咒	zhòu	curse, damn, incantation
2287	女 38.6	2287	1737	3	4	9	姨	yí	mother's sister, aunt
2288	木 75.8	2288	2562	4	5	12	棒	bàng	stick, club, truncheon; hit
2289	邑 163.7	2289	4375	\N	\N	9	郡	jùn	administrative division
2290	水 85.7	2290	2076	6	7–9	10	浴	yù	bathe, wash; bath
2291	女 38.9	2291	2811	\N	7–9	12	媚	mèi	charming, attractive; flatter
2292	魚 195.5	2292	5529	\N	\N	13	稣	sū	revive, to rise again; collect
2293	水 85.8	2293	2421	\N	7–9	11	淮	huái	river in Anhui province
2294	口 30.6	2294	1082	5	7–9	8	哎	āi	interjection of surprise
2295	尸 44.4	2295	903	6	\N	7	屁	pì	break wind; fart; buttocks
2296	水 85.11	2296	3161	6	7–9	14	漆	qī	varnish, lacquer, paint
2297	水 85.8	2297	2424	\N	\N	11	淫	yín	obscene, licentious, lewd
2298	巛 47.8	2298	2500	6	7–9	11	巢	cháo	nest, living quarter in tree
2299	口 30.4	2299	741	6	7–9	7	吩	fēn	order, command, instruct
2300	手 64.12	2300	3205	\N	7–9	15	撰	zhuàn	compose, write, compile
2301	口 30.8	2301	2291	6	7–9	11	啸	xiào	roar, howl, scream; whistle
2302	水 85.9	2302	2750	6	7–9	12	滞	zhì	block up, obstruct; stagnant
2303	玉 96.4	2303	950	\N	7–9	8	玫	méi	rose
2304	石 112.6	2304	2241	4	5	11	硕	shuò	great, eminent; large, big
2305	金 167.3	2305	1120	5	7–9	8	钓	diào	fish; fishhook; tempt, lure
2306	虫 142.9	2306	3245	5	\N	15	蝶	dié	butterfly
2307	肉 130.11	2307	3274	6	7–9	15	膝	xī	knee
2308	女 38.6	2308	1740	\N	\N	9	姚	yáo	handsome, elegant; surname
2309	艸 140.5	2309	1003	6	7–9	8	茂	mào	thick, lush, dense; talented
2310	身 158.4	2310	2335	\N	7–9	11	躯	qū	body
2311	口 30.3	2311	381	\N	7–9	6	吏	lì	government official, magistrate
2312	犬 94.10	2312	2978	\N	\N	13	猿	yuán	ape
2313	宀 40.11	2313	3171	\N	7–9	14	寨	zhài	stockade, stronghold, outpost; brothel
2314	心 61.6	2314	2142	6	7–9	10	恕	shù	forgive, excuse, show mercy
2315	水 85.9	2315	2416	6	6	11	渠	qú	ditch, canal, channel, gutter
2316	戈 62.7	2316	2239	4	7–9	11	戚	qī	relative; be related to; sad
2317	辰 161.0	2317	701	6	7–9	7	辰	chén	early morning; 5th terrestrial branch
2318	舟 137.5	2318	2344	6	7–9	11	舶	bó	large, ocean-going vessel
2319	頁 181.4	2319	1990	6	7–9	10	颁	bān	confer, bestow; publish, promulgate
2320	心 61.9	2320	2775	\N	\N	12	惶	huáng	fearful, afraid, anxious, nervous
2321	犬 94.5	2321	1196	\N	\N	8	狐	hú	species of fox
2322	言 149.4	2322	559	5	7–9	6	讽	fěng	recite, incant; satirize
2323	竹 118.5	2323	2317	4	4	11	笨	bèn	foolish, stupid, dull; awkward
2324	衣 145.5	2324	2117	6	7–9	10	袍	páo	long gown, robe, cloak
2325	口 30.12	2325	3238	6	7–9	15	嘲	cháo	ridicule, deride, scorn, jeer at
2326	口 30.8	2326	2272	2	3	11	啡	fēi	morphine; coffee
2327	水 85.5	2327	1262	4	5	8	泼	pō	pour, splash, water, sprinkle
2328	彳 60.8	2328	2342	6	7–9	11	衔	xián	bit; hold in mouth, bite; gag
2329	人 9.8	2329	1968	6	7–9	10	倦	juàn	be tired of, weary
2330	水 85.8	2330	2434	6	7–9	11	涵	hán	soak, wet; tolerate, be lenient
2331	隹 172.3	2331	2255	6	7–9	11	雀	què	sparrow
2332	日 72.2	2332	500	5	7–9	6	旬	xún	ten-day period; period of time
2333	人 9.13	2333	3269	6	7–9	15	僵	jiāng	stiff and motionless, stock still
2334	手 64.12	2334	3191	5	7–9	15	撕	sī	rip, tear; buy cloth
2335	肉 130.4	2335	1182	6	7–9	8	肢	zhī	human limbs; animal feet
2336	龍 212.3	2336	1055	6	7–9	8	垄	lǒng	grave, mound; ridge in field
2337	大 37.3	2337	403	\N	7–9	6	夷	yí	ancient barbarian tribes
2338	辵 162.8	2338	2363	\N	7–9	11	逸	yì	flee, escape, break loose
2339	艸 140.5	2339	1016	\N	7–9	8	茅	máo	reeds, rushes, grass; surname
2340	人 9.6	2340	1149	6	7–9	8	侨	qiáo	sojourn, lodge
2341	八 12.12	2341	3125	6	7–9	14	舆	yú	cart, palanquin, sedan chair
2342	穴 116.6	2342	2457	\N	7–9	11	窑	yáo	kiln; coal mine pit
2343	水 85.7	2343	4649	\N	\N	10	涅	niè	blacken; black mud, slime
2344	艸 140.10	2344	2857	\N	\N	13	蒲	pú	type of rush; vine
2345	言 149.10	2345	2798	5	6	12	谦	qiān	humble, modest
2346	木 75.4	2346	1030	\N	7–9	8	杭	háng	cross stream; navigate
2347	口 30.13	2347	5933	\N	\N	15	噢	ō	moan; interjection for pain, sad
2348	廾 55.12	2348	3156	6	7–9	14	弊	bì	evil, wrong, bad; criminal
2349	力 19.7	2349	1506	\N	7–9	9	勋	xūn	meritorious deed; merits; rank
2350	刀 18.6	2350	1129	3	6	8	刮	guā	shave, pare off, scrape
2351	邑 163.6	2351	1218	4	5	8	郊	jiāo	suburbs; waste land, open spaces
2352	冫 15.8	2352	2015	6	7–9	10	凄	qī	bitter cold, miserable, dreary
2353	手 64.8	2353	2160	6	7–9	11	捧	pěng	hold up in two hands
2354	水 85.7	2354	2085	6	7–9	10	浸	jìn	soak, immerse, dip, percolate
2355	石 112.4	2355	1447	6	7–9	9	砖	zhuān	tile, brick
2356	鼎 206.0	2356	2617	\N	7–9	12	鼎	dǐng	large, three-legged bronze caldron
2357	竹 118.10	2357	3357	2	2	16	篮	lán	basket
2358	艸 140.10	2358	2860	6	7–9	13	蒸	zhēng	steam; evaporate
2359	食 184.6	2359	1614	4	5	9	饼	bǐng	rice-cakes, biscuits
2360	亠 8.5	2360	829	\N	7–9	7	亩	mǔ	Chinese land measure; fields
2361	肉 130.4	2361	1073	\N	7–9	8	肾	shèn	kidneys; testes, gizzard
2362	阜 170.7	2362	1727	6	7–9	9	陡	dǒu	steep, sloping; abruptly, sudden
2363	爪 87.0	2363	138	\N	7–9	4	爪	zhǎo	claw, nail, talon; animal feet
2364	儿 10.6	2364	1195	5	5	8	兔	tù	rabbit, hare
2365	殳 79.6	2365	1977	\N	7–9	10	殷	yīn	many, great; abundant, flourishing
2366	卜 25.4	2366	412	\N	7–9	6	贞	zhēn	virtuous, chaste, pure; loyal
2367	艸 140.6	2367	1405	5	7–9	9	荐	jiàn	repeat, reoccur; recommend
2368	口 30.6	2368	1484	6	7–9	9	哑	yǎ	dumb, mute; become hoarse
2369	火 86.5	2369	1517	5	7–9	9	炭	tàn	charcoal; coal; carbon
2370	土 32.4	2370	644	6	7–9	7	坟	fén	grave, mound; bulge; bulging
2371	目 109.5	2371	1481	6	7–9	9	眨	zhǎ	wink
2372	手 64.10	2372	2835	6	7–9	13	搏	bó	seize; spring upon; strike
2373	口 30.6	2373	1513	4	5	9	咳	hāi	cough
2374	手 64.5	2374	958	6	7–9	8	拢	lǒng	collect, bring together
2375	臼 134.7	2375	2957	5	7–9	13	舅	jiù	maternal uncle
2376	日 72.5	2376	1477	6	7–9	9	昧	mèi	obscure, dark; darken
2377	手 64.13	2377	3318	6	7–9	16	擅	shàn	monopolize; claim; arbitrarily; to dare
2378	爻 89.7	2378	2244	6	6	11	爽	shuǎng	happy, cheerful; refreshing
2379	口 30.5	2379	1104	2	3	8	咖	kā	coffee; a phonetic
2380	手 64.9	2380	2533	6	7–9	12	搁	gē	place, put, lay down; delay
2381	示 113.7	2381	2794	\N	\N	12	禄	lù	blessing, happiness, prosperity
2382	隹 172.5	2382	3098	6	\N	14	雌	cí	female; feminine; gentle, soft
2383	口 30.7	2383	1904	6	7–9	10	哨	shào	whistle, blow whistle; chirp
2384	工 48.3	2384	361	6	6	6	巩	gǒng	bind; firm, secure, strong
2385	糸 120.7	2385	2150	\N	\N	10	绢	juàn	kind of thick stiff silk
2386	虫 142.11	2386	3410	\N	7–9	17	螺	luó	spiral shell; conch; spiral
2387	衣 145.8	2387	3139	5	4	14	裹	guǒ	wrap, bind; encircle, confine
2388	日 72.4	2388	1000	6	7–9	8	昔	xī	formerly; ancient; in beginning
2389	車 159.3	2389	709	\N	\N	7	轩	xuān	carriage; high; wide; balcony
2390	言 149.11	2390	3034	6	7–9	13	谬	miù	error, exaggeration; erroneous
2391	言 149.9	2391	2460	6	7–9	11	谍	dié	an intelligence report; to spy; spying
2392	龜 213.0	2392	808	\N	7–9	7	龟	guī	turtle or tortoise; cuckold
2393	女 38.10	2393	3039	6	7–9	13	媳	xí	daughter-in-law
2394	女 38.6	2394	1643	\N	7–9	9	姜	jiāng	surname; ginger
2395	目 109.10	2395	3235	5	7–9	15	瞎	xiā	blind, reckless; rash
2396	冖 14.8	2396	2124	6	7–9	10	冤	yuān	grievance, injustice, wrong
2397	鳥 196.4	2397	1464	6	7–9	9	鸦	yā	crow; Corvus species (various)
2398	艸 140.11	2398	2855	6	7–9	13	蓬	péng	type of raspberry; fairyland
2399	己 49.6	2399	1406	6	7–9	9	巷	xiàng	alley, lane
2400	玉 96.8	2400	2502	\N	\N	12	琳	lín	beautiful jade, gem
2401	木 75.6	2401	1782	6	7–9	10	栽	zāi	to cultivate, plant; to care for plants
2402	水 85.5	2402	1245	6	7–9	8	沾	zhān	moisten, wet, soak; touch
2403	言 149.5	2403	893	6	7–9	7	诈	zhà	cheat, defraud, swindle; trick
2404	文 67.6	2404	2029	\N	\N	10	斋	zhāi	vegetarian diet; study
2405	目 109.10	2405	3232	6	7–9	15	瞒	mán	deceive, lie; eyes half-closed
2406	彡 59.8	2406	2254	\N	\N	11	彪	biāo	tiger; tiger stripes; tiger-like
2407	厂 27.2	2407	3514	\N	7–9	4	厄	è	adversity, difficulty, distress
2408	口 30.6	2408	1629	5	6	9	咨	zī	inquire, consult, discuss; plan
2409	糸 120.4	2409	940	6	7–9	7	纺	fǎng	spin, reel, weave; reeled pongee
2410	缶 121.18	2410	3499	6	7–9	23	罐	guàn	jar, jug, pitcher, pot
2411	木 75.7	2411	2230	4	7–9	11	桶	tǒng	pail, bucket, tub; cask, keg
2412	土 32.17	2412	3474	6	7–9	20	壤	rǎng	soil, loam, earth; rich
2413	米 119.10	2413	3375	3	5	16	糕	gāo	cakes, pastry
2414	頁 181.4	2414	1991	6	7–9	10	颂	sòng	laud, acclaim; hymn; ode
2415	肉 130.12	2415	3364	6	7–9	16	膨	péng	to swell; swollen, bloated, inflated
2416	言 149.9	2416	2462	6	6	11	谐	xié	harmonize, agree; joke, jest
2417	土 32.6	2417	1751	\N	7–9	9	垒	lěi	rampart, military wall
2418	口 30.5	2418	1083	\N	\N	8	咕	gū	mumble, mutter, murmur; rumble
2419	阜 170.10	2419	2806	6	7–9	12	隙	xì	crack, split, fissure; grudge
2420	辛 160.7	2420	3148	4	4	14	辣	là	peppery, pungent, hot; cruel
2421	糸 120.6	2421	1752	6	7–9	9	绑	bǎng	bind, tie, fasten
2422	宀 40.5	2422	1277	5	6	8	宠	chǒng	favorite, concubine; favor
2423	口 30.12	2423	3252	6	7–9	15	嘿	hēi	be silent, be quiet
2424	儿 10.5	2424	850	5	7–9	7	兑	duì	cash; exchange
2425	雨 173.7	2425	3231	5	7–9	15	霉	méi	mildew, mold; moldy, mildewed
2426	手 64.7	2426	1805	6	7–9	10	挫	cuò	push down; chop down; grind
2427	禾 115.10	2427	3260	\N	7–9	15	稽	jī	examine, investigate; delay
2428	車 159.9	2428	2888	6	7–9	13	辐	fú	spokes of wheel
2429	乙 5.2	2429	42	6	7–9	3	乞	qǐ	beg; request
2430	糸 120.4	2430	932	\N	7–9	7	纱	shā	gauze, thin silk; yarn, thread
2431	衣 145.7	2431	2792	3	3	12	裙	qún	skirt, apron, petticoat
2432	口 30.12	2432	3236	\N	\N	15	嘻	xī	mirthful, happy; interjection
2433	口 30.6	2433	1482	6	6	9	哇	wa	vomit; cry of an infant
2434	糸 120.7	2434	2151	6	7–9	10	绣	xiù	embroider; embroidery; ornament
2435	木 75.3	2435	683	6	7–9	7	杖	zhàng	cane, walking stick
2436	土 32.10	2436	2843	5	7–9	13	塘	táng	pond; tank; dike, embankment
2437	行 144.3	2437	1582	6	7–9	9	衍	yǎn	overflow, spill over, spread out
2438	車 159.5	2438	1462	\N	7–9	9	轴	zhóu	axle, axletree; pivot; axis
2439	手 64.15	2439	3456	6	7–9	19	攀	pān	climb; pull; hang on to
2440	肉 130.10	2440	3133	4	7–9	14	膊	bó	shoulders, upper arms
2441	言 149.13	2441	3487	6	7–9	20	譬	pì	metaphor, simile, example
2442	文 67.7	2442	2730	\N	\N	12	斌	bīn	refined, having both appearance
8392	鳥 196.6	8392	\N	\N	\N	17	鴾	móu	a crested ibis
2443	示 113.4	2443	1295	\N	7–9	8	祈	qí	pray; entreat, beseech
2444	足 157.8	2444	3241	2	6	15	踢	tī	kick
2445	聿 129.7	2445	2831	6	7–9	13	肆	sì	indulge; excess; numeral four; particle meaning now, therefore; shop
2446	土 32.4	2446	639	\N	\N	7	坎	kǎn	pit, hole; snare, trap; crisis
2447	車 159.6	2447	1875	\N	7–9	10	轿	jiào	sedan-chair, palanquin
2448	木 75.8	2448	2575	\N	7–9	12	棚	péng	tent, awning; booth; shed
2449	水 85.5	2449	1253	6	7–9	8	泣	qì	cry, sob, weep
2450	尸 44.9	2450	2801	6	7–9	12	屡	lǚ	frequently, often, again and again
2451	足 157.13	2451	3477	6	7–9	20	躁	zào	tense, excited, irritable
2452	邑 163.5	2452	3729	\N	\N	7	邱	qiū	surname; hill; mound; grave
2453	几 16.9	2453	2368	\N	7–9	11	凰	huáng	female phoenix
2454	水 85.10	2454	3016	\N	7–9	13	溢	yì	overflow, brim over; full
2455	木 75.8	2455	2573	6	\N	12	椎	chuí	hammer, mallet; vertebra
2456	石 112.5	2456	1863	6	7–9	10	砸	zá	smash, crush, break; pound, mash
2457	走 156.8	2457	3195	4	6	15	趟	tàng	time, occasion; take journey
2458	巾 50.5	2458	1283	5	5	8	帘	lián	flag-sign of a tavern
2459	巾 50.3	2459	437	6	7–9	6	帆	fān	sail; boat
2460	木 75.6	2460	1837	\N	7–9	10	栖	qī	perch; roost; stay
2461	穴 116.7	2461	2783	6	7–9	12	窜	cuàn	run away; revise, edit; expel
2462	丶 3.2	2462	51	6	7–9	3	丸	wán	small round object; pellet, pill
2463	車 159.4	2463	1060	6	7–9	8	斩	zhǎn	cut, chop, sever; behead
2464	土 32.9	2464	2519	6	7–9	12	堤	dī	dike
2465	土 32.10	2465	2836	6	7–9	13	塌	tā	fall in ruins, collapse
2466	貝 154.4	2466	1115	6	7–9	8	贩	fàn	peddler, hawker, street merchant
2467	厂 27.9	2467	2238	5	7–9	11	厢	xiāng	side-room, wing; theatre box
2468	手 64.8	2468	2176	6	7–9	11	掀	xiān	lift, raise; stir
2469	口 30.9	2469	5160	\N	\N	12	喀	kā	vomit; used in transliterations
2470	丿 4.7	2470	1128	5	7–9	8	乖	guāi	rebel; crafty, shrewd
2471	言 149.9	2471	2468	6	7–9	11	谜	mí	riddle, conundrum; puzzle
2472	手 64.7	2472	1793	6	7–9	10	捏	niē	pick with fingers; knead; mold
2473	門 169.8	2473	2396	\N	7–9	11	阎	yán	village gate; surname
2474	水 85.10	2474	3018	6	7–9	13	滨	bīn	beach, sea coast; river bank
2475	虍 141.2	2475	1072	6	7–9	8	虏	lǔ	to capture, imprison, seize; a prison
2476	匕 21.9	2476	2259	4	7–9	11	匙	shi	spoon; surname
2477	艸 140.4	2477	672	\N	7–9	7	芦	lú	rushes, reeds
2478	艸 140.5	2478	1004	1	3	8	苹	píng	artemisia; duckweed; apple
2479	卩 26.6	2479	1536	6	7–9	9	卸	xiè	lay down; retire from office
2480	水 85.5	2480	1260	6	7–9	8	沼	zhǎo	lake, fishpond, swamps
2481	金 167.4	2481	1531	4	7–9	9	钥	yào	key; lock
2482	木 75.6	2482	1840	6	7–9	10	株	zhū	numerary adjunct for trees; root
2483	示 113.7	2483	2464	\N	7–9	11	祷	dǎo	pray; entreat, beg, plead; prayer
2484	刀 18.8	2484	2042	6	7–9	10	剖	pōu	split in two, slice; dissect
2485	火 86.10	2485	3075	\N	7–9	14	熙	xī	bright, splendid, glorious
2486	口 30.6	2486	1507	6	7–9	9	哗	huā	rushing sound; gush forward
2487	刀 18.13	2487	3311	6	7–9	15	劈	pī	cut apart, split, chop
2488	心 61.5	2488	1266	6	7–9	8	怯	qiè	lacking in courage, afraid
2489	木 75.8	2489	2608	\N	\N	12	棠	táng	crab apple tree; wild plums
2490	肉 130.6	2490	1997	4	7–9	10	胳	gē	armpit, arms
2491	木 75.6	2491	1846	\N	7–9	10	桩	zhuāng	stake, post; affair, matter
2492	玉 96.10	2492	2828	\N	7–9	13	瑰	guī	extraordinary, fabulous; rose
2493	女 38.7	2493	2140	5	6	10	娱	yú	pleasure, enjoyment, amusement
2494	女 38.8	2494	2197	5	7–9	11	娶	qǔ	marry, take wife
2495	水 85.5	2495	1239	6	7–9	8	沫	mò	froth, foam, bubbles, suds
2496	口 30.10	2496	2929	5	7–9	13	嗓	sǎng	voice; throat
2497	足 157.12	2497	3458	5	6	19	蹲	dūn	squat, crouch; idle about
2498	火 86.8	2498	2568	\N	7–9	12	焚	fén	burn
2499	水 85.8	2499	2426	5	7–9	11	淘	táo	wash in sieve; weed out
2500	女 38.11	2500	3183	5	7–9	14	嫩	nèn	soft, tender, delicate; young
2501	音 180.4	2501	2995	\N	7–9	13	韵	yùn	rhyme; vowel
2502	衣 145.3	2502	1292	3	3	8	衬	chèn	underwear; inner garments
2503	勹 20.4	2503	504	\N	\N	6	匈	xiōng	Hungary, Hungarian
2504	金 167.4	2504	1533	\N	7–9	9	钧	jūn	unit of measure equivalent to thirty catties
2505	立 117.4	2505	1473	6	7–9	9	竖	shù	perpendicular, vertical; erect
2506	山 46.7	2506	1923	6	7–9	10	峻	jùn	high, steep, towering; stern
2507	豸 153.3	2507	1989	\N	7–9	10	豹	bào	leopard, panther; surname
2508	手 64.7	2508	1781	6	7–9	10	捞	lāo	scoop out of water; dredge, fish
2509	艸 140.8	2509	2209	\N	7–9	11	菊	jú	chrysanthemum
2510	邑 163.11	2510	2903	6	7–9	13	鄙	bǐ	mean; low
2511	鬼 194.5	2511	3129	6	7–9	14	魄	pò	vigor; body; dark part of moon
2512	儿 10.9	2512	2336	6	7–9	11	兜	dōu	pouch
2513	口 30.6	2513	1483	6	7–9	9	哄	hōng	coax; beguile, cheat, deceive
2514	頁 181.7	2514	2979	6	7–9	13	颖	yǐng	rice tassel; sharp point; clever
2515	金 167.10	2515	3258	\N	7–9	15	镑	bàng	pound sterling
2516	尸 44.7	2516	2133	6	7–9	10	屑	xiè	bits, scraps, crumbs, fragments
2517	虫 142.3	2517	1499	6	\N	9	蚁	yǐ	ants
2518	士 33.7	2518	1812	5	6	10	壶	hú	jar, pot, jug, vase; surname
2519	心 61.5	2519	1272	\N	7–9	8	怡	yí	harmony; pleasure, joy; be glad
2520	水 85.8	2520	2437	6	7–9	11	渗	shèn	soak through, infiltrate
2521	禾 115.2	2521	764	6	7–9	7	秃	tū	bald
2522	辵 162.5	2522	4072	\N	\N	8	迦	jiā	character for transliteration
2523	日 72.3	2523	714	6	7–9	7	旱	hàn	drought; dry; dry land
2524	口 30.6	2524	1516	\N	\N	9	哟	yō	ah, final particle
2525	口 30.6	2525	1443	4	4	9	咸	xián	together; all, completely; united
2526	火 86.7	2526	2169	\N	\N	11	焉	yān	thereupon, then; how? why? where?
2527	言 149.13	2527	3307	6	7–9	15	谴	qiǎn	reprimand, scold, abuse
2528	宀 40.5	2528	1284	\N	\N	8	宛	wǎn	seem, as if, crooked
2529	禾 115.10	2529	3261	6	7–9	15	稻	dào	rice growing in field, rice plant
2530	金 167.7	2530	2656	6	7–9	12	铸	zhù	melt, cast; coin, mint
2531	金 167.9	2531	3114	3	4	14	锻	duàn	forge metal; temper, refine
2532	人 9.5	2532	3735	\N	\N	7	伽	jiā	traditionally used as phonetic for ga
2533	言 149.6	2533	5524	\N	\N	13	詹	zhān	surname; talk too much, verbose
2534	比 81.6	2534	1878	\N	7–9	10	毙	bì	kill; die violent death
2535	心 61.6	2535	1687	6	7–9	9	恍	huǎng	seemingly; absent-minded
2536	貝 154.5	2536	1116	6	7–9	8	贬	biǎn	decrease, lower; censure, criticize
2537	火 86.6	2537	2061	6	7–9	10	烛	zhú	candle, taper; shine, illuminate
2538	馬 187.6	2538	1764	\N	7–9	9	骇	hài	terrify, frighten, scare; shock
2539	艸 140.4	2539	673	\N	7–9	7	芯	xīn	pith from rush (juncus effusus)
2540	水 85.2	2540	308	4	3	5	汁	zhī	juice, liquor, fluid, sap, gravy, sauce
2541	木 75.6	2541	4450	\N	\N	10	桓	huán	variety of tree; surname
2542	土 32.4	2542	647	\N	\N	7	坊	fāng	lane; workshop; surname
2543	馬 187.4	2543	941	\N	\N	7	驴	lǘ	donkey, ass
2544	木 75.2	2544	375	6	7–9	6	朽	xiǔ	decayed, rotten; rot, decay
2545	青 174.5	2545	2993	\N	\N	13	靖	jìng	pacify; appease; calm, peaceful
2546	人 9.5	2546	780	6	7–9	7	佣	yōng	commission fee
2547	水 85.3	2547	541	\N	\N	6	汝	rǔ	you
2548	石 112.8	2548	2882	6	7–9	13	碌	lù	rough, uneven, rocky; mediocre
2549	辵 162.3	2549	453	6	7–9	6	迄	qì	extend, reach; until; till
2550	八 12.14	2550	3340	\N	\N	16	冀	jì	hope for; wish; Hebei province
2551	刀 18.8	2551	1401	\N	7–9	9	荆	jīng	thorns; brambles; my wife; cane
2552	山 46.8	2552	2296	\N	\N	11	崔	cuī	high, lofty, towering; surname
2553	隹 172.4	2553	2593	\N	7–9	12	雁	yàn	wild goose
2554	糸 120.5	2554	1339	6	7–9	8	绅	shēn	girdle; tie, bind; gentry
2555	玉 96.5	2555	1360	\N	\N	9	珊	shān	coral
2556	木 75.10	2556	3081	6	6	14	榜	bǎng	placard; list of successful exam candidates
2557	言 149.7	2557	1718	6	7–9	9	诵	sòng	recite, chant, repeat
2558	人 9.10	2558	2696	5	6	12	傍	bàng	by side of, beside, near, close
2559	彡 59.6	2559	4314	\N	\N	9	彦	yàn	elegant
2560	酉 164.8	2560	3223	\N	7–9	15	醇	chún	rich, good as wine; pure, unmixed
2561	竹 118.5	2561	2319	\N	7–9	11	笛	dí	bamboo flute; whistle
2562	禸 114.8	2562	2711	6	7–9	12	禽	qín	birds, fowl; surname;; capture
2563	勹 20.2	2563	152	5	7–9	4	勿	wù	must not, do not; without, never
2564	女 38.7	2564	2141	\N	\N	10	娟	juān	beautiful, graceful
2565	目 109.9	2565	2898	6	7–9	13	瞄	miáo	take aim at; look at
2566	巾 50.12	2566	3254	6	7–9	15	幢	chuáng	carriage curtain; sun screen
2567	宀 40.8	2567	2451	\N	\N	11	寇	kòu	bandits, thieves; enemy; invade
2568	目 109.9	2568	2896	6	7–9	13	睹	dǔ	look at, gaze at; observe
2569	貝 154.6	2569	1925	6	7–9	10	贿	huì	bribe; bribes; riches, wealth
2570	足 157.8	2570	3243	5	6	15	踩	cǎi	step on
2571	雨 173.7	2571	5684	\N	\N	14	霆	tíng	a sudden peal of thunder
2572	口 30.4	2572	745	\N	7–9	7	呜	wū	sound of crying, sobbing
2573	手 64.6	2573	1369	\N	7–9	9	拱	gǒng	fold hands on breast; bow, salute
2574	女 38.3	2574	580	\N	\N	6	妃	fēi	wife, spouse; imperial concubine
2575	艸 140.11	2575	3070	6	7–9	14	蔑	miè	disdain, disregard; slight
2576	言 149.9	2576	5004	\N	\N	11	谕	yù	proclaim, instruct; edict
2577	糸 120.10	2577	3044	6	7–9	13	缚	fù	to tie
2578	言 149.6	2578	1298	\N	\N	8	诡	guǐ	deceive, cheat, defraud; sly
2579	竹 118.11	2579	3359	6	7–9	16	篷	péng	awning, covering; sail; boat
2580	水 85.8	2580	2415	6	7–9	11	淹	yān	drown; cover with liquid, steep
2581	肉 130.8	2581	2716	\N	7–9	12	腕	wàn	wrist
2582	火 86.8	2582	2529	5	6	12	煮	zhǔ	cook
2583	人 9.8	2583	4562	\N	\N	10	倩	qiàn	beautiful, lovely; son-in-law
2584	十 24.6	2584	1217	\N	7–9	8	卒	zú	soldier; servant; at last, finally
2585	力 19.9	2585	2195	6	7–9	11	勘	kān	investigate; compare; collate
2586	香 186.11	2586	3475	\N	7–9	20	馨	xīn	fragrant, aromatic; distant fragrance
2587	辵 162.7	2587	1854	5	7–9	10	逗	dòu	tempt, allure, arouse, stir
2588	田 102.2	2588	809	\N	7–9	7	甸	diān	suburbs of capital; govern; crops
2589	貝 154.5	2589	1520	\N	7–9	9	贱	jiàn	mean, low; cheap, worthless
2590	火 86.4	2590	1234	5	6	8	炒	chǎo	fry, saute, roast, boil, cook
2591	火 86.3	2591	852	6	7–9	7	灿	càn	vivid, illuminating; bright
2592	攴 66.8	2592	2607	6	7–9	12	敞	chǎng	roomy, spacious, open, broad
2593	虫 142.8	2593	3106	6	7–9	14	蜡	là	wax; candle; waxy, glazed; maggot; as a non-simplified form sometimes used as an equivalent to 䄍, meaning imperial harvest
2594	囗 31.2	2594	261	\N	7–9	5	囚	qiú	prisoner, convict; confine
2595	木 75.6	2595	1855	\N	\N	10	栗	lì	chestnut tree, chestnuts; surname
2596	辛 160.5	2596	2560	6	7–9	12	辜	gū	crime, criminal offense
2597	土 32.6	2597	1390	6	7–9	9	垫	diàn	advance money, pay for another
2598	女 38.4	2598	923	6	7–9	7	妒	dù	jealous, envious
2599	鬼 194.4	2599	2963	\N	7–9	13	魁	kuí	chief; leader; best; monstrous
2600	言 149.10	2600	2796	6	7–9	12	谣	yáo	sing; folksong, ballad; rumor
2601	宀 40.11	2601	3026	5	7–9	13	寞	mò	silent, still, lonely, solitary
2602	虫 142.7	2602	2934	\N	7–9	13	蜀	shǔ	name of an ancient state
2603	用 101.0	2603	284	5	7–9	5	甩	shuǎi	throw away, discard
2604	水 85.8	2604	2414	\N	7–9	11	涯	yá	border, horizon, shore
2605	木 75.4	2605	1033	6	7–9	8	枕	zhěn	pillow
2606	一 1.3	2606	84	6	7–9	4	丐	gài	beggar; beg; give
2607	水 85.5	2607	1257	2	3	8	泳	yǒng	dive; swim
2608	大 37.6	2608	4171	\N	\N	9	奎	kuí	stride of man; one of the twenty-eight lunar mansions
2609	水 85.5	2609	1256	6	7–9	8	泌	mì	to seep out, excrete
2610	辵 162.9	2610	2708	\N	7–9	12	逾	yú	go over, pass over, exceed
2611	口 30.2	2611	241	6	7–9	5	叮	dīng	exhort or enjoin repeatedly
2612	黑 203.5	2612	6261	\N	\N	17	黛	dài	blacken eyebrows; black
2613	火 86.13	2613	3430	5	7–9	17	燥	zào	dry, parched, arid; quick-tempered
2614	手 64.8	2614	2186	6	\N	11	掷	zhì	throw, hurl, cast, fling
2615	艸 140.14	2615	3390	\N	\N	17	藉	jí	mat, pad; rely on; pretext
2616	木 75.4	2616	1021	\N	7–9	8	枢	shū	door hinge; pivot; center of power
2617	心 61.12	2617	3303	\N	\N	15	憎	zēng	hate, detest, abhor; hatred
2618	魚 195.8	2618	3366	\N	\N	16	鲸	jīng	whale
2619	弓 57.2	2619	329	\N	7–9	5	弘	hóng	enlarge, expand; liberal, great
2620	人 9.8	2620	1957	\N	7–9	10	倚	yǐ	rely on, depend on; lean heavily
2621	人 9.7	2621	1566	6	7–9	9	侮	wǔ	insult, ridicule, disgrace
2622	艸 140.15	2622	6322	\N	\N	18	藩	fān	fence; boundary; outlying border
2623	手 64.5	2623	986	\N	\N	8	拂	fú	shake off, brush away; dust
2624	鳥 196.10	2624	3308	\N	7–9	15	鹤	hè	crane; Grus species (various)
2625	食 184.6	2625	1612	6	7–9	9	蚀	shí	nibble away; erode; eclipse
2626	水 85.6	2626	2018	\N	7–9	10	浆	jiāng	any thick fluid; starch; broth
2627	艸 140.4	2627	661	\N	\N	7	芙	fú	hibiscus
2628	土 32.5	2628	980	4	4	8	垃	lā	garbage, refuse, waste
2629	火 86.6	2629	2057	4	5	10	烤	kǎo	bake, roast, toast, cook
2630	日 72.6	2630	1887	5	4	10	晒	shài	dry in sun, expose to sun
2631	雨 173.9	2631	3399	6	7–9	17	霜	shuāng	frost; crystallized; candied
2632	刀 18.14	2632	3048	\N	\N	13	剿	jiǎo	destroy, exterminate, annihilate
2633	艸 140.14	2633	3212	6	7–9	15	蕴	yùn	to collect, gather, store; profound
2634	土 32.4	2634	362	4	4	6	圾	jī	garbage, rubbish; shaking; danger
2635	糸 120.8	2635	2495	5	7–9	11	绸	chóu	silk cloth, satin damask
2636	山 46.3	2636	434	5	7–9	6	屿	yǔ	island
2637	气 84.5	2637	1542	\N	\N	9	氢	qīng	ammonia; hydrogen nitride
2638	馬 187.5	2638	1347	\N	\N	8	驼	tuó	a camel; humpbacked; to carry on the back
2639	女 38.3	2639	512	6	7–9	6	妆	zhuāng	to adorn oneself, dress up, use make-up
2640	手 64.7	2640	1796	6	7–9	10	捆	kǔn	tie up; bind, truss up; bundle
2641	金 167.5	2641	1934	2	6	10	铅	qiān	lead
2642	辵 162.7	2642	2003	4	4	10	逛	guàng	ramble, stroll, roam, wander
2643	水 85.8	2643	2418	\N	\N	11	淑	shū	good, pure, virtuous, charming
2644	木 75.10	2644	3080	\N	\N	14	榴	liú	pomegranate
2645	一 1.4	2645	213	6	7–9	5	丙	bǐng	third; 3rd heavenly stem
2646	疒 104.6	2646	2382	5	7–9	11	痒	yǎng	itch
2647	金 167.4	2647	1527	6	7–9	9	钞	chāo	paper money, bank notes; copy
2648	足 157.9	2648	3344	\N	\N	16	蹄	tí	hoof; leg of pork; little witch
2649	犬 94.0	2649	92	6	7–9	4	犬	quǎn	dog; radical number 94
2650	身 158.3	2650	1972	6	7–9	10	躬	gōng	body; personally, in person
2651	尸 44.6	2651	1723	6	7–9	9	昼	zhòu	daytime, daylight
2652	艸 140.16	2652	3455	\N	7–9	19	藻	zǎo	splendid, magnificent; algae
2653	虫 142.6	2653	2635	\N	\N	12	蛛	zhū	spider
2654	衣 145.9	2654	3179	\N	\N	14	褐	hè	coarse woolen cloth; dull, dark
2655	頁 181.6	2655	2597	\N	7–9	12	颊	jiá	cheeks, jaw
2656	大 37.9	2656	2744	6	7–9	12	奠	diàn	pay respect; settle
2657	力 19.11	2657	2549	\N	7–9	12	募	mù	levy, raise; summon; recruit
2658	耳 128.4	2658	1818	5	7–9	10	耽	dān	indulge in; be negligent
2659	足 157.10	2659	3409	6	6	17	蹈	dǎo	stamp feet; dance
2660	阜 170.6	2660	1317	6	7–9	8	陋	lòu	narrow; crude, coarse; ugly
2661	人 9.6	2661	1146	6	7–9	8	侣	lǚ	companion; associate with
2662	鬼 194.5	2662	3130	5	7–9	14	魅	mèi	kind of forest demon, elf
2663	山 46.4	2663	3717	\N	\N	7	岚	lán	mountain mist, mountain haze
2664	人 9.6	2664	1144	6	\N	8	侄	zhí	nephew
2665	虍 141.3	2665	1470	6	7–9	9	虐	nüè	cruel, harsh, oppressive
2666	土 32.9	2666	2475	6	7–9	11	堕	duò	fall, sink, let fall; degenerate
2667	阜 170.7	2667	4380	\N	\N	9	陛	bì	steps leading throne; throne
2668	艸 140.7	2668	1830	\N	7–9	10	莹	yíng	luster of gems; bright, lustrous
2669	艸 140.7	2669	1420	\N	7–9	9	荫	yīn	shade, shelter; protect
2670	犬 94.6	2670	1604	5	7–9	9	狡	jiǎo	cunning, deceitful, treacherous
2671	門 169.6	2671	1638	\N	7–9	9	阀	fá	powerful and influential group
2672	糸 120.6	2672	1763	\N	7–9	9	绞	jiǎo	twist, wring; intertwine; winch
2673	肉 130.10	2673	3142	4	7–9	14	膏	gāo	grease, fat; paste, ointment
2674	土 32.6	2674	1371	\N	7–9	9	垮	kuǎ	be defeated, fail, collapse
2675	艸 140.5	2675	1014	6	7–9	8	茎	jīng	stem, stalk
2676	糸 120.9	2676	2814	\N	7–9	12	缅	miǎn	distant, remote; think of
2677	口 30.9	2677	2621	6	7–9	12	喇	lǎ	horn, bugle; lama; final particle
2678	糸 120.6	2678	1753	6	5	9	绒	róng	silk, cotton, or woolen fabric
2679	手 64.9	2679	2536	6	7–9	12	搅	jiǎo	disturb, agitate, stir up
2680	几 16.12	2680	3186	\N	7–9	14	凳	dèng	bench; stool
2681	木 75.7	2681	2231	\N	\N	11	梭	suō	shuttle (textiles); to move back and from
2682	丨 2.2	2682	56	\N	7–9	3	丫	yā	forked; bifurcation
2683	女 38.7	2683	4687	\N	\N	10	姬	jī	beauty; imperial concubine
2684	言 149.5	2684	3799	\N	\N	7	诏	zhào	decree, proclaim; imperial decree
2685	金 167.4	2685	1535	\N	\N	9	钮	niǔ	button, knob; surname
2686	木 75.8	2686	2577	\N	7–9	12	棺	guān	coffin
2687	耳 128.4	2687	1817	\N	7–9	10	耿	gěng	bright, shining; have guts
2688	糸 120.9	2688	2819	6	7–9	12	缔	dì	tie, join, connect; connection
2689	心 61.13	2689	3382	\N	7–9	16	懈	xiè	idle, relaxed, remiss
2690	女 38.10	2690	3040	6	7–9	13	嫉	jí	jealousy; be jealous of
2691	火 86.3	2691	851	6	7–9	7	灶	zào	kitchen stove, cooking stove
2692	勹 20.2	2692	156	5	7–9	4	匀	yún	equal
2693	口 30.10	2693	5466	\N	\N	13	嗣	sì	to connect, inherit; descendants, heirs
2694	鳥 196.6	2694	2349	6	7–9	11	鸽	gē	pigeon, dove; Columba species (various)
2695	水 85.13	2695	3378	3	2	16	澡	zǎo	wash, bathe
2696	凵 17.10	2696	2605	\N	7–9	12	凿	záo	chisel; bore, pierce
2697	糸 120.4	2697	929	6	7–9	7	纬	wěi	woof; parallels of latitude
2698	水 85.5	2698	1259	6	7–9	8	沸	fèi	boil, bubble up, gush
2699	田 102.7	2699	2627	6	7–9	12	畴	chóu	farmland, arable land; category
2700	刀 18.1	2700	68	\N	\N	3	刃	rèn	edged tool, cutlery, knife edge
2701	辵 162.9	2701	2624	6	7–9	12	遏	è	stop, suppress, curb, check; a bar
2702	火 86.5	2702	1657	6	7–9	9	烁	shuò	shine, glitter, sparkle
2703	口 30.10	2703	2927	6	7–9	13	嗅	xiù	smell, scent, sniff; olfactive
2704	口 30.2	2704	247	6	7–9	5	叭	bā	trumpet
2705	火 86.11	2705	3053	5	7–9	14	熬	áo	cook down, to boil; endure
2706	目 109.12	2706	6168	\N	\N	16	瞥	piē	take fleeting glance at
2707	骨 188.6	2707	5945	\N	\N	15	骸	hái	skeleton, body; leg bone
2708	大 37.9	2708	2242	6	7–9	11	奢	shē	extravagant, wasteful; exaggerate
2709	手 64.5	2709	987	6	7–9	8	拙	zhuō	stupid, clumsy, crude; convention
2710	木 75.5	2710	1429	6	7–9	9	栋	dòng	main beams supporting house
2711	毛 82.8	2711	2672	5	7–9	12	毯	tǎn	rug, carpet, blanket
2712	木 75.6	2712	1839	\N	\N	10	桐	tóng	name applied various trees
2713	石 112.4	2713	1451	\N	7–9	9	砂	shā	sand; pebbles, gravel; gritty
2714	艸 140.8	2714	1821	\N	7–9	10	莽	mǎng	thicket, underbrush; poisonous
2715	水 85.5	2715	1255	6	7–9	8	泻	xiè	drain off, leak; flow, pour down
2716	土 32.5	2716	960	\N	7–9	8	坪	píng	level ground; Japanese measure
2717	木 75.7	2717	2228	5	7–9	11	梳	shū	comb; brush
2718	木 75.3	2718	685	\N	\N	7	杉	shān	various species of pine and fir
2719	日 72.7	2719	4813	6	7–9	11	晤	wù	have interview with; meet
2720	禾 115.8	2720	2948	6	7–9	13	稚	zhì	young, immature; childhood
2721	艸 140.11	2721	3211	5	5	15	蔬	shū	vegetables, greens
2722	虫 142.8	2722	3107	\N	7–9	14	蝇	yíng	flies
2723	手 64.7	2723	1811	6	7–9	10	捣	dǎo	hull; thresh; beat, attack
2724	頁 181.2	2724	1058	\N	7–9	8	顷	qǐng	a moment; a measure of area equal to 100 mu or 6.7 hectares; to lean
2725	麻 200.3	2725	5780	\N	\N	14	麽	mó	interrogative final particle; insignificant, small, tiny
2726	尢 43.10	2726	2883	6	7–9	13	尴	gān	embarrassed; ill at ease
2727	金 167.11	2727	6112	\N	\N	16	镖	biāo	dart, spear, harpoon; escort
2728	言 149.6	2728	4057	6	7–9	8	诧	chà	be surprised, be shocked
2729	尢 43.4	2729	705	6	7–9	7	尬	gà	limp, staggering gait; embarrass
2730	石 112.7	2730	2592	\N	\N	12	硫	liú	sulfur
2731	口 30.18	2731	3479	6	7–9	20	嚼	jué	prattle, be glib
2732	羊 123.6	2732	2740	4	7–9	12	羡	xiàn	envy, admire; praise; covet
2733	水 85.4	2733	863	\N	\N	7	沦	lún	be lost; sink, be submerged
2734	水 85.4	2734	869	\N	7–9	7	沪	hù	Shanghai; river near Shanghai
2735	日 72.3	2735	727	6	7–9	7	旷	kuàng	extensive, wide, broad; empty
2736	彡 59.8	2736	2220	\N	7–9	11	彬	bīn	cultivated, well-bred
2737	艸 140.4	2737	664	6	7–9	7	芽	yá	bud, sprout, shoot
2738	犬 94.7	2738	2004	\N	\N	10	狸	lí	fox
2739	冖 14.8	2739	2121	\N	\N	10	冥	míng	dark, gloomy, night; deep
2740	石 112.9	2740	3092	6	7–9	14	碳	tàn	carbon
2741	口 30.6	2741	1490	\N	7–9	9	咧	liě	stretch mouth, grimace, grin
2742	心 61.8	2742	2443	6	7–9	11	惕	tì	be cautious, careful, alert
2743	日 72.8	2743	2613	4	4	12	暑	shǔ	hot
2744	口 30.6	2744	4224	\N	\N	9	咯	gē	final particle
2745	艸 140.8	2745	2204	\N	7–9	11	萝	luó	type of creeping plant; turnip
2746	水 85.4	2746	864	6	7–9	7	汹	xiōng	turbulent; noisy, restless
2747	肉 130.9	2747	2970	6	7–9	13	腥	xīng	raw meat; rank, strong-smelling
2748	穴 116.8	2748	3027	\N	7–9	13	窥	kuī	peep, watch, spy on, pry
2749	人 9.8	2749	1958	\N	\N	10	俺	ǎn	personal pronoun, I
2750	水 85.12	2750	3293	\N	7–9	15	潭	tán	deep pool, lake; deep, profound
2751	山 46.8	2751	2293	\N	\N	11	崎	qí	rough, uneven, jagged, rugged
2752	鹿 198.12	2752	6485	\N	\N	23	麟	lín	female of Chinese unicorn
2753	手 64.7	2753	1804	5	6	10	捡	jiǎn	to pick up
2754	手 64.6	2754	1398	\N	7–9	9	拯	zhěng	help, save, aid; lift, raise
2755	厂 27.10	2755	5112	\N	\N	12	厥	jué	personal pronoun he, she, it
2756	水 85.12	2756	3299	6	7–9	15	澄	chéng	purify water by allowing sediment to settle; clear, pure
2757	艸 140.8	2757	2206	6	7–9	11	萎	wēi	wither, wilt
2758	口 30.6	2758	1381	\N	\N	9	哉	zāi	final exclamatory particle
2759	水 85.7	2759	2072	\N	7–9	10	涡	wō	swirl, whirlpool, eddy
2760	水 85.10	2760	3011	6	7–9	13	滔	tāo	overflow; rushing water, a torrent
2761	日 72.9	2761	2910	\N	\N	13	暇	xiá	leisure, relaxation, spare time
2762	水 85.10	2762	3017	\N	7–9	13	溯	sù	go upstream, go against current; formerly
2763	魚 195.12	2763	3483	\N	\N	20	鳞	lín	fish scales
2764	酉 164.7	2764	3088	6	7–9	14	酿	niàng	brew, ferment
2765	艸 140.6	2765	1410	\N	\N	9	茵	yīn	a cushion, mattress; wormwood; Skimmia japon
2766	心 61.9	2766	2773	\N	\N	12	愕	è	startled, alarmed, astonished
2767	目 109.9	2767	3101	\N	7–9	14	瞅	chǒu	see, look, gaze at
2768	日 72.11	2768	3067	\N	7–9	14	暮	mù	evening, dusk, sunset; ending
2769	行 144.7	2769	2964	\N	\N	13	衙	yá	public office; official residence
2770	言 149.7	2770	1704	6	7–9	9	诫	jiè	warn, admonish; warning
2771	斤 69.4	2771	1170	\N	7–9	8	斧	fǔ	axe, hatchet; chop, hew
2772	八 12.2	2772	3518	\N	\N	4	兮	xī	exclamatory particle
2773	火 86.7	2773	2409	\N	7–9	11	焕	huàn	shining
2774	木 75.8	2774	2576	6	\N	12	棕	zōng	hemp palm; palm tree
2775	人 9.5	2775	773	\N	7–9	7	佑	yòu	help, protect, bless
2776	口 30.12	2776	3237	\N	\N	15	嘶	sī	neighing of a horse; gravel voiced, husky throated; (Cant.) to hiccough
2777	女 38.4	2777	918	\N	\N	7	妓	jì	prostitute
2778	口 30.9	2778	2646	6	7–9	12	喧	xuān	lively, noisy; clamor, talk loudly
2779	艸 140.10	2779	2858	\N	\N	13	蓉	róng	hibiscus; Chengdu, Sichuan
2780	刀 18.5	2780	815	5	7–9	7	删	shān	to cut; delete
2781	木 75.11	2781	3215	\N	\N	15	樱	yīng	cherry, cherry blossom
2782	人 9.5	2782	788	6	7–9	7	伺	cì	serve, wait upon, attend; examine
2783	口 30.10	2783	2928	\N	\N	13	嗡	wēng	sound of flying bees, airplanes
2784	女 38.7	2784	2143	\N	7–9	10	娥	é	be beautiful; good; surname
2785	木 75.7	2785	2225	6	7–9	11	梢	shāo	pointed tip of something long like a branch; rudder
2786	土 32.4	2786	629	6	7–9	7	坝	bà	embankment; dam
2787	虫 142.4	2787	1777	\N	\N	10	蚕	cán	silkworms
2788	攴 66.11	2788	3219	6	7–9	15	敷	fū	spread, diffuse; apply, paint
2789	水 85.12	2789	3298	\N	7–9	15	澜	lán	overflowing; waves, ripples
2790	木 75.3	2790	684	\N	\N	7	杏	xìng	apricot; almond
2791	糸 120.7	2791	4703	\N	\N	10	绥	suí	soothe, appease, pacify
2792	冫 15.5	2792	843	\N	7–9	7	冶	yě	smelt, fuse metals; cast, found
2793	广 53.4	2793	833	6	\N	7	庇	bì	cover, shield, shelter, protect
2794	手 64.6	2794	1375	6	7–9	9	挠	náo	scratch; disturb, bother; submit
2795	手 64.9	2795	2535	6	7–9	12	搂	lǒu	hug, embrace; drag, pull
2796	人 9.8	2796	4568	\N	\N	10	倏	shū	hastily, suddenly, abruptly
2797	耳 128.4	2797	1819	\N	\N	10	聂	niè	whisper; surname
2798	女 38.8	2798	2483	\N	7–9	11	婉	wǎn	amiable, congenial; restrained
2799	口 30.13	2799	3349	6	7–9	16	噪	zào	be noisy; chirp loudly
2800	禾 115.10	2800	3264	6	7–9	15	稼	jià	sow grain; sheaves of grain
2801	魚 195.10	2801	3446	\N	\N	18	鳍	qí	fin
2802	艸 140.8	2802	2199	\N	\N	11	菱	líng	water-chestnut, water caltrop
2803	皿 108.5	2803	1779	\N	7–9	10	盏	zhǎn	small cup or container
2804	匸 23.9	2804	1776	\N	7–9	10	匿	nì	hide; go into hiding
2805	口 30.4	2805	723	\N	\N	7	吱	zhī	chirping, squeaking, hissing
2806	宀 40.10	2806	3029	6	7–9	13	寝	qǐn	sleep, rest; bed chamber
2807	手 64.9	2807	2518	\N	7–9	12	揽	lǎn	grasp, take hold of; monopolize
2808	骨 188.13	2808	3494	\N	7–9	21	髓	suǐ	bone marrow; essences, substances
2809	禾 115.3	2809	1134	\N	7–9	8	秉	bǐng	grasp, hold; bundle; authority
2810	口 30.7	2810	1894	6	7–9	10	哺	bǔ	chew food; feed
2811	矢 111.0	2811	264	\N	7–9	5	矢	shǐ	arrow, dart; vow, swear
2812	口 30.8	2812	2266	\N	\N	11	啪	pā	syllable
2813	巾 50.5	2813	1109	6	7–9	8	帜	zhì	flag, pennant; sign; fasten
2814	邑 163.5	2814	3816	\N	\N	7	邵	shào	surname; various place names
2815	口 30.11	2815	3103	4	7–9	14	嗽	sòu	cough, gargle, clear throat
2816	手 64.6	2816	1374	\N	7–9	9	挟	xié	clasp under arm; hold to bosom
2817	缶 121.3	2817	1537	\N	7–9	9	缸	gāng	earthen jug, crock, cistern
2818	手 64.9	2818	2540	6	7–9	12	揉	róu	rub, massage; crush by hand
2819	肉 130.9	2819	2968	6	7–9	13	腻	nì	greasy, oily, dirty; smooth
2820	馬 187.3	2820	592	\N	7–9	6	驯	xún	tame, docile, obedient
2821	糸 120.9	2821	2815	\N	7–9	12	缆	lǎn	hawser, heavy-duty rope, cable
2822	日 72.6	2822	1895	\N	\N	10	晌	shǎng	noon, midday; moment; unit land measurement equal to seven mou (畝), or the area that can be sown in one day
2823	疒 104.10	2823	3283	6	7–9	15	瘫	tān	paralysis, palsy, numbness
2824	貝 154.4	2824	1118	\N	7–9	8	贮	zhù	store, stockpile, hoard
2825	爪 87.4	2825	1173	6	7–9	8	觅	mì	seek; search
2826	月 74.14	2826	3422	\N	7–9	17	朦	méng	condition or appearance of moon
2827	人 9.13	2827	3271	6	7–9	15	僻	pì	out-of-the-way, remote; unorthodox
2828	阜 170.9	2828	2474	\N	\N	11	隋	suí	Sui dynasty; surname
2829	艸 140.11	2829	3069	6	7–9	14	蔓	màn	creeping plants, tendrils, vines
4082	口 30.22	4082	6496	\N	\N	25	囔	nāng	muttering, indistinct speech
2830	口 30.5	2830	1097	6	\N	8	咋	zǎ	question-forming particle, why? how? what?; to bite; loud
2831	山 46.9	2831	2647	6	7–9	12	嵌	qiàn	inlay, set in; fall into; rugged
2832	虍 141.4	2832	4491	\N	7–9	10	虔	qián	act with reverence; reverent
2833	田 102.5	2833	1899	6	7–9	10	畔	pàn	boundary path dividing fields
2834	玉 96.7	2834	2156	\N	\N	11	琐	suǒ	trifling, petty; troublesome
2835	石 112.9	2835	3090	\N	7–9	14	碟	dié	small dish, plate
2836	水 85.7	2836	2088	6	\N	10	涩	sè	astringent; harsh; uneven, rough
2837	肉 130.5	2837	1592	\N	7–9	9	胧	lóng	condition or appearance of moon
2838	口 30.12	2838	5440	\N	\N	13	嘟	dū	sound of horn tooting
2839	足 157.11	2839	3442	6	7–9	18	蹦	bèng	hop, leap, jump; bright
2840	冖 14.8	2840	4669	\N	\N	10	冢	zhǒng	burial mound, mausoleum; grand
2841	水 85.6	2841	1677	5	7–9	9	浏	liú	clear; bright; whistling
2842	衣 145.7	2842	5548	5	7–9	13	裔	yì	progeny, descendants, posterity
2843	衣 145.13	2843	3449	\N	\N	18	襟	jīn	lapel, collar
2844	口 30.2	2844	255	6	7–9	5	叨	dāo	talkative; quarrelous
2845	言 149.4	2845	562	\N	7–9	6	诀	jué	take leave of, bid farewell
2846	日 72.2	2846	502	\N	7–9	6	旭	xù	rising sun; brilliance; radiant
2847	虫 142.3	2847	1498	\N	7–9	9	虾	xiā	shrimp, prawn
2848	竹 118.13	2848	3463	\N	\N	19	簿	bù	register, account book, notebook
2849	口 30.8	2849	2289	3	3	11	啤	pí	beer
2850	手 64.13	2850	3200	\N	\N	15	擒	qín	catch, capture, seize, arrest
2851	木 75.4	2851	1040	\N	7–9	8	枣	zǎo	date tree; dates, jujubes; surname
2852	口 30.11	2852	5699	\N	\N	14	嘎	gā	sound of laughter; bad, malevolent
2853	艸 140.5	2853	1008	\N	\N	8	苑	yuàn	pasture, park, garden; mansion
2854	牛 93.2	2854	3643	\N	\N	6	牟	móu	make; seek, get; barley; low
2855	口 30.4	2855	725	6	7–9	7	呕	ǒu	vomit; annoy, enrage
2856	馬 187.6	2856	1760	\N	\N	9	骆	luò	a white horse with black mane; a camel
2857	凵 17.3	2857	229	6	7–9	5	凸	tū	protrude, bulge out, convex
2858	火 86.10	2858	3157	6	7–9	14	熄	xī	put out, extinguish, quash
2859	儿 10.1	2859	3503	\N	\N	3	兀	wù	to cut off the feet
2860	口 30.9	2860	5161	\N	\N	12	喔	ō	descriptive of crying or of crowing
2861	衣 145.8	2861	3099	6	\N	14	裳	shang	clothes; skirt; beautiful
2862	凵 17.3	2862	260	6	7–9	5	凹	āo	concave, hollow, depressed; a pass, valley
2863	貝 154.8	2863	2652	\N	7–9	12	赎	shú	buy, redeem; ransome; atone for
2864	屮 45.1	2864	103	\N	7–9	4	屯	tún	village, hamlet; camp; station
2865	肉 130.11	2865	3275	6	7–9	15	膛	táng	chest; hollow space, cavity
2866	水 85.6	2866	1667	5	7–9	9	浇	jiāo	spray, water, sprinkle
2867	火 86.3	2867	853	\N	7–9	7	灼	zhuó	burn; broil; cauterize; bright
2868	衣 145.7	2868	5409	\N	\N	13	裘	qiú	fur garments; surname
2869	石 112.5	2869	1864	\N	\N	10	砰	pēng	sound of crashing stones, bang!
2870	木 75.8	2870	2584	\N	7–9	12	棘	jí	jujube tree; thorns, brambles
2871	木 75.12	2871	3216	4	7–9	15	橡	xiàng	chestnut oak; rubber tree; rubber
2872	石 112.9	2872	3091	\N	\N	14	碱	jiǎn	alkaline, alkali, lye, salt
2873	耳 128.5	2873	2245	6	7–9	11	聋	lóng	deaf
2874	女 38.6	2874	1736	5	7–9	9	姥	lǎo	maternal grandmother; midwife
2875	玉 96.9	2875	5342	\N	\N	13	瑜	yú	flawless gem or jewel
2876	毋 80.0	2876	3527	\N	\N	4	毋	wú	do not; not; surname; rad. 80
2877	女 38.6	2877	4382	\N	\N	9	娅	yà	mutual term of address used by sons-in-law; a brother-in-law
2878	水 85.5	2878	1247	6	7–9	8	沮	jǔ	stop, prevent; defeated, dejected
2879	艸 140.8	2879	2203	6	7–9	11	萌	méng	bud, sprout
2880	人 9.7	2880	1561	\N	7–9	9	俏	qiào	like, similar; resemble; pretty
2881	音 180.12	2881	3493	\N	\N	21	黯	àn	dark, black; sullen, dreary
2882	手 64.12	2882	3064	6	7–9	14	撇	piē	discard, abandon, throw away
2883	米 119.6	2883	2583	\N	\N	12	粟	sù	unhusked millet; grain
2884	米 119.6	2884	2742	\N	7–9	12	粪	fèn	manure, dung, shit, excrement, night soil
2885	尸 44.1	2885	3524	\N	\N	4	尹	yǐn	govern; oversee; director
2886	艸 140.5	2886	1007	6	\N	8	苟	gǒu	careless, frivolous; illicit; grammatical particle: if, but, if only; surname; grass name; distinguish DKW 30853 (ji4)
2887	疒 104.16	2887	6455	\N	\N	21	癫	diān	crazy, mad; madness, mania, insan
2888	虫 142.3	2888	1501	6	\N	9	蚂	mǎ	ant; leech
2889	禸 114.4	2889	1575	\N	\N	9	禹	yǔ	legendary hsia dynasty founder
2890	广 53.11	2890	5785	\N	\N	14	廖	liào	surname; name of an ancient state
2891	人 9.7	2891	1567	6	7–9	9	俭	jiǎn	temperate, frugal, economical
2892	巾 50.5	2892	1107	6	7–9	8	帖	tiē	invitation card; notice
2893	火 86.9	2893	3000	6	7–9	13	煎	jiān	fry in fat or oil; boil in water
2894	糸 120.9	2894	2820	\N	7–9	12	缕	lǚ	thread; detailed, precise
2895	穴 116.8	2895	5593	\N	\N	13	窦	dòu	surname; hole, burrow; corrupt
2896	竹 118.11	2896	3418	\N	7–9	17	簇	cù	swarm, crowd together, cluster
2897	木 75.8	2897	2563	\N	7–9	12	棱	léng	squared timber; angle, edge
2898	口 30.2	2898	254	\N	\N	5	叩	kòu	knock, ask; kowtow, bow
2899	口 30.4	2899	738	\N	7–9	7	呐	nà	raise voice, yell out loud, shout; stammer
2900	玉 96.10	2900	5622	\N	\N	14	瑶	yáo	precious jade
2901	土 32.11	2901	3102	6	7–9	14	墅	shù	villa, country house
2902	艸 140.7	2902	1831	\N	\N	10	莺	yīng	oriole, green finch; Sylvia species (various)
2903	火 86.6	2903	2087	5	7–9	10	烫	tàng	scald, heat; wash; iron clothes
2904	虫 142.6	2904	2634	\N	7–9	12	蛙	wā	frog
2905	歹 78.0	2905	96	6	7–9	4	歹	dǎi	bad, vicious, depraved, wicked
2906	人 9.5	2906	779	6	\N	7	伶	líng	lonely, solitary; actor
2907	艸 140.9	2907	2554	\N	7–9	12	葱	cōng	scallions, leeks, green onions
2908	口 30.7	2908	1890	\N	\N	10	哮	xiāo	cough; pant; roar
2909	目 109.5	2909	4496	\N	\N	10	眩	xuàn	to confuse; dizzy, dazed, disoriented
2910	土 32.5	2910	964	\N	\N	8	坤	kūn	earth; feminine, female
2911	广 53.11	2911	2989	6	7–9	13	廓	kuò	broad, wide, open, empty; to expand
2912	言 149.4	2912	551	6	7–9	6	讳	huì	conceal; shun; regard as taboo
2913	口 30.9	2913	2645	\N	\N	12	啼	tí	weep, whimper; howl, twitter
2914	丿 4.4	2914	266	\N	\N	5	乍	zhà	first time, for the first time
2915	瓜 97.14	2915	3468	6	7–9	19	瓣	bàn	petal; segment; valves
2916	矢 111.6	2916	2310	\N	7–9	11	矫	jiǎo	correct, rectify, straighten out
2917	足 157.5	2917	2629	\N	\N	12	跋	bá	go by foot; epilogue, colophon
2918	木 75.4	2918	1017	6	7–9	8	枉	wǎng	useless, in vain; bent, crooked
2919	木 75.7	2919	2223	\N	\N	11	梗	gěng	stem of flower, branch of plant
2920	厂 27.6	2920	1047	4	6	8	厕	cè	mingle with; toilet, lavatory
2921	玉 96.8	2921	2503	6	7–9	12	琢	zuó	polish jade; cut jade
2922	言 149.2	2922	173	6	7–9	4	讥	jī	ridicule, jeer, mock; inspect
2923	釆 165.5	2923	5223	\N	\N	12	釉	yòu	glaze
2924	穴 116.8	2924	3028	\N	7–9	13	窟	kū	hole, cave; cellar; underground
2925	攴 66.7	2925	2350	\N	7–9	11	敛	liǎn	draw back, fold back; collect
2926	車 159.6	2926	4484	\N	\N	10	轼	shì	horizontal wooden bar in front
2927	广 53.4	2927	839	\N	\N	7	庐	lú	hut, cottage; name of a mountain
2928	肉 130.5	2928	1591	\N	7–9	9	胚	pēi	embryo; unfinished things
2929	口 30.5	2929	1095	6	\N	8	呻	shēn	groan, moan; recite with intonation
2930	糸 120.8	2930	2490	\N	7–9	11	绰	chuò	graceful, delicate; spacious
2931	手 64.4	2931	619	\N	\N	7	扼	è	grasp, clutch; choke, strangle
2932	心 61.18	2932	6465	\N	\N	22	懿	yì	virtuous, admirable, esteemed
2933	火 86.5	2933	4327	\N	\N	9	炯	jiǒng	bright, brilliant, clear; hot
2934	竹 118.3	2934	1554	\N	7–9	9	竿	gān	bamboo pole; penis
2935	心 61.11	2935	3170	6	7–9	14	慷	kāng	ardent; generous, magnanimous
2936	虍 141.7	2936	5430	\N	\N	13	虞	yú	concerned about, anxious, worried
2937	金 167.8	2937	2940	6	7–9	13	锤	chuí	balance weight on scale; hammer
2938	木 75.6	2938	1843	\N	7–9	10	栓	shuān	wooden peg, post or stick
2939	木 75.6	2939	2017	6	7–9	10	桨	jiǎng	oar, paddle
2940	虫 142.4	2940	1901	\N	7–9	10	蚊	wén	mosquito; gnat
2941	石 112.10	2941	3227	6	7–9	15	磅	bàng	pound; weigh
2942	子 39.17	2942	3452	\N	\N	19	孽	niè	evil; son of concubine; ghost
2943	心 61.8	2943	2440	5	7–9	11	惭	cán	ashamed, humiliated; shameful
2944	戈 62.14	2944	3451	\N	7–9	18	戳	chuō	prick, stab; stamp, seal, chop
2945	示 113.8	2945	2987	\N	\N	13	禀	bǐng	report to, petition
2946	邑 163.9	2946	2283	\N	\N	11	鄂	è	Hubei province; startled
2947	食 184.9	2947	2724	6	7–9	12	馈	kuì	offer food superior; send gift
2948	土 32.6	2948	4096	\N	\N	9	垣	yuán	low wall
2949	水 85.9	2949	2760	6	7–9	12	溅	jiàn	sprinkle, spray; spill, splash
2950	口 30.5	2950	3916	\N	\N	8	咚	dōng	onomatopoetic, a thumping sound
2951	金 167.4	2951	1525	6	7–9	9	钙	gài	calcium
2952	石 112.12	2952	3397	\N	7–9	17	礁	jiāo	reef; jetty; submerged rocks
2953	彡 59.11	2953	3149	6	7–9	14	彰	zhāng	clear, manifest, obvious
2954	谷 150.10	2954	3432	\N	7–9	17	豁	huō	open up, clear; exempt
2955	目 109.6	2955	2262	6	\N	11	眯	mī	be blinded
2956	石 112.12	2956	3398	\N	\N	17	磷	lín	phosphorus; water rushing between
2957	雨 173.4	2957	5115	\N	\N	12	雯	wén	cloud patterns, coloring of cloud
2958	土 32.12	2958	3055	6	7–9	14	墟	xū	high mound; hilly countryside; wasteland
2959	辵 162.3	2959	350	\N	\N	6	迂	yū	doctrinaire, abstruse, unrealistic
2960	目 109.13	2960	3441	6	7–9	18	瞻	zhān	look; look out for; respect
2961	頁 181.5	2961	2252	\N	\N	11	颅	lú	skull
2962	玉 96.7	2962	2158	\N	\N	11	琉	liú	sparkling stone; glazed, opaque
2963	心 61.8	2963	2441	6	7–9	11	悼	dào	grieve, mourn, lament; grieved
2964	虫 142.9	2964	3246	5	\N	15	蝴	hú	butterfly
2965	手 64.5	2965	961	6	7–9	8	拣	jiǎn	choose; select; pick up; gather
2966	水 85.9	2966	2755	6	7–9	12	渺	miǎo	endlessly long, boundless, vast
2967	目 109.6	2967	2401	\N	\N	11	眷	juàn	take interest in, care for
2968	心 61.7	2968	2095	\N	\N	10	悯	mǐn	pity, sympathize with, grieve for
2969	水 85.4	2969	858	6	7–9	7	汰	tài	excessive; scour, wash out
2970	心 61.10	2970	5589	\N	7–9	13	慑	shè	afraid, scared, fearful
2971	女 38.8	2971	2482	\N	\N	11	婶	shěn	wife of father's younger brother
2972	文 67.8	2972	5122	\N	\N	12	斐	fěi	graceful, elegant, beautiful
2973	口 30.11	2973	5715	\N	\N	14	嘘	xū	exhale; blow out; deep sigh; hiss; praise
2974	金 167.17	2974	3497	6	7–9	22	镶	xiāng	insert, inlay, set, mount; fill
2975	火 86.4	2975	1236	\N	\N	8	炕	kàng	the brick-bed in northern China
2976	宀 40.6	2976	1696	\N	\N	9	宦	huàn	officialdom, government official
2977	足 157.2	2977	1493	6	7–9	9	趴	pā	lying prone, leaning over
2978	糸 120.8	2978	2494	\N	7–9	11	绷	běng	bind, draw firmly, strap
2979	穴 116.7	2979	2787	\N	7–9	12	窘	jiǒng	embarrassed; hard-pressed
2980	衣 145.11	2980	6286	\N	\N	17	襄	xiāng	aid, help, assist; undress
2981	玉 96.5	2981	4089	\N	\N	9	珀	pò	amber
2982	口 30.15	2982	3443	\N	\N	18	嚣	xiāo	be noisy; treat with contempt
2983	手 64.5	2983	\N	\N	\N	8	拚	pàn	risk, disregard; go all out for
2984	酉 164.3	2984	1857	6	7–9	10	酌	zhuó	serve wine; feast; deliberate
2985	水 85.6	2985	1668	6	7–9	9	浊	zhuó	muddy, turbid, dirty, filthy
2986	毋 80.9	2986	5754	\N	\N	14	毓	yù	give birth to; bring up, educate
2987	手 64.13	2987	3315	6	7–9	16	撼	hàn	move, shake; (Cant.) to fight
2988	口 30.10	2988	2902	\N	7–9	13	嗜	shì	be fond of, have weakness for
2989	手 64.3	2989	354	6	7–9	6	扛	káng	carry on shoulders; lift
2990	山 46.7	2990	1919	6	\N	10	峭	qiào	steep, precipitous, rugged
2991	石 112.10	2991	3225	6	7–9	15	磕	kē	hit; collide, knock into; sound
2992	羽 124.6	2992	2601	6	7–9	12	翘	qiào	turn up, lift, elevate, raise
2993	木 75.11	2993	3214	\N	7–9	15	槽	cáo	trough; manger; vat, tank; groove; a distillery
2994	水 85.8	2994	2419	\N	7–9	11	淌	tǎng	trickle; flow down; drip
2995	木 75.5	2995	1433	\N	\N	9	栅	zhà	fence; palisade; grid
2996	頁 181.7	2996	2950	\N	7–9	13	颓	tuí	ruined, decayed; disintegrate
2997	火 86.10	2997	3119	6	7–9	14	熏	xūn	smoke, fog, vapor; smoke, cure
2998	玉 96.9	2998	5046	\N	\N	12	瑛	yīng	luster of gem; crystal
2999	頁 181.7	2999	5391	\N	\N	13	颐	yí	cheeks; jaw; chin; rear; to nourish
3000	心 61.3	3000	3629	\N	\N	6	忖	cǔn	guess, suppose, conjecture
3001	牛 93.3	3001	759	\N	7–9	7	牡	mǔ	male of animals; bolt of door
3002	糸 120.8	3002	2499	6	7–9	11	缀	zhuì	patch together, link, connect
3003	彳 60.6	3003	1581	6	7–9	9	徊	huái	linger, walk to and fro, hesitain
3004	木 75.7	3004	2313	5	5	11	梨	lí	pear; opera; cut, slash
3005	肉 130.4	3005	1188	6	7–9	8	肪	fáng	animal fat
3006	水 85.7	3006	2083	6	7–9	10	涕	tì	tear; snivel, nasal mucus
3007	夂 34.9	3007	2722	6	7–9	12	惫	bèi	tired, weary, fatigued
3008	手 64.11	3008	3068	\N	\N	14	摹	mó	trace, copy, duplicate; pattern
3009	足 157.9	3009	3343	\N	\N	16	踱	duó	stroll, pace, walk slowly
3010	肉 130.3	3010	806	\N	\N	7	肘	zhǒu	the elbow; help a person shoulder a load
3011	火 86.10	3011	3158	\N	\N	14	熔	róng	melt, smelt, fuse; mold
3012	手 64.6	3012	1808	6	7–9	10	挚	zhì	sincere, warm, cordial; surname
3013	气 84.8	3013	2673	\N	\N	12	氯	lǜ	chlorine
3014	冫 15.13	3014	3284	\N	\N	15	凛	lǐn	to shiver with cold or fear
3015	糸 120.5	3015	1349	6	7–9	8	绎	yì	to unravel or unreel silk; to interpret
3016	广 53.8	3016	2378	\N	\N	11	庶	shù	numerous, various; multitude
3017	肉 130.7	3017	2357	\N	\N	11	脯	pú	dried meat; preserved fruits
3018	辵 162.5	3018	1123	\N	7–9	8	迭	dié	repeatedly, frequently
3019	目 109.8	3019	2897	6	7–9	13	睦	mù	friendly, amiable, peaceful
3020	穴 116.5	3020	2103	6	7–9	10	窍	qiào	hole, opening, aperture
3021	米 119.6	3021	2803	6	6	12	粥	zhōu	rice gruel, congee
3022	广 53.8	3022	2380	\N	\N	11	庵	ān	Buddhist monastery or nunnery
3023	水 85.4	3023	866	6	7–9	7	沧	cāng	blue, dark green; cold
3024	心 61.5	3024	1747	6	7–9	9	怠	dài	idle, remiss, negligent; neglect
3025	水 85.4	3025	872	\N	\N	7	沁	qìn	soak into, seep in, percolate
3026	大 37.6	3026	4306	\N	\N	9	奕	yì	in sequence, orderly; abundant
3027	口 30.5	3027	1089	6	7–9	8	咙	lóng	throat
3028	气 84.6	3028	1937	\N	\N	10	氨	ān	ammonia; hydrogen nitride
3029	目 109.19	3029	3500	\N	\N	24	矗	chù	straight, upright, erect, lofty
3030	皿 108.6	3030	2243	\N	\N	11	盔	kuī	helmet; bowl; basin
3031	手 64.5	3031	994	\N	\N	8	拇	mǔ	thumb; big toe
3032	水 85.4	3032	857	6	7–9	7	沛	pèi	abundant, full, copious; sudden
3033	木 75.10	3033	5662	\N	\N	14	榻	tà	cot, couch, bed
3034	手 64.9	3034	2525	\N	7–9	12	揣	chuāi	put things under clothes
3035	山 46.8	3035	2294	6	7–9	11	崭	zhǎn	high, steep, precipitous; new
3036	革 177.7	3036	6047	\N	\N	16	鞘	qiào	scabbard, sheath
3037	革 177.8	3037	3391	6	7–9	17	鞠	jū	bow, bend; rear, raise, nourish
3038	土 32.6	3038	1719	\N	7–9	9	垦	kěn	cultivate, reclaim, to farm land
3039	水 85.6	3039	1674	6	7–9	9	洽	qià	to blend with, be in harmony; to penetrate; to cover; a river in Shenxi
3040	口 30.8	3040	2287	6	7–9	11	唾	tuò	spit, spit on; saliva
3041	木 75.12	3041	3330	\N	7–9	16	橱	chú	cabinet, wardrobe, cupboard
3042	人 9.3	3042	3542	\N	\N	5	仕	shì	official; serve government
3043	虫 142.8	3043	3108	\N	\N	14	蜘	zhī	spider
3044	疒 104.8	3044	2991	\N	7–9	13	痰	tán	phlegm, mucus, spittle
3045	衣 145.5	3045	2115	4	4	10	袜	wà	socks, stockings
3046	山 46.6	3046	4230	\N	7–9	9	峙	zhì	stand erect, stand up; pile up
3047	木 75.5	3047	1442	6	7–9	9	柬	jiǎn	letter, invitation; choose
3048	虫 142.8	3048	3109	\N	\N	14	蝉	chán	cicada; continuous
3049	虫 142.13	3049	3464	\N	\N	19	蟹	xiè	crab, brachyura
3050	言 149.9	3050	4995	\N	\N	11	谏	jiàn	remonstrate, admonish
3051	鳥 196.7	3051	2640	\N	\N	12	鹃	juān	cuckoo
3052	手 64.13	3052	3324	6	7–9	16	擎	qíng	lift up, hold up, support
3053	白 106.7	3053	2698	\N	\N	12	皓	hào	bright, luminous; clear; hoary
3054	月 74.6	3054	4595	\N	\N	10	朕	zhèn	I; we; subtle
3055	疒 104.4	3055	1628	6	\N	9	疤	bā	scar, cicatrix; birthmark
3056	禸 114.4	3056	4195	\N	\N	9	禺	yú	district; mountain in Zhejiang
3057	金 167.6	3057	2308	\N	7–9	11	铲	chǎn	spade, shovel, trowel, scoop
3058	酉 164.7	3058	5673	\N	\N	14	酶	méi	enzymes; (Cant.) soft
4083	虫 142.7	4083	2636	\N	\N	12	蜓	tíng	dragonfly
3059	金 167.4	3059	1526	6	\N	9	钝	dùn	blunt, obtuse; dull; flat; dull-witted
3060	氏 83.4	3060	1226	6	7–9	8	氓	máng	people; subjects; vassals
3061	匚 22.5	3061	692	\N	\N	7	匣	xiá	small box, case, coffer
3062	弓 57.5	3062	1312	\N	7–9	8	弧	hú	wooden bow; arc, crescent
3063	山 46.7	3063	1920	\N	\N	10	峨	é	lofty
3064	金 167.8	3064	2941	\N	\N	13	锥	zhuī	gimlet, awl, drill, auger; bore
3065	手 64.9	3065	2527	\N	7–9	12	揪	jiū	grasp with hand, pinch
3066	木 75.3	3066	679	6	7–9	7	杠	gāng	lever, pole, crowbar; sharpen
3067	口 30.4	3067	746	\N	7–9	7	吭	kēng	throat
3068	山 46.8	3068	2300	\N	7–9	11	崛	jué	towering, eminent; rise abruptly
3069	言 149.7	3069	1706	6	\N	9	诬	wū	make false accusation; defame
3070	冂 13.3	3070	258	\N	\N	5	冉	rǎn	tender; weak; proceed gradually
3071	手 64.4	3071	659	6	7–9	7	抒	shū	express; eliminate; relieve
3072	广 53.5	3072	1219	\N	\N	8	庚	gēng	7th heavenly stem
3073	心 61.7	3073	2093	\N	\N	10	悍	hàn	courageous, brave; violent
3074	非 175.11	3074	3466	\N	\N	19	靡	mí	divide, disperse, scatter
3075	日 72.7	3075	2269	\N	\N	11	晦	huì	dark, unclear, obscure; night
3076	酉 164.8	3076	3222	5	6	15	醋	cù	vinegar; jealousy, envy
3077	土 32.14	3077	6201	\N	\N	17	壕	háo	trench, ditch, channel, moat
3078	金 167.8	3078	2944	\N	7–9	13	锯	jù	a saw; to saw; amputate
3079	大 37.1	3079	126	\N	\N	4	夭	yāo	young, fresh-looking; die young
3080	口 30.6	3080	4202	\N	\N	9	咦	yí	exclamation of surprise
3081	人 9.6	3081	1152	6	7–9	8	侈	chǐ	luxurious, extravagant
3082	女 38.8	3082	5020	\N	\N	11	婢	bì	servant girl; your servant
3083	犬 94.10	3083	2720	5	7–9	12	猾	huá	crafty, cunning, shrewd; deceitful
3084	彳 60.8	3084	2339	6	7–9	11	徘	pái	walk back and forth, hesitate
3085	石 112.7	3085	2590	\N	\N	12	硝	xiāo	saltpeter, niter; to tan
3086	火 86.10	3086	3159	\N	7–9	14	煽	shān	stir up, incite, agitate, provoke
3087	白 106.2	3087	787	5	7–9	7	皂	zào	soap; black; menial servant
3088	舟 137.5	3088	2346	\N	7–9	11	舵	duò	rudder, helm
3089	口 30.10	3089	2904	6	7–9	13	嗦	suo	suck
3090	犬 94.4	3090	813	6	7–9	7	狈	bèi	a legendary animal with short forelegs which rode a wolf
3091	革 177.4	3091	2849	\N	7–9	13	靴	xuē	boots
3092	手 64.7	3092	1785	\N	7–9	10	捂	wǔ	resist
3093	疒 104.4	3093	1625	\N	\N	9	疮	chuāng	tumor, boil, sore, wound
3094	邑 163.7	3094	4103	\N	\N	9	郝	hǎo	surname; place in modern Shanxi
3095	艸 140.5	3095	1001	\N	7–9	8	苛	kē	small, petty; harsh, rigorous
3096	禾 115.6	3096	2315	\N	7–9	11	秽	huì	dirty, unclean; immoral, obscene
3097	艸 140.6	3097	4108	\N	\N	9	茜	qiàn	madder, rubia cordifolia; reeds
3098	手 64.10	3098	2534	6	7–9	12	搓	cuō	to rub or roll between the hands
3099	艸 140.4	3099	3661	\N	\N	7	芸	yún	rue, herb used to keep insects away; to cut grass or weeds; art, talent, ability, craft, technique, performance, acting, trick, stunt
3100	酉 164.6	3100	2986	5	6	13	酱	jiàng	any jam-like or paste-like food
3101	貝 154.6	3101	1965	6	7–9	10	赁	lìn	rent, hire; hired person
3102	木 75.13	3102	3395	\N	\N	17	檐	yán	eaves of house; brim, rim
3103	食 184.6	3103	4299	\N	\N	9	饷	xiǎng	rations and pay for soldiers
3104	艸 140.12	3104	3209	3	3	15	蕉	jiāo	banana; plantain
3105	金 167.5	3105	4536	\N	\N	10	铀	yóu	uranium
3106	艸 140.5	3106	1015	\N	\N	8	苔	tái	moss, lichen
3107	赤 155.4	3107	2172	\N	\N	11	赦	shè	forgive, remit, pardon
3108	糸 120.9	3108	2817	\N	\N	12	缎	duàn	satin
3109	舟 137.5	3109	4918	\N	\N	11	舷	xián	the sides of a boat, bulwarks; a gunwale
3110	竹 118.7	3110	2955	3	2	13	筷	kuài	chopsticks
3111	月 74.6	3111	4635	\N	\N	10	朔	shuò	first day of lunar month; the north
3112	女 38.8	3112	2222	6	7–9	11	婪	lán	covet; covetous, avaricious
3113	糸 120.4	3113	2036	6	7–9	10	紊	wěn	confused, disorder
3114	厂 27.12	3114	5675	\N	\N	14	厮	sī	servant; to make a disturbance
3115	女 38.9	3115	2812	\N	7–9	12	婿	xù	son-in-law; husband
3116	宀 40.11	3116	3176	\N	7–9	14	寥	liáo	few, scarce; empty, deserted
3117	儿 10.12	3117	3077	6	7–9	14	兢	jīng	fearful, cautious, wary
3118	米 119.11	3118	3373	5	7–9	16	糙	cāo	coarse, harsh, rough, unpolished rice
3119	卜 25.6	3119	954	\N	7–9	8	卦	guà	fortune telling; tell fortunes
3120	木 75.10	3120	2868	\N	7–9	13	槐	huái	locust tree
3121	手 64.2	3121	201	6	7–9	5	扒	bā	scratch; dig up; crawl; crouch
3122	衣 145.8	3122	5688	\N	\N	14	裴	péi	surname; look of a flowing gown
3123	示 113.3	3123	891	\N	7–9	7	祀	sì	to sacrifice, worship
3124	土 32.7	3124	4413	\N	\N	10	埔	bù	plain, arena; port, market
3125	糸 120.6	3125	2809	\N	7–9	12	絮	xù	waste cotton, raw silk or cotton
3126	艸 140.4	3126	676	\N	7–9	7	芭	bā	plantain or banana palm; fragrant
3127	尸 44.5	3127	1307	5	7–9	8	屉	tì	drawer; tray; pad; screen
3128	疒 104.7	3128	2733	6	7–9	12	痪	huàn	paralysis, numbness of limbs
3129	雨 173.7	3129	3230	\N	\N	15	霄	xiāo	sky; clouds, mist; night
3130	糸 120.8	3130	2497	\N	7–9	11	绽	zhàn	ripped seam, rend, crack
3131	宀 40.7	3131	2100	6	7–9	10	宵	xiāo	night, evening, dark
3132	邑 163.0	3132	748	\N	\N	7	邑	yì	area, district, city, state
3133	雨 173.8	3133	6076	\N	\N	16	霖	lín	long spell of rain, copious rain
3134	山 46.4	3134	802	6	7–9	7	岔	chà	diverge, branch off; fork in road
3135	食 184.6	3135	1610	\N	7–9	9	饵	ěr	bait; bait, entice; dumplings
3136	艸 140.5	3136	1013	\N	6	8	茄	jiā	eggplant
3137	韋 178.3	3137	610	6	7–9	7	韧	rèn	strong and pliable, resilient
3138	玉 96.8	3138	5045	\N	\N	12	琪	qí	type of jade
3139	邑 163.5	3139	3749	\N	\N	7	邹	zōu	name of an ancient state; surname
3140	玉 96.9	3140	5340	\N	\N	13	瑚	hú	coral; person of virtue
3141	心 61.12	3141	3289	6	7–9	15	憋	biē	to suppress inner feelings; hasty
3142	歹 78.5	3142	4177	\N	\N	9	殆	dài	dangerous, perilous; endanger
3143	口 30.12	3143	5935	\N	\N	15	噜	lū	verbose, talkative; mumbling
3144	心 61.3	3144	3689	\N	\N	7	忒	tè	excessive; too; very-usually of objectionable things; to err; to mistake; changeable
3145	心 61.4	3145	1179	\N	\N	8	忿	fèn	get angry; fury, exasperation
3146	血 143.5	3146	2338	6	7–9	11	衅	xìn	consecrate sacrificial vessels by smearing blood; rift
3147	水 85.8	3147	2427	\N	\N	11	淳	chún	honest, simple, unsophisticated; cyanogen; ethane dinitrile
3148	心 61.7	3148	2090	\N	\N	10	悖	bèi	be contradictory to, go counter
3149	髟 190.4	3149	5630	5	7–9	14	髦	máo	flowing hair of young child
3150	子 39.4	3150	3801	\N	\N	7	孜	zī	be as diligent as possible
3151	米 119.6	3151	2700	\N	7–9	12	粤	yuè	Guangdong and Guangxi provinces; initial particle
3152	阜 170.10	3152	2807	6	7–9	12	隘	ài	narrow, confined; a strategic pass
3153	水 85.13	3153	3377	6	\N	16	濒	bīn	approach, be on verge of; near
3154	金 167.8	3154	4881	\N	\N	11	铮	zhēng	clanging sound; small gong
3155	田 102.8	3155	2912	\N	7–9	13	畸	jī	odd, fractional, remainder, odds
3156	刀 18.8	3156	1896	6	7–9	10	剔	tī	pick out; scrape off; scrape meat
3157	土 32.4	3157	3655	\N	\N	7	坞	wù	entrenchment, bank, low wall
3158	竹 118.11	3158	3360	\N	\N	16	篱	lí	bamboo or wooden fence; hedge
3159	水 85.8	3159	2431	6	7–9	11	淀	diàn	shallow water, swamp; swampy
3160	馬 187.10	3160	5373	\N	\N	13	蓦	mò	suddenly, quickly, abruptly
3161	口 30.8	3161	2281	\N	7–9	11	唬	hǔ	to intimidate; to scare
3162	金 167.8	3162	2939	\N	\N	13	锣	luó	gong
3163	水 85.2	3163	3553	\N	\N	5	汀	tīng	sandbar, beach, bank, shore
3164	足 157.4	3164	2274	\N	\N	11	趾	zhǐ	toe; tracks, footprints
3165	糸 120.9	3165	2816	6	7–9	12	缉	jī	to sew in close stitches
3166	女 38.11	3166	5833	\N	7–9	14	嫦	cháng	name of a moon goddess
3167	斗 68.9	3167	2846	6	\N	13	斟	zhēn	to pour wine or tea into a cup; to gauge
3168	革 177.6	3168	3208	\N	\N	15	鞍	ān	saddle; any saddle-shaped object
3169	手 64.4	3169	634	\N	7–9	7	扳	bān	pull; drag; right itself
3170	手 64.6	3170	1385	\N	7–9	9	拴	shuān	bind with rope, fasten
3171	言 149.5	3171	3796	\N	\N	7	诅	zǔ	curse; swear, pledge
3172	言 149.10	3172	5303	\N	\N	12	谟	mó	scheme, plan; plan; be without
3173	口 30.4	3173	3703	\N	\N	7	呃	è	belch; hiccup
3174	心 61.14	3174	3431	\N	\N	17	懦	nuò	weak, timid, cowardly
3175	辵 162.7	3175	1886	\N	7–9	10	逞	chěng	indulge oneself; brag, show off
3176	牛 93.7	3176	2314	\N	\N	11	犁	lí	plow
3177	心 61.3	3177	3630	\N	\N	6	忏	chàn	regret, repent; confess sins
3178	手 64.5	3178	985	6	7–9	8	拧	níng	pinch; twist, wring; determined
3179	亠 8.4	3179	524	\N	\N	6	亥	hài	12th terrestrial branch
3180	人 9.5	3180	3733	\N	\N	7	佟	tóng	a name
3181	口 30.2	3181	3539	\N	\N	5	叱	chì	scold, shout at, bawl out
3182	舛 136.6	3182	5225	\N	\N	12	舜	shùn	legendary ruler
3183	糸 120.5	3183	1346	\N	\N	8	绊	bàn	loop, catch; fetter, shackle
3184	龍 212.6	3184	4801	\N	\N	11	龚	gōng	give, present; reverential
3185	肉 130.9	3185	2971	\N	\N	13	腮	sāi	lower part of face; jaw; gills of a fish
3186	邑 163.5	3186	3743	\N	\N	7	邸	dǐ	official residence, residence of
3187	木 75.8	3187	2570	5	7–9	12	椒	jiāo	pepper, spices
3188	艸 140.11	3188	3076	6	\N	14	蔚	wèi	luxuriant, thick; ornamental
3189	水 85.9	3189	5277	\N	\N	12	湛	zhàn	deep; profound; clear; tranquil, placid
3190	犬 94.6	3190	4294	\N	\N	9	狩	shòu	winter hunting; imperial tour
3191	目 109.6	3191	2258	6	\N	11	眶	kuàng	eye socket; rim of eye
3192	木 75.5	3192	1425	\N	\N	9	栈	zhàn	warehouse; tavern, inn
3193	艸 140.13	3193	3323	\N	\N	16	薇	wēi	Osmunda regalis, a species of fern
3194	肉 130.4	3194	1187	\N	\N	8	肮	āng	dirty
3195	水 85.15	3195	3448	6	7–9	18	瀑	pù	waterfall, cascade; heavy rain
3196	水 85.9	3196	2753	6	7–9	12	渣	zhā	refuse, dregs, lees, sediment
3197	衣 145.8	3197	3031	\N	\N	13	褂	guà	jacket, overcoat, coat; gown
3198	口 30.2	3198	251	\N	\N	5	叽	jī	sigh in disapproval; take small
3199	肉 130.13	3199	3433	\N	\N	17	臀	tún	buttocks
3200	女 38.4	3200	3813	\N	\N	7	妞	niū	girl
3201	山 46.18	3201	3481	\N	\N	20	巍	wēi	high, lofty, majestic, eminent
3202	口 30.7	3202	4500	\N	\N	10	唔	wú	hold in mouth; bite; (Cant.) not, negation
3203	疒 104.3	3203	1215	\N	\N	8	疚	jiù	chronic disease, chronic illness; sorrow
3204	魚 195.7	3204	3276	\N	\N	15	鲤	lǐ	carp
3205	戈 62.2	3205	352	\N	\N	6	戎	róng	arms, armaments; military affair
3206	聿 129.8	3206	3178	\N	7–9	14	肇	zhào	begin, commence, originate
3207	竹 118.3	3207	4255	\N	\N	9	笃	dǔ	deep, true, sincere, genuine
3208	車 159.12	3208	3339	6	7–9	16	辙	zhé	wagon ruts, wheel tracks
3209	女 38.7	3209	4693	\N	\N	10	娴	xián	elegant, refined; skillful
3210	阜 170.4	3210	3639	\N	\N	6	阮	ruǎn	ancient musical instrument: surname
3211	木 75.1	3211	3532	\N	\N	5	札	zhá	letter, note; correspondence
3212	心 61.13	3212	3302	\N	\N	15	懊	ào	vexed, worried, nervous; regret
3213	火 86.7	3213	4711	\N	\N	11	焘	dào	shine, illuminate; cover, envelope
3214	心 61.6	3214	1689	\N	7–9	9	恤	xù	show pity; relieve, help
3215	疒 104.5	3215	2030	\N	\N	10	疹	zhěn	measles; rash; fever
3216	水 85.11	3216	3160	6	7–9	14	潇	xiāo	sound of beating wind and rain
3217	金 167.6	3217	2305	\N	7–9	11	铝	lǚ	aluminum
3218	水 85.7	3218	2079	\N	7–9	10	涤	dí	wash, cleanse, purify; sweep
3219	心 61.6	3219	1684	\N	\N	9	恃	shì	rely on, presume on, trust to
3220	口 30.9	3220	5158	\N	\N	12	喽	lóu	used in onomatopoetic expressions
3221	石 112.4	3221	1450	\N	7–9	9	砌	qì	to build, pile up; stone steps, brick walk
3222	辵 162.9	3222	5216	\N	\N	12	遁	dùn	hide, conceal oneself; escape
3223	木 75.9	3223	7497	\N	\N	13	楞	léng	used for Ceylon in Buddhist texts
3224	阜 170.4	3224	3638	6	7–9	6	阱	jǐng	pitfall, trap, snare
3225	口 30.5	3225	3989	\N	\N	8	咎	jiù	fault, defect; error, mistake
3226	水 85.6	3226	1662	\N	\N	9	洼	wā	hollow; pit; depression; swamp
3227	火 86.5	3227	4324	\N	\N	9	炳	bǐng	bright, luminous; glorious
3228	口 30.13	3228	6105	\N	\N	16	噬	shì	bite; gnaw; snap at
3229	木 75.4	3229	1028	\N	\N	8	枫	fēng	maple tree
3230	手 64.6	3230	1368	\N	\N	9	拷	kǎo	torture and interrogate; hit
3231	口 30.6	3231	1511	6	7–9	9	哆	duō	tremble, shiver, shudder, quiver
3232	石 112.2	3232	3686	\N	\N	7	矶	jī	jetty; submerged rock; eddy
3233	艸 140.4	3233	663	\N	\N	7	苇	wěi	reed
3234	羽 124.9	3234	3305	\N	\N	15	翩	piān	fly, flutter
3235	穴 116.6	3235	2456	\N	7–9	11	窒	zhì	stop up, obstruct
3236	人 9.6	3236	3966	\N	\N	8	侬	nóng	I; you; family name
3237	革 177.4	3237	2850	\N	7–9	13	靶	bǎ	target; splashboard on chariot
3238	肉 130.6	3238	1993	\N	\N	10	胰	yí	pancreas; soap
3239	艸 140.4	3239	662	\N	\N	7	芜	wú	luxurious growth of weeds
3240	辛 160.10	3240	3426	6	7–9	17	辫	biàn	braid; pigtail, plait, queue
3241	口 30.14	3241	3413	\N	\N	17	嚎	háo	cry loudly, yell, scream
3242	女 38.5	3242	4001	\N	\N	8	妾	qiè	concubine
3243	巾 50.10	3243	2935	\N	\N	13	幌	huǎng	curtain, cloth screen
3244	足 157.7	3244	5703	\N	\N	14	踉	liáng	hop, jump; hurriedly, urgently
3245	人 9.5	3245	776	\N	\N	7	佃	diàn	tenant farmer; be a tenant farmer
3246	艸 140.9	3246	2545	\N	\N	12	葫	hú	bottle-gourd
3247	白 106.7	3247	2699	\N	\N	12	皖	wǎn	Anhui province
3248	手 64.6	3248	1380	6	7–9	9	拽	zhuāi	drag, tow; throw; twist
3249	水 85.10	3249	3009	6	7–9	13	滤	lǜ	strain out, filter
3250	目 109.8	3250	2901	6	7–9	13	睬	cǎi	notice; pay attention to
3251	人 9.7	3251	4272	\N	\N	9	俞	yú	surname; consent, approve
3252	匕 21.0	3252	13	\N	\N	2	匕	bǐ	spoon, ladle; knife, dirk
3253	言 149.10	3253	2797	6	7–9	12	谤	bàng	slander, libel
3254	口 30.10	3254	5475	\N	\N	13	嗤	chī	laugh at, ridicule, sneer; snort
3255	手 64.7	3255	1792	6	7–9	10	捍	hàn	ward off, guard against, defend
3256	子 39.11	3256	3137	\N	7–9	14	孵	fū	sit on eggs, hatch
3257	人 9.8	3257	4571	\N	\N	10	倪	ní	feeble, tiny, young and weak
3258	疒 104.11	3258	3368	6	7–9	16	瘾	yǐn	rash; addiction, craving, habit
3259	攴 66.8	3259	4955	\N	\N	11	敝	bì	break, destroy; broken, tattered
3260	匚 22.4	3260	3563	\N	\N	6	匡	kuāng	correct, restore, revise
3261	石 112.10	3261	5680	6	7–9	14	磋	cuō	polish, buff; scrutinize
3262	糸 120.8	3262	5027	\N	\N	11	绫	líng	thin silk, damask silk
3263	水 85.8	3263	2422	6	7–9	11	淆	xiáo	confused, in disarray, mixed up
3264	儿 10.4	3264	406	\N	\N	6	尧	yáo	a legendary ancient emperor-sage
3265	艸 140.12	3265	3210	\N	\N	15	蕊	ruǐ	unopened flowers, flower buds
3266	火 86.6	3266	2058	6	7–9	10	烘	hōng	bake, roast; dry by fire
3267	玉 96.11	3267	5856	\N	\N	15	璋	zhāng	jade plaything; jade ornament
3268	亠 8.2	3268	162	\N	\N	4	亢	kàng	high, proud; violent, excessive; skilled; name
3269	車 159.1	3269	224	\N	\N	5	轧	yà	crush by weight; grind
3270	貝 154.6	3270	1926	6	7–9	10	赂	lù	bribe; give present
3271	虫 142.9	3271	3250	\N	\N	15	蝗	huáng	kind of locust
3272	木 75.9	3272	2869	\N	\N	13	榆	yú	elm tree
3273	馬 187.7	3273	2154	\N	7–9	10	骏	jùn	excellent horse, noble steed
3274	言 149.6	3274	4051	\N	\N	8	诛	zhū	execute, kill, put to death; punish
3275	勹 20.1	3275	49	4	6	3	勺	sháo	spoon, ladle; unit of volume
3276	木 75.7	3276	4770	\N	\N	11	梵	fàn	Buddhist, Sanskrit
3277	火 86.5	3277	4326	\N	\N	9	炽	chì	burning-hot, intense; to burn, blaze; splendid, illustrious
3278	竹 118.5	3278	4898	\N	\N	11	笠	lì	bamboo hat; bamboo covering
3279	頁 181.6	3279	5221	\N	\N	12	颌	hé	mouth; jaw
3280	門 169.5	3280	1227	\N	7–9	8	闸	zhá	sluice; flood gate, canal lock
3281	犬 94.5	3281	3988	\N	\N	8	狒	fèi	baboon
3282	木 75.11	3282	5888	\N	\N	15	樊	fán	a railing; a fence an enclosed place
3283	金 167.10	3283	7790	\N	\N	15	镕	róng	fuse, melt, smelt; mold
3284	土 32.6	3284	1384	\N	\N	9	垢	gòu	dirt, filth, stains; dirty
3285	疒 104.10	3285	3146	\N	7–9	14	瘟	wēn	epidemic, plague, pestilence
3286	糸 120.11	3286	5847	\N	\N	14	缪	móu	wind around, bind; prepare
3287	艸 140.8	3287	2218	\N	7–9	11	菇	gū	mushrooms
3288	玉 96.8	3288	5047	\N	\N	12	琦	qí	gem, precious stone, jade
3289	刀 18.7	3289	1661	\N	7–9	9	剃	tì	shave
3290	辵 162.8	3290	4321	6	\N	9	迸	bèng	gush out; burst forth; split
3291	水 85.10	3291	3020	\N	\N	13	溺	nì	drown; submerge in water; indulge
3292	火 86.5	3292	1659	6	7–9	9	炫	xuàn	shine, glitter; show off, flaunt
3293	心 61.8	3293	4990	\N	\N	11	惚	hū	absent-minded, confused
3294	口 30.10	3294	5473	6	\N	13	嗨	hāi	an exclamation
3295	阜 170.7	3295	1731	\N	7–9	9	陨	yǔn	fall, slip; let fall; die
3296	貝 154.6	3296	1927	\N	7–9	10	赃	zāng	booty, loot, stolen goods; bribe
3297	网 122.12	3297	6237	\N	\N	17	羁	jī	halter; restrain, hold, control
3298	至 133.10	3298	6081	\N	\N	16	臻	zhēn	reach, arrive; utmost, superior
3299	口 30.11	3299	3111	\N	\N	14	嘀	dí	backbite
3300	肉 130.12	3300	6136	\N	7–9	16	膳	shàn	meals, provisions, board
3301	貝 154.17	3301	3495	\N	\N	21	赣	gàn	Jiangxi province; places therein
3302	足 157.7	3302	5702	\N	\N	14	踌	chóu	hesitate, falter; smug, self-satisfied
3303	歹 78.6	3303	1873	\N	\N	10	殉	xùn	die for cause, be martyr for
3304	木 75.6	3304	1836	5	\N	10	桔	jú	Chinese bellflower; well-swept; the inner fibers of corn-stalks
3305	目 109.13	3305	6328	\N	\N	18	瞿	qú	surname
3306	門 169.6	3306	1637	\N	\N	9	闽	mǐn	fujian province; a river; a tribe
3307	豕 152.4	3307	2358	\N	\N	11	豚	tún	small pig, suckling pig; suffle
3308	手 64.8	3308	2191	\N	7–9	11	掺	càn	mix, blend, adulterate
3309	水 85.4	3309	3770	\N	\N	7	沌	dùn	chaotic, confused; turbid, murky
3310	心 61.9	3310	2772	6	7–9	12	惰	duò	indolent, careless, lazy, idle
3311	口 30.9	3311	2619	\N	\N	12	喳	zhā	whispering
3312	木 75.8	3312	2579	6	\N	12	椭	tuǒ	oval-shaped, elliptical, tubular
3313	口 30.6	3313	1514	\N	\N	9	咪	mī	sound for calling a cat
3314	雨 173.8	3314	3338	\N	\N	16	霎	shà	light rain, drizzle; an instant; passing
3315	人 9.6	3315	3958	6	7–9	8	侃	kǎn	upright and strong; amiable
3316	犬 94.8	3316	4928	\N	\N	11	猝	cù	abruptly, suddenly; abrupt
3317	穴 116.7	3317	2785	\N	\N	12	窖	jiào	pit, cellar
3318	戈 62.11	3318	6019	\N	\N	15	戮	lù	kill, massacre; oppress
3319	示 113.5	3319	1713	\N	\N	9	祠	cí	ancestral temple; offer sacrifice
3320	目 109.12	3320	3405	6	7–9	17	瞩	zhǔ	watch carefully, stare at, focus on
3321	艸 140.8	3321	4746	\N	\N	11	菁	jīng	flower of leek family; turnip
3322	足 157.13	3322	6332	\N	\N	18	躇	chú	hesitate, falter, be undecided
3323	人 9.6	3323	3951	\N	\N	8	佬	lǎo	(Cant.) man, person; mature
3324	肉 130.2	3324	496	\N	\N	6	肋	lē	ribs; chest
3325	口 30.5	3325	1103	\N	\N	8	咄	duō	noise of rage, cry out in anger
3326	心 61.4	3326	3785	\N	\N	7	忡	chōng	a sad, uneasy countenance
3327	隹 172.5	3327	5551	\N	\N	13	雍	yōng	harmony, union; harmonious
3328	心 61.4	3328	875	\N	\N	7	忱	chén	truth, sincerity; sincere
3329	艸 140.13	3329	3320	6	7–9	16	蕾	lěi	buds, unopened flowers
3330	足 157.4	3330	4830	\N	\N	11	跄	qiāng	walk rapidly
3331	石 112.6	3331	2240	\N	\N	11	硅	guī	silicon
3332	人 9.4	3332	3602	\N	\N	6	伎	jì	talent, skill, ability
3333	火 86.4	3333	1235	6	7–9	8	炊	chuī	cook; meal
3334	金 167.2	3334	3721	\N	\N	7	钊	zhāo	endeavor, strive; encourage; cut
3335	虫 142.9	3335	3247	\N	\N	15	蝠	fú	kind of bat
3336	尸 44.6	3336	1725	\N	\N	9	屎	shǐ	excrement, shit, dung
3337	手 64.6	3337	1364	\N	\N	9	拭	shì	wipe away stains with cloth
3338	言 149.9	3338	5008	\N	\N	11	谛	dì	careful, attentive
3339	衣 145.10	3339	3180	\N	\N	14	褪	tuì	strip, undress; fall off; fade
3340	一 1.5	3340	3641	\N	\N	6	丞	chéng	assist, aid, rescue
3341	十 24.3	3341	200	\N	7–9	5	卉	huì	general term for plants; myriads
3342	阜 170.13	3342	3182	6	7–9	14	隧	suì	tunnel, underground passageway, path to a tomb
3343	艸 140.6	3343	1402	\N	\N	9	茸	rōng	soft, downy; buds, sprouts
3344	金 167.5	3344	1929	\N	7–9	10	钳	qián	pincers, pliers, tongs; to compress
3345	口 30.8	3345	2275	6	7–9	11	啃	kěn	gnaw, chew, bite
3346	人 9.4	3346	3604	\N	\N	6	伢	yá	child
3347	門 169.6	3347	1635	\N	7–9	9	闺	guī	small arched door; boudoir, lady's chamber
3348	舌 135.8	3348	3117	6	7–9	14	舔	tiǎn	lick with tongue; taste
3349	足 157.12	3349	3460	6	7–9	19	蹬	dēng	step on, tread on; lose energy
3350	手 64.6	3350	4612	\N	\N	10	挛	luán	tangled; entwined; crooked
3351	目 109.6	3351	4814	\N	\N	11	眺	tiào	look at, gaze at, scan, survey
3352	衣 145.6	3352	2463	6	7–9	11	袱	fú	a piece of cloth used wrap bundles
3353	阜 170.5	3353	3802	\N	\N	7	陇	lǒng	mountain located between Shanxi
3354	殳 79.4	3354	1054	6	7–9	8	殴	ōu	beat, fight with fists, hit
3355	木 75.5	3355	1436	4	5	9	柿	shì	persimmon
3356	木 75.7	3356	2224	\N	\N	11	梧	wú	Chinese parasoltree, Sterculia platanifolia
3357	心 61.9	3357	5295	\N	\N	12	惺	xīng	intelligent, clever, astute
3358	弓 57.3	3358	569	\N	7–9	6	弛	chí	loosen, relax, unstring a bow
3359	人 9.6	3359	1142	6	\N	8	侥	jiǎo	be lucky; by chance, by luck
3360	玉 96.8	3360	5055	\N	\N	12	琛	chēn	treasure, valuables
3361	手 64.7	3361	1813	\N	7–9	10	捅	tǒng	jab
3362	酉 164.4	3362	2236	6	7–9	11	酝	yùn	liquor, spirits, wine; ferment
3363	艸 140.14	3363	3321	\N	6	16	薯	shǔ	yam, tuber, potato
3364	曰 73.2	3364	3592	\N	\N	6	曳	yè	trail, tow, drag, pull
3365	水 85.12	3365	3297	6	\N	15	澈	chè	thoroughly, completely
3366	金 167.7	3366	2663	6	7–9	12	锈	xiù	rust, corrode
3367	禾 115.8	3367	2949	6	7–9	13	稠	chóu	dense, crowded, packed; soupy
3368	目 109.6	3368	4816	\N	\N	11	眸	móu	pupil of eye; eye
3369	口 30.5	3369	3917	\N	\N	8	咆	páo	roar
3370	竹 118.12	3370	3417	\N	\N	17	簧	huáng	reed of woodwind instrument
3371	鳥 196.4	3371	1459	\N	\N	9	鸥	ōu	seagull, tern; Larus species (various)
3372	疒 104.4	3372	3999	\N	\N	8	疡	yáng	ulcers, sores; infection
3373	水 85.8	3373	4968	\N	\N	11	渎	dú	ditch, sluice, gutter, drain
3374	水 85.4	3374	3626	\N	\N	6	汲	jí	draw water from well; imbibe
3375	女 38.12	3375	6017	\N	7–9	15	嬉	xī	enjoy; play, amuse oneself
3376	肉 130.6	3376	2002	\N	\N	10	脓	nóng	pus
3377	馬 187.11	3377	3187	\N	\N	14	骡	luó	mule
3378	禾 115.12	3378	3415	\N	\N	17	穗	suì	ear of grain; tassel; Guangzhou
3379	木 75.10	3379	3079	\N	7–9	14	槛	kǎn	threshold, door-sill
3380	手 64.5	3380	973	\N	7–9	8	拎	līn	to haul; to lift; to take
3381	己 49.0	3381	62	\N	\N	3	巳	sì	the hours from 9 to 11; 6th terrestrial branch
3382	邑 163.4	3382	3567	\N	\N	6	邢	xíng	surname, place name
3383	廾 55.1	3383	3510	\N	\N	4	廿	niàn	twenty, twentieth
3384	手 64.9	3384	2531	6	7–9	12	搀	chān	give helping hand
3385	日 72.14	3385	3407	\N	7–9	17	曙	shǔ	bright, light of rising sun
3386	木 75.12	3386	6059	\N	\N	16	樵	qiáo	woodcutter; firewood; gather wood
3387	阜 170.9	3387	2478	\N	\N	11	隅	yú	corner, nook, remote place
3388	竹 118.6	3388	2684	6	7–9	12	筛	shāi	sieve, filter, screen; sift
3389	言 149.9	3389	5002	\N	\N	11	谒	yè	visit, pay respects
3390	人 9.8	3390	4570	\N	\N	10	倭	wō	dwarf; dwarfish, short
3391	疒 104.8	3391	2988	6	7–9	13	痹	bì	paralysis, numbness
3392	犬 94.8	3392	2369	\N	7–9	11	猖	chāng	mad, wild, reckless, unruly
3393	人 9.6	3393	3965	\N	\N	8	佯	yáng	pretend, feign; false, deceitful
3394	肉 130.3	3394	804	\N	\N	7	肛	gāng	anus
3395	大 37.7	3395	4587	\N	\N	10	奚	xī	where? what? how? why?; servant
3396	用 101.4	3396	4164	6	\N	9	甭	béng	there is no need
3397	手 64.5	3397	3837	\N	7–9	8	抨	pēng	impeach, censure; attack
3398	虫 142.7	3398	2924	\N	\N	13	蛾	é	moth
3399	口 30.7	3399	1891	6	7–9	10	唠	láo	chat, jaw, gossip, talk
3400	艸 140.6	3400	1417	\N	7–9	9	荧	yíng	shine, shimmer; shining, dazzling
3401	山 46.10	3401	5479	\N	\N	13	嵩	sōng	high, lofty; one of the 5 peaks, situated in Hunan
3402	水 85.11	3402	3162	\N	\N	14	漱	shù	gargle, rinse; wash, scour
3403	酉 164.2	3403	4323	\N	\N	9	酋	qiú	chief of tribe, chieftain
3404	手 64.17	3404	6421	\N	7–9	20	攘	rǎng	seize, take by force; repel
3405	言 149.6	3405	4041	\N	\N	8	诘	jí	question, interrogate
3406	竹 118.10	3406	3358	\N	\N	16	篡	cuàn	usurp
3407	目 109.9	3407	5692	\N	\N	14	睿	ruì	shrewd, astute, clever, keen
3408	口 30.13	3408	3329	\N	\N	16	噩	è	bad, ill-omened, unlucky
3409	心 61.4	3409	3788	\N	\N	7	怅	chàng	disappointed, dissatisfied
3410	皿 108.5	3410	4518	\N	\N	10	盎	àng	cup; pot; bowl; abundant
3411	彳 60.8	3411	2340	6	\N	11	徙	xǐ	(literary) to change one's residence
3412	革 177.5	3412	5647	\N	\N	14	鞅	yāng	martingale (leather strap in horse harness); disconnected
3413	水 85.10	3413	3014	\N	\N	13	漓	lí	river in Guangxi province; water dripping
3414	示 113.5	3414	2136	\N	\N	10	祟	suì	evil spirit; evil influence
3415	目 109.8	3415	2899	\N	\N	13	睫	jié	eyelashes
3416	攴 66.3	3416	3730	\N	\N	7	攸	yōu	distant, far; adverbial prefix
3417	羽 124.5	3417	4920	\N	\N	11	翎	líng	feather; plume; wing
3418	口 30.4	3418	742	\N	7–9	7	呛	qiāng	choke by smoke; irritates nose
3419	竹 118.6	3419	2680	6	7–9	12	筐	kuāng	bamboo basket or chest
3420	土 32.8	3420	4808	\N	\N	11	堑	qiàn	moat, trench, pit, cavity
3421	木 75.13	3421	3396	\N	\N	17	檀	tán	sandalwood, hardwood; surname
3422	宀 40.8	3422	2452	\N	\N	11	寅	yín	to respect, reverence; respectfully; 3rd terrestrial branch
3423	石 112.10	3423	3226	\N	7–9	15	磊	lěi	pile of rocks or stones; great
3424	馬 187.2	3424	3562	\N	7–9	5	驭	yù	drive, ride; manage, control
3425	心 61.8	3425	4987	\N	\N	11	惘	wǎng	disconcerted, dejected, discouraged
3426	口 30.4	3426	724	\N	\N	7	吠	fèi	bark
3427	馬 187.3	3427	590	\N	7–9	6	驮	tuó	carry on back
3428	玉 96.9	3428	2829	\N	\N	13	瑙	nǎo	agate; cornelian
3429	火 86.5	3429	1233	\N	7–9	8	炬	jù	torch
3430	疒 104.5	3430	4621	\N	\N	10	痉	jìng	convulsions, fits
3431	日 72.15	3431	3457	6	7–9	19	曝	pù	sun, air in sun, expose or dry in the sun
3432	心 61.6	3432	4353	\N	\N	9	恺	kǎi	enjoy, be contented, joyful
3433	肉 130.6	3433	4597	\N	\N	10	胺	àn	amine
3434	艸 140.8	3434	2213	\N	\N	11	萤	yíng	glow-worm, luminous insect
3435	攴 66.7	3435	4783	\N	\N	11	敕	chì	an imperial order or decree
3436	竹 118.6	3436	2689	\N	7–9	12	筝	zhēng	stringed musical instrument; kite
3437	巾 50.12	3437	5940	\N	\N	15	幡	fān	pennant, banner, streamer, flag
3438	雨 173.13	3438	3491	\N	\N	21	霹	pī	thunder, crashing thunder
3439	竹 118.2	3439	3948	\N	\N	8	竺	zhú	India; bamboo; surname
3440	火 86.6	3440	2063	\N	\N	10	烙	lào	brand, burn; branding iron
3441	田 102.4	3441	4206	\N	\N	9	毗	pí	help, assist; connect, adjoin
3442	鳥 196.2	3442	3748	\N	\N	7	鸠	jiū	pigeon; collect, assemble
3443	土 32.8	3443	2175	\N	\N	11	埠	bù	port city
3444	艸 140.10	3444	2847	\N	7–9	13	蒜	suàn	garlic
3445	阜 170.0	3445	3968	\N	\N	8	阜	fù	mound; abundant, ample, numerous
3446	口 30.11	3446	5696	6	\N	14	嘈	cáo	noisy
3447	丿 4.5	3447	456	4	7–9	6	乒	pīng	used with pong for ping pong
3448	巾 50.8	3448	2297	\N	\N	11	帷	wéi	tent; curtain, screen
3449	口 30.8	3449	2271	\N	\N	11	啄	zhuó	to peck; (Cant.) to slander
3450	魚 195.10	3450	6311	\N	\N	18	鳌	áo	huge sea turtle
3451	毛 82.5	3451	1541	\N	\N	9	毡	zhān	felt; rug, carpet
3452	門 169.10	3452	5554	\N	\N	13	阙	quē	watch tower; palace
3453	衣 145.10	3453	3306	\N	\N	15	褥	rù	mattress, cushion; bedding
3454	手 64.10	3454	2539	\N	\N	12	搔	sāo	to scratch
3455	竹 118.4	3455	1953	\N	\N	10	笋	sǔn	bamboo shoots
3456	冂 13.9	3456	4825	\N	\N	11	冕	miǎn	crown; ceremonial cap
3457	犬 94.5	3457	1199	\N	\N	8	狞	níng	ferocious appearance; hideous
3458	音 180.5	3458	5786	\N	\N	14	韶	sháo	music of the emperor Shun; beautiful
3459	骨 188.6	3459	5944	\N	\N	15	骼	gé	bone; skeleton; corpse
3460	艸 140.11	3460	3074	6	7–9	14	蔼	ǎi	lush; affable, friendly
3461	火 86.7	3461	2377	6	7–9	11	烹	pēng	boil, cook; quick fry, stir fry
3462	大 37.5	3462	3889	\N	\N	8	奄	yǎn	ere long; remain, tarry; feeble
3463	女 38.11	3463	5832	\N	\N	14	嫖	piáo	patronize prostitutes, frequent
3464	水 85.4	3464	856	6	7–9	7	沐	mù	bathe, cleanse, wash, shampoo
3465	口 30.12	3465	5929	\N	\N	15	噗	pū	burst
3466	山 46.4	3466	3716	\N	\N	7	岑	cén	steep, precipitous; peak
3467	虫 142.6	3467	5150	\N	\N	12	蛟	jiāo	scaly dragon with four legs
3468	手 64.8	3468	4720	\N	\N	11	掳	lǔ	capture, seize
3469	口 30.5	3469	1101	\N	7–9	8	咏	yǒng	sing song or poem, hum, chant
3470	弓 57.5	3470	4068	\N	\N	8	弩	nǔ	cross-bow, bow; downward stroke
3471	手 64.8	3471	2178	\N	\N	11	捻	niǎn	to twist or nip with the fingers
3472	囗 31.7	3472	1906	\N	\N	10	圃	pǔ	garden, cultivated field
3473	子 39.4	3473	3739	\N	\N	7	孚	fú	brood over eggs; have confidence
3474	心 61.8	3474	2447	\N	\N	11	悴	cuì	suffer, become emaciated, haggard
3475	言 149.6	3475	4055	\N	\N	8	诣	yì	reach; achievement, accomplishment
3476	口 30.5	3476	3914	\N	\N	8	呱	gū	wail, crying of child; swear at
3477	示 113.3	3477	3633	\N	\N	6	祁	qí	pray; numerous, ample, abundant
3478	手 64.8	3478	2171	\N	7–9	11	捶	chuí	strike with stick, lash, beat
3479	金 167.4	3479	1530	\N	\N	9	钠	nà	sodium, natrium; sharpen wood
3480	衣 145.4	3480	1709	\N	\N	9	袄	ǎo	outer garments; coat, jacket
3481	水 85.12	3481	3291	\N	\N	15	澎	pēng	splatter
3482	气 84.8	3482	2671	\N	\N	12	氮	dàn	nitrogen
3483	心 61.6	3483	4356	\N	\N	9	恪	kè	respectful, reverent
3484	隹 172.5	3484	2983	\N	\N	13	雏	chú	chick, fledging; infant, toddler
3485	手 64.12	3485	3197	\N	\N	15	撮	cuō	little bit, small amount, pinch
3486	土 32.9	3486	2512	\N	\N	12	堰	yàn	dam; embankment, dike, bank
3487	彳 60.4	3487	3736	\N	\N	7	彷	fǎng	like, resembling; resemble
3488	鳥 196.11	3488	3350	\N	\N	16	鹦	yīng	parrot
3489	日 72.6	3489	6991	\N	\N	10	晖	huī	sunshine; light, bright, radiant
3490	牛 93.8	3490	2799	\N	\N	12	犀	xī	rhinoceros; sharp, well-tempered
3491	肉 130.8	3491	5232	\N	\N	12	腑	fǔ	bowels, entrails, internal organs
3492	水 85.5	3492	1243	\N	7–9	8	沽	gū	buy and sell; inferior in quality
3493	木 75.12	3493	3218	\N	\N	15	橄	gǎn	olive
3494	手 64.8	3494	2181	6	7–9	11	掐	qiā	hold; gather with hand; choke
3495	亠 8.10	3495	5250	\N	\N	12	亵	xiè	slight, insult, treat with disrespect
3496	齒 211.9	3496	6220	\N	\N	17	龋	qǔ	tooth decay
3497	口 30.10	3497	5129	\N	\N	12	嗒	dā	absent-minded
3498	口 30.5	3498	3911	6	\N	8	咀	jǔ	suck; chew, masticate
3499	示 113.8	3499	5309	\N	\N	12	祺	qí	good luck, good fortune
3500	金 167.8	3500	2937	\N	\N	13	锚	máo	anchor
3501	匸 23.9	3501	2248	\N	\N	11	匾	biǎn	flat, round split-bamboo contain
3502	丿 4.5	3502	457	4	7–9	6	乓	pāng	used with ping for ping pong
3503	艸 140.8	3503	4761	\N	\N	11	萃	cuì	dense, thick, close-set; to collect together
3504	貝 154.5	3504	1522	\N	\N	9	贻	yí	give to, hand down, bequeath
3505	手 64.9	3505	5066	\N	\N	12	揖	yī	salute, bow; defer to, yield
3506	見 147.11	3506	5901	\N	\N	15	觑	qù	peep at; watch, spy on
3507	口 30.4	3507	835	6	\N	7	吝	lìn	stingy, miserly, parsimonious
3508	心 61.12	3508	3301	\N	\N	15	憔	qiáo	be worn-out, emaciated, haggard
3509	羊 123.2	3509	3764	\N	\N	7	羌	qiāng	Qiang nationality; surname
3510	言 149.7	3510	1716	\N	\N	9	诲	huì	teach, instruct; encourage, urge
3511	石 112.5	3511	1865	\N	\N	10	砾	lì	gravel, pebbles
3512	虫 142.14	3512	3478	\N	\N	20	蠕	rú	eumenes polifomis, kind of wasp
3513	肉 130.4	3513	1169	6	\N	8	肴	yáo	cooked or prepared meat
3514	手 64.12	3514	3193	\N	\N	15	撩	liāo	lift up, raise; leave, depart
3515	土 32.4	3515	3654	\N	\N	7	坍	tān	collapse; landslide
3516	酉 164.5	3516	2586	\N	7–9	12	酥	sū	butter; flaky, crispy, light, fluffy
3517	衣 145.4	3517	4608	\N	\N	10	袅	niǎo	curling upwards; wavering gently
3518	黑 203.5	3518	6242	\N	\N	17	黝	yǒu	black
3519	人 9.8	3519	4572	\N	\N	10	俾	bǐ	so that, in order that; to cause; (Cant.) to give (synonymous with Mandarin給)
3520	女 38.11	3520	5830	\N	\N	14	嫣	yān	charming, fascinating; gay
3521	穴 116.3	3521	4036	\N	\N	8	穹	qióng	high and vast; elevated; arched
3522	禾 115.5	3522	1946	\N	7–9	10	秧	yāng	rice seedlings, young rice plants
3523	女 38.4	3523	3810	\N	\N	7	妊	rèn	conceive, be pregnant
3524	水 85.9	3524	2769	6	7–9	12	溉	gài	water, irrigate, flood; wash
3525	鳥 196.8	3525	2851	\N	\N	13	鹊	què	magpie; Pica species (various)
3526	聿 129.0	3526	3635	\N	\N	6	聿	yù	writing brush, pencil; thereupon
3527	疒 104.3	3527	1214	6	\N	8	疙	gē	pimple, sore, boil, wart, pustule
3528	艸 140.16	3528	3454	\N	7–9	19	蘑	mó	type of edible mushroom
3529	目 109.9	3529	5763	\N	\N	14	睾	gāo	testicle
3530	木 75.9	3530	2865	\N	7–9	13	楷	kǎi	model style of Chinese writing
3531	酉 164.7	3531	3086	\N	7–9	14	酵	jiào	yeast, leaven
3532	艸 140.6	3532	4136	\N	\N	9	茹	rú	roots; vegetables; eat; bear
3533	金 167.7	3533	2665	\N	\N	12	锌	xīn	zinc
3534	水 85.10	3534	3007	\N	\N	13	滇	diān	Yunnan province
3535	車 159.10	3535	3097	\N	\N	14	辗	niǎn	turn over, roll
3536	糸 120.14	3536	6438	\N	\N	20	纂	zuǎn	edit, compile; topknot, chignon
3537	土 32.3	3537	3570	\N	\N	6	圭	guī	jade pointed at top
3538	巾 50.11	3538	5725	\N	\N	14	幔	màn	curtain, screen, tent
3539	衣 145.9	3539	3280	\N	\N	15	褒	bāo	praise, commend, honor, cite
3540	手 64.9	3540	2507	6	7–9	12	揍	zòu	hit, beat; smash, break
3541	言 149.8	3541	2114	6	7–9	10	诽	fěi	slander, vilify, condemn
3542	人 9.8	3542	1974	6	7–9	10	倔	jué	stubborn, obstinate, intransigent; firm
3543	肉 130.8	3543	5229	\N	\N	12	腓	féi	calf; avoid; be ill; wither
3544	頁 181.6	3544	5067	\N	\N	12	颉	jié	fly upward, soar; contest
3545	金 167.7	3545	2661	\N	\N	12	锄	chú	hoe; eradicate
3546	口 30.10	3546	5444	\N	\N	13	嗔	chēn	be angry at, scold, rebuke
3547	石 112.12	3547	\N	\N	\N	16	磺	huáng	sulphur; brimstone
3548	手 64.16	3548	6368	6	7–9	19	攒	zǎn	save, hoard
3549	疒 104.10	3549	3145	6	\N	14	瘩	da	pimples
3550	雨 173.4	3550	2598	\N	\N	12	雳	lì	thunderclap, crashing thunder
3551	口 30.3	3551	433	\N	\N	6	吆	yāo	bawl, yell, shout, cry out
3552	心 61.7	3552	4659	\N	\N	10	悚	sǒng	afraid, scared, frightened
3553	土 32.12	3553	3201	\N	\N	15	墩	dūn	heap, mound, block of stone
3554	彐 58.15	3554	6364	\N	\N	18	彝	yí	Yi (nationality); tripod, wine vessel; rule
3555	囗 31.4	3555	790	\N	7–9	7	囱	cōng	chimney
3556	辵 162.7	3556	4492	\N	\N	10	逍	xiāo	ramble, stroll, jaunt, loiter
3557	車 159.7	3557	4807	\N	\N	11	辄	zhé	sides of chariot where weapons
3558	木 75.6	3558	4460	\N	\N	10	桅	wéi	mast of ship
3559	人 9.7	3559	4257	\N	\N	9	俨	yǎn	grave, respectful, majestic
3560	糸 120.4	3560	3824	\N	\N	7	纶	lún	green silk thread or tassel
3561	心 61.8	3561	4988	\N	\N	11	悸	jì	fearful, apprehensive, perturbed
3562	歹 78.5	3562	1461	6	7–9	9	殃	yāng	misfortune, disaster, calamity
3563	巾 50.6	3563	4233	\N	\N	9	帧	zhèng	picture, scroll; one of pair of
3564	人 9.7	3564	1565	6	\N	9	俐	lì	smooth; active; clever, sharp
3565	糸 120.8	3565	5029	\N	\N	11	绮	qǐ	fine thin silk; elegant, beautifu
3566	衣 145.5	3566	4671	\N	\N	10	袒	tǎn	strip; lay bare; bared; naked
3567	米 119.3	3567	1648	\N	\N	9	籽	zǐ	seed, pip, pit, stone
3568	子 39.8	3568	4935	\N	\N	11	孰	shú	who? which? what? which one?
3569	心 61.10	3569	5588	\N	\N	13	愫	sù	guileless, sincere, honest
3570	手 64.5	3570	984	6	7–9	8	拌	bàn	mix
3571	木 75.12	3571	3331	6	7–9	16	橙	chéng	orange
3572	日 72.10	3572	5827	\N	\N	14	暨	jì	and; attain, reach; confines
3573	攴 66.7	3573	4411	\N	\N	10	敖	áo	ramble, play about; leisurely; surname
3574	貝 154.10	3574	3052	\N	\N	14	赘	zhuì	unnecessary, superfluous
3575	手 64.4	3575	3657	\N	\N	7	抉	jué	choose, select; gouge, pluck out
3576	水 85.8	3576	2429	\N	\N	11	淤	yū	mud, sediment; clog up, silt up
3577	刀 18.7	3577	4161	\N	\N	9	剌	lá	slash, cut in two; contradict
3578	女 38.8	3578	5019	\N	\N	11	娼	chāng	prostitute, harlot
3579	玉 96.6	3579	4403	\N	\N	10	顼	xū	grieved
3580	艸 140.9	3580	2561	\N	\N	12	葵	kuí	sunflower; measure
3581	口 30.6	3581	4227	\N	\N	9	哝	nóng	whisper
3582	酉 164.5	3582	2585	\N	7–9	12	酣	hān	enjoy intoxicants
3583	鹿 198.8	3583	6374	\N	\N	19	麓	lù	foot of hill; foothill
3584	金 167.5	3584	4530	\N	\N	10	钵	bō	earthenware basin; alms bowl
3585	玉 96.7	3585	2159	\N	\N	11	琅	láng	a variety of white carnelian; pure
3586	竹 118.13	3586	3462	6	\N	19	簸	bǒ	winnower
3587	禾 115.0	3587	267	\N	7–9	5	禾	hé	grain still on stalk; rice plant
3588	金 167.6	3588	4872	\N	\N	11	铢	zhū	unit of weight, one twenty-fourth of a Chinese ounce (liang)
3589	玉 96.13	3589	3450	\N	\N	18	璧	bì	piece of jade with hole in it
3590	女 38.7	3590	4688	\N	\N	10	娠	shēn	pregnant
3591	彐 58.8	3591	4709	\N	\N	11	彗	huì	broomstick; comet
3592	心 61.8	3592	2448	6	7–9	11	惋	wǎn	regret, be sorry; alarmed
3593	肉 130.8	3593	2714	\N	\N	12	腋	yè	armpit
3594	虫 142.10	3594	5713	\N	\N	14	螂	láng	mantis, dung beetle
3595	阜 170.4	3595	3640	\N	\N	6	阪	bǎn	hillside farmland; slope
3596	手 64.8	3596	5191	\N	\N	12	掣	chè	drag, pull; hinder by pulling back
3597	力 19.6	3597	4002	\N	\N	8	劾	hé	examine into, impeach, charge
3598	水 85.4	3598	859	\N	\N	7	沥	lì	trickle, drip; strain; dregs
3599	米 119.7	3599	3021	\N	\N	13	粱	liáng	better varieties of millet
3600	口 30.14	3600	6236	\N	\N	17	嚓	cā	a cracking or snapping sound
3601	心 61.8	3601	4992	6	\N	11	惮	dàn	dread, shrink from, shirk, fear
3602	气 84.2	3602	3600	\N	\N	6	氖	nǎi	neon
3603	手 64.7	3603	1791	6	7–9	10	捎	shāo	to select; to take; to carry
3604	羊 123.4	3604	2050	\N	\N	10	羔	gāo	lamb, kid
3605	人 9.7	3605	4267	\N	\N	9	俟	qí	wait for, wait until, as soon as
3606	水 85.9	3606	2768	\N	\N	12	渲	xuàn	add repeated washes of color
3607	木 75.9	3607	2866	\N	\N	13	榄	lǎn	olive
3608	艸 140.6	3608	1409	\N	\N	9	茧	jiǎn	cocoon; callus, blister
3609	雨 173.8	3609	6078	\N	\N	16	霓	ní	rainbow; variegated, colored
3610	鳥 196.8	3610	2826	\N	\N	13	鹉	wǔ	species of parrot
3611	肉 130.5	3611	4379	\N	\N	9	胥	xū	all, together, mutually
3612	玉 96.8	3612	5044	\N	\N	12	琶	pá	guitar-like instrument
3613	手 64.12	3613	3198	\N	7–9	15	撬	qiào	lift, raise; pry open
3614	木 75.12	3614	3332	\N	7–9	16	橘	jú	orange, tangerine
3615	酉 164.11	3615	\N	\N	\N	18	醫	yī	cure, heal; doctor, medical
3616	手 64.5	3616	3840	\N	\N	8	拈	niān	pick up with fingers; draw lots
3617	竹 118.4	3617	4560	\N	\N	10	笆	bā	bamboo fence
3618	疒 104.6	3618	2381	\N	\N	11	痊	quán	be healed, be cured; recover
3619	二 7.6	3619	4062	\N	\N	8	亟	jí	urgently, immediately, extremely
3620	水 85.9	3620	5282	\N	\N	12	渭	wèi	name of a river in Shanxi
3621	犬 94.5	3621	3985	\N	\N	8	狙	jū	an ape, monkey; to spy, watch for; to lie
3622	玉 96.5	3622	4086	\N	\N	9	珂	kē	inferior kind of jade
3623	刀 18.5	3623	821	\N	7–9	7	刨	páo	to dig, to excavate; carpenter's plane
3624	虫 142.7	3624	2926	\N	\N	13	蜕	tuì	molt
3625	言 149.9	3625	2467	\N	\N	11	谚	yàn	proverb, maxim
3626	心 61.12	3626	6007	\N	\N	15	憧	chōng	irresolute, indecisive; yearn for
3627	目 109.11	3627	6084	\N	\N	16	瞟	piǎo	glare at; look askance at; squint
3628	食 184.11	3628	3138	5	6	14	馒	mán	steamed bread; steamed dumplings
3629	手 64.5	3629	995	\N	\N	8	拗	ǎo	to pull, drag, break off, to pluck (a flower); bent, warped; perverse, obstinate
3630	巾 50.5	3630	1306	\N	\N	8	帚	zhǒu	broom, broomstick
3631	金 167.3	3631	3944	\N	\N	8	钗	chāi	ornamental hairpin
3632	口 30.7	3632	4498	\N	\N	10	哧	chī	sound of ripping or giggling
3633	口 30.9	3633	5128	\N	\N	12	喋	dié	nag; chatter, babble, twitter
3634	竹 118.8	3634	3124	\N	\N	14	箫	xiāo	bamboo flute
3635	刀 18.0	3635	16	\N	7–9	2	刁	diāo	tricky, sly, crafty, cunning
3636	心 61.5	3636	4027	\N	\N	8	怦	pēng	eager, ardent, impulsive; anxious
3637	糸 120.12	3637	3314	\N	\N	15	缭	liáo	wind round, rap around, bind
3638	辵 162.5	3638	3931	\N	\N	8	迥	jiǒng	distant, far; separated; different
3639	水 85.9	3639	5292	\N	\N	12	湄	méi	brink, edge
3640	石 112.10	3640	5963	\N	\N	15	磐	pán	large rock, boulder; firm
3641	水 85.9	3641	2763	\N	7–9	12	渝	yú	change; chongqing
3642	冖 14.2	3642	172	\N	7–9	4	冗	rǒng	excessive; superfluous
3643	門 169.4	3643	3763	\N	\N	7	闵	mǐn	mourn, grieve; urge on, incite
3644	口 30.13	3644	5907	\N	\N	15	噶	gá	used in transliterations
3645	黍 202.5	3645	6254	\N	7–9	17	黏	nián	stick to; glutinous, sticky; glue
3646	艸 140.12	3646	5880	\N	\N	15	蕃	fān	foreign things
3647	弓 57.9	3647	5317	\N	\N	12	弼	bì	aid, assist, help; correct
3648	馬 187.5	3648	4081	\N	\N	8	驿	yì	relay station
3649	水 85.8	3649	4982	\N	\N	11	淄	zī	river in Shandong province
3650	食 184.6	3650	1613	4	2	9	饺	jiǎo	stuffed dumplings
3651	足 157.8	3651	5919	\N	\N	15	踞	jù	crouch, squat; sit, occupy
3652	韋 178.10	3652	5628	\N	\N	14	韬	tāo	sheath, scabbard, bow case
3653	女 38.9	3653	5322	\N	\N	12	婷	tíng	pretty; attractive; graceful
3654	口 30.7	3654	1917	6	\N	10	唆	suō	make mischief, incite, instigate
3655	虫 142.7	3655	2637	\N	\N	12	蜒	yán	millipede
3656	人 9.9	3656	2329	\N	\N	11	偎	wēi	cling to, cuddle, embrace, fondle
3657	木 75.10	3657	3082	6	7–9	14	榨	zhà	to press or extract juices; a press to extract juices; a vegetable
3658	水 85.11	3658	5808	\N	\N	14	漉	lù	filter, strain; wet, dripping
3659	石 112.8	3659	5420	\N	\N	13	碉	diāo	room made of stone; watchtower
3660	白 106.4	3660	4265	\N	\N	9	皈	guī	follow, comply with
3661	矛 110.4	3661	4392	\N	\N	9	矜	jīn	pity, feel sorry for, show sympat
3662	竹 118.4	3662	4254	\N	\N	9	笈	jí	bamboo box used carry books
3663	木 75.5	3663	4159	\N	\N	9	枷	jiā	cangue scaffold
3664	魚 195.7	3664	3294	\N	7–9	15	鲨	shā	shark
3665	足 157.10	3665	6227	\N	\N	17	蹑	niè	tread, step on; follow, track
3666	水 85.16	3666	6412	\N	\N	19	瀚	hàn	vast, wide, extensive
3667	酉 164.6	3667	2873	\N	\N	13	酪	lào	cream, cheese; koumiss
3668	言 149.9	3668	4998	\N	\N	11	谑	xuè	jeer
3669	疒 104.13	3669	6359	\N	\N	18	癖	pǐ	craving, weakness for; indigestion
3670	火 86.6	3670	4643	\N	\N	10	烬	jìn	cinders, ashes, embers; remnants
3671	手 64.9	3671	2513	\N	\N	12	揩	kāi	rub and wipe, dust, clean
3672	火 86.4	3672	3990	\N	\N	8	炙	zhì	roast, broil; toast; cauterize
3673	虫 142.8	3673	5711	\N	\N	14	蜷	quán	to curl up (like a scroll)
3674	人 9.6	3674	3959	\N	\N	8	侏	zhū	small, little, tiny, dwarf
3675	冫 15.8	3675	4623	\N	\N	10	凋	diāo	be withered, fallen; exhausted
3676	水 85.11	3676	5807	\N	\N	14	漪	yī	ripples on water; swirling
3677	心 61.8	3677	4984	\N	\N	11	悻	xìng	anger, vexation; angry, indignant
3678	足 157.10	3678	3408	6	\N	17	蹋	tà	step on, tread on; stumble, slip
3679	言 149.3	3679	3556	\N	\N	5	讪	shàn	abuse, slander; vilify; ridicule
3680	手 64.10	3680	5359	\N	\N	13	搐	chù	cramp, spasm, convulsion; twitch
3681	石 112.8	3681	2877	\N	\N	13	碘	diǎn	iodine
3682	巾 50.5	3682	3967	\N	\N	8	帛	bó	silks, fabrics; wealth, property
3683	言 149.6	3683	4054	\N	\N	8	诠	quán	explain, expound, comment on
3684	石 112.10	3684	3228	\N	\N	15	碾	niǎn	roller, crush; roll
3685	手 64.13	3685	3316	\N	\N	16	擂	léi	rub, grind; grind with a mortar and pestle; triturate
3686	艸 140.5	3686	3855	\N	\N	8	苯	běn	benzene; luxuriant
3687	言 149.5	3687	3795	\N	\N	7	诃	hē	scold loudly, curse, abuse
3688	金 167.5	3688	4547	\N	\N	10	铎	duó	bell; surname
3689	戈 62.1	3689	220	\N	\N	5	戊	wù	5th heavenly stem
3690	艸 140.6	3690	4124	\N	\N	9	荀	xún	surname; ancient state; plant
3691	馬 187.5	3691	1343	\N	\N	8	驹	jū	colt; fleet, swift; sun; surname
3692	手 64.20	3692	6479	\N	\N	23	攫	jué	snatch away, seize; catch with
3693	心 61.12	3693	6006	\N	\N	15	憬	jǐng	rouse, awaken; become conscious
3694	口 30.7	3694	4499	\N	\N	10	哽	gěng	choke (with grief)
3695	足 157.9	3695	6093	\N	\N	16	踵	zhǒng	heel; follow; visit, call on
3696	虫 142.13	3696	6098	\N	\N	16	蟒	mǎng	python, boa constrictor
3697	水 85.11	3697	3166	\N	7–9	14	漾	yàng	overflow; swirl, ripple; to be tosssed by waves
3698	口 30.8	3698	4811	\N	\N	11	啧	zé	interjection of approval or admiration
3699	口 30.4	3699	752	\N	\N	7	吮	shǔn	suck with mouth, sip, lick
3700	木 75.9	3700	5393	\N	\N	13	楠	nán	name of tree, machilus nanmu
3701	气 84.5	3701	4248	\N	\N	9	氟	fú	fluorine
3702	心 61.4	3702	3973	\N	\N	8	怂	sǒng	instigate, arouse, incite
3703	口 30.2	3703	252	6	7–9	5	叼	diāo	holding in mouth
3704	立 117.7	3704	2736	\N	7–9	12	竣	jùn	terminate, end, finish; quit
3705	人 9.9	3705	4906	\N	\N	11	偕	xié	together; be in order
3706	水 85.11	3706	5810	\N	\N	14	漩	xuán	eddy, whirlpool
3707	足 157.12	3707	3459	\N	7–9	19	蹭	cèng	to shuffle, procrastinate, dilly-dally
3708	羽 124.5	3708	5024	\N	\N	11	翌	yì	bright; daybreak, dawn; the next day
3709	肉 130.13	3709	6274	\N	\N	17	臆	yì	chest, breast, bosom; thought
3710	手 64.6	3710	4095	\N	\N	9	挝	wō	to beat; to strike
3711	糸 120.6	3711	1759	\N	\N	9	绚	xuàn	variegated, adorned; brilliant
3712	山 46.9	3712	5169	\N	\N	12	崽	zǎi	a child, a servant; a diminutive
3713	米 119.11	3713	6287	\N	\N	17	糜	mí	rice gruel, congee; mashed
3714	疒 104.10	3714	5984	\N	\N	15	瘢	bān	scar, mole
3715	足 157.6	3715	2919	\N	7–9	13	跤	jiāo	stumble, fall down; wrestle
3716	門 169.9	3716	5266	\N	\N	12	阑	lán	door screen; railing fence
3717	心 61.6	3717	1688	\N	\N	9	恬	tián	quiet, calm, tranquil, peaceful
3718	豕 152.6	3718	5556	\N	\N	13	豢	huàn	domestic animals; feed, raise
3719	水 85.4	3719	3779	\N	\N	7	汶	wèn	a river in Shandong province
3720	足 157.6	3720	2914	\N	\N	13	跷	qiāo	to raise one's foot; to stand on tiptoe
3721	玉 96.8	3721	5043	\N	\N	12	琵	pí	guitar-like instrument
3722	心 61.12	3722	3309	\N	\N	15	憨	hān	foolish, silly, coquettish
3723	虫 142.7	3723	2923	\N	\N	13	蜗	wō	a snail, Eulota callizoma
3724	虫 142.10	3724	6100	\N	\N	16	螅	xī	intestinal worm
3725	心 61.9	3725	5297	\N	\N	12	惴	zhuì	afraid, apprehensive, nervous
3726	戈 62.8	3726	5092	\N	\N	12	戟	jǐ	halberd with crescent blade
3727	匚 22.9	3727	4782	\N	\N	11	匮	kuì	to lack
3728	心 61.6	3728	4633	\N	\N	10	恙	yàng	illness, sickness; indisposition
3729	手 64.5	3729	3851	\N	\N	8	抿	mǐn	pucker up lips in smile; press
3730	木 75.6	3730	4453	\N	\N	10	桢	zhēn	hardwood; supports, posts
3731	竹 118.5	3731	4893	\N	\N	11	笺	jiān	note, memo; stationery; comments
3732	虫 142.6	3732	2638	\N	\N	12	蛤	há	clam
3733	目 109.12	3733	3404	\N	\N	17	瞳	tóng	pupil of eye
3734	艸 140.15	3734	\N	\N	\N	18	藥	yào	drugs, pharmaceuticals, medicine
3735	瓜 97.11	3735	3335	\N	\N	16	瓢	piáo	ladle made from dried gourd
3736	衣 145.4	3736	\N	\N	\N	9	衹	zhǐ	only, merely, but
3737	禾 115.5	3737	1943	6	7–9	10	秤	chèng	balance, scale, steelyard
3738	足 157.6	3738	2916	\N	\N	13	跺	duò	stamp feet, step
3739	水 85.12	3739	6000	\N	7–9	15	潦	lǎo	to flood; a puddle; without care
3740	艸 140.4	3740	666	\N	\N	7	芹	qín	celery
3741	口 30.6	3741	6827	\N	\N	9	哒	dā	a sound made to get a horse to move forward
3742	食 184.4	3742	3754	\N	\N	7	饬	chì	order; command; give command
3743	木 75.6	3743	4463	\N	\N	10	栩	xǔ	species of oak; be glad, be pleased
3744	日 72.16	3744	6428	\N	\N	20	曦	xī	sunlight, sunshine, early dawn
3745	骨 188.5	3745	5730	\N	\N	14	骷	kū	skeleton
3746	女 38.11	3746	5836	\N	\N	14	嫡	dí	legal wife, child of legal wife
3747	卜 25.5	3747	711	\N	7–9	7	卤	lǔ	salt
3748	一 1.4	3748	3535	\N	\N	5	丕	pī	great, grand, glorious, distinguished
3749	髟 190.10	3749	3473	\N	\N	20	鬓	bìn	hair on temples
3750	木 75.7	3750	4776	\N	\N	11	梓	zǐ	catalpa ovata
3751	口 30.10	3751	5155	\N	\N	12	嗖	sōu	whizzing sound
3752	心 61.8	3752	2446	6	7–9	11	惦	diàn	think of, remember, miss
3753	水 85.7	3753	4658	\N	\N	10	浚	jùn	dredge
3754	口 30.5	3754	3908	\N	\N	8	咔	kā	used in translation
3755	艸 140.14	3755	3393	6	\N	17	藐	miǎo	disregard, slight, disdain
3756	艸 140.6	3756	4122	\N	\N	9	荃	quán	aromatic herb; fine cloth
3757	口 30.7	3757	1914	\N	\N	10	唧	jī	chirping of insects; pump; (Cant.) a final particle
3758	玉 96.5	3758	4599	\N	\N	10	玺	xǐ	imperial signet, royal signet
3759	水 85.3	3759	539	\N	7–9	6	汛	xùn	high water, flood tides
3760	金 167.6	3760	2303	\N	\N	11	铐	kào	shackles, manacles
3761	骨 188.9	3761	6342	\N	\N	18	髅	lóu	skull; skeleton
3762	水 85.9	3762	2754	\N	\N	12	渤	bó	swelling; the Gulf of Hopei (Hebei)
3763	皿 108.0	3763	259	\N	\N	5	皿	mǐn	shallow container; rad. no. 108
3764	竹 118.8	3764	5745	\N	\N	14	箍	gū	hoop; bind, surround
3765	食 184.8	3765	2372	6	7–9	11	馅	xiàn	filling, stuffing; secret
3766	水 85.4	3766	3776	\N	\N	7	汾	fén	river in Shanxi province
3767	戈 62.2	3767	3588	\N	\N	6	戍	shù	defend borders, guard frontiers
3768	疒 104.6	3768	4938	\N	\N	11	痔	zhì	hemorrhoids, piles
3769	衣 145.11	3769	6185	\N	\N	16	褶	zhě	pleat, crease, wrinkles
3770	耳 128.5	3770	2194	\N	\N	11	聆	líng	listen, hear
3771	水 85.7	3771	4339	\N	\N	9	涎	xián	saliva
3772	水 85.3	3772	628	\N	\N	7	汞	gǒng	element mercury
3773	水 85.8	3773	4963	\N	\N	11	渍	zì	soak, steep; dye; stains; sodden
3774	大 37.4	3774	3744	\N	\N	7	奂	huàn	be numerous, brilliant
3775	山 46.16	3775	3461	\N	7–9	19	巅	diān	summit of mountain, mountain top
3776	疒 104.4	3776	4309	\N	\N	9	疣	yóu	wart; tumor; goiter; papule
3777	人 9.10	3777	5215	\N	\N	12	傩	nuó	rich
3778	辵 162.8	3778	4727	\N	\N	11	逵	kuí	thoroughfare, crossroads
3779	老 125.4	3779	4419	\N	\N	10	耆	qí	man of sixty; aged, old
3780	虫 142.11	3780	3411	\N	\N	17	蟋	xī	cricket
3781	魚 195.9	3781	3424	\N	7–9	17	鳄	è	alligator
3782	言 149.4	3782	555	\N	7–9	6	讹	é	swindle, cheat; erroneous, wrong
3783	肉 130.13	3783	6289	\N	\N	17	膺	yīng	breast, chest; undertake, bear
3784	足 157.12	3784	6389	\N	\N	19	蹿	cuān	leap; to jump; to spurt out
3785	竹 118.6	3785	2686	\N	\N	12	筏	fá	raft
3786	金 167.2	3786	4586	\N	\N	10	釜	fǔ	cauldron, pot, kettle
3787	水 85.4	3787	3775	\N	\N	7	沂	yí	river in southeast Shandong
3788	土 32.5	3788	956	\N	\N	8	坯	pī	dam, embankment; weir
3789	山 46.6	3789	1615	\N	\N	9	峦	luán	mountain range; pointed mountain
3790	艸 140.6	3790	1404	\N	\N	9	茬	chá	harvest
3791	手 64.11	3791	5075	\N	\N	12	摒	bǐng	expel, cast off; arrange
3792	虫 142.11	3792	3412	\N	\N	17	蟀	shuài	cricket
3793	手 64.12	3793	3190	\N	\N	15	撵	niǎn	drive away, expel, oust
3794	水 85.6	3794	4345	\N	\N	9	浒	hǔ	riverbank, shore
3795	糸 120.10	3795	3047	\N	7–9	13	缤	bīn	flourishing, thriving, abundant
3796	山 46.9	3796	5176	\N	\N	12	嵋	méi	Omei mountain in Sichuan
3797	玉 96.5	3797	4087	\N	\N	9	珑	lóng	a gem cut like dragon
3798	艸 140.5	3798	1009	\N	\N	8	苞	bāo	a variety of rush; firm, enduring; to burst forth
3799	玉 96.11	3799	5851	\N	\N	15	瑾	jǐn	brilliance of gems; fine jade
3800	水 85.5	3800	1452	\N	\N	9	泵	bèng	pump
3801	金 167.5	3801	1931	\N	\N	10	钾	jiǎ	potassium
3802	日 72.10	3802	5700	6	\N	14	暧	ài	obscure, dim, ambiguous, vague
3803	广 53.9	3803	5260	\N	\N	12	赓	gēng	continue
3804	又 29.8	3804	4260	\N	\N	9	叟	sǒu	old man; elder
3805	人 9.5	3805	3731	\N	\N	7	佚	yì	indulge in pleasures; flee
3806	水 85.4	3806	3936	\N	\N	8	沓	dá	connected, joined; repeated
3807	手 64.11	3807	5633	\N	\N	14	撂	liào	put down, put aside; drop
3808	虫 142.5	3808	4836	\N	\N	11	蛊	gǔ	poison; venom; harm; bewitch
3809	生 100.7	3809	2667	\N	\N	12	甥	shēng	sister's son, nephew
3810	玉 96.12	3810	6197	\N	\N	17	璐	lù	beautiful variety of jade
3811	日 72.6	3811	4502	\N	\N	10	晏	yàn	peaceful, quiet; clear; late in the day
3812	疒 104.10	3812	3281	\N	\N	15	瘪	biě	shrivelled up, dried up; vexed
3813	水 85.11	3813	5809	\N	\N	14	漳	zhāng	name of a river in Henan
3814	門 169.8	3814	4947	\N	\N	11	阉	yān	castrate; eunuch
3815	足 157.9	3815	3345	\N	\N	16	蹂	róu	trample under foot, tread on
3816	魚 195.9	3816	6279	\N	\N	17	鳃	sāi	fish gills
3817	玉 96.7	3817	4713	\N	\N	11	琏	liǎn	vessel used to hold grain offerings
3818	水 85.9	3818	2762	\N	\N	12	湃	pài	sound of waves; turbulent
3819	車 159.11	3819	5898	\N	\N	15	辘	lù	windlass, pulley, capstan; wheel
3820	人 9.12	3820	5758	\N	\N	14	僭	jiàn	assume, usurp
3821	足 157.14	3821	3492	\N	\N	21	躏	lìn	trample down, oppress, overrun
3822	鼻 209.3	3822	6264	\N	\N	17	鼾	hān	snore loudly
3823	心 61.16	3823	6363	\N	\N	18	懵	měng	stupid, ignorant, dull
3824	金 167.13	3824	3444	\N	\N	18	镰	lián	sickle
3825	宀 40.9	3825	5302	\N	\N	12	寐	mèi	sleep; be asleep
3826	衣 145.9	3826	5597	\N	\N	13	褚	chǔ	bag, valise; stuff, pad; surname
3827	手 64.20	3827	6480	\N	\N	23	攥	zuàn	(coll.) hold; grip; grasp
3828	水 85.7	3828	2082	\N	\N	10	涧	jiàn	brook, mountain stream
3829	虫 142.9	3829	3251	\N	\N	15	蝙	biān	bat
3830	肉 130.6	3830	1999	\N	\N	10	脐	qí	abdominal area of crab; navel
3831	車 159.10	3831	5686	6	\N	14	辕	yuán	shafts of cart; yamen
3832	水 85.7	3832	2078	\N	\N	10	涣	huàn	scatter; scattered
3833	木 75.3	3833	3680	\N	\N	7	杞	qǐ	willow; medlar tree; a small feudal state (Qi)
3834	火 86.9	3834	5560	\N	\N	13	煜	yù	bright, shining, brilliant
3835	馬 187.16	3835	6418	\N	\N	19	骥	jì	thoroughbred horse; refined and
3836	人 9.10	3836	5208	\N	\N	12	傣	dǎi	the Dai minority living in South China
3837	口 30.10	3837	5470	\N	\N	13	嗳	āi	interjection; exclamation
3838	示 113.6	3838	4673	\N	\N	10	祯	zhēn	lucky, auspicious, good omen
3839	酉 164.0	3839	698	\N	\N	7	酉	yǒu	10th terrestrial branch; a wine vessel
3840	禾 115.6	3840	2312	\N	\N	11	秸	jiē	stalks of millet, corn
3841	手 64.8	3841	2165	\N	\N	11	捺	nà	to press down heavily with the fingers
3842	玉 96.9	3842	5345	\N	\N	13	瑕	xiá	flaw in gem; fault, defect
3843	金 167.16	3843	6490	\N	\N	24	鑫	xīn	used in names
3844	食 184.9	3844	2725	6	7–9	12	馋	chán	gluttonous, greedy; lewd, lecherous
3845	穴 116.12	3845	3383	\N	7–9	16	窿	lóng	mine shaft; cavity, hole
3846	木 75.9	3846	5392	\N	\N	13	楔	xiē	wedge; gatepost; foreword
3847	肉 130.6	3847	4590	\N	\N	10	胱	guāng	bladder
3848	艸 140.6	3848	1421	\N	\N	9	荔	lì	lichee
3849	虫 142.11	3849	3346	\N	\N	16	蟆	má	frog, toad
3850	水 85.9	3850	5283	\N	\N	12	湍	tuān	rapid water current, rapids
3851	山 46.3	3851	435	\N	7–9	6	屹	yì	to rise high; to stand erect
3852	辵 162.9	3852	5315	\N	\N	12	遐	xiá	afar, distant; old, advanced in
3853	車 159.5	3853	4179	\N	\N	9	轲	kē	axle; personal name of mencius
3854	金 167.13	3854	6346	\N	\N	18	镯	zhuó	bracelet, armband; small bell
3855	糸 120.13	3855	3386	\N	\N	16	缰	jiāng	reins, bridle
3856	木 75.6	3856	1842	\N	\N	10	桦	huà	type of birch
3857	火 86.4	3857	4005	\N	7–9	8	炖	dùn	heat with fire; stew
3858	金 167.4	3858	4241	\N	\N	9	钡	bèi	barium
3859	羊 123.5	3859	2399	\N	\N	11	羚	líng	species of antelope
3860	十 24.9	3860	4780	6	\N	11	啬	sè	miserly, thrifty; stingy
3861	言 149.6	3861	4059	\N	\N	8	诩	xǔ	boast, brag; popular, well-known
3862	糸 120.8	3862	5030	\N	7–9	11	绯	fēi	scarlet, dark red, crimson; purpl
3863	手 64.8	3863	4733	\N	\N	11	掖	yē	support with the arms; stick in, tuck in; fold up
3864	竹 118.8	3864	5753	\N	\N	14	箓	lù	book
3865	水 85.8	3865	4973	\N	\N	11	涸	hé	dried up; exhausted, tired; dry
3866	鳥 196.5	3866	2010	\N	\N	10	鸳	yuān	male mandarin duck (Aix galericulata)
3867	土 32.11	3867	5779	\N	\N	14	塾	shú	village school; private tutorage
3868	口 30.5	3868	3902	\N	\N	8	呸	pēi	expression of reprimand
3869	手 64.4	3869	635	\N	7–9	7	抡	lūn	swing, brandish, flourish
3870	手 64.13	3870	6042	\N	\N	16	擞	sǒu	shake, tremble, quake; flutter
3871	火 86.12	3871	6040	\N	\N	16	熹	xī	dim light, glimmer; warm, bright
3872	土 32.5	3872	955	\N	\N	8	坷	kě	clod of earth, lump of soil
3873	瓦 98.4	3873	3975	\N	\N	8	瓮	wèng	earthen jar; jar for ashes
3874	二 7.4	3874	3585	\N	\N	6	亘	gèn	extend across, through; from
3875	口 30.10	3875	5157	\N	\N	12	嗟	jiē	sigh, alas
3876	竹 118.7	3876	5206	\N	\N	12	筵	yán	bamboo mat; feast, banquet
3877	足 157.5	3877	2632	\N	\N	12	跛	bǒ	lame
3878	水 85.3	3878	3623	\N	\N	6	汕	shàn	basket for catching fish; bamboo; Swatow (Shantou)
3879	欠 76.3	3879	3690	\N	\N	7	欤	yú	a final particle used to express admiration, doubt, surprise, or to mark a question
3880	土 32.14	3880	6223	\N	\N	17	壑	hè	bed of torrent, narrow ravine
3881	水 85.8	3881	5238	\N	\N	12	颍	yǐng	river in Anhui
3882	水 85.10	3882	5571	\N	\N	13	溥	pǔ	big, great, vast, wide; widespread
3883	女 38.5	3883	4066	\N	\N	8	姗	shān	slander; ridicule; proceed slowly
3884	足 157.7	3884	3104	6	7–9	14	踊	yǒng	leap, jump
3885	木 75.4	3885	3991	\N	\N	8	枭	xiāo	owl thus, something evil
3886	日 72.9	3886	5449	6	\N	13	暄	xuān	warm, comfortable; warm, genial
3887	禾 115.10	3887	5954	\N	\N	15	稷	jì	god of cereals; minister of agriculture
3888	足 157.5	3888	5138	\N	\N	12	跚	shān	stagger, limp
3889	水 85.7	3889	4647	\N	\N	10	涟	lián	flowing water; ripples; weeping
3890	水 85.16	3890	6414	\N	\N	19	瀛	yíng	sea, ocean
3891	竹 118.5	3891	2320	\N	\N	11	笙	shēng	small gourd-shaped musical instrument
3892	水 85.10	3892	5967	\N	\N	15	滕	téng	an ancient state in Shandong province; water bursting forth
3893	足 157.8	3893	5912	\N	\N	15	踝	huái	ankle
3894	弋 56.6	3894	1353	\N	\N	9	贰	èr	number two
3895	目 109.12	3895	6086	\N	\N	16	瞰	kàn	watch, spy; overlook; look down
3896	心 61.6	3896	4354	\N	\N	9	恻	cè	feel anguish, feel compassion
3897	口 30.14	3897	6225	5	\N	17	嚏	tì	sneeze
3898	辵 162.5	3898	1331	\N	\N	8	迢	tiáo	far; distant
3899	犬 94.12	3899	5975	\N	\N	15	獗	jué	unruly, wild, violent, lawless
3900	邑 163.5	3900	3660	\N	\N	7	邯	hán	city in Hebei province; various
3901	目 109.7	3901	5124	\N	\N	12	睑	jiǎn	eyelid
3902	貝 154.13	3902	3414	\N	7–9	17	赡	shàn	support, aid; rich, elegant
3903	艸 140.8	3903	4767	\N	\N	11	萦	yíng	entangle, entwine, coil
3904	玉 96.6	3904	4401	\N	\N	10	珥	ěr	ear ornament; stick, insert
3905	酉 164.6	3905	5412	\N	\N	13	酮	tóng	ketones
3906	玉 96.12	3906	6029	\N	\N	16	璞	pú	unpolished gem, uncarved gem
3907	羊 123.13	3907	3469	\N	\N	19	羹	gēng	soup, broth
3908	糸 120.9	3908	5330	\N	\N	12	缄	jiān	seal, close; bind; letter
3909	日 72.8	3909	2625	6	\N	12	晾	liàng	air-dry; sun-dry
3910	人 9.8	3910	4561	\N	\N	10	俸	fèng	wages, salary, official emolument
3911	女 38.10	3911	5606	\N	7–9	13	媲	pì	marry off, pair, match; compare
3912	鳥 196.6	3912	4934	\N	\N	11	鸾	luán	fabulous bird
3913	心 61.7	3913	5025	\N	\N	11	恿	yǒng	instigate, incite; to alarm
3914	虫 142.8	3914	5712	\N	\N	14	蜿	wān	creep, crawl
3915	牛 93.8	3915	5196	\N	\N	12	犊	dú	calf; victim of sacrifice
3916	言 149.4	3916	3634	\N	\N	6	讷	nè	slow of speech; mumble; stammer
3917	戶 63.7	3917	4996	\N	\N	11	扈	hù	escort, retinue; insolent
3918	虫 142.7	3918	2922	\N	\N	13	蜈	wú	centipede
3919	羽 124.8	3919	5838	\N	\N	14	翟	dí	surname; a kind of pheasant; plumes
3920	艸 140.15	3920	3437	\N	\N	18	藕	ǒu	lotus root
3921	戈 62.2	3921	387	\N	\N	6	戌	xū	11th terrestrial branch
3922	艸 140.10	3922	5376	\N	\N	13	蓓	bèi	bud
3923	金 167.7	3923	5865	\N	\N	15	鋆	yún	gold; character used in personal name
3924	言 149.11	3924	5602	\N	\N	13	谩	mán	deceive, insult
3925	言 149.8	3925	4675	\N	\N	10	谀	yú	flatter, truckle
3926	卩 26.3	3926	291	\N	\N	5	卯	mǎo	4th terrestrial branch; period from 5-7 a.m.
3927	言 149.9	3927	5007	\N	\N	11	谙	ān	versed in, fully acquainted with
3928	山 46.4	3928	3713	\N	\N	7	岐	qí	high; majestic; fork in road
3929	虫 142.9	3929	3248	\N	\N	15	蝎	xiē	scorpion
3930	艸 140.7	3930	4436	\N	\N	10	荼	tú	bitter vegetable
3931	金 167.9	3931	3115	\N	\N	14	镀	dù	plate, coat, gild
3932	木 75.9	3932	2565	\N	7–9	12	椰	yē	palm tree, coconut palm
3933	瓦 98.9	3933	5411	\N	\N	13	甄	zhēn	to examine, discern; to grade; a surname
3934	虫 142.13	3934	6392	\N	\N	19	蟾	chán	toad
3935	足 157.10	3935	6229	\N	\N	17	蹊	qī	footpath, trail; track
3936	水 85.5	3936	1254	\N	\N	8	泞	nìng	mud; miry, muddy, stagnant
3937	手 64.12	3937	5864	\N	\N	15	撸	lū	(dialect) to rub one's hand along; to fire (an employee)
3938	虫 142.10	3938	3347	\N	\N	16	螃	páng	crab
3939	木 75.14	3939	3394	\N	\N	17	檬	méng	type of locust oracacia
3940	犬 94.8	3940	\N	\N	\N	11	猓	guǒ	monkey
3941	艸 140.11	3941	5644	\N	\N	14	蔷	qiáng	rose
3942	羊 123.10	3942	6166	\N	\N	16	羲	xī	ancient emperor; breath, vapor
3943	疒 104.11	3943	3369	6	\N	16	瘸	qué	lameness, paralysis of hands, leg
3944	艸 140.19	3944	6466	\N	7–9	22	蘸	zhàn	dip (a brush); remarry
3945	艸 140.11	3945	3072	\N	\N	14	蔗	zhè	sugar cane
3946	人 9.10	3946	4908	\N	\N	11	傀	guī	great, gigantic; puppet
3947	虫 142.4	3947	1898	\N	\N	10	蚌	bàng	oysters, mussels; mother-of-pearl
3948	金 167.8	3948	5488	\N	\N	13	锢	gù	run metal into cracks; confine
3949	辵 162.13	3949	6082	\N	\N	16	遽	jù	suddenly, unexpectedly; at once
3950	辵 162.13	3950	6300	\N	\N	17	邃	suì	profound, detailed; deep
3951	心 61.6	3951	4412	\N	\N	10	恚	huì	anger, rage
3952	白 106.6	3952	4911	\N	\N	11	皑	ái	brilliant white
3953	金 167.9	3953	5738	\N	\N	14	锵	qiāng	tinkle, clang, jingle
3954	竹 118.11	3954	6255	\N	\N	17	簌	sù	(of flower petals) falling
3955	火 86.8	3955	5274	\N	\N	12	焙	bèi	dry over slow fire; bake; roast
3956	日 72.4	3956	3897	\N	\N	8	昊	hào	summer time; sky; heaven
3957	鳥 196.17	3957	6467	\N	\N	22	鹳	guàn	crane, grus japonensis; stork; Ciconia species (various)
3958	目 109.9	3958	5694	\N	\N	14	睽	kuí	staring
3959	刀 18.6	3959	3971	\N	\N	8	刽	guì	amputate, cut off
3960	魚 195.11	3960	3470	\N	\N	19	鳖	biē	turtle
3961	口 30.12	3961	5906	\N	\N	15	噎	yē	choke; hiccup
3962	口 30.4	3962	3708	\N	\N	7	呗	bei	final particle of assertion
3963	宀 40.13	3963	6183	\N	\N	16	寰	huán	great domain, country, world
3964	口 30.8	3964	4847	\N	\N	11	唷	yō	final particle
3965	歹 78.10	3965	5683	\N	\N	14	殡	bìn	encoffin; embalm; funeral
3966	水 85.8	3966	4970	\N	\N	11	淖	nào	slush; mud
3967	言 149.7	3967	4371	\N	\N	9	诰	gào	inform, notify, admonish, order
3968	心 61.6	3968	4625	\N	\N	10	恣	zì	indulge oneself, unrestrained
3969	目 109.7	3969	2612	\N	\N	12	睐	lài	squint at; sidelong glance
3970	女 38.8	3970	5021	\N	\N	11	婵	chán	beautiful, lovely, pretty, graceful
3971	木 75.9	3971	5402	\N	\N	13	榈	lǘ	palm
3972	气 84.6	3972	4550	\N	\N	10	氦	hài	helium
3973	革 177.4	3973	5371	\N	\N	13	靳	jìn	martingale; stingy; surname
3974	虫 142.7	3974	5465	\N	\N	13	蛹	yǒng	chrysalis, larva
3975	鳥 196.5	3975	1910	\N	\N	10	鸯	yāng	female mandarin duck (Aix galericulata)
3976	心 61.8	3976	4983	\N	\N	11	惬	qiè	be satisfied, be comfortable
3977	足 157.11	3977	6324	\N	\N	18	蹙	cù	urgent, suddenly; grieve, lament
3978	言 149.6	3978	4043	\N	\N	8	诙	huī	tease, joke with; ridicule, mock
3979	目 109.4	3979	4194	\N	\N	9	眈	dān	gloat, stare at; to delay, to loiter, to hinder
3980	网 122.5	3980	4522	\N	\N	10	罡	gāng	the name of a certain stars; the god who is supposed to live in them
3981	糸 120.12	3981	6022	\N	\N	15	缮	shàn	repair, mend; rewrite, transcribe
3982	肉 130.5	3982	4302	\N	\N	9	胤	yìn	heir, successor; progeny, posterity
3983	白 106.5	3983	4579	\N	\N	10	皋	gāo	the high land along a river
3984	虫 142.5	3984	2279	\N	\N	11	蛀	zhù	insects that eat books, clothes
3985	人 9.9	3985	4564	\N	\N	10	偌	ruò	thus, so, like, such
3986	疒 104.5	3986	4940	\N	\N	11	疵	cī	flaw, fault, defect; disease
3987	糸 120.6	3987	4397	\N	\N	9	绛	jiàng	deep red; river in Shanxi provinc
3988	艸 140.9	3988	5087	\N	\N	12	葆	bǎo	reserve, preserve; conceal
3989	黑 203.4	3989	3353	\N	\N	16	黔	qián	black; Guizhou
3990	口 30.9	3990	5162	\N	\N	12	喙	huì	beak, bill, snout; pant
3991	火 86.7	3991	4959	\N	\N	11	烽	fēng	signal fire; tower where signal
3992	人 9.15	3992	6262	\N	\N	17	儡	lěi	puppet, dummy
3993	人 9.6	3993	3964	\N	\N	8	佼	jiǎo	beautiful, handsome, good-looking
3994	文 67.12	3994	6161	\N	\N	16	斓	lán	multicolored
3995	女 38.10	3995	5608	\N	\N	13	嫔	pín	court lady; palace maid
3996	頁 181.9	3996	5931	\N	\N	15	颚	è	jaw
3997	齒 211.6	3997	5691	\N	\N	14	龈	kěn	gums
3998	皿 108.4	3998	4213	\N	\N	9	盅	zhōng	small cup or bowl
3999	女 38.7	3999	4695	\N	\N	10	娓	wěi	comply; complying, agreeable
4000	土 32.4	4000	3653	\N	\N	7	坂	bǎn	hillside, inconvenient places
4001	田 102.2	4001	3706	\N	\N	7	町	tīng	raised path between fields
4002	艸 140.4	4002	667	\N	\N	7	芥	jiè	mustard plant; mustard; tiny
4003	疒 104.10	4003	5985	\N	\N	15	瘠	jí	thin, emaciated; barren
4004	門 169.6	4004	4319	6	7–9	9	阂	hé	blocked or separated; to prevent
4005	手 64.6	4005	1372	6	7–9	9	挎	kuà	carry
4006	木 75.12	4006	6058	\N	\N	16	橇	qiāo	a sledge for transportation
4007	艸 140.6	4007	4123	\N	\N	9	荟	huì	luxuriant, flourishing, abundant
4008	口 30.8	4008	4854	\N	\N	11	啜	chuài	sip, suck up; sob, weep
4009	土 32.6	4009	1388	\N	\N	9	垛	duǒ	heap, pile; pile up, heap up
4010	水 85.8	4010	4965	\N	\N	11	淇	qí	river in Henan province
4011	玉 96.16	4011	6420	\N	\N	20	瓒	zàn	ceremonial libation cup
4012	竹 118.9	4012	3266	\N	\N	15	篓	lǒu	bamboo basket
4013	虫 142.2	4013	4071	\N	\N	8	虱	shī	louse; bug; parasite
4014	足 157.6	4014	5458	\N	\N	13	跻	jī	ascend, go up, rise
4015	龍 212.6	4015	4919	\N	\N	11	龛	kān	niche, shrine
4016	足 157.10	4016	6228	\N	\N	17	蹒	pán	to jump over; to limp
4017	髟 190.5	4017	5859	\N	\N	15	髯	rán	beard; mustache
4018	目 109.11	4018	6085	\N	\N	16	瞠	chēng	look at, stare at, gaze at
4019	疒 104.7	4019	5258	\N	\N	12	痫	xián	epilepsy, convulsions
4020	手 64.8	4020	2183	\N	\N	11	掂	diān	heft, hold or weigh in palm
4021	水 85.12	4021	6004	\N	\N	15	潼	tóng	high, lofty; damp
4022	酉 164.6	4022	5413	\N	\N	13	酰	xiān	acyl
4023	金 167.9	4023	5739	\N	\N	14	镁	měi	magnesium
4024	火 86.3	4024	819	\N	7–9	7	灸	jiǔ	cauterize with moxa; moxibustion
4025	肉 130.8	4025	5230	\N	\N	12	腆	tiǎn	prosperous; good; protruding
4026	竹 118.7	4026	5504	\N	\N	13	筱	xiǎo	dwarf bamboo
4027	言 149.8	4027	2126	\N	\N	10	谆	zhūn	patient, earnest; earnestly
4028	馬 187.7	4028	4702	\N	\N	10	骋	chěng	gallop horse; hasten, hurry
4029	士 33.1	4029	124	\N	\N	4	壬	rén	9th heavenly stem
4030	艸 140.6	4030	4125	\N	\N	9	茗	míng	tea; tea plant
4031	木 75.8	4031	5101	\N	\N	12	椋	liáng	fruit
4032	虫 142.6	4032	5147	\N	\N	12	蛔	huí	tapeworm
4033	水 85.12	4033	6005	\N	\N	15	潺	chán	sound of flowing water
4034	戶 63.8	4034	5304	\N	\N	12	扉	fēi	door panel
4035	耒 127.4	4035	1767	\N	\N	10	耘	yún	weed
4036	木 75.10	4036	5668	\N	\N	14	槟	bīn	betel-nut, areca nut
4037	雨 173.5	4037	2887	6	\N	13	雹	báo	hail
4038	用 101.2	4038	3819	\N	\N	7	甬	yǒng	path; river in Ningbo; Ningbo
4039	言 149.10	4039	5313	\N	\N	12	谥	shì	to confer posthumous titles
4040	水 85.8	4040	4967	\N	\N	11	淞	sōng	name of a river in Jiangsu
4041	火 86.12	4041	6170	\N	\N	16	燎	liáo	to burn, set afire; to illuminate; a signal lamp
4042	艸 140.12	4042	5872	\N	\N	15	蕙	huì	species of fragrant orchid
4043	虫 142.4	4043	1902	\N	\N	10	蚪	dǒu	tadpole
4044	虫 142.8	4044	3105	\N	\N	14	蜻	qīng	dragonfly
4045	邑 163.8	4045	4636	\N	\N	10	郸	dān	county in Hebei province
4046	車 159.5	4046	4181	\N	\N	9	轶	yì	rush forth; surpass, excel
4047	犬 94.6	4047	1603	\N	\N	9	狰	zhēng	fierce-looking, ferocious
4048	木 75.9	4048	5406	\N	\N	13	楣	méi	crossbeam above or under gate
4049	手 64.7	4049	4422	\N	\N	10	捋	lǚ	to pluck; to gather in the fingers; to rub; to scrape off
4050	水 85.7	4050	4652	\N	\N	10	涓	juān	brook, stream; select; pure
4051	艸 140.6	4051	4135	\N	\N	9	荪	sūn	aromatic grass; iris, flower
4052	女 38.6	4052	1649	\N	\N	9	娄	lóu	surname; a constellation; to wear
4053	鹿 198.10	4053	6456	\N	\N	21	麝	shè	musk deer
4054	虫 142.4	4054	1749	\N	\N	9	蚤	zǎo	flea; louse
4055	艸 140.14	4055	6209	\N	\N	17	薰	xūn	a medicinal herb; to cauterize
4056	酉 164.12	4056	6375	\N	\N	19	醮	jiào	religious service; Daoist or Buddhist ceremony
4057	手 64.10	4057	5358	\N	\N	13	搪	táng	ward off, evade; parry; block
4058	言 149.10	4058	5314	\N	\N	12	谧	mì	calm, quiet, still; cautious
4059	水 85.9	4059	5279	\N	\N	12	湮	yān	bury, sink, block up; stain
4060	車 159.8	4060	5120	\N	\N	12	辍	chuò	stop, suspend, halt
4061	目 109.10	4061	5902	\N	\N	15	瞌	kē	doze off; sleepy
4062	木 75.7	4062	1834	\N	\N	10	梆	bāng	watchman's rattle
4063	木 75.11	4063	3217	\N	\N	15	樟	zhāng	camphor tree
4064	艸 140.5	4064	998	\N	\N	8	茉	mò	white jasmine
4065	山 46.4	4065	753	\N	\N	7	岖	qū	steep, sheer; rugged, rough
4066	臼 134.0	4066	462	\N	\N	6	臼	jiù	mortar; bone joint socket
4067	疒 104.14	4067	3467	\N	\N	19	癣	xuǎn	ringworms
4068	禾 115.11	4068	6123	\N	\N	16	穑	sè	farm, harvest grain; stingy
4069	玉 96.5	4069	1357	\N	\N	9	玷	diàn	flaw in gem; flaw in character
4070	食 184.10	4070	2984	\N	\N	13	馍	mó	bread
4071	口 30.5	4071	3912	\N	\N	8	呷	gā	suck, swallow, drink
4072	艸 140.9	4072	5086	\N	\N	12	萼	è	the stem and calyx of a flower; a younger brother
4073	女 38.4	4073	3807	\N	\N	7	妩	wǔ	charming, enchanting
4074	人 9.4	4074	3610	\N	\N	6	伫	zhù	to stand for a long time; to wait
4075	彡 59.4	4075	817	\N	\N	7	彤	tóng	red, vermilion; name of ancient
4076	艸 140.7	4076	4433	\N	\N	10	莓	méi	moss; edible berries
4077	山 46.5	4077	3925	\N	\N	8	岬	jiǎ	cape; promontory, headland
4078	女 38.9	4078	5321	\N	\N	12	媛	yuàn	beauty, beautiful woman
4079	心 61.8	4079	4989	\N	\N	11	惆	chóu	distressed, regretful, sad
4080	魚 195.10	4080	6353	\N	\N	18	鳎	tǎ	sole
4081	口 30.9	4081	5154	\N	\N	12	啾	jiū	wailing of child; chirp
4084	子 39.14	4084	6304	\N	\N	17	孺	rú	child; blood relation; affection
4085	彳 60.6	4085	4269	\N	\N	9	徇	xùn	comply with, follow; display
4086	彳 60.12	4086	5962	\N	\N	15	徵	zhēng	summon, recruit; musical note
4087	火 86.7	4087	2408	\N	7–9	11	焊	hàn	weld, solder
4088	山 46.5	4088	3956	\N	\N	8	岱	dài	Daishan, one of the Five Sacred Mountains in China
4089	日 72.5	4089	4201	\N	\N	9	昵	nì	intimate, close; approach
4090	十 24.2	4090	3512	\N	\N	4	卅	sà	thirty, thirtieth
4091	風 182.12	4091	6074	\N	7–9	16	飙	biāo	whirlwind, stormy gale
4092	邑 163.3	4092	3552	\N	\N	5	邙	máng	mountain in Henan province
4093	疒 104.7	4093	5256	\N	\N	12	痞	pǐ	dyspepsia, spleen infection
4094	隹 172.2	4094	4574	\N	\N	10	隼	sǔn	aquiline (nose); a falcon
4095	心 61.6	4095	4352	\N	\N	9	恫	dòng	in pain, sorrowful
4096	心 61.4	4096	3791	\N	\N	7	怆	chuàng	sad, broken-hearted, disconsolate
4097	木 75.6	4097	4607	\N	\N	10	桀	jié	chicken roost; ancient emperor
4098	糸 120.8	4098	5035	\N	\N	11	绶	shòu	silk ribbon attached as a seal
4099	衣 145.6	4099	4999	\N	\N	11	裆	dāng	crotch or seat of pants; pants
4100	皿 108.3	4100	3833	\N	\N	8	盂	yú	basin; cup
4101	木 75.6	4101	4459	\N	\N	10	桧	guì	Chinese cypress, Chinese juniper
4102	虫 142.4	4102	1903	\N	\N	10	蚓	yǐn	earthworm
4103	手 64.4	4103	617	\N	7–9	7	抠	kōu	raise, lift up; tight-fisted
4104	口 30.11	4104	5434	\N	\N	13	嗷	áo	loud clamor; sound of wailing
4105	木 75.10	4105	5399	\N	\N	13	槌	chuí	hammer, mallet; strike, beat
4106	疒 104.7	4106	2731	\N	\N	12	痘	dòu	smallpox
4107	疒 104.7	4107	2732	\N	\N	12	痢	lì	dysentery
4108	艸 140.4	4108	3666	\N	\N	7	芮	ruì	small; surname
4109	虫 142.4	4109	1900	\N	\N	10	蚣	gōng	centipede
4110	門 169.1	4110	3522	\N	\N	4	闩	shuān	bolt, latch, crossbar
4111	金 167.7	4111	5180	\N	\N	12	铿	kēng	strike, beat, stroke; jingling
4112	風 182.8	4112	5242	\N	\N	12	飓	jù	cyclone, typhoon, gale
4113	疒 104.5	4113	4619	\N	\N	10	疱	pào	acne
4114	虫 142.9	4114	3249	\N	\N	15	蝌	kē	tadpole
4115	手 64.12	4115	5862	\N	\N	15	撅	juē	protrude; snap, break; dig
4116	虫 142.5	4116	2278	\N	\N	11	蚯	qiū	earthworm
4117	斗 68.10	4117	5657	\N	\N	14	斡	wò	revolve, rotate, turn
4118	穴 116.8	4118	5594	\N	\N	13	窠	kē	nest; hole, indention; den
4119	艸 140.6	4119	4109	\N	\N	9	荚	jiá	pods of leguminous plants; pods
4120	耳 128.3	4120	4172	\N	\N	9	耷	dā	ears hanging down
4121	石 112.4	4121	1453	\N	\N	9	砚	yàn	inkstone
4122	片 91.9	4122	5505	\N	\N	13	牒	dié	documents, records; dispatch
4123	貝 154.7	4123	4863	\N	\N	11	赈	zhèn	relieve, aid distressed; rich
4124	火 86.9	4124	5448	\N	\N	13	煦	xù	kind, gentle, gracious, genial
4125	口 30.10	4125	5442	\N	\N	13	嗫	niè	move lips as when speaking; hesitation
4126	耒 127.4	4126	1769	\N	\N	10	耙	bà	rake
4127	木 75.10	4127	3083	\N	\N	14	榕	róng	banyan tree
4128	革 177.6	4128	5871	\N	\N	15	鞑	dá	tatars
4129	衣 145.5	4129	4944	\N	\N	11	袤	mào	longitude, lengthwise; length
4130	言 149.9	4130	4994	\N	\N	11	谌	chén	sincere, faithful; surname
4131	酉 164.14	4131	6450	\N	\N	21	醺	xūn	get drunk, be intoxicated
4132	禾 115.3	4132	1130	\N	\N	8	秆	gǎn	straw; stalk of grain
4133	彳 60.9	4133	5217	\N	\N	12	徨	huáng	doubtful, irresolute, vacillating
4134	木 75.12	4134	6061	\N	\N	16	橹	lǔ	oar, scull; row, scull
4135	羽 124.8	4135	5689	\N	\N	14	翡	fěi	kingfisher; emerald, jade
4136	糸 120.11	4136	5845	\N	\N	14	缨	yīng	a chin strap; tassel; to annoy, bother
4137	金 167.9	4137	3113	\N	\N	14	锹	qiāo	shovel
4138	山 46.9	4138	5201	\N	\N	12	嵇	jī	mountain in Henan; surname
4139	土 32.3	4139	3572	\N	\N	6	圪	gē	(phonetic)
4140	髟 190.6	4140	6036	\N	\N	16	髻	jì	hair rolled up in a bun, topknot
4141	口 30.10	4141	5443	\N	\N	13	嗬	hē	(Cant.) interrogative particle
4142	車 159.8	4142	5121	\N	\N	12	辎	zī	a supply cart, covered wagon, dray
4143	疒 104.7	4143	5253	\N	\N	12	痣	zhì	spots, moles; birthmark
4144	女 38.7	4144	4692	\N	\N	10	娩	miǎn	give birth child; complaisant
4145	言 149.8	4145	4677	\N	\N	10	谄	chǎn	flatter, truckle, toady
4146	虫 142.6	4146	5146	\N	\N	12	蛐	qū	cricket; worm
4147	鳥 196.10	4147	5965	\N	\N	15	鹞	yào	sparrow hawk; kite shaped like
4148	羽 124.10	4148	6131	\N	\N	16	翱	áo	soar, roam
4149	广 53.5	4149	3996	\N	\N	8	庖	páo	kitchen; cooking, cuisine
4150	竹 118.13	4150	6399	\N	\N	19	籁	lài	bamboo flute; pipe; various sound
4151	艸 140.11	4151	5656	\N	\N	14	蓿	xu	clover, lucerne
4152	魚 195.11	4152	6406	\N	\N	19	鳗	mán	eel
4153	疒 104.3	4153	1213	\N	\N	8	疟	nüè	intermittent fever; malaria
4154	魚 195.5	4154	5527	\N	\N	13	鲇	nián	sheatfish, parasilurus asotus
4155	辵 162.7	4155	\N	\N	\N	10	這	zhè	this, the, here
4156	口 30.14	4156	6226	\N	\N	17	嚅	rú	talk indistinctly and falteringly
4157	疒 104.8	4157	7572	\N	\N	13	瘀	yū	a hematoma, contusion; extravasted blood
4158	頁 181.7	4158	5516	\N	\N	13	颔	hàn	chin, jowl; give nod
4159	黑 203.5	4159	6241	\N	\N	17	黜	chù	dismiss; demote, downgrade
4160	黑 203.6	4160	6340	\N	\N	18	黠	xiá	sly, cunning, shrewd; artful
4161	水 85.13	4161	6174	\N	\N	16	濑	lài	swift current; rapids
4162	食 184.7	4162	2013	\N	7–9	10	馁	něi	hungry, starving, famished
4163	水 85.6	4163	4344	\N	\N	9	洵	xún	true, real, truly, really
4164	心 61.3	4164	3694	\N	\N	7	忐	tǎn	timorous; nervous
4165	心 61.3	4165	3682	\N	\N	7	忑	tè	fearful; nervous; timid
4166	石 112.5	4166	4480	\N	\N	10	砥	dǐ	a whetstone; to polish
4167	口 30.5	4167	3901	\N	\N	8	咂	zā	to suck, to smack the lips; (Cant.) to cheat
4168	网 122.11	4168	6109	\N	\N	16	罹	lí	sorrow, grief; incur, meet with
4169	米 119.11	4169	3429	\N	\N	17	糠	kāng	chaff, bran, husks; poor
4170	匚 22.3	4170	3534	\N	\N	5	匝	zā	full circle; encircle
4171	人 9.9	4171	4905	\N	\N	11	偃	yǎn	cease, lay off, lay down
4172	水 85.8	4172	4979	\N	\N	11	淙	cóng	gurgling sound of water
4173	糸 120.3	4173	597	\N	\N	6	纫	rèn	thread needle, sew stitch, string
4174	口 30.9	4174	4818	\N	\N	11	喏	nuò	respectful reply of assent to superiors
4175	門 169.6	4175	4317	\N	\N	9	闾	lǘ	village of twenty-five families
4176	示 113.5	4176	4364	\N	\N	9	祛	qū	expel, disperse, exorcise
4177	虫 142.6	4177	5073	\N	\N	12	蛰	zhé	to hibernate
4178	肉 130.9	4178	5519	\N	\N	13	腼	miǎn	modest
4179	水 85.7	4179	2067	\N	7–9	10	涝	lào	inundate, flood; torrent
4180	日 72.14	4180	6331	\N	\N	18	曜	yào	glorious, as sun; daylight, sunlight; one of the seven planets of pre-modern astronomy (the sun, the moon, Mercury, Venus, Mars, Jupiter, and Saturn)
4181	厂 27.9	4181	4800	\N	\N	11	厩	jiù	stable; barnyard
4182	疒 104.5	4182	4617	\N	\N	10	疽	jū	ulcer, carbuncle, abscess
4183	門 169.4	4183	845	\N	\N	7	闰	rùn	intercalary; extra, surplus
4184	水 85.6	4184	4337	\N	\N	9	洄	huí	a back-water; an eddy a whirlpool
4185	火 86.9	4185	5563	\N	\N	13	煊	xuān	warm
4186	水 85.3	4186	3625	\N	\N	6	汐	xī	night tides, evening ebb tide
4187	艸 140.14	4187	6210	\N	\N	17	藓	xiǎn	moss, lichen
4188	玉 96.12	4188	5852	\N	\N	15	璜	huáng	a semicircular jade ornament used as a pendant
4189	金 167.6	4189	4880	\N	\N	11	铬	gè	chromium
4190	糸 120.7	4190	\N	\N	\N	13	經	jīng	classic works; pass through
4191	水 85.9	4191	5291	\N	\N	12	渥	wò	moisten, soak; great, deep; dye; to enrich
4192	革 177.5	4192	5646	\N	\N	14	靼	dá	tartars
4193	酉 164.4	4193	2237	6	7–9	11	酗	xù	drunk, to become violent under the influence of alcohol
4194	艸 140.5	4194	3865	\N	\N	8	苓	líng	fungus, tuber; licorice
4195	口 30.13	4195	6089	\N	\N	16	噤	jìn	close; be silent, be unable speak
4196	口 30.6	4196	4376	\N	\N	9	咫	zhǐ	foot measure of Zhou dynasty
4197	木 75.9	4197	2862	\N	\N	13	椿	chūn	father; a plant with white flowers
4198	魚 195.7	4198	3277	\N	\N	15	鲫	jì	Carassius auratus, crucian carp
4199	金 167.8	4199	5491	\N	\N	13	锭	dìng	spindle, slab, cake, tablet
4200	网 122.3	4200	3938	\N	\N	8	罔	wǎng	net; deceive; libel; negative
4201	金 167.9	4201	7679	\N	\N	14	锺	zhōng	cup, glass, goblet; surname
4202	勹 20.7	4202	4290	\N	\N	9	匍	pú	crawl; lie prostrate
4203	示 113.5	4203	4369	\N	\N	9	祗	zhī	respect, look up to, revere
4204	金 167.8	4204	2945	\N	\N	13	锰	měng	manganese
4205	山 46.4	4205	3593	\N	\N	6	岌	jí	perilous, hazardous; high, steep
4206	食 184.7	4206	\N	\N	\N	10	馀	yú	surplus, excess, remainder
4207	田 102.8	4207	5464	\N	\N	13	畹	wǎn	a field of 20 or 30 mu
4208	米 119.14	4208	3485	\N	\N	20	糯	nuò	glutinous rice; glutinous, sticky
4209	肉 130.5	4209	4288	\N	\N	9	胫	jìng	shinbone; calf of leg
4210	火 86.11	4210	5996	\N	\N	15	熠	yì	bright and sparkling
4211	金 167.6	4211	5778	\N	\N	14	銮	luán	bells hung on horse; bells hung
4212	水 85.4	4212	3767	\N	\N	7	沅	yuán	name of a river in western Hunan that flows into Dongting lake
4213	木 75.8	4213	5104	\N	\N	12	棣	dì	kerria japonica plant, cherry
4214	方 70.7	4214	4942	\N	\N	11	旌	jīng	banner or flag adorned with feathers; to signal
4215	豆 151.8	4215	3220	\N	\N	15	豌	wān	peas
4216	子 39.5	4216	4061	\N	\N	8	孢	bāo	spore
4217	金 167.13	4217	6345	\N	\N	18	镭	léi	radium
4218	馬 187.5	4218	4078	\N	\N	8	驸	fù	extra horse; imperial son-in-law
4219	肉 130.8	4219	5228	\N	\N	12	腌	yān	salt, pickle; be dirty
4220	目 109.4	4220	1478	\N	7–9	9	盹	dǔn	to doze; to nap; to nod
4221	火 86.11	4221	5995	\N	\N	15	熵	shāng	entropy
4222	金 167.10	4222	3257	\N	\N	15	镐	gǎo	stove; bright
4223	食 184.11	4223	5537	\N	\N	13	馐	xiū	food, meal; eat; offer
4224	口 30.11	4224	5719	\N	\N	14	嘤	yīng	seek friends; also used in onomatopoetic expressions
4225	疒 104.13	4225	6356	\N	\N	18	癞	lài	leprosy, scabies, mange; shoddy
4226	骨 188.4	4226	5481	\N	\N	13	骰	tóu	die, dice
4227	韭 179.0	4227	1466	\N	\N	9	韭	jiǔ	scallion, leek; radical 179
4228	門 169.10	4228	5552	\N	\N	13	阖	hé	close; whole, entire; all; leaf
4229	目 109.10	4229	5904	\N	\N	15	瞑	míng	close eyes
4230	衣 145.8	4230	5598	\N	\N	13	裨	bì	aid, benefit, help; supplement
4231	宀 40.5	4231	4035	\N	\N	8	宕	dàng	stone quarry; cave dwelling
4232	戶 63.4	4232	4042	\N	\N	8	戾	lì	perverse, recalcitrant, rebellious
4233	金 167.10	4233	5948	\N	\N	15	镌	juān	engraving tool; carve, engrave
4234	水 85.10	4234	5586	\N	\N	13	溟	míng	drizzling rain; dark, obscure
4235	片 91.8	4235	5211	\N	\N	12	牍	dú	writing tablet; documents, books
4236	隹 172.2	4236	4575	\N	\N	10	隽	juàn	superior, outstanding, talented
4237	女 38.8	4237	5017	\N	\N	11	婊	biǎo	whore, prostitute
4238	鳥 196.7	4238	5199	\N	\N	12	鹄	gǔ	target
4239	土 32.7	4239	1784	\N	\N	10	埂	gěng	ditches for irrigation; hole
4240	手 64.5	4240	979	6	7–9	8	拄	zhǔ	lean on; post; prod; ridicule
4241	女 38.7	4241	4691	\N	\N	10	娲	wā	a goddess, the mythological sister and successor to Fuxi
4242	虫 142.1	4242	3707	\N	\N	7	虬	qiú	young dragon
4243	艸 140.9	4243	5091	\N	\N	12	萱	xuān	day-lily, hemerocallisflava
4244	口 30.8	4244	4849	\N	\N	11	啵	bo	phonetic
4245	虫 142.15	4245	6463	\N	\N	21	蠡	lí	wood-boring insect; bore into wood
4246	艸 140.3	4246	370	\N	\N	6	芋	yù	taro
4247	肉 130.6	4247	4592	\N	\N	10	胭	yān	rouge, cosmetics
4248	豸 153.3	4248	1988	\N	\N	10	豺	chái	wolf; cruel, wicked, mean
4249	口 30.9	4249	5263	\N	\N	12	啻	chì	only, merely; just like; stop at
4250	衣 145.9	4250	5822	\N	\N	14	褛	lǚ	lapel, collar; tattered, threadbare
4251	虫 142.5	4251	4834	\N	\N	11	蛆	qū	maggots
4252	木 75.5	4252	1438	\N	\N	9	柠	níng	lemon
4253	手 64.8	4253	2668	6	7–9	12	掰	bāi	(Cant.) to tear, to rip
4254	竹 118.9	4254	5959	\N	\N	15	篆	zhuàn	seal script; seal, official stamp
4255	人 9.8	4255	4576	\N	\N	10	倌	guān	assistant in wine shop, groom
4256	口 30.5	4256	3918	\N	\N	8	咛	níng	enjoin, instruct; charge
4257	虫 142.6	4257	5144	\N	\N	12	蛭	zhì	leech
4258	言 149.10	4258	5312	\N	\N	12	谡	sù	rise up; raise up
4259	艸 140.6	4259	4132	\N	\N	9	荨	xún	nettle
4260	艸 140.7	4260	4443	\N	\N	10	莞	guǎn	smiling; a kind of aquatic herb, clubrush, Scirpus lacustris
4261	水 85.13	4261	6178	\N	\N	16	澹	dàn	calm, quiet, tranquil
4262	糸 120.4	4262	3821	\N	\N	7	纭	yún	confused, in disorder; numerous
4263	水 85.12	4263	6176	\N	\N	16	潞	lù	river in northern china
4264	邑 163.6	4264	3894	\N	\N	8	郅	zhì	to go up to. flourishing a superlative
4265	弋 56.0	4265	3504	\N	\N	3	弋	yì	catch, arrest; shoot with bow
4266	風 182.10	4266	5534	\N	\N	13	飕	sōu	sound of wind; blow chilly
4267	虫 142.11	4267	6234	\N	\N	17	螳	táng	mantis
4268	肉 130.5	4268	4208	\N	\N	9	胄	zhòu	helmet, headpiece; descendant
4269	虫 142.11	4269	6235	\N	\N	17	蟑	zhāng	cockroach
4270	犬 94.9	4270	5241	\N	\N	12	猥	wěi	vulgar, low, cheap; wanton; obscene
4271	宀 40.5	4271	4037	\N	\N	8	宓	mì	quiet, silent; in good health
4272	日 72.4	4272	3898	\N	\N	8	昙	tán	become cloudy, overcast
4273	金 167.7	4273	5186	\N	\N	12	锏	jiǎn	kind of rapier
4274	虫 142.12	4274	6337	\N	\N	18	蟠	pán	coil; coiling, curling; occupy
4275	辵 162.9	4275	\N	\N	\N	11	過	guò	pass, pass through, go across
4276	木 75.5	4276	1426	\N	\N	9	柑	gān	tangerine, loose-skinned orange
4277	火 86.7	4277	4957	\N	\N	11	烯	xī	alkene
4278	勹 20.9	4278	4924	\N	\N	11	匐	fú	fall prostrate; crawl
4279	水 85.14	4279	6294	\N	\N	17	濮	pú	county in Henan province
4280	虫 142.12	4280	6338	\N	\N	18	蟮	shàn	type of earthworm
4281	示 113.5	4281	6905	\N	\N	9	祐	yòu	divine intervention, protection
4282	人 9.2	4282	3513	\N	\N	4	仄	zè	slanting, oblique; oblique tones
4283	人 9.9	4283	4907	\N	\N	11	偈	jì	brave; martial; hasty; scudding
4284	虫 142.7	4284	5416	\N	\N	13	蜃	shèn	marine monster which can change its shape; water spouts; clams
4285	竹 118.9	4285	5955	\N	\N	15	箴	zhēn	needle, probe; admon
4286	米 119.8	4286	5793	\N	\N	14	粼	lín	clear (as of water)
4287	口 30.10	4287	5468	\N	\N	13	嗥	háo	roar, call out, wail; bark, yelp
4288	衣 145.10	4288	6011	\N	\N	15	褴	lán	ragged, tattered, threadbare
4289	艸 140.12	4289	5875	\N	\N	15	蕨	jué	pteris aquilina, common bracken
4290	艸 140.10	4290	5380	\N	\N	13	蓟	jì	circium, thistles; surname
4291	土 32.3	4291	3568	\N	\N	6	圩	wéi	dike, embankment
4292	子 39.6	4292	4303	\N	7–9	9	孪	luán	twins
4293	木 75.4	4293	3877	\N	\N	8	杳	yǎo	obscure, dark, mysterious, deep
4294	鬼 194.6	4294	5893	\N	\N	15	魇	yǎn	nightmare, bad dreams
4295	艸 140.6	4295	1416	6	\N	9	荤	hūn	meat diet; strong smelling
4296	言 149.8	4296	4674	\N	\N	10	诿	wěi	pass buck, lay blame on others
4297	竹 118.12	4297	6349	\N	\N	18	簪	zān	hairpin, clasp; wear in hair
4298	气 84.10	4298	5494	\N	\N	13	氲	yūn	life giving influences of nature; spirit of harmony; prosperity
4299	手 64.11	4299	5634	\N	\N	14	摞	luò	to pile up
4300	風 182.5	4300	4315	\N	\N	9	飒	sà	the sound of the wind; bleak; melancholy
4301	金 167.9	4301	5740	\N	\N	14	镂	lòu	carve, inlay, engrave, tattoo
4302	臼 134.4	4302	1986	\N	\N	10	舀	yǎo	dip, ladle; ladle
4303	夕 36.3	4303	3614	\N	\N	6	夙	sù	early in morning, dawn; previous
4304	臣 131.8	4304	5681	\N	\N	14	臧	zāng	good, right, generous; command
4305	艸 140.10	4305	5382	\N	\N	13	蒿	hāo	mugwort, artemisia; give off
4306	豸 153.5	4306	5226	\N	\N	12	貂	diāo	marten, sable, mink
4307	虫 142.8	4307	5705	\N	\N	14	蜥	xī	lizard
4308	足 157.12	4308	6361	\N	\N	18	蹩	bié	to limp
4309	口 30.13	4309	6108	\N	\N	16	噼	pī	child's buttocks (esp. Cantonese)
4310	金 167.4	4310	4240	\N	\N	9	钛	tài	titanium
4311	金 167.4	4311	4239	\N	\N	9	钚	bù	plutonium
4312	犬 94.18	4312	6445	\N	\N	20	獾	huān	the badger
4313	水 85.13	4313	6181	\N	\N	16	濂	lián	a waterfall; a river in Hunan
4314	金 167.6	4314	4870	\N	\N	11	铠	kǎi	armor, chain mail
4315	白 106.8	4315	5401	\N	\N	13	皙	xī	white; kind of date
4316	雨 173.11	4316	6379	\N	\N	19	霭	ǎi	cloudy sky, haze; calm, peaceful
4317	魚 195.5	4317	5528	\N	\N	13	鲈	lú	sea perch, sea bass
4318	口 30.2	4318	3533	\N	\N	5	叵	pǒ	cannot, be unable do, improbable; thereupon
4319	雨 173.14	4319	6468	\N	\N	22	霾	mái	misty, foggy; dust storm
4320	水 85.5	4320	4022	\N	\N	8	泯	mǐn	destroy, eliminate; perish
4321	石 112.9	4321	5677	\N	\N	14	碴	chá	chipped edge of a container
4322	鳥 196.5	4322	2008	\N	\N	10	鸵	tuó	ostrich
4323	山 46.7	4323	4524	\N	\N	10	峪	yù	valley, ravine
4324	食 184.13	4324	6470	\N	\N	22	饕	tāo	gluttonous, greedy, covetous
4325	疒 104.8	4325	5545	\N	\N	13	瘁	cuì	feel tired, be weary, be worn out
4326	目 109.8	4326	5437	\N	\N	13	睢	suī	gaze at, stare at; uninhibited
4327	髟 190.8	4327	6313	\N	\N	18	鬃	zōng	mane; neck bristles
4328	辵 162.5	4328	3983	\N	\N	8	迩	ěr	be near, be close; recently
4329	糸 120.3	4329	3645	\N	\N	6	纣	zhòu	name of an emperor; saddle part
4330	夊 35.19	4330	6457	\N	\N	21	夔	kuí	one-legged monster; walrus
4331	土 32.6	4331	4107	\N	\N	9	垠	yín	boundary, bank of stream or river
4332	食 184.4	4332	3750	\N	\N	7	饨	tún	stuffed dumplings
4333	木 75.10	4333	5664	\N	\N	14	榭	xiè	kiosk, pavilion
4334	阜 170.9	4334	5014	\N	\N	11	隍	huáng	dry ditch, dry moat
4335	女 38.7	4335	4648	\N	\N	10	娑	suō	dance, frolic; lounge; saunter
4336	竹 118.10	4336	6124	\N	\N	16	篝	gōu	bamboo basket; bamboo frame
4337	木 75.9	4337	2578	\N	\N	12	榔	láng	betel-nut tree
4338	水 85.6	4338	4334	\N	\N	9	洌	liè	clear
4339	水 85.7	4339	4655	\N	\N	10	浜	bāng	creek, stream; beach, sea coast
4340	魚 195.6	4340	5768	\N	\N	14	鲑	guī	salmon; spheroides vermicularis
4341	言 149.9	4341	5003	\N	\N	11	谔	è	honest speech, straightforward
4342	水 85.4	4342	3773	\N	\N	7	汩	gǔ	run swiftly
4343	水 85.7	4343	4657	\N	\N	10	浣	huàn	to wash, to rinse
4344	舌 135.4	4344	4552	\N	\N	10	舐	shì	lick with tongue
4345	目 109.12	4345	3401	\N	\N	17	瞭	liǎo	bright, clear; clear-sighted
4346	心 61.4	4346	3789	\N	\N	7	忻	xīn	delightful, joyful, pleasant
4347	口 30.6	4347	4218	\N	\N	9	咻	xiū	shout
4348	鳥 196.8	4348	5538	\N	\N	13	鹑	chún	quail; Turnix species (various)
4349	口 30.7	4349	4519	\N	\N	10	唑	zuò	(chem.) azole
4350	心 61.13	4350	6214	\N	\N	17	懋	mào	splendid, grand, majestic
4351	白 106.6	4351	4912	\N	\N	11	皎	jiǎo	white; bright, brilliant; clear
4352	言 149.5	4352	3800	\N	\N	7	诒	yí	bequeath, pass on to future generations
4353	麻 200.4	4353	5980	\N	\N	15	麾	huī	a pennant, flag, banner; to signal to
4354	車 159.9	4354	5425	\N	\N	13	辏	còu	hubs of wheel; converge around
4355	氏 83.1	4355	3548	\N	\N	5	氐	dī	name of an ancient tribe
4356	冫 15.6	4356	3994	\N	\N	8	冽	liè	cold and raw; pure, clear
4357	竹 118.8	4357	3120	\N	\N	14	箕	jī	sieve; dust pan, garbage bag
4358	人 9.7	4358	4264	\N	\N	9	俚	lǐ	rustic, vulgar, unpolished; mean
4359	水 85.4	4359	3778	\N	\N	7	汴	biàn	name of a river in Henan; Henan
4360	宀 40.7	4360	4665	\N	\N	10	宸	chén	imperial; imperial palace
4361	艸 140.3	4361	3579	\N	\N	6	芍	sháo	peony; water chestnuts
4362	手 64.8	4362	\N	\N	\N	11	捱	ái	put off, procrastinate; endure
4363	手 64.10	4363	5362	\N	\N	13	摈	bìn	exclude, expel, reject; usher
4364	手 64.11	4364	\N	\N	\N	14	摺	zhé	fold, bend; twisted, curved
4365	竹 118.12	4365	\N	\N	\N	18	簦	dēng	large umbrella with a long handle, used for street stalls
4366	竹 118.8	4366	5750	\N	\N	14	箔	bó	reed screen; frame for growing silkworms
4367	口 30.5	4367	3922	\N	\N	8	咝	sī	hiss; call to come; syllable
4368	女 38.17	4368	6446	\N	\N	20	孀	shuāng	widow
4369	心 61.5	4369	4029	\N	\N	8	怏	yàng	discontented, dispirited, sad
4370	言 149.9	4370	5009	\N	\N	11	谝	piǎn	brag, boast; quibble
4371	石 112.5	4371	4476	\N	\N	10	砧	zhēn	anvil; flat stone; exe
4372	食 184.22	4372	6497	\N	\N	25	馕	náng	bread (persian naan)
4373	老 125.4	4373	4420	\N	\N	10	耄	mào	elderly person; very old, senile
4374	缶 121.8	4374	5729	\N	\N	14	罂	yīng	long necked jar or bottle
4375	水 85.11	4375	5801	\N	\N	14	漕	cáo	transport by water; canal transportation
4376	水 85.4	4376	3766	\N	\N	7	沣	fēng	river in Shanxi province
4377	木 75.6	4377	4611	\N	\N	10	栾	luán	name of tree; a part of cornice
4378	木 75.9	4378	\N	\N	\N	13	榘	jǔ	variant of 矩
4379	火 86.7	4379	4961	\N	\N	11	烷	wán	alkane
4380	木 75.10	4380	5670	\N	\N	14	榷	què	footbridge; toll, levy; monopoly
4381	人 9.7	4381	4266	\N	\N	9	俑	yǒng	wooden figure buried with dead
4382	水 85.5	4382	4021	\N	\N	8	沱	tuó	rivers, streams, waterways; flow
4383	糸 120.10	4383	5611	\N	\N	13	缜	zhěn	detailed, fine; closely woven
4384	鳥 196.12	4384	6285	\N	\N	17	鹫	jiù	condor, vulture
4385	虫 142.6	4385	5145	\N	\N	12	蛳	sī	kind of snail with spiral shell
4386	刀 18.11	4386	5410	\N	\N	13	剽	piāo	rob, plunder; slice off; fast
4387	行 144.18	4387	6489	\N	\N	24	衢	qú	highway; thoroughfare, intersection
4388	水 85.5	4388	4015	\N	\N	8	泗	sì	mucous; nasal flow; sniffle; river in Shandong
4389	肉 130.13	4389	3423	\N	7–9	17	臊	sāo	rank; rancid; frowzy, fetid; bashful
4390	疒 104.11	4390	6158	\N	\N	16	瘴	zhàng	malaria pestilential vapors
4391	酉 164.4	4391	4787	\N	\N	11	酚	fēn	carbolic acid; phenol
4392	糸 120.4	4392	3825	\N	\N	7	纾	shū	loosen, relax, relieve; extricate
4393	日 72.6	4393	4501	\N	\N	10	晁	cháo	morning, dawn; surname
4394	子 39.4	4394	3683	\N	\N	7	孛	bèi	comet
4395	火 86.3	4395	3765	\N	\N	7	炀	yáng	roast; scorch; melt; flame
4396	厶 28.6	4396	1333	\N	\N	8	叁	sān	three (banker's anti-fraud numeral)
4397	心 61.12	4397	6122	\N	\N	16	憩	qì	rest, take rest
4398	手 64.8	4398	4731	\N	\N	11	掬	jū	to grasp or hold with both hands
4399	木 75.8	4399	5098	\N	\N	12	椤	luó	tree
4400	口 30.8	4400	4829	\N	\N	11	啮	niè	bite, gnaw
4401	田 102.10	4401	6025	\N	\N	15	畿	jī	imperial domain; area near capital
4402	手 64.8	4402	4737	\N	\N	11	掸	dǎn	to dust; a duster
4403	金 167.12	4403	6247	\N	\N	17	镣	liào	fetters
4404	馬 187.6	4404	4394	\N	\N	9	骁	xiāo	excellent horse; brave, valiant
4405	木 75.9	4405	5408	\N	\N	13	椽	chuán	beams, rafters, supports
4406	人 9.6	4406	3957	\N	\N	8	侗	dòng	big; ignorant; rude, rustic
4407	水 85.10	4407	5582	\N	\N	13	滦	luán	river and county in Hebei province
4408	艸 140.6	4408	4133	\N	\N	9	荩	jìn	a kind of weed; faithfulness
4409	水 85.5	4409	4023	\N	\N	8	泓	hóng	clear, deep pool of water
4410	虫 142.5	4410	4838	\N	\N	11	蚱	zhà	grasshopper; (edible) locust; cicada
4411	疒 104.13	4411	6358	\N	\N	18	癜	diàn	erythema
4412	酉 164.6	4412	5414	\N	\N	13	酯	zhǐ	ester
4413	骨 188.13	4413	\N	\N	\N	22	體	tǐ	body; group, class, body, unit
4414	癶 105.4	4414	1748	\N	\N	9	癸	guǐ	10th heavenly stem
4415	虫 142.4	4415	4508	\N	\N	10	蚜	yá	plant louse, aphids
4416	手 64.3	4416	3575	\N	\N	6	扪	mén	stoke, pat, feel by hand, grope
4417	广 53.4	4417	3756	\N	\N	7	庑	wǔ	corridor, hallway; luxuriant
4418	欠 76.9	4418	5549	\N	\N	13	歆	xīn	like, admire; willingly, gladly; to quicken
4419	虫 142.9	4419	5924	\N	\N	15	蝮	fù	venomous snake, viper
4420	足 157.12	4420	6384	\N	\N	19	蹶	jué	stumble, fall down; trample
4421	廾 55.6	4421	4305	\N	7–9	9	弈	yì	Chinese chess
4422	广 53.4	4422	3757	\N	\N	7	庋	guǐ	a cupboard or pantry to store
4423	口 30.9	4423	5153	\N	\N	12	喟	kuì	heave sigh, sigh
4424	水 85.10	4424	5584	\N	\N	13	滂	pāng	torrential; voluminous
4425	口 30.8	4425	4843	\N	\N	11	啕	táo	wail
4426	虫 142.5	4426	4833	\N	\N	11	蛎	lì	oyster
4427	犬 94.13	4427	6148	\N	\N	16	獭	tǎ	otter
4428	木 75.10	4428	5667	\N	\N	14	槁	gǎo	wither; withered, rotten, dead
4429	羽 124.5	4429	4941	\N	\N	11	翊	yì	flying; assist, help; respect
4430	齒 211.7	4430	5900	\N	\N	15	龊	chuò	narrow, small; dirty
4431	邑 163.5	4431	3696	\N	\N	7	邺	yè	ancient district in modern day Hebei Province; surname
4432	艸 140.7	4432	4441	\N	\N	10	莘	shēn	long; numerous; a marsh plant whose root is used for medicine
4433	火 86.13	4433	6284	\N	\N	17	燮	xiè	harmonize, blend; adjust
4434	刀 18.6	4434	3982	\N	\N	8	剁	duò	chop by pounding, mince, hash
4435	見 147.11	4435	5870	\N	\N	15	觐	jìn	have imperial audience
4436	金 167.6	4436	2304	\N	\N	11	铛	dāng	frying pan; warming vessel
4437	言 149.9	4437	5006	\N	\N	11	谗	chán	slander, defame, misrepresent
4438	金 167.10	4438	5949	\N	\N	15	镍	niè	nickel
4439	肉 130.13	4439	6275	\N	\N	17	臃	yōng	swell up; swelling; fat
4440	土 32.11	4440	5640	\N	\N	14	墒	shāng	wet tilth
4441	日 72.6	4441	6989	\N	\N	10	晔	yè	bright; radiant; thriving
4442	火 86.12	4442	6172	\N	\N	16	燔	fán	to roast; to burn
4443	口 30.12	4443	5905	\N	\N	15	嘭	pēng	syllable; (Cant.) to chase, drive away
4444	水 85.8	4444	4969	\N	\N	11	涿	zhuō	drip, dribble, trickle
4445	酉 164.12	4445	6376	\N	\N	19	醯	xī	vinegar; pickle; acid
4446	竹 118.8	4446	3122	\N	\N	14	箩	luó	bamboo basket
4447	邑 163.12	4447	5765	\N	\N	14	鄱	pó	county and lake in Jiangxi
4448	目 109.8	4448	5436	\N	\N	13	睨	nì	look askance at, glare at; squint
4449	言 149.6	4449	4056	\N	\N	8	诤	zhēng	to expostulate; to remonstrate
4450	土 32.5	4450	3852	\N	\N	8	坳	ào	a hollow in the ground, a cavity, depression; undulating, depressed
4451	鳥 196.13	4451	6334	\N	\N	18	鹭	lù	heron, egret; Ardea species (various)
4452	石 112.5	4452	4477	\N	\N	10	砷	shēn	arsenic
4453	口 30.7	4453	4517	\N	\N	10	唏	xī	weep or sob; grieve
4454	人 9.5	4454	6605	\N	\N	7	伲	nì	we (Shanghai dialect)
4455	犬 94.9	4455	2719	\N	\N	12	猬	wèi	vulgar; wanton; low; many; varied; a hedgehog, porcupine
4456	玉 96.8	4456	5048	\N	\N	12	琥	hǔ	jewel in shape of tiger; amber
4457	歹 78.4	4457	3891	\N	\N	8	殁	mò	die; death; dead
4458	虫 142.4	4458	4685	\N	\N	10	蚩	chī	worm; ignorant, rustic; laugh
4459	水 85.5	4459	4024	\N	\N	8	泾	jīng	name of a river
4460	糸 120.11	4460	5842	\N	\N	14	缥	piāo	light blue silk; dim; misty
4461	歹 78.7	4461	4803	\N	\N	11	殓	liàn	dress corpse for burial
4462	魚 195.9	4462	6280	\N	\N	17	鳅	qiū	loach
4463	气 84.8	4463	5193	\N	\N	12	氰	qíng	cyanogen; ethane dinitrile
4464	言 149.5	4464	3797	\N	\N	7	诋	dǐ	slander, comdemn, reproach
4465	彐 58.2	4465	3550	\N	\N	5	刍	chú	mow, cut grass; hay, fodder
4466	艸 140.4	4466	3665	\N	\N	7	芷	zhǐ	angelica, type of iris
4467	山 46.12	4467	5941	\N	\N	15	嶙	lín	precipitous
4468	辵 162.6	4468	4268	\N	\N	9	逅	hòu	meet unexpectedly
4469	舟 137.4	4469	4585	\N	\N	10	舫	fǎng	fancy boat, yacht
4470	口 30.4	4470	3700	\N	\N	7	呓	yì	to talk in one's sleep
4471	口 30.8	4471	4853	\N	\N	11	唰	shuā	swish, rustle
4472	艸 140.5	4472	1012	\N	\N	8	茁	zhuó	to sprout, flourish; sprouts appearing above-ground; vigorous
4473	食 184.11	4473	5777	\N	\N	14	馑	jǐn	time of famine or crop failure
4474	女 38.4	4474	3812	\N	\N	7	妫	guī	family name
4475	馬 187.17	4475	6447	\N	\N	20	骧	xiāng	gallop about with head uplifted
4476	艸 140.5	4476	3854	\N	\N	8	苷	gān	licorice
4477	手 64.14	4477	6204	\N	\N	17	擢	zhuó	pull up, draw up; select
4478	山 46.6	4478	4236	\N	\N	9	峋	xún	ranges of hills stretching on beyond another irregular peaks
4479	衣 145.4	4479	4363	\N	\N	9	袂	mèi	sleeves
4480	心 61.13	4480	6292	\N	\N	17	懑	mèn	be sick at heart, sorrowful, sad
4481	艸 140.10	4481	5381	\N	\N	13	蓑	suō	rain coat made of straw, coir, etc.
4482	臼 134.8	4482	\N	\N	\N	13	與	yǔ	and; with; to; for; give, grant
4483	水 85.7	4483	4646	\N	\N	10	涞	lái	river in Hebei province; creek
4484	示 113.4	4484	4049	\N	\N	8	祉	zhǐ	happiness, blessings, good luck
4485	足 157.9	4485	6092	\N	7–9	16	踹	chuài	trample, tread on, kick; to crush
4486	手 64.8	4486	4743	\N	\N	11	掇	duō	collect, gather up, pick up
4487	水 85.4	4487	3771	\N	7–9	7	沏	qī	infuse
4488	言 149.7	4488	4372	\N	\N	9	诳	kuáng	deceive, lie, delude, cheat
4489	口 30.13	4489	6106	\N	\N	16	噫	yī	belch; alas
4490	食 184.7	4490	4609	\N	\N	10	饽	bō	ferrule
4491	食 184.4	4491	3752	6	\N	7	饪	rèn	cooked food; cook until well done
4492	糸 120.8	4492	5036	\N	\N	11	绺	liǔ	skein; tuft, lock; wrinkle
4493	言 149.9	4493	\N	\N	\N	11	谘	zī	consult, confer; communicate in
4494	食 184.3	4494	5247	\N	\N	12	飧	sūn	evening meal, supper; cooked food
4495	辵 162.5	4495	6745	\N	\N	8	迳	jìng	pass by, approach; direct
4496	金 167.6	4496	4871	\N	\N	11	铡	zhá	sickle for cutting grass or hay
4497	木 75.4	4497	3881	\N	\N	8	枞	cōng	fir tree
4498	火 86.11	4498	6015	6	\N	15	熨	yùn	iron, press
4499	金 167.7	4499	6002	\N	\N	15	鋈	wù	silver plating
4500	艸 140.6	4500	6796	\N	\N	9	荭	hóng	herb
4501	貝 154.7	4501	4864	\N	\N	11	赊	shē	buy and sell on credit, distant
4502	人 9.7	4502	4256	\N	\N	9	俦	chóu	companion, mate, colleague
4503	戈 62.7	4503	4788	\N	\N	11	戛	jiá	lance; tap or strike lightly
4504	水 85.9	4504	5280	\N	\N	12	湎	miǎn	flushed with drink, drunk
4505	幺 52.0	4505	3507	\N	\N	3	幺	yāo	one; tiny, small
4506	冫 15.8	4506	4610	\N	\N	10	凇	sōng	dewdrop; icicle
4507	艸 140.4	4507	3672	\N	\N	7	芪	qí	celery
4508	角 148.8	4508	5977	\N	\N	15	觯	zhì	wine goblet made from horn
4509	齒 211.9	4509	6221	\N	\N	17	龌	wò	narrow, small; dirty
4510	手 64.6	4510	4097	\N	\N	9	挞	tà	flog, whip; chastise
4511	女 38.14	4511	6164	\N	\N	16	嬴	yíng	to win; to have a surplus; surname
4512	艸 140.5	4512	3864	\N	\N	8	苻	fú	kind of herb; type of grass
4513	口 30.11	4513	5698	\N	\N	14	嘁	qī	to be grieved; ashamed; used to imitate sounds
4514	革 177.9	4514	6315	\N	\N	18	鞯	jiān	saddle blanket
4515	肉 130.4	4515	3979	\N	\N	8	肽	tài	a chemical compound
4516	心 61.6	4516	4349	\N	\N	9	恸	tòng	sadness, grief; mourn; be moved
4517	辵 162.5	4517	4073	\N	\N	8	迨	dài	until, when; seize, arrest
4518	金 167.5	4518	4527	\N	\N	10	钰	yù	rare treasure
4519	人 9.13	4519	5756	\N	\N	14	儆	jǐng	warn; warning
4520	見 147.9	4520	5511	\N	\N	13	觎	yú	desire strongly, covet, long for
4521	言 149.3	4521	3557	\N	\N	5	讫	qì	finish; conclude, stop; exhaust
4522	水 85.10	4522	5585	\N	\N	13	滓	zǐ	sediment, lees, dregs
4523	人 9.12	4523	5760	\N	\N	14	僮	tóng	page, boy servant
4524	女 38.10	4524	5604	\N	\N	13	媾	gòu	marry; be on friendly terms with
4525	齒 211.6	4525	5690	\N	\N	14	龇	zī	to show the teeth; crooked teeth
4526	肉 130.6	4526	4589	\N	\N	10	胯	kuà	pelvis; groin; thighs
4527	水 85.8	4527	2433	6	7–9	11	涮	shuàn	rinse; cook or boil in juice
4528	糸 120.8	4528	5038	\N	\N	11	绾	wǎn	to string together, to bind up
4529	木 75.3	4529	3681	\N	\N	7	杈	chā	fork of a tree; a pitchfork
4530	走 156.2	4530	4099	\N	\N	9	赳	jiū	grand, valiant
4531	斗 68.7	4531	4929	\N	\N	11	斛	hú	dry measure equal to some five or ten dou (舒)
4532	角 148.6	4532	5535	\N	\N	13	觥	gōng	a cup made of horn obstinate
4533	疒 104.5	4533	4616	\N	\N	10	疸	dǎn	jaundice; disorders of stomach
4534	卜 25.2	4534	3521	\N	\N	4	卞	biàn	to be impatient, in a hurry; excitable
4535	心 61.9	4535	5294	\N	\N	12	愠	yùn	angry
4536	手 64.6	4536	4093	\N	\N	9	拮	jié	laboring hard, occupied; pursue
4537	广 53.6	4537	4312	\N	\N	9	庠	xiáng	village school; teach
4538	火 86.6	4538	4638	\N	\N	10	烨	yè	bright, glorious, splendid, flame
4539	龠 214.5	4539	8095	\N	\N	22	龢	hé	in harmony; calm, peaceful
4540	艸 140.8	4540	2212	\N	\N	11	菠	bō	spinach and similar greens
4541	穴 116.5	4541	4666	\N	\N	10	窈	yǎo	obscure, secluded; refined
4542	缶 121.11	4542	6203	\N	\N	17	罄	qìng	exhaust, run out, use up; empty
4543	囗 31.4	4543	750	\N	\N	7	囤	dùn	grain basket, bin for grain
4544	廾 55.2	4544	3561	\N	\N	5	弁	biàn	conical cap worn during Zhou dynasty
4545	大 37.7	4545	4683	\N	\N	10	奘	zàng	large, powerful, stout, thick
4546	口 30.6	4546	4214	\N	\N	9	咣	guāng	the sound of large door closing
4547	糸 120.11	4547	5848	\N	\N	14	缫	sāo	draw, reel
4548	肉 130.9	4548	5231	\N	\N	12	腴	yú	fat; fertile, rich; plump, soft
4549	糸 120.9	4549	5333	\N	\N	12	缈	miǎo	indistinct, dim; minute; distant
4550	口 30.9	4550	4819	\N	\N	11	喵	miāo	the mew of the cat
4551	水 85.12	4551	5800	\N	\N	14	潢	huáng	expanse of water, lake, pond
4552	辵 162.10	4552	5536	\N	7–9	13	遛	liú	take walk, stroll
4553	木 75.5	4553	4149	\N	\N	9	柚	yòu	pomelo, grapefruit
4554	邑 163.6	4554	3892	\N	\N	8	郏	jiá	county in Henan province; surname
4555	艸 140.7	4555	4440	\N	\N	10	荻	dí	reed, Miscanthus saccariflorus
4556	艸 140.15	4556	6320	\N	\N	18	藜	lí	Chenopodium album, pigweed
4557	玉 96.8	4557	5049	\N	\N	12	琨	kūn	beautiful jade, precious stones
4558	金 167.15	4558	6435	\N	\N	20	镳	biāo	bit, bridle; ride
4559	隹 172.5	4559	5493	\N	\N	13	雉	zhì	pheasant; crenellated wall
4560	木 75.12	4560	6066	\N	\N	16	橐	tuó	a sack, a bag opening at both ends
4561	阜 170.9	4561	\N	\N	\N	11	陽	yáng	positive (electric.); sun; male principle (Taoism)
4562	馬 187.6	4562	4398	\N	\N	9	骈	pián	team of horses; associate, join
4563	虫 142.5	4563	4839	\N	\N	11	蛉	líng	dragonfly, libellulidae
4564	艮 138.0	4564	3636	\N	\N	6	艮	gěn	seventh of eight diagrams
4565	手 64.10	4565	5061	\N	\N	12	搽	chá	smear; rub, wipe; anoint
4566	水 85.14	4566	6293	\N	\N	17	濡	rú	immerse, moisten; wet, damp
4567	宀 40.12	4567	6008	\N	\N	15	寮	liáo	shanty, hut, shack
4568	木 75.5	4568	4144	\N	\N	9	柩	jiù	coffin which contains corpse
4569	人 9.5	4569	3734	\N	\N	7	佗	tuó	other, he; surname; a load
4570	口 30.8	4570	4851	\N	\N	11	啷	lāng	a clanging or rattling sound
4571	言 149.6	4571	4052	\N	\N	8	诜	shēn	inquire, question; numerous
4572	見 147.4	4572	\N	\N	\N	11	視	shì	look at, inspect, observe, see
4573	人 9.9	4573	4910	\N	\N	11	偻	lóu	humpback; surname
4574	大 37.2	4574	219	\N	\N	5	夯	hāng	heavy load, burden; lift up
4575	門 169.4	4575	3761	\N	\N	7	闱	wéi	gate, door; living quarters
4576	言 149.9	4576	5005	\N	\N	11	谖	xuān	forget; lie, cheat, deceive
4577	夕 36.11	4577	7669	\N	\N	14	夥	huǒ	companion; partner; assistant
4578	木 75.5	4578	4156	\N	\N	9	枸	gǒu	kind of aspen found in Sichuan
4579	肉 130.10	4579	5767	\N	\N	14	膑	bìn	the kneecap
4580	虫 142.3	4580	4212	\N	\N	9	虻	méng	horsefly, gadfly
4581	竹 118.7	4581	5500	\N	\N	13	筠	yún	bamboo skin; bamboo
4582	土 32.8	4582	4742	\N	\N	11	埽	sào	broom; to sweep, clear away
4583	竹 118.5	4583	4903	\N	\N	11	笞	chī	bamboo rod used for beatings
4584	臼 134.2	4584	3955	\N	\N	8	臾	yú	moment, instant, short while
4585	女 38.8	4585	4696	\N	\N	10	婀	ē	be beautiful, be graceful
4586	玉 96.6	4586	4408	\N	\N	10	珞	luò	kind of necklace
4587	米 119.4	4587	4634	\N	\N	10	粑	bā	tsamba (food in Tibet)
4588	心 61.5	4588	4026	\N	\N	8	怵	chù	fear, be afraid; shy, timid
4589	糸 120.8	4589	5037	\N	\N	11	绻	quǎn	affectionate, solicitous
4590	歹 78.7	4590	4802	\N	\N	11	殒	yǔn	die, perish; vanish; fall
4591	見 147.6	4591	4525	\N	\N	10	觊	jì	covet, long for, desire
4592	山 46.7	4592	4520	\N	\N	10	崂	láo	Laoshan, mountain in Shandong
4593	頁 181.17	4593	6481	\N	\N	23	颧	quán	cheek bones
4594	口 30.10	4594	5441	\N	\N	13	嗑	kē	eat seeds; reproach; loquacious
4595	木 75.10	4595	5660	\N	\N	14	榛	zhēn	hazelnut; thicket, underbrush
4596	日 72.5	4596	4200	\N	\N	9	昱	yù	bright light, sunlight; dazzling
4597	虫 142.8	4597	5708	\N	\N	14	蜴	yì	lizard
4598	魚 195.12	4598	6443	\N	\N	20	鳝	shàn	eel
4599	口 30.12	4599	5934	\N	\N	15	噙	qín	hold in mouth; bite
4600	水 85.8	4600	7371	\N	\N	12	淼	miǎo	a wide expanse of water
4601	石 112.3	4601	1044	\N	\N	8	矾	fán	alum
4602	石 112.8	4602	5419	\N	\N	13	硼	péng	borax, boron
4603	囗 31.6	4603	4219	\N	\N	9	囿	yòu	pen up; limit, constrain
4604	水 85.5	4604	4014	\N	\N	8	泅	qiú	swim, float, wade
4605	辵 162.13	4605	6150	\N	\N	16	邂	xiè	unexpected meeting; encounter by
4606	金 167.4	4606	6845	\N	\N	9	钜	jù	steel, iron; great
4607	虫 142.18	4607	6487	\N	\N	24	蠹	dù	moth; insects which eat into clot
4608	土 32.6	4608	4129	\N	\N	9	垩	è	holy, sacred, sage; simplification of堊chalk; daub with chalk
4609	乙 5.5	4609	3590	\N	\N	6	乩	jī	to divine
4610	口 30.10	4610	5445	\N	\N	13	嗝	gé	cackling of fowls to gag, to vomit
4611	水 85.8	4611	4975	\N	\N	11	淦	gàn	river in Jiangxi province; water leaking into a boat
4612	木 75.12	4612	6062	\N	\N	16	樽	zūn	goblet; jar, jug; lush
4613	言 149.7	4613	4368	\N	\N	9	诮	qiào	criticize, scold, blame, ridicule
4614	手 64.9	4614	5076	\N	\N	12	揆	kuí	prime minister; to guess, estimate
4615	口 30.8	4615	4845	\N	\N	11	啐	cuì	to taste, to sip; to spit; the sound of sipping; to surprise
4616	水 85.8	4616	4966	\N	\N	11	淅	xī	water used wash rice; to wash ric
4617	木 75.9	4617	5404	\N	\N	13	榉	jǔ	type of elm
4618	首 185.2	4618	4931	\N	\N	11	馗	kuí	cheekbone; path, road; intersection
4619	口 30.10	4619	5613	\N	\N	13	辔	pèi	bridle of horse, reins
4620	日 72.12	4620	5909	\N	\N	15	暹	xiān	rise; advance, go forward
4621	馬 187.9	4621	5327	\N	\N	12	骛	wù	gallop; rush about; pursue, run
4622	魚 195.4	4622	5235	\N	\N	12	鱿	yóu	cuttlefish
4623	艸 140.5	4623	3858	\N	\N	8	苫	shān	rush or straw matting
4624	犬 94.3	4624	3617	\N	\N	6	犷	guǎng	fierce, rude, uncivilized
4625	犬 94.12	4625	5976	\N	\N	15	獠	liáo	to hunt at night by torches
4626	言 149.5	4626	5167	\N	\N	12	詈	lì	scold, abuse verbally, curse
4627	立 117.7	4627	5261	\N	\N	12	竦	sǒng	revere, respect, be in awe of
4628	竹 118.10	4628	6128	\N	\N	16	篙	gāo	pole used punt boat
4629	言 149.6	4629	4058	\N	\N	8	诨	hùn	jokes, obsene jests; joke
4630	金 167.6	4630	4883	\N	\N	11	铰	jiǎo	hinge; shears, scissors
4631	食 184.8	4631	4933	\N	\N	11	馄	hún	dumpling soup, wonton
4632	虫 142.8	4632	5687	\N	\N	14	蜚	fēi	cockroach
4633	山 46.6	4633	4234	\N	\N	9	峒	dòng	mountain in Gansu province
4634	水 85.10	4634	5570	\N	\N	13	滢	yíng	clear, pure water; lucid; glossy
4635	玉 96.8	4635	5054	\N	\N	12	琬	wǎn	the virtue of a gentleman; jade
4636	青 174.4	4636	5050	\N	\N	12	靓	jìng	make up face; ornament; quiet
4637	犬 94.7	4637	7037	\N	\N	10	狻	suān	a fabulous beast
4638	玉 96.13	4638	6195	\N	\N	17	璨	càn	gems; luster of gems; lustrous
4639	牛 93.12	4639	6188	\N	\N	16	犟	jiàng	stubborn
4640	鳥 196.5	4640	4490	\N	\N	10	鸬	lú	cormorant
4641	虫 142.10	4641	6097	\N	\N	16	螨	mǎn	insect
4642	艸 140.4	4642	3671	\N	\N	7	芩	qín	salt marsh plant
4643	口 30.12	4643	3239	\N	\N	15	嘹	liáo	used describe clarity of voice; resonant
4644	金 167.8	4644	5487	\N	\N	13	锟	kūn	ancient treasured sword
4645	虫 142.7	4645	5356	\N	\N	13	蜇	zhē	jellyfish
4646	水 85.6	4646	4332	\N	\N	9	洹	huán	river in Henan province
4647	木 75.5	4647	4140	\N	\N	9	栉	zhì	comb; comb out; weed out, elimininate
4648	人 9.7	4648	4259	\N	\N	9	俪	lì	spouse, couple, pair
4649	金 167.3	4649	3939	\N	\N	8	钍	tǔ	thorium
4650	金 167.8	4650	5489	\N	\N	13	锨	xiān	shovel
4651	玉 96.9	4651	5341	\N	\N	13	瑁	mào	fine piece of jade
4652	士 33.9	4652	2537	\N	\N	12	壹	yī	number one
4653	疒 104.8	4653	5543	\N	\N	13	痿	wěi	paralysis; impotence
4654	立 117.4	4654	4313	\N	\N	9	竑	hóng	be vast and endless; broad
4655	米 119.5	4655	4954	\N	\N	11	粕	pò	lees, dregs, sediments left after distilling liquor
4656	牛 93.8	4656	5197	\N	\N	12	犄	jī	animal horns
4657	疒 104.10	4657	5784	\N	\N	14	瘙	sào	itch
4658	食 184.5	4658	3992	\N	\N	8	饯	jiàn	farewell party; see off, send off
4659	手 64.4	4659	3650	\N	\N	7	抟	tuán	roll around with hand; model
4660	衣 145.4	4660	4360	\N	\N	9	衲	nà	mend, sew, patch; line; quilt
4661	足 157.8	4661	5916	\N	\N	15	踮	diǎn	tip toe
4662	齒 211.5	4662	5427	\N	\N	13	龅	bāo	teeth protrude
4663	心 61.9	4663	5299	\N	\N	12	愎	bì	obstinate, stubborn, headstrong
4664	香 186.9	4664	6347	\N	\N	18	馥	fù	fragrance, scent, aroma
4665	木 75.7	4665	4772	\N	\N	11	梏	gù	handcuffs, manacles, fetters
4666	言 149.2	4666	3523	\N	\N	4	讣	fù	obituary; give notice of death
4667	邑 163.3	4667	3551	\N	\N	5	邝	kuàng	surname
4668	艸 140.2	4668	3531	\N	\N	5	艿	nǎi	used in 芋艿, taro
4669	足 157.4	4669	4828	\N	\N	11	趺	fū	sit cross-legged; back of the foo
4670	魚 195.6	4670	5772	\N	\N	14	鲟	xún	sturgeon
4671	刀 18.8	4671	4667	\N	\N	10	剜	wān	cut, cut out, pick out, scoop out
4672	糸 120.5	4672	4079	\N	\N	8	绉	zhòu	crepe, crape, wrinkles, creases
4673	缶 121.11	4673	6253	\N	\N	17	罅	xià	crack, fissure, split
4674	竹 118.5	4674	4899	\N	\N	11	笥	sì	a hamper, wicker basket
4675	衣 145.3	4675	4046	\N	\N	8	衩	chǎ	the open seam of a garment which allows freedom of movement
4676	女 38.6	4676	4386	\N	\N	9	姣	jiāo	beautiful, handsome, pretty
4677	斤 69.5	4677	4168	\N	\N	9	斫	zhuó	cut, chop, lop off
4678	鳥 196.9	4678	5717	\N	\N	14	鹗	è	osprey, fishhawk
4679	肉 130.8	4679	\N	\N	\N	12	腎	shèn	kidneys; testes, gizzard
4680	爻 89.0	4680	3520	\N	\N	4	爻	yáo	diagrams for divination
4681	犬 94.8	4681	4930	\N	\N	11	猕	mí	macacus monkey
4682	日 72.7	4682	4824	\N	\N	11	晗	hán	pre-dawn
4683	金 167.6	4683	4877	\N	\N	11	铩	shā	moult
4684	穴 116.6	4684	4993	\N	\N	11	窕	tiǎo	slender; quiet and modest, charming
4685	人 9.3	4685	3541	\N	\N	5	仨	sā	(coll.) three (cannot be followed by a measure word)
4686	手 64.10	4686	5366	\N	\N	13	搡	sǎng	to push over or push back
4687	山 46.9	4687	5165	\N	\N	12	崴	wǎi	high, lofty; precipitous
4688	酉 164.5	4688	5109	\N	\N	12	酢	cù	toast to host by guest
4689	木 75.13	4689	6212	\N	\N	17	檄	xí	call arms; urgency
4690	人 9.5	4690	3728	\N	\N	7	佞	nìng	flattery; glib
4691	子 39.0	4691	3505	\N	\N	3	孑	jié	remaining, left-over; lonely
4692	玉 96.11	4692	5853	\N	\N	15	璀	cuǐ	lustre of gems; glitter; shine
4693	山 46.5	4693	3932	\N	\N	8	岷	mín	min mountain, min river
4694	舛 136.0	4694	3619	\N	\N	6	舛	chuǎn	oppose, deviate, be contrary to
4695	邑 163.3	4695	4707	\N	\N	10	邕	yōng	former or literary name for Nanning (in Guangxi)
4696	門 169.10	4696	4318	\N	\N	9	闿	kǎi	open; peaceful
4697	金 167.5	4697	4537	\N	\N	10	铂	bó	platinum; thin sheet of metal
4698	雨 173.6	4698	5685	\N	\N	14	霁	jì	to clear up after rain; to cease be angry
4699	牛 93.10	4699	5741	\N	\N	14	犒	kào	entertain victorious soldiers
4700	食 184.10	4700	2985	\N	\N	13	馏	liú	distill, distillation
4701	門 169.8	4701	4946	\N	\N	11	阈	yù	threshold; separated, confined
4702	鹿 198.6	4702	6291	\N	\N	17	麋	mí	elk; surname
4703	鹿 198.8	4703	6408	\N	\N	19	麒	qí	legendary auspicious animal
4704	艸 140.4	4704	3670	\N	\N	7	苁	cōng	medicinal herb
4705	手 64.10	4705	5355	\N	\N	13	摁	èn	to press with the hand
4706	水 85.7	4706	4654	\N	\N	10	涔	cén	river in Shaanxi; murky torrent
4707	宀 40.6	4707	4358	\N	\N	9	宥	yòu	forgive, pardon, indulge
4708	女 38.6	4708	3806	\N	\N	7	妍	yán	beautiful, handsome; seductive
4709	金 167.7	4709	4874	\N	\N	11	铤	dìng	ingots, bars of metal; hurry
4710	金 167.9	4710	5736	\N	\N	14	锷	è	high, lofty; edge of knife
4711	口 30.10	4711	5469	\N	\N	13	嗲	diǎ	coy, childish
4712	心 61.6	4712	4357	\N	\N	9	恽	yùn	devise, plan, deliberate; consult
4713	鹿 198.2	4713	5547	\N	\N	13	麂	jǐ	species of deer
4714	厂 27.14	4714	6073	\N	\N	16	赝	yàn	false; counterfeit; bogus; sham
4715	肉 130.5	4715	4281	\N	\N	9	胛	jiǎ	the shoulder, shoulder blade
4716	口 30.6	4716	4196	\N	\N	9	哂	shěn	smile, laugh at, sneer at; (Cant.) a final particle indicating doing something to the full extent possible
4717	手 64.12	4717	5861	\N	\N	15	撷	xié	pick up, gather up; hold in lap
4718	口 30.5	4718	3919	\N	\N	8	呶	náo	talkative; clamour; hubbub
4719	口 30.12	4719	5910	\N	\N	15	噘	juē	pouting
4720	心 61.13	4720	7911	\N	\N	16	懔	lǐn	be afraid of, to be in awe of
4721	木 75.5	4721	4155	\N	\N	9	栎	lì	chestnut-leaved oak; oak
4722	木 75.6	4722	4452	\N	\N	10	桎	zhì	fetters, shackles, handcuffs
4723	雨 173.12	4723	6425	\N	\N	20	霰	sǎn	hail, sleet
4724	食 184.3	4724	5338	\N	\N	12	飨	xiǎng	host banquet; banquet
4725	手 64.9	4725	5071	\N	\N	12	揄	yú	lift, raise; praise; hang; flap
4726	口 30.12	4726	5937	\N	\N	15	噔	dēng	syllable; (Cant.) for (a recipient of pity or sympathy)
4727	女 38.7	4727	4694	\N	\N	10	娣	dì	younger sister, sister-in-law
4728	艸 140.13	4728	6052	\N	\N	16	薏	yì	Job's tear plant
4729	心 61.4	4729	3834	\N	\N	8	忝	tiǎn	disgraced; ashamed; self-deprecating
4730	口 30.6	4730	4226	\N	\N	9	咤	zhà	scold, bellow, shout at, roar
4731	口 30.10	4731	5476	\N	\N	13	嗵	tōng	used for sound
4732	辵 162.5	4732	3949	\N	\N	8	迤	yí	wind; walk out of straight path
4733	貝 154.5	4733	4100	\N	\N	9	贲	bēn	forge ahead; energetic; surname
4734	肉 130.5	4734	4280	\N	\N	9	胪	lú	arrange in order; display
4735	金 167.9	4735	6309	\N	\N	17	鍪	móu	an iron pan; a metal cap
4736	水 85.5	4736	4012	\N	\N	8	泸	lú	river in Jiangxi province
4737	艸 140.11	4737	5643	\N	\N	14	蔫	niān	withered, faded, decayed; calm
4738	刀 18.2	4738	3519	\N	\N	4	刈	yì	cut off, reap, mow; sickle
4739	人 9.12	4739	5755	\N	\N	14	僖	xī	joy, gladness, delight; surname
4740	口 30.6	4740	4220	\N	\N	9	咿	yī	descriptive of creaking; laugh
4741	鳥 196.8	4741	5424	\N	\N	13	鹌	ān	quail; Coturnix coturnix
4742	口 30.10	4742	5432	\N	\N	13	嗪	qín	character used in translation
4743	艸 140.5	4743	3857	\N	\N	8	茏	lóng	tall grass; water-weeds
4744	艸 140.6	4744	4119	\N	\N	9	茯	fú	china root; medicinal fungus
4745	山 46.5	4745	3926	\N	\N	8	岫	xiù	mountain peak; cave, cavern
4746	山 46.9	4746	5163	\N	\N	12	嵘	róng	high, steep; lofty, towering
4747	車 159.5	4747	4178	\N	\N	9	轱	gū	wheel; to turn; to revolve
4748	心 61.5	4748	4389	\N	\N	9	怼	duì	hate, abhor; hatred, resentment
4749	金 167.6	4749	4876	\N	\N	11	铨	quán	weigh, measure; select officials
4750	日 72.4	4750	3903	\N	\N	8	昕	xīn	dawn; early morning; day
4751	邑 163.7	4751	4191	\N	\N	9	郢	yǐng	Ying, ancient capital of Chu 楚 in Hubei, Jianling county
4752	口 30.6	4752	4225	\N	\N	9	咩	miē	the bleating of sheep; (Cant.) an interrogative particle
4753	食 184.9	4753	5249	\N	\N	12	馊	sōu	spoiled, rotten, stale, rancid
4754	髟 190.3	4754	5349	\N	\N	13	髡	kūn	to shear tree; ancient punishment
4755	水 85.13	4755	6177	\N	\N	16	澧	lǐ	river in northern Hunan province
4756	艸 140.5	4756	3664	\N	\N	7	苣	jù	kind of lettuce
4757	水 85.14	4757	6297	\N	\N	17	濯	zhuó	wash out, rinse; cleanse
4758	皿 108.11	4758	6129	\N	\N	16	盥	guàn	wash
4759	囗 31.3	4759	3596	\N	\N	6	囡	nān	child, daughter
4760	石 112.5	4760	4475	\N	\N	10	砺	lì	whetstone; sharpen
4761	人 9.5	4761	3737	\N	\N	7	佘	shé	surname
4762	言 149.17	4762	6416	\N	\N	19	谶	chèn	prophecy, hint, omen
4763	弋 56.9	4763	5220	\N	\N	12	弑	shì	to murder a superior
4764	木 75.9	4764	5394	\N	\N	13	楂	zhā	a raft, to hew, to fell trees
4765	羽 124.9	4765	7809	\N	\N	15	翦	jiǎn	scissors; cut, clip; annhilate
4766	心 61.5	4766	4032	\N	\N	8	怩	ní	shy, timid, bashful; look ashamed
4767	虫 142.20	4767	8105	\N	\N	26	蠼	qú	earwig
4768	雨 173.8	4768	6077	\N	\N	16	霏	fēi	falling of snow and rain
4769	木 75.9	4769	5407	\N	\N	13	楹	yíng	column, pillar; numerary adjunct
4770	言 149.4	4770	3631	\N	\N	6	讴	ōu	sing; songs
4771	金 167.9	4771	5733	6	\N	14	锲	qiè	sickle; cut, carve, engrave
4772	心 61.11	4772	5813	\N	\N	14	慵	yōng	indolent, easy-going, lazy
4773	肉 130.5	4773	4286	\N	\N	9	胝	zhī	callous, corn
4774	石 112.5	4774	4169	\N	\N	9	砭	biān	stone probe; pierce; counsel
4775	水 85.11	4775	5812	\N	\N	14	潍	wéi	county in Shandong province
4776	木 75.4	4776	3879	\N	\N	8	杵	chǔ	pestle; baton used beat clothes
4777	木 75.12	4777	6056	\N	\N	16	樾	yuè	the shade of trees
4778	巾 50.8	4778	4858	\N	\N	11	帼	guó	cap worn by women
4779	石 112.9	4779	5678	\N	\N	14	碣	jié	stone tablet
4780	言 149.5	4780	3798	\N	\N	7	诌	zhōu	play with words, quip; talk nonse
4781	彳 60.7	4781	4584	\N	\N	10	徕	lái	induce, encourage to come
4782	肉 130.6	4782	4591	\N	\N	10	胴	dòng	the large intestine; the body
4783	金 167.5	4783	4529	\N	\N	10	钴	gǔ	cobalt; household iron
4784	衣 145.7	4784	5574	\N	\N	13	裟	shā	a cassock or robe of a monk
4785	口 30.8	4785	4850	\N	\N	11	啶	dìng	phonetic used in pyridine and pyrimidine
4786	金 167.6	4786	4873	\N	\N	11	铣	xǐ	mill
4787	金 167.6	4787	4884	\N	\N	11	铱	yī	iridium
4788	木 75.9	4788	5396	\N	\N	13	楫	jí	oar, paddle
4789	赤 155.9	4789	5863	\N	\N	15	赭	zhě	reddish brown; hematite; ochre
4790	石 112.8	4790	5417	\N	\N	13	碛	qì	sand and gravel
4791	酉 164.2	4791	4162	\N	\N	9	酊	dīng	drunk, intoxicated
4792	鬼 194.11	4792	6401	\N	\N	19	魑	chī	a mountain demon resembling a tiger
4793	酉 164.10	4793	6068	\N	\N	16	醛	quán	aldehyde
4794	刀 18.7	4794	4216	\N	\N	9	剐	guǎ	cut, cut flesh from bones
4795	田 102.6	4795	4827	\N	\N	11	畦	qí	sections in vegetable farm
4796	阜 170.5	4796	3804	\N	\N	7	陂	bēi	dam, embankment; reservoir
4797	門 169.4	4797	6609	\N	\N	7	闶	kāng	door
4798	門 169.7	4798	4630	\N	\N	10	阄	jiū	lots (to be drawn); draw lots
4799	示 113.5	4799	4367	\N	\N	9	祚	zuò	throne; bless; blessing, happiness
4800	鳥 196.10	4800	5732	\N	\N	14	鹘	gǔ	a kind of pigeon; treron permagna
4801	水 85.5	4801	4013	\N	\N	8	泱	yāng	great, expansive; agitated
4802	走 156.5	4802	5065	\N	\N	12	趄	jū	weak, lame
4803	馬 187.6	4803	4395	\N	\N	9	骅	huá	an excellent horse
4804	阜 170.8	4804	4686	\N	\N	10	陲	chuí	frontier, border
4805	邑 163.7	4805	4217	\N	\N	9	郧	yún	county in Hubei province
4806	人 9.8	4806	4573	\N	\N	10	倜	tì	raise high; unrestrained
4807	口 30.5	4807	3915	\N	\N	8	呤	lìng	purine
4808	火 86.13	4808	6173	\N	\N	16	燧	suì	flintstone; beacon, signal fire; torch
4809	金 167.5	4809	4541	\N	\N	10	铉	xuàn	device for carrying a tripod
4810	米 119.7	4810	5429	\N	\N	13	粲	càn	polish; bright, radiant; smiling
4811	骨 188.5	4811	5731	\N	\N	14	骶	dǐ	coccyx
4812	山 46.5	4812	3929	\N	\N	8	峁	mǎo	yellow dirt mount
4813	心 61.4	4813	3793	\N	\N	7	忸	niǔ	blush, be bashful, be ashamed
4814	水 85.8	4814	4981	\N	\N	11	渌	lù	strain
4815	馬 187.10	4815	5592	\N	\N	13	骞	qiān	raise, hold high; fly, soar
4816	髟 190.5	4816	6037	\N	\N	16	髭	zī	mustache
4817	戈 62.9	4817	5368	\N	\N	13	戡	kān	subjugate, subdue, quell; kill
4818	金 167.5	4818	4244	\N	\N	9	钨	wū	tungsten, wolfram
4819	言 149.12	4819	5826	\N	\N	14	谲	jué	cunning, crafty, sly, wily
4820	艸 140.4	4820	3667	\N	\N	7	苋	xiàn	amaranth
4821	金 167.7	4821	5181	\N	\N	12	锃	zèng	polish
4822	虫 142.7	4822	5460	\N	\N	13	蜊	lí	clam
4823	巾 50.9	4823	5175	\N	\N	12	幄	wò	tent; mosquito net
4824	門 169.6	4824	4316	\N	\N	9	闼	tà	door; gate
4825	戈 62.4	4825	4060	\N	\N	8	戕	qiāng	kill, slay; wound, injure, hurt
4826	馬 187.7	4826	4700	\N	\N	10	骊	lí	a pure black horse; a pair of horses
4827	虍 141.9	4827	5964	\N	\N	15	虢	guó	name of ancient feudal State in Shenxi and Hunan
4828	火 86.6	4828	4639	\N	\N	10	烩	huì	ragout, cook, braise
4829	人 9.10	4829	5212	\N	\N	12	傥	tǎng	if, supposing, in case
4830	女 38.5	4830	4064	\N	\N	8	妲	dá	concubine of last ruler of the Shang dynasty
4831	糸 120.5	4831	4080	\N	\N	8	绌	chù	sew, stitch; insufficient
4832	木 75.6	4832	6958	\N	\N	10	桠	yā	the forking branch of a tree
4833	衣 145.5	4833	5023	\N	\N	11	袈	jiā	Buddhist cassock
4834	金 167.10	4834	\N	\N	\N	18	鎗	qiāng	rifle, small arms, hand gun
4835	艸 140.13	4835	6053	\N	\N	16	薮	sǒu	marsh, swamp; wild country
4836	手 64.9	4836	5069	\N	\N	12	揿	qìn	press
4837	木 75.4	4837	3899	\N	\N	8	杲	gǎo	bright sun; brilliant; high
4838	肉 130.3	4838	3760	\N	\N	7	肓	huāng	region between heart and diaphragm
4839	厂 27.8	4839	4471	\N	\N	10	厝	cuò	cut or engrave; a grave or tombstone
4840	艸 140.7	4840	4435	\N	\N	10	莅	lì	attend, be present; arrive at
4841	气 84.6	4841	4549	\N	\N	10	氤	yīn	hanging fog, misty
4842	糸 120.10	4842	5610	\N	\N	13	缙	jìn	red silk
4843	衣 145.4	4843	4622	\N	\N	10	衮	gǔn	ceremonial dress worn by the emperor
4844	言 149.6	4844	4053	\N	\N	8	诟	gòu	abuse, scold, berate, insult
4845	方 70.10	4845	5787	\N	\N	14	旖	yǐ	romantic; tender; charming
4846	石 112.6	4846	4791	\N	\N	11	硒	xī	selenium
4847	口 30.7	4847	1912	\N	\N	10	唁	yàn	express condolence
4848	女 38.13	4848	6190	\N	\N	16	嬗	shàn	succession to the throne
4849	石 112.6	4849	4789	\N	\N	11	硎	xíng	whetstone
4850	衣 145.8	4850	5596	\N	\N	13	裱	biǎo	to mount maps or scrolls to paste
4851	十 24.19	4851	6452	\N	\N	21	颦	pín	frown, knit brows; with knitted
4852	貝 154.8	4852	\N	\N	\N	15	質	zhì	matter, material, substance
4853	厂 27.13	4853	5892	\N	\N	15	靥	yè	dimples
4854	糸 120.3	4854	3646	\N	\N	6	纥	gē	inferior silk; tassel, fringe
4855	火 86.9	4855	5561	\N	\N	13	煨	wēi	to stew, simmer
4856	石 112.16	4856	6451	\N	\N	21	礴	bó	fill, extend
4857	金 167.11	4857	6409	\N	\N	19	鏖	áo	to fight to the end, engage in a fierce battle
4858	虫 142.8	4858	5707	\N	\N	14	蝈	guō	small green frog; cicada
4859	竹 118.4	4859	4559	\N	\N	10	笏	hù	tablet held by someone having authority
4860	羽 124.3	4860	4390	\N	\N	9	羿	yì	legendary archer
4861	鼎 206.2	4861	5837	\N	\N	14	鼐	nài	incense tripod
4862	水 85.9	4862	5286	\N	\N	12	湟	huáng	river in qinghai province
4863	瓦 98.12	4863	6169	\N	\N	16	甑	zèng	boiler for steaming rice, pot
4864	火 86.4	4864	4003	\N	\N	8	炜	wěi	brilliant red; glowing
4865	火 86.9	4865	5506	\N	7–9	13	煲	bāo	to heat; to boil a saucepan
4866	金 167.7	4866	5185	\N	\N	12	锉	cuò	to file; rasp
4867	竹 118.4	4867	4557	\N	\N	10	笕	jiǎn	bamboo water pipe
4868	口 30.9	4868	5156	\N	\N	12	喑	yīn	to be dumb; the sobbing of infants
4869	山 46.11	4869	5726	\N	\N	14	嶂	zhàng	cliff; mountain barrier
4870	水 85.6	4870	4346	\N	\N	9	浔	xún	steep bank by stream; jiujiang
4871	弓 57.6	4871	4377	\N	\N	9	弭	mǐ	stop, desist, end, quell
4872	女 38.4	4872	3808	\N	\N	7	妪	yù	old woman, hag
4873	金 167.7	4873	5182	\N	\N	12	锂	lǐ	lithium
4874	艸 140.5	4874	3677	\N	\N	7	苡	yǐ	barley
4875	子 39.10	4875	5271	\N	\N	12	孳	zī	breed in large numbers
4876	頁 181.6	4876	5264	\N	\N	12	颏	kē	chin
4877	酉 164.13	4877	6424	\N	\N	20	醴	lǐ	sweet wine; sweet spring
4878	門 169.4	4878	\N	\N	\N	12	間	jiān	interval, space; place, between
4879	水 85.8	4879	4964	\N	\N	11	渚	zhǔ	small sand bank, islet
4880	車 159.4	4880	3893	\N	\N	8	轭	è	yoke, collar
4881	鳥 196.12	4881	6308	\N	\N	17	鹬	yù	snipe, kingfisher
4882	虫 142.4	4882	4512	\N	\N	10	蚝	háo	hairy and poisonous caterpillars
4883	黃 201.0	4883	\N	\N	\N	12	黃	huáng	yellow; surname
4884	肉 130.11	4884	5966	\N	\N	15	膘	biāo	fat; rump
4885	邑 163.3	4885	3529	\N	\N	5	邛	qióng	in distress; a mound
4886	疒 104.7	4886	5254	\N	\N	12	痨	láo	consumption; tuberculosis
4887	衣 145.10	4887	5819	\N	\N	14	褡	dā	girdle; loincloth; pouch, bag
4888	耒 127.9	4888	5849	\N	\N	15	耦	ǒu	plow side by side; team of two
4889	襾 146.6	4889	5107	\N	\N	12	覃	tán	reach to, spread to; extensive
4890	虍 141.6	4890	\N	\N	\N	12	虛	xū	false, worthless; empty, hollow
4891	食 184.12	4891	5979	\N	\N	15	馔	zhuàn	to feed, support, provide for; food
4892	竹 118.11	4892	6256	\N	\N	17	篾	miè	bamboo splints or slats
4893	儿 10.6	4893	4000	\N	\N	8	兖	yǎn	establish; one of nine empire divisions
4894	門 169.8	4894	4949	\N	\N	11	阋	xì	feud, fight, quarrel
4895	辵 162.11	4895	5346	\N	\N	13	遨	áo	ramble, roam; travel for pleasure
4896	爪 87.5	4896	4276	\N	\N	9	爰	yuán	lead on to; therefore, then
4897	疒 104.5	4897	4620	\N	\N	10	痂	jiā	scab
4898	舟 137.7	4898	5510	\N	\N	13	艄	shāo	stern of a vessel
4899	耒 127.10	4899	6027	\N	\N	16	耨	nòu	hoe, rake; weed
4900	水 85.4	4900	3769	\N	\N	7	沤	ōu	soak, steep; sodden or soaked
4901	辵 162.15	4901	6365	\N	\N	18	邋	lā	rags
4902	火 86.7	4902	4958	\N	\N	11	焓	hán	(Cant.) onomatopoetic, the sound of a fiercely-burning fire
4903	禾 115.5	4903	4553	\N	\N	10	秣	mò	fodder, horse feed; feed horse
4904	日 72.5	4904	4374	\N	\N	9	昶	chǎng	a long day. bright. extended. clear
4905	禾 115.9	4905	\N	\N	\N	14	種	zhǒng	seed; race; offspring; to plant
4906	言 149.16	4906	\N	\N	\N	23	變	biàn	change, transform, alter; rebel
4907	穴 116.8	4907	5595	\N	\N	13	窣	sū	to rush out of a den; rustling, whispering
4908	糸 120.7	4908	4704	\N	\N	10	绦	tāo	silk cord, ribbon
4909	人 9.7	4909	4274	\N	\N	9	俎	zǔ	chopping board or block; painted
4910	木 75.10	4910	5663	\N	\N	14	榫	sǔn	mortise and tenon; fit into
4911	虫 142.12	4911	6336	\N	\N	18	蟪	huì	a kind of cicada
4912	禾 115.8	4912	5498	\N	\N	13	稗	bài	darnels, weeds, tares small
4913	言 149.10	4913	6299	\N	\N	17	謇	jiǎn	stutter; speak out boldly
4914	气 84.6	4914	4548	\N	\N	10	氩	yà	argonium
4915	頁 181.10	4915	\N	\N	\N	19	類	lèi	class, group, kind, category
4916	金 167.9	4916	5734	\N	\N	14	锴	kǎi	high quality iron
4917	齒 211.7	4917	5899	\N	\N	15	龉	yǔ	uneven teeth; to disagree
4918	火 86.5	4918	4330	\N	\N	9	烃	tīng	hydrocarbon
4919	人 9.7	4919	4263	\N	\N	9	俣	yǔ	big
4920	女 38.14	4920	6306	\N	\N	17	嬷	mā	mother
4921	肉 130.4	4921	3980	\N	\N	8	肱	gōng	forearm
4922	鳥 196.3	4922	3895	\N	\N	8	鸢	yuān	kite; Milvus species (various)
4923	竹 118.5	4923	7012	\N	\N	10	笫	zǐ	bed boards, sleeping mat
4924	疒 104.7	4924	5257	\N	\N	12	痤	cuó	a swelling of the lymph nodes
4925	阜 170.8	4925	\N	\N	\N	10	陰	yīn	overcast (weather); cloudy; shady; Yin (the negative principle of Yin and Yang); negative (electric.)
4926	艸 140.8	4926	4762	\N	\N	11	菏	hé	river in Shandong province
4927	艸 140.7	4927	4428	\N	\N	10	莆	pú	a kind of legendary tree
4928	艸 140.4	4928	3581	\N	\N	6	芨	jī	name of a plant, the roots are used for various purposes
4929	門 169.9	4929	5268	\N	\N	12	阕	què	close, shut; watch tower
4930	石 112.5	4930	4481	\N	\N	10	砣	tuó	a stone roller; a heavy stone, a weight, a plummet
4931	石 112.8	4931	5423	\N	\N	13	碜	chěn	gritty
4932	鼠 208.10	4932	6483	\N	\N	23	鼹	yǎn	a kind of insectivorous rodent
4933	長 168.0	4933	\N	\N	\N	8	長	zhǎng	long; length; excel in; leader
4934	犬 94.9	4934	5558	\N	\N	13	猷	yóu	plan, scheme; plan, plot; way
4935	竹 118.3	4935	4253	\N	\N	9	竽	yú	ancient woodwind instrument
4936	舟 137.5	4936	4915	\N	\N	11	舸	gě	large boat, barge
4937	言 149.6	4937	4038	\N	\N	8	诓	kuāng	cheat, swindle, lie
4938	金 167.8	4938	6079	\N	\N	16	錾	zàn	engraving tool, chisel
4939	水 85.8	4939	4977	\N	\N	11	淬	cuì	temper; dye; soak; change, alter
4940	阜 170.10	4940	5015	\N	\N	11	隗	kuí	high; lofty; surname
4941	心 61.7	4941	4663	\N	\N	10	悌	tì	brotherly, respectful
4942	女 38.6	4942	4387	\N	\N	9	姘	pīn	illicit sexual relations
4943	木 75.11	4943	5885	\N	\N	15	槭	qī	maple
4944	辵 162.14	4944	6270	\N	\N	17	邈	miǎo	far, distant, remote; slight
4945	女 38.8	4945	5018	\N	\N	11	婕	jié	handsome
4946	欠 76.12	4946	6135	\N	\N	16	歙	shè	name of a district in Anhui
4947	禾 115.10	4947	7791	\N	\N	15	稹	zhěn	to accumulate
4948	足 157.12	4948	6387	\N	\N	19	蹴	cù	kick; tread on; leap; solemn
4949	石 112.4	4949	4167	\N	\N	9	砒	pī	arsenic
4950	疒 104.5	4950	4618	\N	\N	10	痈	yōng	carbuncle, sore, ulcer, abscess
4951	金 167.10	4951	5950	\N	\N	15	镏	liú	distil; lutetium; surname
4952	羊 123.9	4952	5987	\N	\N	15	羯	jié	wether, castrated ram; deer skin
4953	豕 152.0	4953	3688	\N	\N	7	豕	shǐ	a pig, boar; KangXi radical 152
4954	魚 195.4	4954	5237	\N	\N	12	鲂	fáng	bream
4955	艸 140.10	4955	5377	\N	\N	13	蓖	bì	castor-oil plant, Ricinus commumis
4956	匚 22.6	4956	3835	\N	\N	8	匦	guǐ	small box; chest, casket
4957	竹 118.5	4957	4900	\N	\N	11	笤	tiáo	a broom, a besom
4958	山 46.6	4958	4237	\N	\N	9	峥	zhēng	high, lofty, noble; steep, perilous
4959	彳 60.10	4959	5508	\N	\N	13	徭	yáo	conscript labor, compulsory labor
4960	水 85.6	4960	4335	\N	\N	9	浃	jiā	saturate, drench; damp, wet
4961	火 86.6	4961	4640	\N	\N	10	烊	yáng	to smelt; to melt
4962	衣 145.7	4962	\N	\N	\N	12	補	bǔ	mend, patch, fix, repair, restore
4963	穴 116.11	4963	6184	\N	\N	16	窸	xī	faint sound, whisper
4964	邑 163.18	4964	6426	\N	\N	20	酆	fēng	name of Zhou period state
4965	糸 120.10	4965	5617	\N	\N	13	缢	yì	hang, strangle
4966	衣 145.9	4966	5821	\N	\N	14	褓	bǎo	swaddling cloth; infancy
4967	虫 142.4	4967	4507	\N	\N	10	蚨	fú	a kind of water-beetle cash, then dollars and money generally
4968	羽 124.11	4968	6216	\N	\N	17	翳	yì	shade, screen; to hide, screen
4969	走 156.6	4969	5352	\N	\N	13	趔	liè	not progressing; to be checked
4970	火 86.4	4970	4008	\N	\N	8	炔	guì	acetylene
4971	言 149.6	4971	2997	\N	\N	13	誊	téng	copy, transcribe
4972	匚 22.13	4972	5882	\N	\N	15	赜	zé	abstruse, deep, profound
4973	人 9.2	4973	3515	\N	\N	4	仃	dīng	lonely, solitary
4974	力 19.9	4974	4821	\N	\N	11	勖	xù	enjoin, advise, preach to
4975	艸 140.9	4975	5084	\N	\N	12	葺	qì	thatch; fix, repair; pile up
4976	虫 142.5	4976	4841	\N	\N	11	蚴	yòu	larva
4977	水 85.5	4977	4011	\N	\N	8	泷	lóng	raining; wet; soaked; a river in Guangdong
4978	虫 142.6	4978	5149	\N	\N	12	蛴	qí	maggots, grubs
4979	糸 120.6	4979	\N	\N	\N	12	結	jié	knot, tie; join, connect
4980	女 38.10	4980	5609	\N	\N	13	媸	chī	an ugly woman
4981	人 9.8	4981	4565	\N	\N	10	俳	pái	actor; vaudeville show; insincere
4982	言 149.6	4982	4040	\N	\N	8	诖	guà	error, mistake; deceive, mislead
4983	艸 140.6	4983	3868	\N	\N	8	茑	niǎo	the convovulvus; parasitic plants such as mistletoe; Ribes ambiguum
4984	辵 162.7	4984	4698	\N	\N	10	逡	qūn	retreat, withdraw, fall back
4985	子 39.9	4985	5316	\N	\N	12	孱	càn	weak, unfit, frail, feeble
4986	石 112.5	4986	\N	\N	\N	11	砦	zhài	stockade, fort, military outpost; brothel
4987	足 157.6	4987	5454	\N	\N	13	跸	bì	clear way, make room for; emp
4988	示 113.5	4988	4365	\N	\N	9	祜	hù	blessing, happiness, prosperity
4989	人 9.4	4989	3609	\N	\N	6	伉	kàng	compare, match; pair; spouse
4990	水 85.10	4990	5579	\N	\N	13	溴	xiù	bromine
4991	尸 44.7	4991	4679	\N	\N	10	屐	jī	wooden shoes, clogs
4992	風 182.12	4992	\N	\N	\N	16	飚	biāo	whirlwind
4993	虫 142.6	4993	5148	\N	\N	12	蛞	kuò	snail; slug, mole cricket
4994	金 167.11	4994	\N	\N	\N	19	鏡	jìng	mirror; lens; glass; glasses
4995	手 64.8	4995	4739	\N	\N	11	掮	qián	to bear on the shoulders
4996	山 46.8	4996	4861	\N	\N	11	崆	kōng	Kongtong mountain
4997	广 53.9	4997	4937	\N	\N	11	庾	yǔ	granary; storehouse
4998	木 75.12	4998	6057	\N	\N	16	橛	jué	a post, a stake; an axle
4999	石 112.3	4999	3886	\N	\N	8	矸	gān	a rock or cliff
5000	鳥 196.4	5000	4289	\N	\N	9	鸨	bǎo	bustard; procuress; Otis species (various)
5001	土 32.4	5001	3652	\N	\N	7	圻	qí	border, boundary
5002	糸 120.9	5002	5328	\N	\N	12	缂	kè	the woof of a woven item
5003	艸 140.10	5003	5379	\N	\N	13	蒯	kuǎi	a rush, of which various things are made
5004	言 149.8	5004	4668	\N	\N	10	诹	zōu	consult, confer; select, choose
5005	口 30.8	5005	4826	\N	\N	11	啭	zhuàn	sing, chirp, warble, twitter
5006	食 184.3	5006	3622	\N	\N	6	饧	táng	sugar, syrup; malt sugar; sticky
5007	金 167.10	5007	5947	\N	\N	15	镉	gé	cadmium
5008	鳥 196.5	5008	4445	\N	\N	10	鸪	gū	species of Taiwan pigeon
5009	虫 142.6	5009	5072	\N	\N	12	蛩	qióng	cricket, locust; anxious
5010	虫 142.14	5010	6390	\N	\N	19	蠖	huò	inch-worm; looper caterpiller
5011	言 149.7	5011	\N	\N	\N	14	說	shuō	speak, say, talk; scold, upbraid
5012	力 19.5	5012	3817	\N	\N	7	劭	shào	encourage; to excel; excellent
5013	口 30.6	5013	4187	\N	\N	9	哐	kuāng	syllable
5014	山 46.8	5014	7170	\N	\N	11	崧	sōng	high mountain; lofty, eminent
5015	木 75.4	5015	3885	\N	\N	8	杼	zhù	shuttle of loom; narrow; long-headed; a scrub oak; thin
5016	木 75.7	5016	4779	\N	\N	11	棂	líng	carved or patterned window sills
5017	虫 142.11	5017	6199	\N	\N	17	螫	shì	poison; sting; poisonous insect
5018	齒 211.5	5018	5426	\N	\N	13	龃	jǔ	irregular teeth; discord
5019	食 184.13	5019	6475	\N	\N	22	饔	yōng	breakfast; eat prepared food
5020	辵 162.9	5020	5214	\N	\N	12	遑	huáng	leisure, leisurely; hurry about
5021	頁 181.12	5021	6330	\N	\N	18	颢	hào	luminous; white, hoary
5022	肉 130.9	5022	5234	\N	\N	12	腱	jiàn	tendons
5023	衣 145.11	5023	6301	\N	\N	17	襁	qiǎng	swaddling clothes
5024	心 61.4	5024	3787	\N	\N	7	忾	kài	anger, wrath, hatred, enmity
5025	水 85.14	5025	6296	\N	\N	17	濠	háo	moat, trench, ditch
5026	牛 93.2	5026	3601	\N	\N	6	牝	pìn	female of species; deep gorge
5027	虫 142.5	5027	4832	\N	\N	11	蛄	gū	mole cricket
5028	魚 195.5	5028	5526	\N	\N	13	鲆	píng	sole
5029	口 30.10	5029	5447	\N	\N	13	嗄	á	hoarse of voice
5030	水 85.18	5030	6459	\N	\N	21	灏	hào	vast, large, grand, expansive
5031	疒 104.4	5031	4310	\N	\N	9	疥	jiè	scabies, itch
5032	艸 140.5	5032	3859	\N	\N	8	苜	mù	clover
5033	艸 140.6	5033	4118	\N	\N	9	荞	qiáo	buckwheat
5034	口 30.11	5034	5718	\N	\N	14	嘣	bēng	syllable
5035	夕 36.11	5035	5776	\N	\N	14	夤	yín	distant place; remote; deep
5036	石 112.5	5036	4473	\N	\N	10	砝	fá	balance weights
5037	頁 181.9	5037	6045	\N	\N	16	颞	niè	the temporal bone
5038	門 169.4	5038	\N	\N	\N	12	開	kāi	open; initiate, begin, start
5039	心 61.4	5039	3786	\N	\N	7	忤	wǔ	insubordinate, stubborn; wrong
5040	辵 162.10	5040	5450	\N	\N	13	遢	tà	careless, negligent, slipshod
5041	方 70.7	5041	4943	\N	\N	11	旎	nǐ	fluttering of flag; romantic
5042	疒 104.10	5042	5982	\N	\N	15	瘛	chì	used in 瘛疭
5043	鬼 194.7	5043	6132	\N	\N	16	魉	liǎng	a kind of monster
5044	車 159.8	5044	5057	\N	\N	12	辇	niǎn	hand-cart; transport by carriage
5045	見 147.0	5045	\N	\N	\N	7	見	jiàn	see, observe, behold; perceive
5046	瓜 97.17	5046	3498	\N	\N	22	瓤	ráng	flesh, core, pulp, pith
5047	艸 140.6	5047	4130	\N	\N	9	荥	xíng	a county in Henan; the rising and dashing of waves
5048	水 85.8	5048	4980	\N	\N	11	涫	guàn	(classical) to boil
5049	女 38.7	5049	4689	\N	\N	10	娌	lǐ	used in 妯娌
5050	气 84.3	5050	3726	\N	\N	7	氚	chuān	tritium
5051	肉 130.13	5051	\N	\N	\N	17	臁	lián	calf of the leg
5052	殳 79.9	5052	5364	\N	\N	13	毂	gǔ	hub of wheel
5053	石 112.8	5053	5422	\N	\N	13	碇	dìng	anchor
5054	比 81.5	5054	4184	\N	\N	9	毖	bì	guard against, take care; caution
5055	土 32.13	5055	6165	\N	\N	16	壅	yōng	to obstruct
5056	口 30.4	5056	3705	\N	\N	7	吡	bǐ	blame
5057	糸 120.10	5057	5612	\N	\N	13	缛	rù	decorative, adorned, elegant
5058	玉 96.4	5058	3826	\N	\N	8	玮	wěi	type of jade; rare, valuable
5059	羊 123.5	5059	4952	\N	\N	11	羟	qiǎng	hydroxide
5060	辵 162.13	5060	\N	\N	\N	16	還	hái	still, yet, also, besides
5061	玉 96.5	5061	4092	\N	\N	9	珈	jiā	gamma, jewelry
5062	斤 69.6	5062	4583	\N	\N	10	颀	qí	tall and slim
5063	虫 142.3	5063	4211	\N	\N	9	虼	gè	a flea; species of beetle
5064	示 113.4	5064	4050	\N	\N	8	祇	qí	the spirit of the earth; (used for只) only, merely, but
5065	人 9.5	5065	3732	\N	\N	7	佝	gōu	rickets
5066	羽 124.6	5066	5222	\N	\N	12	翕	xī	agree
5067	辵 162.12	5067	5990	\N	\N	15	遴	lín	select, choose; surname
5068	玉 96.5	5068	4084	\N	\N	9	珏	jué	two pieces of jade joined together
5069	邑 163.7	5069	4277	\N	\N	9	郛	fú	outer walls of city; suburbs
5070	車 159.6	5070	\N	\N	\N	13	較	jiào	compare; comparatively, more
5071	馬 187.13	5071	\N	\N	\N	23	驗	yàn	test, examine, inspect; verify
5072	玉 96.3	5072	602	\N	\N	7	玖	jiǔ	black-colored jade
5073	足 157.10	5073	6298	\N	\N	17	蹇	jiǎn	lame, crippled; unlucky
5074	辵 162.7	5074	4465	\N	\N	10	逋	bū	flee, run away, leave debt unsettled
5075	毛 82.12	5075	6083	\N	\N	16	氅	chǎng	overcoat; down feathers
5076	米 119.8	5076	5794	\N	7–9	14	粽	zòng	dumpling made of glutinous rice
5077	言 149.5	5077	3794	\N	\N	7	诂	gǔ	exegesis, explanation; explain
5078	山 46.5	5078	3923	\N	\N	8	岢	kě	used in 岢岚
5079	耳 128.6	5079	5078	\N	\N	12	聒	guā	clamor, din, hubbub
5080	骨 188.8	5080	6243	\N	\N	17	髁	kē	thigh bone, hipbone; kneecap
5081	黍 202.0	5081	5202	\N	\N	12	黍	shǔ	glutinous millet; KangXi radical number 202
5082	艸 140.4	5082	3662	\N	\N	7	芾	fèi	flower; small; little; lush
5083	水 85.8	5083	4976	\N	\N	11	淝	féi	name of an affluent of the Poyang Lake
5084	魚 195.5	5084	5591	\N	\N	13	鲎	hòu	king crab
5085	革 177.9	5085	6319	\N	\N	18	鞣	róu	tan, soften
5086	骨 188.10	5086	6395	\N	\N	19	髋	kuān	hipbone; hip
5087	門 169.4	5087	3762	\N	\N	7	闳	hóng	gate, barrier; wide, vast, expand
5088	水 85.11	5088	7724	\N	\N	14	潆	yíng	tiny stream; swirl around
5089	水 85.4	5089	3774	\N	\N	7	汨	mì	Mi(luo) river in Hunan province where Qu Yuan drowned himself; to sink; used (erroneously) for汩
5090	肉 130.5	5090	4284	\N	\N	9	胍	guā	guanidine
5091	門 169.8	5091	4951	\N	\N	11	阏	è	block, obstruct, stop up
5092	金 167.4	5092	4243	\N	\N	9	钤	qián	lock, latch; stamp, seal
5093	鳥 196.9	5093	5840	\N	\N	14	鹜	wù	duck
5094	髟 190.8	5094	6312	\N	\N	18	鬈	quán	fine growth of hair curly hair
5095	金 167.6	5095	4886	\N	\N	11	铵	ǎn	ammonium
5096	戈 62.10	5096	5653	\N	\N	14	戬	jiǎn	exterminate, destroy; blessing
5097	黑 203.5	5097	\N	\N	\N	17	點	diǎn	dot, speck, spot; point, degree
5098	山 46.8	5098	4859	\N	\N	11	崮	gù	a mesa, hill with flat top and steep sides
5099	木 75.5	5099	4145	\N	\N	9	枰	píng	smooth board; chessboard; chess
5100	木 75.11	5100	5884	\N	\N	15	樯	qiáng	mast, yard-arm, boom
5101	肉 130.6	5101	4593	\N	\N	10	脍	kuài	minced meat or fish
5102	田 102.7	5102	5219	\N	\N	12	畲	shē	to cultivate land by first setting fire to it
5103	衣 145.4	5103	4588	\N	\N	10	衾	qīn	coverlet, quilt
5104	足 157.12	5104	6386	\N	\N	19	蹼	pǔ	webbed feet of waterfowl
5105	頁 181.9	5105	\N	\N	\N	18	題	tí	forehead; title, headline; theme
5106	力 19.5	5106	3745	\N	\N	7	劬	qú	be diligent, toil, endeavor
5107	口 30.6	5107	\N	\N	\N	9	咭	jī	variant of 叽
5108	囗 31.4	5108	3720	\N	\N	7	囫	hú	entire, whole
5109	水 85.6	5109	4331	\N	\N	9	洱	ěr	a lake in Yunnan
5110	刀 18.4	5110	3616	\N	\N	6	刎	wěn	behead, cut throat
5111	艸 140.3	5111	6525	\N	\N	6	芏	dù	used in 茳芏
5112	玉 96.7	5112	6929	\N	\N	10	琊	yá	a place in eastern Shandong
5113	石 112.8	5113	5421	\N	\N	13	碚	bèi	suburb
5114	魚 195.11	5114	6405	\N	\N	19	鳕	xuě	codfish
5115	言 149.11	5115	5603	\N	\N	13	谪	zhé	charge, blame; disgrace; demote
5116	艸 140.3	5116	3583	\N	\N	6	芎	qiōng	a kind of herb
5117	心 61.6	5117	4355	\N	\N	9	恂	xún	careful, sincere, honest; trust
5118	木 75.11	5118	5883	\N	\N	15	槿	jǐn	hibiscus
5119	魚 195.8	5119	5970	\N	\N	15	鲢	lián	silver carp, hypophthalmiathys
5120	魚 195.7	5120	5973	\N	\N	15	鲧	gǔn	giant fish; father of emperor
5121	口 30.11	5121	5722	\N	\N	14	嘧	mì	pyrimidine
5122	糸 120.5	5122	4074	\N	\N	8	绀	gàn	dark blue or reddish color
5123	邑 163.7	5123	4163	\N	\N	9	郦	lì	ancient place name, surname
5124	口 30.13	5124	6104	\N	\N	16	噱	jué	laugh heartily, laugh aloud
5125	水 85.7	5125	4656	\N	\N	10	浠	xī	name of a river in Hubei
5126	水 85.12	5126	5999	\N	\N	15	潸	shān	weep; tears flowing
5127	足 157.5	5127	5140	\N	\N	12	跏	jiā	sit cross-legged; squat
5128	魚 195.8	5128	\N	\N	\N	16	鲶	nián	sheat
5129	目 109.15	5129	6427	\N	\N	20	矍	jué	look about in fright or alarm
5130	艸 140.4	5130	3669	\N	\N	7	苌	cháng	averrhora carambola; surname
5131	手 64.5	5131	3842	\N	\N	8	抻	chēn	pull
5132	玉 96.8	5132	5051	\N	\N	12	琰	yǎn	jewel, gem; glitter of gems
5133	鳥 196.9	5133	5797	\N	\N	14	鹚	cí	cormorant
5134	齒 211.5	5134	7514	\N	\N	13	龆	tiáo	lose baby teeth and get adult teeth
5135	自 132.4	5135	4578	\N	\N	10	臬	niè	law, rule; door post
5136	艸 140.3	5136	3580	\N	\N	6	芄	wán	Metaplexis stauntoni
5137	口 30.4	5137	3701	\N	\N	7	呔	dāi	(Cant.) a necktie, a tire
5138	隹 172.6	5138	5775	\N	\N	14	雒	luò	black horse with white mane
5139	角 148.5	5139	5243	\N	\N	12	觞	shāng	wine vessel; propose toast; feast
5140	金 167.3	5140	3942	\N	\N	8	钒	fán	vanadium
5141	食 184.4	5141	3753	\N	\N	7	饫	yù	surfeited, satiated; confer
5142	門 169.9	5142	5267	\N	\N	12	阒	qù	alone; quiet, still
5143	木 75.10	5143	5403	\N	\N	13	槎	chá	raft; time, occasion; to hew
5144	鳥 196.4	5144	4373	\N	\N	9	鸩	zhèn	a bird resembling the secretary falcon
5145	臼 134.5	5145	4712	\N	\N	11	舂	chōng	grind in mortar
5146	言 149.10	5146	5310	\N	\N	12	谠	dǎng	counsel, advice; speak out
5147	阜 170.3	5147	3559	\N	\N	5	阡	qiān	footpaths between fields; paths
5148	艸 140.7	5148	4113	\N	\N	9	莒	jǔ	hemp-like plant; taro; herb
5149	艸 140.9	5149	4755	\N	\N	11	萸	yú	dogwood
5150	女 38.4	5150	3811	\N	\N	7	妗	jìn	wife of mother's brother
5151	禾 115.8	5151	5499	\N	\N	13	稔	rěn	ripe grain; harvest; to know, be familiar with
5152	禾 115.17	5152	6474	\N	\N	22	穰	ráng	stalks of grain; lush, abundant
5153	虫 142.4	5153	4513	\N	\N	10	蚧	jiè	a red spotted lizard, used as medicine
5154	食 184.6	5154	5894	\N	\N	15	餍	yàn	to eat to the full
5155	言 149.12	5155	5824	\N	\N	14	谯	qiáo	tower; surname
5156	艸 140.3	5156	3584	\N	\N	6	芗	xiāng	fragrant smell of grain; aromatic
5157	艸 140.8	5157	\N	\N	\N	11	菸	yān	to fade; withered or dried leaves; tobacco (used for烟and煙)
5158	艸 140.9	5158	5088	\N	\N	12	葩	pā	flowers
5159	足 157.8	5159	5911	\N	\N	15	踔	chuō	to get ahead; to stride; to excel
5160	厂 27.9	5160	7144	\N	\N	11	厣	yǎn	shell
5161	人 9.6	5161	3961	\N	\N	8	佻	tiāo	frivolous; unsteady; delay
5162	口 30.11	5162	5697	\N	\N	14	嘌	piào	fast, speedy
5163	食 184.4	5163	3751	\N	\N	7	饩	xì	sacrficial victim; gift; grain
5164	金 167.3	5164	3941	\N	\N	8	钏	chuàn	bracelet, armlet
5165	虫 142.14	5165	6391	\N	\N	19	蠓	měng	midges; sandflies
5166	黑 203.8	5166	6432	\N	\N	20	黩	dú	to dishonor, defile, corrupt; soiled
5167	人 9.8	5167	4581	\N	\N	10	倨	jù	arrogant, haughty, rude
5168	肉 130.9	5168	\N	\N	\N	13	腸	cháng	intestines; emotions; sausage
5169	糸 120.12	5169	6021	\N	\N	15	缬	xié	patterned silk; tie knot
5170	歹 78.8	5170	5113	\N	\N	12	殚	dān	utmost, entirely, quite; use up
5171	金 167.5	5171	4535	\N	\N	10	钿	diàn	hairpin; gold inlaid work, filigree
5172	金 167.10	5172	6362	\N	\N	18	鎏	liú	pure gold
5173	心 61.6	5173	4569	\N	\N	10	恁	nèn	that, like this, thus, so, such
5174	艸 140.16	5174	6371	\N	\N	19	藿	huò	lophanthus rugosus, betony
5175	囗 31.3	5175	3611	\N	\N	6	囟	xìn	top of the head; skull
5176	邑 163.11	5176	7578	\N	\N	13	鄣	zhāng	name of an ancient city in N. Jiangsu, near Shandong
5177	口 30.4	5177	3698	\N	\N	7	呋	fū	used in 呋喃
5178	女 38.9	5178	5326	\N	\N	12	婺	wù	name of a star
5179	糸 120.8	5179	5031	\N	\N	11	绱	shàng	the piece of leather used for soles on Chinese shoes; a patch
5180	瓦 98.4	5180	3890	\N	\N	8	瓯	ōu	bowl, cup; small tray
5181	方 70.6	5181	4628	\N	\N	10	旃	zhān	silk banner with bent pole
5182	金 167.9	5182	5735	\N	\N	14	锶	sī	strontium
5183	酉 164.6	5183	5415	\N	\N	13	酩	mǐng	drunk; intoxicated; tipsy
5184	心 61.6	5184	4351	\N	\N	9	恹	yān	feeble, sickly; tranquil, calm
5185	辵 162.8	5185	4892	\N	\N	11	逶	wēi	winding, curving; swagger
5186	糸 120.11	5186	5843	\N	\N	14	缦	màn	plain silk; simple, plain
5187	鳥 196.6	5187	4890	\N	\N	11	鸹	guā	the crow
5188	虫 142.10	5188	6103	\N	\N	16	螟	míng	kind of caterpillar, larva
5189	艸 140.8	5189	4759	\N	\N	11	菟	tú	dodder; creeper
5190	門 169.10	5190	5553	\N	\N	13	阗	tián	a place in Xinjiang province
5191	水 85.13	5191	6175	\N	\N	16	濉	suī	name of a river
5192	竹 118.9	5192	5956	\N	\N	15	篑	kuì	a bamboo basket for carrying earth
5193	酉 164.11	5193	6323	\N	\N	18	醪	láo	unclear wine, wine with dregs
5194	魚 195.6	5194	5771	\N	\N	14	鲛	jiāo	shark
5195	言 149.3	5195	3554	\N	\N	5	讦	jié	to accuse; to pry
5196	女 38.9	5196	5320	\N	\N	12	媪	ǎo	old woman; lower-class woman
5197	邑 163.4	5197	3621	\N	\N	6	邬	wū	various place names; surname
5198	歹 78.5	5198	4175	\N	\N	9	殇	shāng	die young; national mourning
5199	邑 163.12	5199	5790	\N	\N	14	鄯	shàn	district in Gansu during the Tang dynasty
5200	艸 140.4	5200	3673	\N	\N	7	芡	qiàn	plant allied to the waterlily
5201	女 38.11	5201	5627	\N	\N	14	嫠	lí	a widow
5202	肉 130.4	5202	3977	\N	\N	8	肼	jǐng	hydrazine
5203	山 46.6	5203	4235	\N	\N	9	峤	jiào	high pointed mountain
5204	石 112.3	5204	\N	\N	\N	8	矽	xì	silicon
5205	言 149.3	5205	3555	\N	\N	5	讧	hòng	confusion; internal strife
5206	手 64.8	5206	4744	\N	\N	11	掼	guàn	throw ground; know, be familiar
5207	火 86.7	5207	4960	\N	\N	11	焖	mèn	simmer, cook over slow fire
5208	心 61.9	5208	5509	\N	\N	13	愆	qiān	a fault, mistake, error, transgression
5209	耳 128.9	5209	5869	\N	\N	15	聩	kuì	deaf
5210	山 46.4	5210	3715	\N	\N	7	岘	xiàn	steep hill; mountain in Hubei
5211	青 174.8	5211	6031	\N	\N	16	靛	diàn	indigo; any blue dye
5212	艸 140.8	5212	4753	\N	\N	11	菖	chāng	iris, sweet flag, calamus
5213	口 30.2	5213	3538	\N	\N	5	卟	bǔ	a chemical compound; divination; to consider
5214	女 38.5	5214	3814	\N	\N	7	姒	sì	wife of elder brother
5215	木 75.4	5215	3884	\N	\N	8	杷	pá	loquat
5216	石 112.4	5216	6755	\N	\N	9	砉	huò	sound of a thing flying fast by, whoosh
5217	衣 145.5	5217	4672	\N	\N	10	袢	pàn	robe
5218	虫 142.4	5218	4510	\N	\N	10	蚋	ruì	gnat, mosquito
5219	竹 118.5	5219	4901	\N	\N	11	笳	jiā	a reed leaf whistle
5220	手 64.6	5220	4400	\N	\N	10	挈	qiè	assist, help, lead by hand
5221	門 169.11	5221	\N	\N	\N	19	關	guān	frontier pass; close; relation
5222	足 157.9	5222	6094	\N	\N	16	踽	jǔ	to walk alone; self-reliant
5223	黽 205.0	5223	3913	\N	\N	8	黾	miǎn	to strive; to endeavor
5224	麻 200.3	5224	\N	\N	\N	14	麼	me	interrogative final particle; insignificant, small, tiny
5225	人 9.6	5225	3960	\N	\N	8	侩	kuài	go-between, broker, proxy
5226	几 16.4	5226	3620	\N	\N	6	凫	fú	wild duck, teal; swim
5227	言 149.6	5227	4039	\N	\N	8	诔	lěi	eulogize, praise the dead
5228	邑 163.8	5228	4642	\N	\N	10	郯	tán	name of a small ancient principality which was situated in what is now part of Shantung and Kiangsu
5229	韋 178.9	5229	5433	\N	\N	13	韪	wěi	right; proper; perpriety
5230	手 64.7	5230	4971	\N	\N	11	挲	sā	to feel or fondle with the fingers
5231	竹 118.5	5231	4896	\N	\N	11	笪	dá	a coarse mat of rushes or bamboo
5232	龜 213.4	5232	5058	\N	\N	12	鼋	yuán	large turtle, sea turtle
5233	艸 140.7	5233	4434	\N	\N	10	莜	yóu	Avena nuda; a bamboo basket
5234	風 182.0	5234	\N	\N	\N	9	風	fēng	wind; air; manners, atmosphere
5235	艸 140.8	5235	4765	\N	\N	11	菅	jiān	coarse grass, themedia forskali
5236	山 46.10	5236	5478	\N	\N	13	嵊	shèng	district in Shaohsing, Chekiang
5237	衣 145.7	5237	5305	\N	\N	12	裢	lián	folding purse inserted in belt
5238	足 157.4	5238	4505	\N	\N	10	趿	tā	to tread on; slipshod
5239	竹 118.9	5239	5746	\N	\N	14	箸	zhù	chopsticks
5240	艸 140.7	5240	4430	\N	\N	10	莴	wō	lettuce
5241	艸 140.7	5241	4432	\N	\N	10	莠	yǒu	weeds, tares; undesirable, evil
5242	門 169.8	5242	7227	\N	\N	11	阌	wén	wen xiang, Henan province
5243	日 72.2	5243	3591	\N	\N	6	旯	lá	nook, corner
5244	囗 31.13	5244	6110	\N	\N	16	圜	huán	circle, surround; encircle
5245	水 85.8	5245	4978	\N	\N	11	涪	fú	river in Sichuan province
5246	貝 154.8	5246	5100	\N	\N	12	赍	jī	present
5247	木 75.5	5247	4151	\N	\N	9	柞	zhà	oak; spinous evergreen tree; to clear away trees
5248	口 30.10	5248	5472	\N	\N	13	嗍	suō	to suck
5249	囗 31.4	5249	3719	\N	\N	7	囵	lún	all, complete, entire
5250	木 75.10	5250	5661	\N	\N	14	榧	fěi	type of yew
5251	衣 145.8	5251	5600	\N	\N	13	裰	duō	to mend clothes
5252	竹 118.6	5252	4902	\N	\N	11	笾	biān	bamboo container for food
5253	竹 118.12	5253	6348	\N	\N	18	簟	diàn	bamboo mat
5254	足 157.5	5254	5139	\N	\N	12	跎	tuó	slip, stumble, falter; vacillate
5255	己 49.9	5255	5318	\N	\N	12	巽	xùn	5th of the 8 trigrams; south-east; mild, modest, obedient
5256	曰 73.5	5256	4198	\N	\N	9	曷	hé	why? what? where?
5257	辵 162.7	5257	4606	\N	\N	10	逖	tì	far, distant; keep at distance
5258	馬 187.8	5258	5034	\N	\N	11	骓	zhuī	piebald horse
5259	糸 120.6	5259	4393	\N	\N	9	绔	kù	trousers
5260	木 75.4	5260	3882	\N	\N	8	枋	fāng	sandalwood; tree used as timber
5261	金 167.10	5261	5951	\N	\N	15	镒	yì	measure of weight for gold
5262	鬼 194.5	5262	5761	\N	\N	14	魃	bá	drought demon
5263	食 184.9	5263	6327	\N	\N	18	餮	tiè	a legendary animal; a greedy person
5264	言 149.5	5264	3632	\N	\N	6	讵	jù	an interjection used express surprise
5265	乙 5.1	5265	3502	\N	\N	2	乜	miē	to squint; (Cant.) what? huh?
5266	邑 163.11	5266	5351	\N	\N	13	鄢	yān	name of a district in Honan
5267	玉 96.10	5267	5623	\N	\N	14	瑭	táng	a kind of jade
5268	足 157.7	5268	5637	\N	\N	14	踅	xué	to walk around; turn back midway
5269	食 184.12	5269	5978	\N	\N	15	馓	sǎn	fried round cakes of wheat flour
5270	虫 142.12	5270	6335	\N	\N	18	蟛	péng	a land-crab
5271	魚 195.12	5271	6444	\N	\N	20	鳟	zūn	barbel
5272	艸 140.6	5272	6786	\N	\N	9	荛	ráo	fuel, firewood; stubble; Wikstroemia japonica
5273	艸 140.8	5273	\N	\N	\N	11	菬	qiáo	\N
5274	心 61.4	5274	3790	\N	\N	7	忪	sōng	quiet, calm, tranquil, peaceful
5275	門 169.8	5275	4950	\N	\N	11	阍	hūn	gatekeeper; gate, door
5276	女 38.6	5276	4388	\N	\N	9	姹	chà	beautiful, colorful; girl
5277	糸 120.4	5277	3822	\N	\N	7	纰	pī	spoiled silk; hem of dress; mista
5278	木 75.6	5278	4462	\N	\N	10	桉	ān	eucalyptus
5279	气 84.7	5279	4888	\N	\N	11	氪	kè	krypton
5280	气 84.2	5280	3599	\N	\N	6	氘	dāo	deuterium
5281	土 32.5	5281	\N	\N	\N	8	垅	lǒng	mound, grave; ridge in field
5282	邑 163.6	5282	6707	\N	\N	8	郃	hé	county in Shanxi province
5283	水 85.3	5283	3628	\N	\N	6	汊	chà	a branching stream
5284	女 38.7	5284	4690	\N	\N	10	娉	pīng	beautiful, attractive, charming, graceful
5285	糸 120.3	5285	3644	\N	\N	6	纡	yū	bend, turn, twist; distort
5286	糸 120.10	5286	5615	\N	\N	13	缟	gǎo	white raw silk
5287	日 72.2	5287	3615	\N	\N	6	旮	gā	nook, corner
5288	金 167.12	5288	6246	\N	\N	17	镢	jué	hoe
5289	人 9.10	5289	5209	\N	\N	12	傈	lì	tribe
5290	土 32.8	5290	4729	\N	\N	11	堋	péng	bury
5291	艸 140.11	5291	5652	\N	\N	14	蔺	lìn	rush used for making mats; surnam
5292	广 53.6	5292	4307	\N	\N	9	庥	xiū	shade; shelter, protection
5293	木 75.4	5293	3874	\N	\N	8	枥	lì	type of oak; stable
5294	肉 130.9	5294	5520	\N	\N	13	腭	è	palate, roof of mouth
5295	鳥 196.9	5295	5658	\N	\N	14	鹕	hú	pelican
5296	竹 118.5	5296	4897	\N	\N	11	笮	zé	boards which support tiles on roof
5297	骨 188.9	5297	6343	\N	\N	18	髂	qià	the pelvis
5298	鬼 194.8	5298	6266	\N	\N	17	魍	wǎng	demons, mountain spirits
5299	糸 120.8	5299	5040	\N	\N	11	缁	zī	black silk
5300	木 75.10	5300	5796	\N	\N	14	槊	shuò	spear, lance
5301	足 157.5	5301	5137	\N	\N	12	跞	lì	walk, move
5302	酉 164.10	5302	6071	\N	\N	16	醚	mí	ether
5303	口 30.3	5303	6531	\N	\N	6	吒	zhā	shout, roar, bellow; scold
5304	木 75.5	5304	4150	\N	\N	9	枳	zhǐ	trifoliate orange; hedge thorn; (Cant.) a plug
5305	手 64.10	5305	\N	\N	\N	14	搿	gé	to hug
5306	鳥 196.11	5306	6151	\N	\N	16	鹧	zhè	partridge
5307	虫 142.7	5307	5461	\N	\N	13	蜍	chú	toad
5308	舟 137.5	5308	4916	\N	\N	11	舻	lú	bow or prow of boat
5309	金 167.11	5309	6310	\N	\N	18	鏊	ào	a flat, iron cooking-plate for cakes
5310	示 113.17	5310	6460	\N	\N	21	禳	ráng	pray or sacrifice, exorcise
5311	艸 140.10	5311	5383	\N	\N	13	蒺	jí	furze; gorse
5312	金 167.5	5312	4531	\N	\N	10	钹	bó	cymbals
5313	虫 142.8	5313	5714	\N	\N	14	蜢	měng	grasshopper
5314	鬲 193.12	5314	6476	\N	\N	22	鬻	yù	sell; child, childish; nourish
5315	玉 96.6	5315	4405	\N	\N	10	珩	háng	the top gem of the pendants
5316	卩 26.3	5316	3547	\N	\N	5	卮	zhī	measuring cup; wine container
5317	土 32.6	5317	4094	\N	\N	9	垭	yā	character used in place names
5318	艸 140.4	5318	3675	\N	\N	7	苄	biàn	benzyl
5319	艸 140.5	5319	3873	\N	\N	8	苕	sháo	rush plant
5320	艸 140.8	5320	4766	\N	\N	11	菀	wǎn	luxuriance of growth
5321	馬 187.11	5321	5841	\N	\N	14	骠	biāo	charger, steed; swift, valiant
5322	衣 145.6	5322	5000	\N	\N	11	袷	jiá	lined garment
5323	足 157.6	5323	5457	\N	\N	13	跹	xiān	wander about, walk around; revolve
5324	疒 104.9	5324	5783	\N	\N	14	瘘	lòu	fistula, sore, ulcer, goiter
5325	馬 187.9	5325	\N	\N	\N	19	騔	gé	\N
5326	言 149.8	5326	\N	\N	\N	15	論	lùn	debate; discuss; discourse
5327	石 112.11	5327	6044	\N	\N	16	磬	qìng	musical instrument; musical stone
5328	缶 121.0	5328	3598	\N	\N	6	缶	fǒu	earthen crock or jar; rad. 121
5329	竹 118.5	5329	4895	\N	\N	11	笸	pǒ	flat basket for grain
5330	鳥 196.6	5330	4732	\N	\N	11	鸷	zhì	hawk, vulture
5331	頁 181.7	5331	\N	\N	\N	16	頭	tóu	head; top; chief, first; boss
5332	艸 140.4	5332	6569	\N	\N	7	芰	jì	water caltrop
5333	艸 140.12	5333	5881	\N	\N	15	蕲	qí	variety of artemisia seek
5334	門 169.7	5334	4632	\N	\N	10	阆	láng	high door; high gate; high, lofty
5335	糸 120.3	5335	3647	\N	\N	6	纨	wán	white silk, fine silk; gauze
5336	玉 96.8	5336	5052	\N	\N	12	琮	cóng	octagonal piece of jade with hole in middle
5337	牛 93.4	5337	3947	\N	\N	8	牦	máo	tail; hair; yak
5338	石 112.5	5338	\N	\N	\N	10	砩	fú	dam up water with rocks, name of a rock
5339	虫 142.17	5339	6486	\N	\N	23	蠲	juān	the millipede sometimes confounded with the grow-worm; bright, clear
5340	金 167.7	5340	5188	\N	\N	12	锒	láng	lock
5341	金 167.8	5341	5190	\N	\N	12	锕	ā	actinium (Ac)
5342	邑 163.6	5342	4045	\N	\N	8	郓	yùn	place name
5343	女 38.5	5343	4065	\N	\N	8	妯	zhóu	used in 妯娌
5344	馬 187.5	5344	4077	\N	\N	8	驷	sì	team of four horses; horses
5345	鳥 196.12	5345	6219	\N	\N	17	鹩	liáo	wren
5346	舟 137.3	5346	4271	\N	\N	9	舢	shān	sampan
5347	足 157.3	5347	4488	\N	\N	10	趸	dǔn	sell or buy wholesale; store
5348	言 149.12	5348	\N	\N	\N	19	證	zhèng	proof, evidence; testify, verify
5349	食 184.6	5349	\N	\N	\N	14	養	yǎng	raise, rear, bring up; support
5350	艸 140.4	5350	3659	\N	\N	7	芫	yán	daphne genkwa, poisonous plant
5351	口 30.10	5351	5435	\N	\N	13	嗉	sù	crop (of bird)
5352	虫 142.13	5352	6393	\N	\N	19	蠊	lián	cockroach
5353	竹 118.4	5353	4558	\N	\N	10	笊	zhào	ladle, bamboo skimmer
5354	艸 140.7	5354	4439	\N	\N	10	莸	yóu	caryopteris divaricata
5355	食 184.5	5355	3993	\N	\N	8	饴	yí	sweet-meats; sweet-cakes; syrup
5356	門 169.7	5356	4629	\N	\N	10	阃	kǔn	threshold; inner appartments; woman
5357	水 85.7	5357	4645	\N	\N	10	浯	wú	name of a river in Shandong
5358	木 75.4	5358	3875	\N	\N	8	枇	pí	loquat
5359	火 86.8	5359	5275	\N	\N	12	焱	yàn	flames
5360	金 167.5	5360	4539	\N	\N	10	铆	mǎo	rivet
5361	手 64.14	5361	6200	\N	\N	17	擤	xǐng	to blow the nose with fingers
5362	木 75.5	5362	4154	\N	\N	9	柢	dǐ	root, base; bottom of object
5363	酉 164.10	5363	6215	\N	\N	17	醢	hǎi	minced pickled meat; mince
5364	口 30.5	5364	4207	\N	\N	9	呲	cī	give a talking-to
5365	山 46.9	5365	7362	\N	\N	12	崾	yǎo	place name in Shanxi province
5366	水 85.9	5366	5287	\N	\N	12	溆	xù	river in Hunan
5367	水 85.12	5367	5806	\N	\N	14	潴	zhū	pond; a pool
5368	片 91.11	5368	5960	\N	\N	15	牖	yǒu	window; lead enlightenment
5369	石 112.7	5369	7340	\N	\N	12	硪	wò	used in 石硪
5370	石 112.8	5370	5418	\N	\N	13	碓	duì	pestle
5371	鳥 196.7	5371	5224	\N	\N	12	鹆	yù	myna; manah; Acridotheres tristis
5372	髟 190.15	5372	6494	\N	\N	25	鬣	liè	bristles, mane
5373	土 32.8	5373	\N	\N	\N	11	堀	kū	cave, hole
5374	巾 50.5	5374	3927	\N	\N	8	帙	zhì	book cover; satchel or bag
5375	雨 173.4	5375	5116	\N	\N	12	雱	pāng	snowing heavily
5376	頁 181.3	5376	\N	\N	\N	12	須	xū	must, have to, necessary; moment; whiskers
5377	辵 162.8	5377	\N	\N	\N	11	進	jìn	advance, make progress, enter
5378	言 149.5	5378	6627	\N	\N	7	诎	qū	bend, stoop, crouch; to yield
5379	犬 94.11	5379	5773	\N	\N	14	獐	zhāng	roebuck, hornless river deer
5380	木 75.6	5380	4458	\N	\N	10	桁	héng	cross-beams of roof
5381	虫 142.6	5381	5142	\N	\N	12	蛱	jiá	kind of butterfly
5382	魚 195.10	5382	6354	\N	\N	18	鳏	guān	huge fish; widower; bachelor
5383	邑 163.8	5383	4449	\N	\N	10	郴	chēn	county in Hunan province; surname
5384	冖 14.10	5384	5311	\N	\N	12	幂	mì	cover-cloth, cover with cloth
5385	竹 118.8	5385	\N	\N	\N	14	箝	qián	tweezers, pliers, tongs, pincers
5386	人 9.12	5386	5757	\N	\N	14	僳	sù	minority name
5387	疒 104.3	5387	3998	\N	\N	8	疝	shàn	hernia, rupture
5388	艸 140.6	5388	4115	\N	\N	9	茴	huí	fennel, aniseed
5389	手 64.9	5389	4716	\N	\N	11	揶	yé	make fun of, ridicule
5390	口 30.5	5390	3921	\N	\N	8	呦	yōu	the bleating of the deer
5391	口 30.10	5391	5471	\N	\N	13	嗌	ài	the throat; to quarrel, choke
5392	囗 31.5	5392	3937	\N	\N	8	囹	líng	prison, enclosure
5393	虫 142.10	5393	6099	\N	\N	16	螈	yuán	a silkworm
5394	肉 130.7	5394	4923	\N	\N	11	脲	niào	urea
5395	金 167.10	5395	5946	\N	\N	15	镊	niè	tweezers, forceps, pincers
5396	金 167.7	5396	5187	\N	\N	12	锑	tī	antimony
5397	肉 130.5	5397	4279	\N	\N	9	胨	dòng	a kind of protein
5398	肉 130.10	5398	5766	\N	\N	14	膈	gé	diaphragm
5399	疒 104.8	5399	5542	\N	\N	13	痼	gù	chronic disease
5400	魚 195.9	5400	6282	\N	\N	17	鳊	biān	bream
5401	貝 154.6	5401	4526	\N	\N	10	赅	gāi	prepared for; inclusive
5402	貝 154.6	5402	4423	\N	\N	10	贽	zhì	gift superior; gift given
5403	虍 141.5	5403	\N	\N	\N	11	處	chù	place, locale; department
5404	艸 140.5	5404	3856	\N	\N	8	苤	piě	kohl rabi
5405	山 46.5	5405	3935	\N	\N	8	峄	yì	a range of peaks in Shandong and Jiangsu; the name of a mountain
5406	木 75.6	5406	4451	\N	\N	10	桡	ráo	bent or twisted piece of wood
5407	隹 172.5	5407	5438	\N	\N	13	雎	jū	osprey, fishhawk; hold back
5408	魚 195.5	5408	5530	\N	\N	13	鲋	fù	carp, carassicus auratus
5409	革 177.9	5409	6317	\N	\N	18	鞫	jū	interrogate, question
5410	鼠 208.5	5410	6350	\N	\N	18	鼬	yòu	weasel, mustela itatis
5411	犬 94.14	5411	7969	\N	\N	17	獯	xūn	a tribe of Scythians which invaded China during the Hsia dynasty
5412	日 72.4	5412	3904	\N	\N	8	昀	yún	sun light; used in personal names
5413	疒 104.6	5413	4939	\N	\N	11	痍	yí	wound, bruise, sore
5414	虫 142.11	5414	6307	\N	\N	17	蟊	máo	a fly which is used similarly to cantharides
5415	革 177.10	5415	6370	\N	\N	19	鞴	bèi	saddle up horse; drive horse
5416	疒 104.2	5416	3759	\N	\N	7	疖	jiē	pimple, sore, boil
5417	火 86.10	5417	5798	\N	\N	14	熘	liū	to steam
5418	丿 4.2	5418	\N	\N	\N	3	乇	tuō	to depend on, to entrust with
5419	羊 123.13	5419	6410	\N	\N	19	羸	léi	weak, lean, emaciated, exhausted
5420	山 46.10	5420	5480	\N	\N	13	嵴	jǐ	mountain ridge
5421	木 75.5	5421	4153	\N	\N	9	栀	zhī	gardenia
5422	木 75.11	5422	5889	\N	\N	15	槲	hú	type of oak
5423	火 86.4	5423	4007	\N	\N	8	炝	qiàng	stir-fry or boil in water or oil then cook with a sauce
5424	火 86.5	5424	4329	\N	\N	9	炷	zhù	candle wick, lamp wick; stick of incense
5425	石 112.6	5425	4794	\N	\N	11	硐	dòng	variant of 洞, cave; chamber; pit
5426	金 167.9	5426	5737	\N	\N	14	锸	chā	spade, shovel; marking pin
5427	鳥 196.7	5427	5111	\N	\N	12	鹂	lí	Chinese oriole; Oriolus oriolus
5428	衣 145.8	5428	5599	\N	\N	13	裾	jū	lapel, border of garment; skirt
5429	人 9.6	5429	3963	\N	\N	8	侪	chái	a company, companion; together
5430	言 149.5	5430	\N	\N	\N	12	診	zhěn	examine patient, diagnose
5431	言 149.8	5431	\N	\N	\N	15	調	diào	transfer, move, change; tune
5432	玉 96.5	5432	4085	\N	\N	9	珐	fà	enamel, cloissoné
5433	糸 120.11	5433	\N	\N	\N	17	縯	yǎn	long
5434	口 30.6	5434	4204	\N	\N	9	哔	bì	used in transliterations
5435	尸 44.8	5435	4680	\N	\N	10	屙	ē	to ease nature
5436	方 70.6	5436	4626	\N	\N	10	旆	pèi	flag ornament; flags, banners
5437	人 9.6	5437	3952	\N	\N	8	佰	bǎi	hundred
5438	人 9.12	5438	7694	\N	\N	14	僦	jiù	to heir; to rent
5439	牛 93.5	5439	4249	\N	\N	9	牯	gǔ	cow; bull; ox
5440	金 167.4	5440	6849	\N	\N	9	钪	kàng	scandium
5441	手 64.9	5441	5077	\N	\N	12	掾	yuàn	a general designation of officials
5442	金 167.2	5442	\N	\N	\N	10	針	zhēn	needle; pin; tack; acupuncture
5443	人 9.3	5443	3543	\N	\N	5	仟	qiān	one thousand; leader of one thousand men
5444	土 32.3	5444	3576	\N	\N	6	圮	pǐ	destroyed, ruined; to subvert to injure
5445	艸 140.4	5445	3674	\N	\N	7	芟	shān	mow, cut; weed out; scythe
5446	山 46.7	5446	4521	\N	\N	10	崃	lái	mountain in Sichuan province
5447	广 53.13	5447	6155	\N	\N	16	廪	lǐn	granary; stockpile
5448	手 64.13	5448	6303	\N	\N	17	擘	bāi	thumb; break, tear open, rip
5449	竹 118.5	5449	7190	\N	\N	11	笱	gǒu	a basket trap for fish, placed in the opening of a weir
5450	足 157.5	5450	5136	\N	\N	12	跗	fū	the instep
5451	魚 195.5	5451	5525	\N	\N	13	鲅	bà	fish name
5452	石 112.7	5452	\N	\N	\N	12	硷	jiǎn	alkaline, alkali, lye, salt
5453	艸 140.4	5453	3676	\N	\N	7	苎	zhù	china grass, ramie
5454	勹 20.9	5454	4799	\N	\N	11	匏	páo	gourd; musical instrument
5455	口 30.11	5455	5721	\N	\N	14	嗾	sǒu	to set a dog on; incite, instigate
5456	囗 31.7	5456	4515	\N	\N	10	圄	yǔ	prison, jail
5457	弓 57.10	5457	5363	\N	\N	13	彀	gòu	enough, adequate fully, quite
5458	米 119.7	5458	5557	\N	\N	13	粳	jīng	non-glutinous rice
5459	卜 25.5	5459	3695	\N	\N	7	卣	yǒu	wine pot
5460	力 19.8	5460	4682	\N	\N	10	勐	měng	imperial degree; daoist magic
5461	手 64.7	5461	4721	\N	\N	11	掴	guāi	to slap
5462	水 85.7	5462	4644	\N	\N	10	涑	sù	river in Shansi province
5463	水 85.7	5463	4651	\N	\N	10	浞	zhuó	to soak, to steep in water
5464	玉 96.5	5464	4088	\N	\N	9	玳	dài	tortoise shell
5465	心 61.9	5465	7611	\N	\N	13	愍	mǐn	pity, sympathize with
5466	田 102.5	5466	4506	\N	\N	10	畛	zhěn	border, boundary; raised path
5467	赤 155.5	5467	4724	\N	\N	11	赧	nǎn	blush, turn red
5468	豸 153.6	5468	5515	\N	\N	13	貉	háo	badger; raccoon dog
5469	手 64.13	5469	6039	\N	\N	16	擀	gǎn	roll flat
5470	水 85.9	5470	5284	\N	\N	12	湫	jiǎo	a small pond; a damp and narrow place
5471	辵 162.7	5471	4470	\N	\N	10	逦	lǐ	meandering, winding
5472	木 75.9	5472	5398	\N	\N	13	椴	duàn	poplar, aspen
5473	金 167.5	5473	4538	\N	\N	10	铄	shuò	melt, smelt; shine
5474	竹 118.8	5474	5744	\N	\N	14	箧	qiè	rattan box, suitcase, or case
5475	刀 18.4	5475	3613	\N	\N	6	刖	yuè	cutting off feet as form of punishment
5476	魚 195.8	5476	6139	\N	\N	16	鲮	líng	carp
5477	言 149.2	5477	4296	\N	\N	9	訇	hōng	the sound of a crash
5478	艸 140.6	5478	4116	\N	\N	9	茱	zhū	dogwood
5479	口 30.8	5479	4848	\N	\N	11	啖	dàn	eat, feed; chew, bite; entice
5480	心 61.7	5480	4660	\N	\N	10	悭	qiān	miserly, parsimonious, stingy
5481	心 61.9	5481	5298	\N	\N	12	愀	qiǎo	change countenance
5482	月 74.5	5482	4287	\N	\N	9	朐	qú	warm
5483	田 102.4	5483	4210	\N	\N	9	畈	fàn	field; farm
5484	鳥 196.11	5484	7914	\N	\N	16	鹨	liù	Anthus species (various)
5485	虫 142.6	5485	5151	\N	\N	12	蛘	yáng	a weevil found in rice, etc.
5486	人 9.6	5486	3950	\N	\N	8	佶	jí	strong, robust; exact, correct
5487	糸 120.9	5487	5329	\N	\N	12	缃	xiāng	light-yellow color
5488	日 72.7	5488	4495	\N	\N	10	晟	chéng	clear, bright; splendor, brightness
5489	魚 195.8	5489	6140	\N	\N	16	鲱	fēi	herring
5490	水 85.2	5490	3595	\N	\N	6	凼	dàng	ditch; pool
5491	艸 140.5	5491	3860	\N	\N	8	苴	jū	sackcloth; female hemp plant
5492	頁 181.9	5492	5938	\N	\N	15	颛	zhuān	good, honest; simple; respectful
5493	厂 27.4	5493	3586	\N	\N	6	厍	shè	surname
5494	匚 22.0	5494	\N	\N	\N	2	匚	fāng	box; KangXi radical 22
5495	彳 60.6	5495	4270	\N	\N	9	徉	yáng	wonder, rove, stray; hesitating
5496	水 85.6	5496	4338	\N	\N	9	洙	zhū	name of a river in Shandong
5497	气 84.5	5497	4247	\N	\N	9	氡	dōng	radon
5498	肉 130.5	5498	4285	\N	\N	9	胗	zhēn	pustules of any kind, a rash or eruption.measles; various kinds of fever
5499	疒 104.18	5499	6484	\N	\N	23	癯	qú	thin, emaciated; worn, tired
5500	革 177.6	5500	5873	\N	\N	15	鞒	qiáo	mud shoe, sledge for the feet
5501	金 167.7	5501	5183	\N	\N	12	锆	gào	zirconium
5502	人 9.5	5502	3605	\N	\N	6	佤	wǎ	the Va (Wa) nationality, living in Yunnan
5503	金 167.8	5503	\N	\N	\N	16	錢	qián	money, currency, coins
5504	食 184.4	5504	\N	\N	\N	12	飲	yǐn	drink; swallow; kind of drink
5505	糸 120.5	5505	\N	\N	\N	11	細	xì	fine, tiny; slender, thin
5506	力 19.13	5506	6018	\N	\N	15	勰	xié	peaceful, harmonious
5507	金 167.5	5507	4532	\N	\N	10	钺	yuè	broad-axe, a battle axe, halberd
5508	糸 120.11	5508	6268	\N	\N	17	繇	yáo	reason, cause
5509	虫 142.11	5509	6101	\N	\N	16	螭	chī	a dragon whose horns have not grown; cruel
5510	山 46.10	5510	5170	\N	\N	12	嵬	wéi	high; rugged, rocky, precipitous
5511	車 159.5	5511	4182	\N	\N	9	轸	zhěn	cross board at rear of carriage
5512	肉 130.3	5512	3742	\N	\N	7	肟	wò	an organic compound
5513	肉 130.4	5513	3981	\N	\N	8	肫	zhūn	the gizzard of a fowl; honest, sincere
5514	邑 163.4	5514	6530	\N	\N	6	邨	cūn	village, hamlet; rustic
5515	疒 104.11	5515	6156	\N	\N	16	瘿	yǐng	swelling, goiter
5516	人 9.3	5516	3546	\N	\N	5	仞	rèn	(measure)
5517	大 37.4	5517	3687	\N	\N	7	奁	lián	bridal trousseau
5518	宀 40.2	5518	6519	\N	\N	5	宄	guǐ	a traitor; a villain
5519	車 159.5	5519	4180	\N	\N	9	轳	lú	pulley, windlass, capstan
5520	火 86.11	5520	\N	\N	\N	15	熳	màn	to spread
5521	目 109.7	5521	5125	\N	\N	12	睇	dì	look at, glance at; stare at
5522	金 167.5	5522	4534	\N	\N	10	钼	mù	molybdenum
5523	虫 142.9	5523	5928	\N	\N	15	蝼	lóu	a mole cricket, Gryllotalpa africana
5524	足 157.5	5524	5141	\N	\N	12	跆	tái	trample
5525	木 75.11	5525	5886	\N	\N	15	樗	chū	Ailanthus glandulosa or A. altissima, a kind of tree useless as timber
5526	魚 195.8	5526	7887	\N	\N	16	鲰	zōu	small fish; small; minnow
5527	竹 118.7	5527	\N	\N	\N	13	節	jié	knot, node, joint; section
5528	言 149.7	5528	\N	\N	\N	9	诶	éi	an exclamation of confirmation
5529	艸 140.13	5529	6054	\N	\N	16	薜	bì	evergreen shrubs, ligusticum
5530	金 167.6	5530	4875	\N	\N	11	铧	huá	spade, shovel, plowshare
5531	衣 145.7	5531	5307	\N	\N	12	裥	jiǎn	folds
5532	木 75.9	5532	7499	\N	\N	13	榇	chèn	coffin; tung tree
5533	食 184.8	5533	4932	\N	\N	11	馃	guǒ	cakes, biscuits, pastry
5534	行 144.5	5534	\N	\N	\N	11	術	shù	art, skill, special feat; method, technique
5535	足 157.11	5535	6333	\N	\N	18	蹚	tāng	tread through mud and water
5536	心 61.4	5536	3784	\N	\N	7	怄	òu	annoyed
5537	宀 40.11	5537	5816	\N	\N	14	寤	wù	few, scarce; empty, deserted
5538	糸 120.9	5538	5337	\N	\N	12	缗	mín	fishing-line; cord; string of coi
5539	石 112.6	5539	4793	\N	\N	11	硗	qiāo	barren land; sandy soil
5540	石 112.9	5540	5676	\N	\N	14	碡	dú	stone roller used to level fields
5541	矢 111.7	5541	5192	\N	\N	12	矬	cuó	a dwarf
5542	鳥 196.5	5542	4598	\N	\N	10	鸱	chī	kite, horned owl; wine cups
5543	虫 142.3	5543	4173	\N	\N	9	虺	huī	large poisonous snake
5544	米 119.9	5544	5993	\N	\N	15	糅	róu	blend, mix; mixed
5545	隹 172.10	5545	6351	\N	\N	18	雠	chóu	enemy, rival, opponent
5546	巾 50.5	5546	4067	\N	\N	8	帑	tǎng	a treasury; public funds
5547	金 167.12	5547	6249	\N	\N	17	镧	lán	lanthanum
5548	土 32.7	5548	4416	\N	\N	10	埙	xūn	instrument
5549	口 30.8	5549	4842	\N	\N	11	啁	zhāo	chirp, twitter, twittering
5550	心 61.7	5550	4662	\N	\N	10	悒	yì	sorrowful, depressed, unhappy
5551	牛 93.9	5551	5200	\N	\N	12	犍	jiān	a bullock; a fabulous monster
5552	石 112.6	5552	4796	\N	\N	11	硌	gè	to press painfully (of sth hard or bulging)
5553	金 167.8	5553	5490	\N	\N	13	锩	juǎn	to bend iron
5554	虫 142.3	5554	4183	\N	\N	9	虿	chài	a kind of scorpion
5555	虫 142.6	5555	7355	\N	\N	12	蛑	móu	a marine crab
5556	舟 137.7	5556	7551	\N	\N	13	艉	wěi	aft
5557	金 167.0	5557	\N	\N	\N	5	钅	jīn	gold; money; KangXi radical 167
5558	口 30.6	5558	4197	\N	\N	9	咴	huī	neigh, whinny
5559	竹 118.7	5559	5502	\N	\N	13	筮	shì	divination with stalks of plants; divining rod
5560	舟 137.9	5560	7797	\N	\N	15	艏	shǒu	bow of a ship
5561	米 119.8	5561	5795	\N	\N	14	糁	sǎn	a grain of rice; rice gruel mixed with meat
5562	黽 205.12	5562	6430	\N	\N	20	鼍	tuó	large reptile, water lizard
5563	聿 129.7	5563	5532	\N	\N	13	肄	yì	learn, practice, study; toil
5564	米 119.2	5564	3974	\N	\N	8	籴	dí	purchase grains; store grain
5565	馬 187.10	5565	5347	\N	\N	13	骜	ào	wild horse, mustang; wild
5566	龍 212.5	5566	4483	\N	\N	10	砻	lóng	grind, sharpen; mill
5567	虫 142.8	5567	5706	\N	\N	14	蜮	yù	a fabulous creature like a turtle; a toad
5568	齒 211.2	5568	4489	\N	\N	10	龀	chèn	lose baby teeth and get adult teeth
5569	黑 203.7	5569	6394	\N	\N	19	黢	qū	black
5570	力 19.3	5570	3537	\N	\N	5	劢	mài	put forth effort, strive forward
5571	肉 130.9	5571	\N	\N	\N	13	腫	zhǒng	swell; swollen; swelling
5572	耒 127.10	5572	6028	\N	\N	16	耪	pǎng	plow, cultivate
5573	鬯 192.0	5573	7028	\N	\N	10	鬯	chàng	sacrificial wine; unhindered
5574	田 102.5	5574	4697	\N	\N	10	畚	běn	straw basket, hamper
5575	角 148.10	5575	6202	\N	\N	17	觳	hú	an ancient measure; a goblet; mean; frightened
5576	禾 115.8	5576	5497	\N	\N	13	稞	kē	grain ready for grinding; grain
5577	鳥 196.7	5577	5106	\N	\N	12	鹁	bó	species of pigeon
5578	魚 195.8	5578	6141	\N	\N	16	鲲	kūn	spawn; roe; fy
5579	禾 115.9	5579	\N	\N	\N	14	稱	chēng	call; name, brand; address; say
5580	手 64.7	5580	1800	\N	\N	10	捌	bā	break open, split open; an accounting version of the numeral eight
5581	艸 140.8	5581	4758	\N	\N	11	菔	fú	turnip
5582	犬 94.13	5582	6149	\N	\N	16	獬	xiè	a fabulous monster
5583	木 75.5	5583	4142	\N	\N	9	柘	zhè	a thorny tree; sugarcane
5584	女 38.6	5584	4384	\N	\N	9	娆	ráo	graceful, charming, fascinating
5585	竹 118.10	5585	6127	\N	\N	16	篪	chí	a bamboo flute with seven holes
5586	魚 195.4	5586	5236	\N	\N	12	鲀	tún	blowfish, globefish, Spheroides vermicular
5587	言 149.12	5587	5825	\N	\N	14	谰	lán	accuse falsely; slander, libel
5588	子 39.7	5588	4472	\N	\N	10	孬	nāo	bad; cowardly
5589	人 9.5	5589	3607	\N	\N	6	伥	chāng	ghost of one devoured by tiger
5590	言 149.8	5590	4678	\N	\N	10	谇	suì	speak ill of, vilify; berate
5591	邑 163.9	5591	4785	\N	\N	11	鄄	juàn	name of a district in Shandong
5592	犬 94.5	5592	3986	\N	\N	8	狎	xiá	be familiar with; disrespect
5593	門 169.3	5593	6546	\N	\N	6	闫	yàn	village gate
5594	水 85.10	5594	5566	\N	\N	13	滟	yàn	overflowing, billowing; wavy
5595	齊 210.9	5595	5986	\N	\N	15	齑	jī	break or smash into pieces, pulverize; hash
5596	辵 162.9	5596	5270	\N	\N	12	遒	qiú	strong, unyielding, forceful
5597	石 112.10	5597	5895	\N	\N	15	磔	zhé	to dismember, tear apart; downward stroke slanting right
5598	耳 128.5	5598	4745	\N	\N	11	聃	dān	ears without rims; a personal name
5599	糸 120.8	5599	5642	\N	\N	14	綦	qí	dark grey. variegated. superlative
5600	魚 195.7	5600	5969	\N	\N	15	鲡	lí	eel
5601	艸 140.11	5601	5655	\N	\N	14	蔻	kòu	肉豆蔻 nutmeg,豆蔻 cardamon
5602	水 85.5	5602	4016	\N	\N	8	泠	líng	nice and cool, mild and comfortable
5603	石 112.4	5603	4165	\N	\N	9	砗	chē	giant clam, tridacna gigas
5604	金 167.3	5604	3943	\N	\N	8	钕	nǚ	neodymium
5605	金 167.12	5605	6252	\N	\N	17	镫	dèng	lamp; a kind of cooking vessel
5606	艸 140.8	5606	4763	\N	\N	11	菹	jū	salted or pickled vegetables
5607	肉 130.5	5607	4282	\N	\N	9	胂	shèn	arsine
5608	火 86.9	5608	5562	\N	\N	13	煅	duàn	variant of 锻
5609	火 86.9	5609	5564	\N	\N	13	煸	biān	to stir-fry before broiling or stewing
5610	虫 142.11	5610	6035	\N	\N	16	螯	áo	nippers
5611	足 157.13	5611	6429	\N	\N	20	躅	zhú	walk carefully; hesitate, falter
5612	魚 195.7	5612	5968	\N	\N	15	鲠	gěng	fish bones; honest, upright
5613	人 9.5	5613	3738	\N	\N	7	佥	qiān	all, together, unanimous
5614	网 122.4	5614	4232	\N	\N	9	罘	fú	screen used in ancient times
5615	山 46.12	5615	5942	\N	\N	15	嶝	dèng	path leading up a mountain
5616	辵 162.11	5616	\N	\N	\N	14	適	shì	match, comfortable; just
5617	土 32.5	5617	3849	\N	\N	8	坨	tuó	a lump, heap
5618	艸 140.8	5618	4752	\N	\N	11	菽	shū	beans and peas, collectively
5619	口 30.6	5619	4229	\N	\N	9	哞	mōu	moo
5620	彳 60.8	5620	4914	\N	\N	11	徜	cháng	walking and fro; lingering
5621	心 61.10	5621	5590	\N	\N	13	慊	qiàn	to resent; contended; satisfied
5622	水 85.6	5622	4348	\N	\N	9	洳	rù	damp, boggy, marshy
5623	水 85.8	5623	4974	\N	\N	11	渑	miǎn	name of a river in Shandong
5624	水 85.21	5624	6491	\N	\N	24	灞	bà	river in Shanxi province
5625	皿 108.5	5625	4426	\N	\N	10	盍	hé	what? why not?
5626	金 167.2	5626	3722	\N	\N	7	钋	pō	polonium
5627	鳥 196.5	5627	4487	\N	\N	10	鸫	dōng	thrush; Turdus species (various)
5628	足 157.8	5628	5917	\N	\N	15	踯	zhí	waver, hesitate, be irresolute
5629	糸 120.11	5629	6288	\N	\N	17	縻	mí	halter for ox; tie up, harness
5630	艸 140.8	5630	4750	\N	\N	11	萘	nài	naphthalene
5631	衣 145.10	5631	6013	\N	\N	15	褫	chǐ	strip, tear off, undress
5632	羊 123.9	5632	5988	\N	\N	15	羰	tāng	carbonyl (radical)
5633	肉 130.9	5633	\N	\N	\N	13	腦	nǎo	brain
5634	人 9.7	5634	4258	\N	\N	9	俅	qiú	ornamental cap
5635	艸 140.4	5635	6577	\N	\N	7	芤	kōu	hollow; scallion stalk
5636	阜 170.15	5636	6305	\N	\N	17	隳	huī	to destroy; to overthrow
5637	水 85.6	5637	4343	\N	\N	9	洮	táo	cleanse; river in Gansu province
5638	肉 130.6	5638	4594	\N	\N	10	胼	pián	callus, calluses
5639	网 122.9	5639	5723	\N	\N	14	罴	pí	brown bear, ursus arctos
5640	金 167.11	5640	6116	\N	\N	16	镛	yōng	large bell used as musical instrument
5641	心 61.5	5641	4028	\N	\N	8	怛	dá	grieved, saddened; worried
5642	艸 140.3	5642	3578	\N	\N	6	芊	qiān	exuberant and vigorous foliage
5643	口 30.8	5643	4820	\N	\N	11	啉	lín	stupid; slow
5644	口 30.12	5644	5936	\N	\N	15	噌	cēng	scold, shout at
5645	女 38.11	5645	5831	\N	\N	14	嫱	qiáng	lady
5646	糸 120.8	5646	5033	\N	\N	11	绲	gǔn	cord; woven belt; hem; hemming
5647	肉 130.13	5647	6273	\N	\N	17	膻	shān	a rank odor; a technical term from Chinese medicine for the center of the chest
5648	火 86.7	5648	4956	\N	\N	11	焐	wù	to warm sth up
5649	衣 145.7	5649	\N	\N	\N	12	裡	lǐ	inside, interior, within
5650	艸 140.9	5650	7315	\N	\N	12	葎	lǜ	Humulus japonicus
5651	二 7.2	5651	3508	\N	\N	4	亓	qí	(archaic form) his, her, its, their; that
5652	人 9.8	5652	7016	\N	\N	10	倮	luǒ	bare, naked, uncovered
5653	艸 140.7	5653	4446	\N	\N	10	莼	chún	an edible water plant-brasenia
5654	艸 140.16	5654	6373	\N	\N	19	蘅	héng	a fragrant plant the root is medicinal
5655	口 30.11	5655	5695	\N	\N	14	嘞	lei	(Cant.) final particle used for polite refusal
5656	糸 120.9	5656	5336	\N	\N	12	缒	zhuì	climb down rope; hang by rope
5657	金 167.10	5657	7785	\N	\N	15	镆	mò	sword
5658	糸 120.8	5658	\N	\N	\N	14	網	wǎng	net, web; network
5659	人 9.4	5659	3608	\N	\N	6	伧	cāng	vulgar person, country man
5660	艸 140.6	5660	4120	\N	\N	9	荏	rěn	beans; soft, pliable; herb
5661	口 30.8	5661	4852	\N	\N	11	唳	lì	cry of bird; cry
5662	木 75.13	5662	6213	\N	\N	17	檩	lǐn	the bole of a tree; a cross beam; the combing round the hatches of a ship
5663	鳥 196.5	5663	4708	\N	\N	10	鸶	sī	the eastern egret
5664	虫 142.4	5664	4511	\N	\N	10	蚬	xiǎn	a variety of bivalves
5665	骨 188.4	5665	7527	\N	\N	13	骱	jiè	joint of bones
5666	艸 140.17	5666	6423	\N	\N	20	蘖	niè	stump, sprout
5667	水 85.12	5667	5997	\N	\N	15	澍	shù	timely rain, life-giving rain
5668	韋 178.9	5668	5348	\N	\N	13	韫	yùn	secrete, hide, conceal
5669	火 86.8	5669	5246	\N	\N	12	颎	jiǒng	bright
5670	口 30.11	5670	7646	\N	\N	14	嘏	gǔ	felicity, prosperity; large and strong
5671	土 32.6	5671	4261	\N	\N	9	垡	fá	plow soil; place name
5672	肉 130.8	5672	5233	\N	\N	12	腚	dìng	buttock
5673	火 86.8	5673	5272	\N	\N	12	焯	chāo	boil vegetables for a very short time; scald
5674	糸 120.14	5674	\N	\N	\N	20	繻	xū	fine silk guaze; torn piece of silk
5675	心 61.5	5675	4025	\N	\N	8	怙	hù	rely on, presume on; persist in
5676	羊 123.7	5676	5555	\N	\N	13	羧	suō	carboxyl group
5677	鼓 207.8	5677	6449	\N	\N	21	鼙	pí	drum carried on horseback
5678	人 9.8	5678	4577	\N	\N	10	倥	kōng	boorish, ignorant; urgent, pressing
5679	亠 8.8	5679	4613	\N	\N	10	亳	bó	name of district in Anhui; capital of Yin
5680	艸 140.2	5680	3530	\N	\N	5	艽	jiāo	used in 秦艽
5681	艸 140.6	5681	4126	\N	\N	9	荠	jì	water-chestnuts; caltrop
5682	日 72.5	5682	4199	\N	\N	9	昴	mǎo	one of the 28 constellations
5683	舟 137.4	5683	\N	\N	\N	10	舨	bǎn	a sampan
5684	鬼 194.7	5684	6133	\N	\N	16	魈	xiāo	mischevious, one footed spirit that dwells in the mountains
5685	酉 164.10	5685	\N	\N	\N	17	醣	táng	carbohydrates
5686	木 75.5	5686	4148	\N	\N	9	枵	xiāo	hollo stump of a tree; empty, thin
5687	米 119.5	5687	5013	\N	\N	11	粜	tiào	sell grains
5688	弋 56.5	5688	\N	\N	\N	8	甙	dài	sugar product
5689	玉 96.6	5689	4410	\N	\N	10	珲	huī	bright, glorious, splendid
5690	木 75.3	5690	3679	\N	\N	7	杓	biāo	handle of cup, ladle, spoon; name of a constellation
5691	木 75.9	5691	5397	\N	\N	13	楸	qiū	mallotus japonicus, deciduous tre
5692	木 75.9	5692	5405	\N	\N	13	楦	xuàn	a last for making shoes; to turn on a lathe
5693	田 102.12	5693	6233	\N	\N	17	疃	tuǎn	hamlet; area outside city
5694	虫 142.5	5694	4840	\N	\N	11	蛏	chēng	razor clam
5695	虫 142.15	5695	\N	\N	\N	20	蠛	miè	flies, small insects produced in damp places
5696	骨 188.10	5696	6396	\N	\N	19	髌	bìn	kneecap
5697	艸 140.5	5697	3870	\N	\N	8	茔	yíng	grave, tomb, cemetery
5698	臣 131.11	5698	\N	\N	\N	17	臨	lín	draw near, approach; descend
5699	言 149.8	5699	4670	\N	\N	10	诼	zhuó	slander; gossip; rumors
5700	女 38.13	5700	6187	\N	\N	16	嬖	bì	favorite; a minion
5701	耒 127.0	5701	3564	\N	\N	6	耒	lěi	handle of plow; plow; rad. 127
5702	虫 142.8	5702	5463	\N	\N	13	蜣	qiāng	dung beetle
5703	竹 118.6	5703	4556	\N	\N	10	笄	jī	hairpin; fifteen year old girl
5704	足 157.6	5704	5456	\N	\N	13	跣	xiǎn	bare footed
5705	金 167.4	5705	4242	\N	\N	9	钣	bǎn	plate
5706	心 61.21	5706	6498	\N	\N	25	戆	gàng	stupid, simple, simple-minded
5707	虫 142.7	5707	5462	\N	\N	13	蜉	fú	mayfly; kind of large insect
5708	口 30.9	5708	5301	\N	\N	12	喾	kù	emperor
5709	金 167.5	5709	4545	\N	\N	10	铍	pī	beryllium
5710	阜 170.5	5710	3805	\N	\N	7	陉	xíng	defile, mountain pass, gorge
5711	艸 140.14	5711	6205	\N	\N	17	薹	tái	cyperus rotundus, type of sedge
5712	肉 130.4	5712	6711	\N	\N	8	肷	qiǎn	area between waist and hips
5713	山 46.5	5713	6681	\N	\N	8	岵	hù	hill
5714	瓦 98.5	5714	4278	\N	\N	9	瓴	líng	concave channels of tiling a long-necked jar
5715	艸 140.7	5715	4438	\N	\N	10	荽	suī	coriander
5716	心 61.5	5716	4033	\N	\N	8	怫	fú	sorry, anxious; depressed
5717	金 167.4	5717	6851	\N	\N	9	钭	tǒu	a wine flagon
5718	穴 116.4	5718	6901	\N	\N	9	窀	zhūn	to bury
5719	糸 120.12	5719	6023	\N	\N	15	缯	zēng	silk fabrics; surname
5720	人 9.8	5720	4567	\N	\N	10	倬	zhuō	noticeable, large; clear, distinct
5721	手 64.11	5721	5638	\N	\N	14	摭	zhí	pick up, gather
5722	巾 50.5	5722	3934	\N	\N	8	帔	pèi	a skirt; long robe for women, having no sleeves and fasten down the front
5723	木 75.9	5723	5395	\N	\N	13	楝	liàn	Melia japonica
5724	疒 104.8	5724	5541	\N	\N	13	痱	fèi	heat rash, prickly heat; ulcers
5725	虫 142.5	5725	4831	\N	\N	11	蚶	hān	kind of clam, arca inflata
5726	虫 142.11	5726	6231	\N	\N	17	螬	cáo	grubs in fruit
5727	骨 188.13	5727	6472	\N	\N	22	髑	dú	skull
5728	糸 120.3	5728	\N	\N	\N	9	紅	hóng	red, vermillion; blush, flush
5729	鼓 207.6	5729	8041	\N	\N	19	鼗	táo	small revolving drum with knobs
5730	犬 94.7	5730	4601	\N	\N	10	狷	juàn	rash, impetuous, impulsive
5731	歹 78.9	5731	5114	\N	\N	12	殛	jí	to put to death to imprison for life
5732	衣 145.6	5732	5001	\N	\N	11	裉	kèn	seam in a garment
5733	米 119.5	5733	4953	\N	\N	11	粝	lì	unpolished rice; brown rice
5734	艸 140.8	5734	4751	\N	\N	11	萋	qī	luxuriant foliage; crowded
5735	艸 140.9	5735	5093	\N	\N	12	葭	jiā	bulrush, reed; flute, whistle
5736	衣 145.4	5736	4361	\N	\N	9	衽	rèn	lapel; hidden lapel of coat
5737	魚 195.13	5737	6454	\N	\N	21	鳢	lǐ	snakehead
5738	人 9.10	5738	5213	\N	\N	12	傧	bīn	entertain guests
5739	口 30.9	5739	5152	\N	\N	12	喁	yóng	the mouth of a fish at the surface of the water, gasping for breath
5740	女 38.11	5740	5835	\N	\N	14	嫘	léi	surname
5741	网 122.5	5741	4523	\N	\N	10	罟	gǔ	net; snare; pressure come or go
5742	金 167.2	5742	3723	\N	\N	7	钌	liǎo	ruthenium
5743	衣 145.8	5743	7603	\N	\N	13	裼	tì	baby's quilt; to bare the upper body
5744	心 61.9	5744	5296	\N	\N	12	愦	kuì	confused, troubled, muddle-headed
5745	虫 142.9	5745	5920	\N	\N	15	蝽	chūn	bedbug
5746	隹 172.9	5746	\N	\N	\N	17	雖	suī	although, even if
5747	金 167.8	5747	5482	\N	\N	13	锗	zhě	germanium
5748	衣 145.4	5748	4362	\N	\N	9	衿	jīn	collar or lapel of garment
5749	米 119.6	5749	7418	\N	\N	12	粢	zī	grain offered in ritual sacrifice; millet
5750	酉 164.13	5750	8054	\N	\N	20	醵	jù	contribute for drinks; pool money
5751	足 157.6	5751	\N	\N	\N	13	跫	qióng	sound of footsteps
5752	金 167.13	5752	6461	\N	\N	21	鐾	bèi	\N
5753	广 53.12	5753	5981	\N	\N	15	廛	chán	a store, shop; ground alloted to a retainer
5754	土 32.11	5754	5639	\N	\N	14	墉	yōng	wall; fortified wall; small wall
5755	口 30.6	5755	4221	\N	\N	9	哌	pài	used in translation
5756	車 159.7	5756	\N	\N	\N	14	輕	qīng	light; easy, simple; gentle
5757	手 64.3	5757	3571	\N	\N	6	扦	qiān	probe, poke, prick, pierce
5758	土 32.8	5758	4749	\N	\N	11	堇	jǐn	yellow loam; clay; season; few
5759	女 38.8	5759	5016	\N	\N	11	婧	jìng	modest; supple
5760	日 72.9	5760	5451	\N	\N	13	暌	kuí	in opposition; distant from; separated
5761	网 122.9	5761	5724	\N	\N	14	罱	lǎn	fishing net
5762	金 167.11	5762	6118	\N	\N	16	镞	zú	arrowhead, barb; swift, quick
5763	足 157.12	5763	6383	\N	\N	19	蹰	chú	hesitate, waver, falter
5764	阜 170.7	5764	4381	\N	\N	9	陟	zhì	climb, scale, ascend; proceed
5765	魚 195.11	5765	6404	\N	\N	19	鳔	biào	swimming bladder of fish
5766	肉 130.7	5766	4922	\N	\N	11	脘	wǎn	internal cavity of stomach
5767	肉 130.18	5767	\N	\N	\N	21	臟	zàng	internal organs, viscera
5768	山 46.5	5768	3924	\N	\N	8	岿	kuī	grand, stately; secure, lasting
5769	人 9.6	5769	3969	\N	\N	8	侔	móu	equal
5770	邑 163.9	5770	4781	\N	\N	11	郾	yǎn	county in Henan province
5771	口 30.8	5771	4844	\N	\N	11	唿	hū	sad; (Cant.) a bit, part
5772	石 112.5	5772	4474	\N	\N	10	砹	ài	astatine
5773	疒 104.5	5773	4615	\N	\N	10	疴	kē	illness, sickness, disease; pain
5774	麥 199.4	5774	4715	\N	\N	11	麸	fū	bran
5775	艸 140.13	5775	6050	\N	\N	16	薨	hōng	death of prince; swarming
5776	糸 120.8	5776	\N	\N	\N	14	綝	chēn	to stop; adjusted, in order
5777	水 85.10	5777	5293	\N	\N	12	滁	chú	district in Anhui province
5778	人 9.9	5778	4904	\N	\N	11	偾	fèn	ruin, cause fail; overthrown
5779	手 64.5	5779	3845	\N	\N	8	拊	fǔ	slap; pat; tap; handle of a vessel
5780	手 64.12	5780	5867	\N	\N	15	撺	cuān	hurry; to throw; to urge
5781	口 30.4	5781	3699	\N	\N	7	呒	fǔ	unclear; an expletive
5782	犬 94.6	5782	4292	\N	\N	9	狯	kuài	sly, cunning, crafty
5783	犬 94.9	5783	5239	\N	\N	12	猢	hú	a kind of monkey found in W.China
5784	木 75.8	5784	5102	\N	\N	12	椁	guǒ	outer-coffin; vault
5785	木 75.10	5785	5666	\N	\N	14	榱	cuī	rafter
5786	网 122.12	5786	6239	\N	\N	17	罾	zēng	a large square net, lowered and raised from the bank of the river
5787	金 167.5	5787	4885	\N	\N	11	铳	chòng	ancient weapon, blunderbuss
5788	衣 145.7	5788	5306	\N	\N	12	裎	chéng	to take off the clothes and expose the body. to carry in the girdle
5789	魚 195.11	5789	8044	\N	\N	19	鳚	wèi	general term of a kind of fish, a snake-like fish
5790	目 109.5	5790	4810	\N	\N	11	眦	zì	corner of the eyes, eyesockets
5791	玉 96.11	5791	5854	\N	\N	15	璎	yīng	a necklace made of precious stones
5792	言 149.7	5792	\N	\N	\N	14	認	rèn	recognize, know, understand
5793	山 46.8	5793	7172	\N	\N	11	崞	guō	mountain in Shanxi
5794	糸 120.9	5794	5332	\N	\N	12	缇	tí	reddish color, red, brown
5795	虫 142.9	5795	5927	\N	\N	15	蝣	yóu	mayfly (Ephemera strigata)
5796	艸 140.8	5796	4756	\N	\N	11	萑	huán	grass used for making mats; Huanpu, place famous for robbers
5797	犬 94.6	5797	4295	\N	\N	9	狲	sūn	monkey
5798	糸 120.13	5798	6192	\N	\N	16	缱	qiǎn	attached to, inseparable; entangl
5799	日 72.8	5799	5133	\N	\N	12	晷	guǐ	shadows of sun; time; sundial
5800	冫 15.6	5800	3995	\N	\N	8	冼	xiǎn	a surname
5801	疒 104.7	5801	5259	\N	\N	12	痧	shā	cholera; colic
5802	糸 120.6	5802	\N	\N	\N	12	統	tǒng	govern, command, control; unite
5803	艸 140.12	5803	5654	\N	\N	14	蕖	qú	lotus
5804	犬 94.5	5804	3987	\N	\N	8	狍	páo	species of deer found in north China
5805	心 61.13	5805	7909	\N	\N	16	憷	chù	painful; suffering; privation
5806	金 167.8	5806	5483	\N	\N	13	锛	bēn	adze
5807	穴 116.9	5807	5815	\N	\N	14	窨	xūn	a cellar, a store-room
5808	衣 145.6	5808	7251	\N	\N	11	袼	gē	gusset, cloth fitting sleeve under armpit
5809	巾 50.4	5809	3712	\N	\N	7	帏	wéi	curtain that forms wall
5810	人 9.13	5810	5961	\N	\N	15	儋	dān	a small jar; to bear a burden; a load of two
5811	糸 120.7	5811	4705	\N	\N	10	绨	tí	coarse pongee, kind of heavy silk
5812	疒 104.3	5812	3997	\N	\N	8	疠	lì	a sore, ulcer; pestilence
5813	艸 140.17	5813	6422	\N	\N	20	蘩	fán	Artemisia stellariana
5814	山 46.9	5814	5173	\N	\N	12	嵝	lǒu	Goulou mountain peak in hunan
5815	广 53.2	5815	\N	\N	\N	5	庀	pǐ	to prepare; to regulate to hand up
5816	水 85.3	5816	3627	\N	\N	6	汜	sì	a stream which leaves the main branch then later returns
5817	火 86.4	5817	3907	\N	\N	8	炅	jiǒng	brilliance
5818	火 86.9	5818	5559	\N	\N	13	煳	hú	be burned, to char (in cooking)
5819	水 85.5	5819	\N	\N	\N	9	泶	xué	\N
5820	瓜 97.6	5820	4798	\N	\N	11	瓠	hù	bottle gourd; calabash; pot
5821	穴 116.10	5821	6009	\N	\N	15	窳	yǔ	dirty, useless, weak, powerless; cracked, a flaw
5822	虫 142.2	5822	3910	\N	\N	8	虮	jǐ	louse eggs, nits
5823	虫 142.5	5823	4835	\N	\N	11	蚰	yóu	millipede
5824	邑 163.5	5824	3820	\N	\N	7	邰	tái	surname; state in modern Shanxi
5825	艸 140.4	5825	6571	\N	\N	7	苊	è	an organic compound
5826	石 112.4	5826	3887	\N	\N	8	砀	dàng	brilliantly colored stone with veined patterns in it
5827	手 64.8	5827	4738	\N	\N	11	捩	liè	twist with hands; snap, tear
5828	足 157.10	5828	6095	\N	\N	16	蹉	cuō	error, mistake, slip; failure
5829	艸 140.7	5829	4431	\N	\N	10	莪	é	artemisia
5830	虫 142.11	5830	6283	\N	\N	17	螽	zhōng	katydid
5831	見 147.13	5831	\N	\N	\N	20	覺	jué	to wake up from sleep; conscious
5832	艸 140.19	5832	8090	\N	\N	22	蘼	mí	millet
5833	木 75.10	5833	5665	\N	\N	14	槔	gāo	water pulley
5834	日 72.14	5834	6329	\N	\N	18	曛	xūn	twilight; sunset
5835	虫 142.6	5835	5143	\N	\N	12	蛲	náo	worms
5836	鹵 197.9	5836	7857	\N	\N	16	鹾	cuó	salty; salt
5837	隹 172.0	5837	6699	\N	\N	8	隹	zhuī	bird; KangXi radical 172
5838	犬 94.3	5838	3618	\N	\N	6	犸	mà	mammoth
5839	血 143.4	5839	4582	\N	\N	10	衄	nǜ	epistaxis, nosebleed; to be defeated
5840	見 147.18	5840	\N	\N	\N	24	觀	guān	see, observe, view; appearance
5841	車 159.11	5841	\N	\N	\N	18	轉	zhuǎn	shift, move, turn
5842	金 167.6	5842	7634	\N	\N	14	銎	qióng	eyehole to hang an axe by
5843	水 85.5	5843	4019	\N	\N	8	泫	xuàn	weep; cry; shine, glisten
5844	玉 96.4	5844	3830	\N	\N	8	玢	bīn	(archaic) a kind of jade
5845	車 159.8	5845	5117	\N	\N	12	辊	gǔn	turn round, revolve; roller
5846	目 109.10	5846	5903	\N	\N	15	瞋	chēn	glare with anger
5847	土 32.11	5847	5868	\N	\N	15	墀	chí	porch; courtyard; steps leading
5848	酉 164.3	5848	4469	\N	\N	10	酐	gān	anhydride
5849	阜 170.14	5849	\N	\N	\N	16	隱	yǐn	hide, conceal; hidden, secret
5850	土 32.9	5850	5060	\N	\N	12	堞	dié	plate
5851	尢 43.3	5851	3589	\N	\N	6	尥	liào	to give a backward kick (e.g. of a horse)
5852	口 30.16	5852	6382	\N	\N	19	嚯	huò	(onom.) expressing admiration or surprise
5853	犬 94.8	5853	4925	\N	\N	11	猗	yī	exclamation of admiration
5854	辵 162.7	5854	4464	\N	\N	10	逑	qiú	collect, unite; match, pair
5855	辵 162.8	5855	5010	\N	\N	11	逯	lù	leave without reason; surname
5856	石 112.6	5856	4792	\N	\N	11	硖	xiá	(archaic) town in Hebei province
5857	口 30.13	5857	6107	\N	\N	16	噻	sāi	character used in translation
5858	山 46.9	5858	5171	\N	\N	12	嵛	yú	county in Shandong province
5859	田 102.3	5859	3909	\N	\N	8	畀	bì	to give
5860	辵 162.9	5860	\N	\N	\N	12	運	yùn	luck, fortune; ship, transport
5861	魚 195.4	5861	7406	\N	\N	12	鲃	bā	a kind of fish; a bonito, (same as鮁) shark
5862	人 9.9	5862	4909	\N	\N	11	偬	zǒng	urgent
5863	邑 163.11	5863	5370	\N	\N	13	鄞	yín	county in Zhejiang province
5864	口 30.4	5864	3702	\N	\N	7	呖	lì	used in onomatopoetic expressions
5865	水 85.10	5865	5572	\N	\N	13	溧	lì	river in Anhui and Jiangsu provinces
5866	女 38.14	5866	\N	\N	\N	17	嬲	niǎo	frolic, play with; flirt with; (Cant.) angry
5867	肉 130.4	5867	6709	\N	\N	8	肭	nà	fat; seal (moon radical DKW: 14342 is different)
5868	鳥 196.7	5868	5276	\N	\N	12	鹈	tí	pelican
5869	鳥 196.14	5869	8017	\N	\N	18	鹱	hù	\N
5870	穴 116.9	5870	7735	\N	\N	14	窭	jù	poor, impoverished
5871	黑 203.8	5871	6437	\N	\N	20	黧	lí	a dark, sallow colour
5872	言 149.13	5872	6014	\N	\N	15	谵	zhān	talkative; incoherent talk
5873	水 85.4	5873	3780	\N	\N	7	沆	hàng	a ferry; fog; flowing
5874	女 38.10	5874	5607	\N	\N	13	嫒	ài	(your) daughter
5875	土 32.10	5875	5350	\N	\N	13	塬	yuán	plateau
5876	糸 120.10	5876	5618	\N	\N	13	缣	jiān	fine silk
5877	竹 118.10	5877	7878	\N	\N	16	篯	jiān	surname
5878	邑 163.17	5878	6377	\N	\N	19	酃	líng	the spirit of a being, which acts upon others spirit; divine; efficacious
5879	口 30.9	5879	5131	\N	\N	12	喱	lí	gramme; syllable
5880	水 85.5	5880	4009	\N	\N	8	泔	gān	water from washing rice to boil thick, as gruel
5881	水 85.10	5881	5568	\N	\N	13	溘	kè	abruptly, suddenly, unexpectedly
5882	辵 162.4	5882	3724	\N	\N	7	迕	wù	obstinate, perverse
5883	聿 129.0	5883	\N	\N	\N	4	肀	yù	pen; radical number 129
5884	禾 115.5	5884	4554	\N	\N	10	秫	shú	glutinous variety of millet
5885	衣 145.7	5885	7445	\N	\N	12	裣	liǎn	used in 裣衽
5886	金 167.5	5886	4543	\N	\N	10	铋	bì	bismuth
5887	艸 140.9	5887	5090	\N	\N	12	蒌	lóu	artemisia stelleriana
5888	日 72.17	5888	6453	\N	\N	21	曩	nǎng	in ancient times, of old, former
5889	貝 154.6	5889	6981	\N	\N	10	赀	zī	property; wealth; to count
5890	竹 118.8	5890	5749	\N	\N	14	箪	dān	small bamboo basket for holding
5891	肉 130.4	5891	\N	\N	\N	8	朊	ruǎn	protein
5892	魚 195.11	5892	6407	\N	\N	19	鳙	yōng	bighead
5893	人 9.3	5893	3545	\N	\N	5	仫	mù	tribe
5894	金 167.3	5894	3940	\N	\N	8	钎	qiān	tool for boring holes
5895	艸 140.3	5895	3582	\N	\N	6	芑	qǐ	white millet
5896	肉 130.5	5896	4283	\N	\N	9	胙	zuò	to grant or bestow; blessing
5897	目 109.3	5897	3896	\N	\N	8	盱	xū	wide open eyes; to gaze in astonishment
5898	米 119.9	5898	7807	\N	\N	15	糇	hóu	dried rice, dry provisions
5899	手 64.7	5899	4418	\N	\N	10	挹	yì	to bale out; to decant liquids
5900	手 64.8	5900	4726	\N	\N	11	捭	bǎi	to open; to spread out
5901	心 61.8	5901	4985	\N	\N	11	悱	fěi	to be desirous of speaking
5902	髟 190.13	5902	6477	\N	\N	23	鬟	huán	dress hair in coiled knot; maid
5903	糸 120.9	5903	\N	\N	\N	15	緩	huǎn	slow, leisurely; to postpone, delay
5904	言 149.8	5904	\N	\N	\N	15	請	qǐng	ask, request; invite; please
5905	山 46.8	5905	4860	\N	\N	11	崤	xiáo	mountain in Henan
5906	水 85.13	5906	6180	\N	\N	16	澶	chán	still water, placid, tranquil
5907	田 102.3	5907	4083	\N	\N	8	甾	zāi	ground that has been under cultivation for one year; evil, calamity
5908	欠 76.8	5908	7341	\N	\N	12	欹	yī	fierce dog; interjection of pleas; (Cant.) strange
5909	目 109.13	5909	6314	\N	\N	18	瞽	gǔ	blind; blind musician; stupid
5910	金 167.1	5910	3597	\N	\N	6	钇	yǐ	yttrium
5911	鳥 196.12	5911	6263	\N	\N	17	鹪	jiāo	wren
5912	革 177.7	5912	7839	\N	\N	16	鞔	mán	sides or uppers of shoes to stretch a skin on a frame for a drum; (Cant.) to cover
5913	糸 120.10	5913	5616	\N	\N	13	缡	lí	a bridal veil; to tie; to bind
5914	金 167.6	5914	4882	\N	\N	11	铯	sè	cesium
5915	魚 195.6	5915	5770	\N	\N	14	鲚	jì	anchovy
5916	糸 120.5	5916	\N	\N	\N	11	組	zǔ	class; section, department
5917	口 30.12	5917	5930	\N	\N	15	嘬	chuài	to lap; to suck
5918	广 53.8	5918	4936	\N	\N	11	庹	tuǒ	length of 2 outstretched arms
5919	水 85.8	5919	\N	\N	\N	11	渖	shěn	juice; liquid; water; to leak, pour
5920	水 85.9	5920	5289	\N	\N	12	湔	jiān	wash, cleanse; purge
5921	玉 96.2	5921	3565	\N	\N	6	玎	dīng	jingling, tinkling
5922	金 167.8	5922	5484	\N	\N	13	锜	qí	a kind of pen; a kind of chisel
5923	金 167.7	5923	7379	\N	\N	12	锊	lüè	6 oz; ancient measurement
5924	舟 137.6	5924	7397	\N	\N	12	舾	xī	(Cant.) equipment on a ship
5925	米 119.3	5925	4322	\N	\N	9	籼	xiān	non-glutinous long grain rice
5926	門 169.8	5926	4948	\N	\N	11	阊	chāng	gate of heaven; main gate of a palace
5927	示 113.5	5927	6906	\N	\N	9	祕	mì	mysterious, secret, abstruse
5928	犬 94.8	5928	7216	\N	\N	11	猊	ní	lion; wild beast; wild horse
5929	火 86.14	5929	6326	\N	\N	18	燹	xiǎn	fire; wild fires
5930	艸 140.9	5930	5079	\N	\N	12	葑	fēng	the rape-turnip
5931	艸 140.11	5931	5659	\N	\N	14	蓼	liǎo	smartweed, polygonum
5932	巾 50.11	5932	5727	\N	\N	14	幛	zhàng	scroll of silk or cloth presente
5933	山 46.5	5933	3928	\N	\N	8	岣	gǒu	a hill in Hunan
5934	水 85.7	5934	7064	\N	\N	10	浼	měi	to request; to ask a favour of; to pollute, contaminate
5935	用 101.7	5935	7442	\N	\N	12	甯	níng	peaceful
5936	玉 96.10	5936	7625	\N	\N	14	瑷	ài	fine quality jade
5937	攴 66.9	5937	5507	\N	\N	13	敫	jiǎo	ancient musical instrument
5938	金 167.3	5938	6690	\N	\N	8	钔	mén	mendelevium (Md)
5939	金 167.4	5939	4245	\N	\N	9	钫	fāng	francium
5940	金 167.9	5940	7680	\N	\N	14	锼	sōu	carve
5941	金 167.9	5941	7684	\N	\N	14	锿	āi	einsteinium (Es)
5942	疒 104.13	5942	6357	\N	\N	18	癔	yì	hysterical
5943	穴 116.3	5943	6727	\N	\N	8	穸	xī	the gloom of the grave a tomb or grave; death
5944	衣 145.9	5944	5823	\N	\N	14	褊	biǎn	cramped, narrow, crowded; mean
5945	虫 142.4	5945	4509	\N	\N	10	蚍	pí	mussels; various shellfish
5946	竹 118.10	5946	6126	\N	\N	16	篦	bì	fine-toothed comb; comb hair
5947	鹿 198.5	5947	6162	\N	\N	16	麇	jūn	general name for the hornless deer; to collect to band together
5948	木 75.11	5948	5887	\N	\N	15	樘	táng	a pillar; door post
5949	金 167.4	5949	4246	\N	\N	9	钯	bǎ	palladium
5950	示 113.9	5950	\N	\N	\N	12	禇	zhě	erroneous form of 褚
5951	金 167.6	5951	4866	\N	\N	11	铒	ěr	erbium
5952	糸 120.15	5952	\N	\N	\N	21	續	xù	continue, carry on; succeed
5953	艸 140.7	5953	4437	\N	\N	10	莩	fú	membrane lining inside of reed
5954	山 46.10	5954	5172	\N	\N	12	嵯	cuó	high, towering; irregular, rugged
5955	辵 162.8	5955	7248	\N	\N	11	逭	huàn	to escape from; to flee, to avoid
5956	辵 162.9	5956	5166	\N	\N	12	遄	chuán	to hurry; to go to and fro
5957	戈 62.4	5957	3976	\N	\N	8	戗	qiāng	support
5958	目 109.7	5958	5126	\N	\N	12	睃	suō	to squint at
5959	魚 195.5	5959	\N	\N	\N	16	鮈	jū	\N
5960	水 85.16	5960	6413	\N	\N	19	瀣	xiè	sea mist; vapor
5961	皮 107.7	5961	5325	\N	\N	12	皴	cūn	chapped, cracked
5962	水 85.5	5962	4020	\N	\N	8	泮	pàn	Zhou dynasty school; disperse; fall apart
5963	車 159.3	5963	3691	\N	\N	7	轫	rèn	a block that keeps a wheel from moving
5964	衣 145.10	5964	6182	\N	\N	16	褰	qiān	to lift (clothes, sheets), lower garments
5965	火 86.5	5965	4391	\N	\N	9	炱	tái	soot
5966	酉 164.9	5966	6070	\N	\N	16	醍	tí	essential oil of butter
5967	金 167.8	5967	5492	\N	\N	13	锱	zī	8 oz; an ancient unit of weight
5968	竹 118.9	5968	5957	\N	\N	15	篁	huáng	bamboo grove; bamboo
5969	艸 140.9	5969	5080	\N	\N	12	葚	rèn	mulberry fruit
5970	隹 172.11	5970	\N	\N	\N	19	難	nán	difficult, arduous, hard; unable
5971	目 109.14	5971	\N	\N	\N	18	矇	méng	stupid, ignorant; blind
5972	馬 187.5	5972	4070	\N	\N	8	驽	nú	tired, old horse; old, weak
5973	車 159.12	5973	6080	\N	\N	16	辚	lín	rumbling of vehicles; threshold
5974	目 109.8	5974	5439	\N	\N	13	睥	pì	look askance at, glare at
5975	鳥 196.6	5975	7194	\N	\N	11	鸺	xiū	horned owl, scops chinensis
5976	竹 118.6	5976	4894	\N	\N	11	筇	qióng	bamboo name; bamboo staff
5977	戈 62.9	5977	5446	\N	\N	13	戥	děng	a small steelyard for weighing money, etc.
5978	骨 188.8	5978	6244	\N	\N	17	髀	bì	buttocks; thigh, thigh bone
5979	馬 187.5	5979	6751	\N	\N	8	驺	zōu	mounted escort; groom
5980	頁 181.7	5980	\N	\N	\N	16	頸	jǐng	neck, throat
5981	口 30.6	5981	4222	\N	\N	9	哙	kuài	swallow, gulp down; greedy
5982	水 85.14	5982	6295	\N	\N	17	濞	bì	used in place names
5983	辵 162.6	5983	4297	\N	\N	9	逄	páng	a surname
5984	木 75.6	5984	4454	\N	\N	10	桤	qī	alder
5985	攴 66.0	5985	\N	\N	\N	4	攵	pū	rap, tap; radical number 66
5986	火 86.5	5986	4325	\N	\N	9	炻	shí	a kind of china
5987	石 112.10	5987	5896	\N	\N	15	磙	gǔn	roller
5988	疒 104.5	5988	4614	\N	\N	10	疳	gān	childhood diseases
5989	酉 164.12	5989	8034	\N	\N	19	醭	bú	molds on liquids; scum
5990	魚 195.9	5990	6281	\N	\N	17	鳇	huáng	sturgeon
5991	鳥 196.13	5991	6339	\N	\N	18	鹮	huán	spoonbill; ibis; family Threskiornidae
5992	辵 162.4	5992	3692	\N	\N	7	迓	yà	to go to meet, to receive, as a guest
5993	目 109.4	5993	4192	\N	\N	9	眇	miǎo	blind in one eye; minute, minuscule
5994	木 75.9	5994	5094	\N	\N	12	楮	chǔ	mulberry; paper
5995	石 112.4	5995	4170	\N	\N	9	砜	fēng	an organic compound
5996	言 149.10	5996	\N	\N	\N	17	謝	xiè	thank; decline
5997	隹 172.11	5997	\N	\N	\N	18	離	lí	leave, depart; go away; separate
5998	糸 120.3	5998	\N	\N	\N	9	約	yuē	treaty, agreement, covenant
5999	艸 140.8	5999	4748	\N	\N	11	菘	sōng	celery, cabbage
6000	食 184.9	6000	5248	\N	\N	12	馇	chā	stir and cook
6001	木 75.5	6001	4146	\N	\N	9	栌	lú	supporting block; sumac, loquat
6002	酉 164.9	6002	6069	\N	\N	16	醐	hú	purest cream
6003	口 30.7	6003	4514	\N	\N	10	唢	suǒ	flute-like musical instrument
6004	犬 94.11	6004	7710	\N	\N	14	獍	jìng	a mythical animal that eats its mother when it is born; Manchurian tiger
6005	殳 79.0	6005	6505	\N	\N	4	殳	shū	name of old weapon; kill; rad. 79
6006	人 9.3	6006	3544	\N	\N	5	仡	gē	strong; valiant
6007	車 159.4	6007	\N	\N	\N	11	軟	ruǎn	soft, flexible, pliable; weak
6008	刀 18.6	6008	3930	\N	\N	8	刿	guì	to cut, injure, stab, stick on
6009	艸 140.9	6009	7301	\N	\N	12	葜	qiā	smilax china
6010	艸 140.13	6010	6055	\N	\N	16	薅	hāo	to weed; to eradicate
6011	水 85.9	6011	7430	\N	\N	12	湓	pén	an affluent of the River Yangtze near Kiukiang
6012	手 64.10	6012	5814	\N	\N	14	搴	qiān	extract; seize; pluck up
6013	小 42.2	6013	3560	\N	\N	5	尕	gǎ	small (used in place names)
6014	石 112.12	6014	6218	\N	\N	17	磴	dèng	steps on ledge, cliff, or hill
6015	金 167.8	6015	5485	\N	\N	13	锝	dé	technetium
6016	金 167.9	6016	7687	\N	\N	14	镅	méi	americium
6017	舟 137.11	6017	7957	\N	\N	17	艚	cáo	ship
6018	歹 78.5	6018	4176	\N	\N	9	殄	tiǎn	to end; to exterminate
6019	日 72.10	6019	5701	\N	\N	14	暝	míng	dark, obscure
6020	示 113.5	6020	4370	\N	\N	9	祢	mí	memorial tablet in a temple commemorating a deceased father, surname
6021	豆 151.4	6021	4784	\N	\N	11	豉	shì	fermented beans
6022	土 32.6	6022	6776	\N	\N	9	垴	nǎo	small, head shaped hill, used in place names
6023	糸 120.8	6023	\N	\N	\N	14	維	wéi	maintain, preserve, safeguard
6024	瓦 98.8	6024	5262	\N	\N	12	瓿	bù	jar, pot
6025	火 86.9	6025	5565	\N	\N	13	煺	tuì	to pluck poultry or depilate pigs using hot water
6026	虫 142.12	6026	6230	\N	\N	17	蟥	huáng	leech
6027	足 157.9	6027	6091	\N	\N	16	蹀	dié	to skip, to dance; to put the foot down
6028	門 169.0	6028	\N	\N	\N	8	門	mén	gate, door, entrance, opening
6029	黹 204.7	6029	6381	\N	\N	19	黼	fǔ	embroidered official or sacrificial robe
6030	气 84.3	6030	3725	\N	\N	7	氙	xiān	xenon
6031	金 167.6	6031	4865	\N	\N	11	铑	lǎo	rhodium
6032	禾 115.11	6032	\N	\N	\N	16	積	jī	accumulate, store up, amass
6033	糸 120.9	6033	\N	\N	\N	15	線	xiàn	thread, line, wire; clue
6034	艸 140.10	6034	5386	\N	\N	13	蒡	bàng	burdock, herb
6035	木 75.4	6035	3876	\N	\N	8	杪	miǎo	tip of twig, top of tree; twig
6036	肉 130.3	6036	\N	\N	\N	7	肜	róng	to sacrifice on two successive days
6037	肉 130.10	6037	5788	\N	\N	14	膂	lǚ	backbone, spinal column
6038	石 112.5	6038	6971	\N	\N	10	砬	lá	big stone
6039	石 112.7	6039	4790	\N	\N	11	硭	máng	a crude saltpetre
6040	酉 164.7	6040	5672	\N	\N	14	酽	yàn	thick, strong (beverage)
6041	足 157.8	6041	5913	\N	\N	15	踟	chí	hesitate, undecided; embarrassed
6042	魚 195.8	6042	6145	\N	\N	16	鲷	diāo	pagrosomus major, porgy
6043	艸 140.10	6043	5388	\N	\N	13	蒴	shuò	seed (capsule)
6044	艸 140.14	6044	6211	\N	\N	17	藁	gǎo	straw, hay; dry, withered
6045	犬 94.8	6045	4926	\N	\N	11	猡	luó	pig; Lolo aboringinal tribe
6046	方 70.9	6046	5550	\N	\N	13	旒	liú	fringes of pearls on crowns
6047	石 112.6	6047	4795	\N	\N	11	硇	náo	a kind of mineral
6048	金 167.7	6048	7380	\N	\N	12	锍	liǔ	\N
6049	革 177.10	6049	6369	\N	\N	19	鞲	gōu	leather arm guard
6050	口 30.7	6050	7089	\N	\N	10	哿	gě	excellent; to commend to be able to
6051	白 106.12	6051	6265	\N	\N	17	皤	pó	white, grey; corpulent
6052	口 30.6	6052	4228	\N	\N	9	哏	gén	funny, odd, interesting
6053	歹 78.7	6053	4804	\N	\N	11	殍	piǎo	to starve to death
6054	水 85.11	6054	5803	\N	\N	14	漯	luò	river in northern Shandong
6055	石 112.10	6055	\N	\N	\N	15	確	què	sure, certain; real, true
6056	糸 120.12	6056	\N	\N	\N	18	織	zhī	weave, knit; organize, unite
6057	辵 162.7	6057	\N	\N	\N	10	連	lián	join, connect; continuous; even
6058	言 149.8	6058	4676	\N	\N	10	谂	shěn	consult carefully with, counsel
6059	足 157.6	6059	5453	\N	\N	13	跶	tà	stumble, slip
6060	木 75.11	6060	7803	\N	\N	15	橥	zhū	wooden peg, post or stick
6061	金 167.13	6061	6344	\N	\N	18	镬	huò	cauldron, large iron pot
6062	鳥 196.5	6062	4600	\N	\N	10	鸲	qú	mynah; Erithacus species (various)
6063	女 38.6	6063	4385	\N	\N	9	姝	shū	a beautiful girl
6064	艸 140.6	6064	4127	\N	\N	9	茭	jiāo	an aquatic grass, the stalks of which are eaten as a vegetable
6065	穴 116.5	6065	\N	\N	\N	9	窆	biǎn	to put a coffin in a grave
6066	髟 190.0	6066	\N	\N	\N	10	髟	biāo	hair; KangXi radical 190
6067	田 102.4	6067	4209	\N	\N	9	畋	tián	till land, cultivate; hunt
6068	水 85.10	6068	5583	\N	\N	13	溏	táng	pool; not hardened, semi-soft
6069	魚 195.6	6069	5769	\N	\N	14	鲔	wěi	kind of sturgeon, tuna
6070	頁 181.14	6070	\N	\N	\N	23	顯	xiǎn	manifest, display; evident, clear
6071	口 30.9	6071	5132	\N	\N	12	喹	kuí	chemical compound
6072	糸 120.5	6072	\N	\N	\N	11	紹	shào	continue, carry on; hand down; to join
6073	口 30.4	6073	3710	\N	\N	7	吣	qìn	vomit
6074	羊 123.15	6074	6462	\N	\N	21	羼	chàn	confuse, mix, interpolate
6075	糸 120.11	6075	5844	\N	\N	14	缧	léi	a chain or rope used bind criminals
6076	穴 116.9	6076	7734	\N	\N	14	窬	yú	a small door or window; a hole in the wall to cut through a wall
6077	馬 187.9	6077	5319	\N	\N	12	骘	zhì	stallion; promote
6078	貝 154.7	6078	4805	\N	\N	11	赉	lài	give, present, confer; surname
6079	金 167.10	6079	5952	\N	\N	15	镓	jiā	gallium
6080	邑 163.5	6080	3685	\N	\N	7	邳	pī	a department in the State of Lu; in what is now Shantung or N. China
6081	玉 96.13	6081	6196	\N	\N	17	璩	qú	jade ring; earrings; surname
6082	鳥 196.6	6082	4797	\N	\N	11	鸸	ér	swallow
6083	水 85.7	6083	4650	\N	\N	10	涠	wéi	still water
6084	水 85.10	6084	5285	\N	\N	12	溲	sōu	urinate; soak, drench
6085	子 39.5	6085	4069	\N	\N	8	孥	nú	child, offspring
6086	攴 66.6	6086	7048	\N	\N	10	敉	mǐ	pacify, soothe, stabilize
6087	竹 118.6	6087	5207	\N	\N	12	筌	quán	bamboo fish trap
6088	言 149.4	6088	6549	\N	\N	6	䜣	xīn	(simplified form of訢) (same as欣) joy; delight; happy
6089	羊 123.7	6089	\N	\N	\N	13	義	yì	right conduct, righteousness
6090	行 144.9	6090	\N	\N	\N	15	衛	wèi	guard, protect, defend
6091	音 180.11	6091	\N	\N	\N	20	響	xiǎng	make sound, make noise; sound
6092	足 157.10	6092	\N	\N	\N	17	蹓	liū	stroll, take walk
6093	土 32.6	6093	4105	\N	\N	9	垓	gāi	border, boundary, frontier
6094	艸 140.5	6094	3861	\N	\N	8	苒	rǎn	lush; successively, in order
6095	艸 140.7	6095	4427	\N	\N	10	荸	bí	water chestnut
6096	瓦 98.13	6096	7976	\N	\N	17	甓	pì	glazed tiles, bricks
6097	金 167.8	6097	7533	\N	\N	13	锪	huō	a kind of tool
6098	金 167.9	6098	7686	\N	\N	14	镄	fèi	fermium
6099	肉 130.6	6099	5251	\N	\N	12	脔	luán	small lump of meat; sliced meat
6100	舟 137.12	6100	6352	\N	\N	18	艟	chōng	ancient warship
6101	辵 162.12	6101	\N	\N	\N	15	選	xuǎn	choose, select; elect; election
6102	辵 162.9	6102	\N	\N	\N	12	達	dá	arrive at, reach; intelligent
6103	目 109.5	6103	4493	\N	\N	10	眬	lóng	faint, fuzzy, blurred
6104	彐 58.9	6104	5331	\N	\N	12	彘	zhì	swine
6105	木 75.13	6105	6051	\N	\N	16	檠	qíng	stand for lamp; frame for bow
6106	肉 130.5	6106	6869	\N	\N	9	胩	kǎ	an organic compound
6107	方 70.6	6107	4627	\N	\N	10	旄	máo	a kind of ancient flag; old
6108	示 113.4	6108	4047	\N	\N	8	祆	xiān	Ormazda, god of the Zoroastrians; extended to god of the Manicheans
6109	人 9.4	6109	3603	\N	\N	6	伛	yǔ	humpback; stoop
6110	魚 195.7	6110	5972	\N	\N	15	鲥	shí	shat, Ilisha elongata
6111	艸 140.6	6111	4131	\N	\N	9	荦	luò	brindled ox; brindled in color
6112	日 72.12	6112	6090	\N	\N	16	暾	tūn	morning sun, sunrise
6113	肉 130.6	6113	\N	\N	\N	10	脈	mài	blood vessels, veins, arteries
6114	糸 120.4	6114	\N	\N	\N	10	納	nà	admit, take, receive, accept
6115	糸 120.9	6115	5334	\N	\N	12	缌	sī	coarse cotton cloth used for mourning
6116	風 182.9	6116	6607	\N	\N	7	飏	yáng	soar, fly, float; scatter
6117	金 167.8	6117	5486	\N	\N	13	锞	kè	ingot; acrobatic move
6118	足 157.3	6118	4504	\N	\N	10	趵	bào	noise of tramping feet
6119	足 157.5	6119	5135	\N	\N	12	跖	zhí	sole (of the foot)
6120	足 157.6	6120	5452	\N	\N	13	跬	kuǐ	to step; a stride equal to half a pace
6121	人 9.12	6121	7693	\N	\N	14	僬	jiāo	clever; alert in mind pigmies
6122	皮 107.6	6122	4997	\N	\N	11	皲	jūn	crack, chap
6123	羽 124.9	6123	5636	\N	\N	14	翥	zhù	to soar; to take off
6124	示 113.4	6124	4048	\N	\N	8	祎	yī	excellent
6125	貝 154.3	6125	\N	\N	\N	10	貢	gòng	offer tribute; tribute, gifts
6126	羽 124.5	6126	\N	\N	\N	11	習	xí	practice; flapping wings
6127	門 169.3	6127	\N	\N	\N	11	閉	bì	shut, close; obstruct, block up
6128	艸 140.4	6128	6574	\N	\N	7	芴	wù	(old) vaguely; fluorene C13H10
6129	艸 140.8	6129	4768	\N	\N	11	菰	gū	wild rice; Zizania latifolia
6130	目 109.5	6130	4497	\N	\N	10	眙	yí	to gaze at
6131	金 167.7	6131	7383	\N	\N	12	锓	qǐn	carve
6132	言 149.5	6132	5428	\N	\N	13	訾	zī	bad-mouth; criticize; defects
6133	艸 140.7	6133	4429	\N	\N	10	莳	shí	transplant; plant; dill, Anethum graveolens
6134	艸 140.8	6134	4764	\N	\N	11	菪	dàng	henbane
6135	木 75.10	6135	5669	\N	\N	14	槠	zhū	Oak
6136	木 75.10	6136	7652	\N	\N	14	榍	xiè	\N
6137	人 9.7	6137	6856	\N	\N	9	俜	pīng	to trust to; send a message
6138	角 148.5	6138	5244	\N	\N	12	觚	gū	jug, winecup, goblet; square
6139	手 64.11	6139	5635	\N	\N	14	撄	yīng	oppose, offend, run counter to
6140	山 46.10	6140	5174	\N	\N	12	嵫	zī	a hill in Shantung
6141	木 75.7	6141	4774	\N	\N	11	桴	fú	raft; drum stick; ridge pole
6142	日 72.7	6142	4812	\N	\N	11	晡	bū	late afternoon
6143	火 86.25	6143	6499	\N	\N	30	爨	cuàn	oven, cooking stove; cook
6144	心 61.7	6144	4740	\N	\N	11	悫	què	sincerity, honesty; modest
6145	金 167.7	6145	5184	\N	\N	12	锇	é	osmium
6146	金 167.8	6146	7528	\N	\N	13	锖	qiāng	the color of the a mineral
6147	金 167.8	6147	7530	\N	\N	13	锘	nuò	nobelium (No)
6148	虫 142.9	6148	5921	\N	\N	15	蝾	róng	lizard
6149	米 119.9	6149	5991	\N	\N	15	糌	zān	zanba, Tibetan barley bread
6150	木 75.5	6150	4147	\N	\N	9	柙	xiá	cage, pen for wild animals
6151	水 85.11	6151	5802	\N	\N	14	滹	hū	the bank of a steam
6152	目 109.8	6152	5431	\N	\N	13	睚	yá	corner of eye; stare
6153	辛 160.9	6153	\N	\N	\N	16	辦	bàn	manage, do, handle; deal with
6154	艸 140.7	6154	4444	\N	\N	10	莨	làng	herb, Scopolia japonica
6155	尸 44.2	6155	3558	\N	\N	5	尻	kāo	end of spine; buttocks, sacrum
6156	网 122.8	6156	5477	\N	\N	13	罨	yǎn	medical compress; fish net
6157	金 167.7	6157	5189	\N	\N	12	锔	jū	curium
6158	竹 118.7	6158	5503	\N	\N	13	筲	shāo	basket, bucket
6159	女 38.4	6159	3809	\N	\N	7	妣	bǐ	deceased mother
6160	石 112.4	6160	4166	\N	\N	9	砘	dùn	a kind of farm tool
6161	言 149.13	6161	6010	\N	\N	15	谳	yàn	to decide, judge; a verdict, decision
6162	金 167.5	6162	4533	\N	\N	10	钽	tǎn	tantalum
6163	金 167.4	6163	\N	\N	\N	12	鈤	rì	archaic translation of element germanium Ge 锗
6164	肉 130.8	6164	\N	\N	\N	12	脹	zhàng	swell, inflate, expand
6165	辵 162.12	6165	\N	\N	\N	15	遺	yí	lose; articles lost; omit
6166	邑 163.14	6166	7837	\N	\N	16	鄹	zōu	name of a state; surname
6167	艸 140.8	6167	4769	\N	\N	11	菡	hàn	buds, lotus buds
6168	山 46.8	6168	4857	\N	\N	11	崦	yān	a mountain in Kansu, where there is a cave into which the sun is said to sink at night
6169	犬 94.7	6169	4605	\N	\N	10	狺	yín	the snarling of dogs
6170	木 75.3	6170	3678	\N	\N	7	杌	wù	the stump f a tree, hence, sterility; a square stool
6171	禾 115.5	6171	4252	\N	\N	9	秭	zǐ	one thousand millions, sometimes used for one hundred millions
6172	舟 137.4	6172	7025	\N	\N	10	舯	zhōng	\N
6173	豆 151.3	6173	4468	\N	\N	10	豇	jiāng	a small kidney bean
6174	魚 195.8	6174	6144	\N	\N	16	鲵	ní	Cryptobranchus japonicus; a salamander
6175	艸 140.17	6175	6372	\N	\N	19	蘧	qú	a plant which resembles wheat but has no edible grain
6176	門 169.11	6176	5789	\N	\N	14	阚	hǎn	glance, peep; roar, growl
6177	心 61.7	6177	4661	\N	\N	10	悝	kuī	to laugh at to pity; afflicted, sad
6178	金 167.5	6178	4544	\N	\N	10	铌	ní	niobium
6179	頁 181.4	6179	\N	\N	\N	13	預	yù	prepare, arrange; in advance
6180	糸 120.9	6180	5335	\N	\N	12	缑	gōu	cord binding on hilt of sword
6181	玉 96.9	6181	5343	\N	\N	13	瑗	yuàn	large ring of fine jade
6182	木 75.9	6182	7492	\N	\N	13	椹	shèn	a chopping board
6183	日 72.3	6183	3697	\N	\N	7	旰	gàn	sunset, dusk; evening
6184	鬼 194.5	6184	5762	\N	\N	14	魆	xū	black
6185	艸 140.10	6185	5369	\N	\N	13	蓍	shī	milfoil, plant used in divination
6186	艸 140.13	6186	7844	\N	\N	16	蕹	wèng	Ipomoea aquatica used as a vegetable
6187	山 46.4	6187	6596	\N	\N	7	岜	bā	rock mountain
6188	金 167.3	6188	6689	\N	\N	8	钐	shān	samarium
6189	金 167.8	6189	7536	\N	\N	13	锬	tán	long spear
6190	金 167.12	6190	6251	\N	\N	17	镪	qiāng	coins, money, wealth
6191	糸 120.7	6191	4701	\N	\N	10	绡	xiāo	raw silk fabric
6192	木 75.13	6192	6060	\N	\N	16	檎	qín	small red apple
6193	禾 115.10	6193	\N	\N	\N	15	穀	gǔ	corn, grain, cereal; lucky
6194	艸 140.5	6194	3871	\N	\N	8	茕	qióng	alone; without friends or relativ
6195	言 149.6	6195	\N	\N	\N	13	話	huà	speech, talk, language; dialect
6196	糸 120.11	6196	\N	\N	\N	17	縮	suō	contract, draw in, reduce
6197	頁 181.12	6197	\N	\N	\N	21	顧	gù	look back; look at; look after
6198	艸 140.6	6198	\N	\N	\N	9	荈	chuǎn	Thea sinensis
6199	人 9.6	6199	3954	\N	\N	8	侉	kuǎ	to speak with an accent; big and clumsy
6200	水 85.9	6200	5278	\N	\N	12	渫	xiè	beating of ocean; surging of water
6201	車 159.6	6201	4486	\N	\N	10	辂	lù	a chariot, carriage; a carriage pull-bar
6202	欠 76.7	6202	\N	\N	\N	11	欷	xī	sob; sigh
6203	車 159.6	6203	4485	\N	\N	10	轾	zhì	low rear portion of cart
6204	麥 199.8	6204	\N	\N	\N	19	麴	qū	yeast, leaven; surname
6205	戈 62.9	6205	5127	\N	\N	12	戢	jí	to put away; to cease; store up
6206	足 157.6	6206	7162	\N	\N	11	趼	jiǎn	callous skin on hands or feet. blisters
6207	言 149.7	6207	\N	\N	\N	14	誤	wù	err, make mistake; interfere
6208	羊 123.1	6208	6588	\N	\N	7	芈	mǐ	bleat of sheep; surname
6209	艸 140.4	6209	3663	\N	\N	7	苈	lì	a kind of plant
6210	糸 120.8	6210	\N	\N	\N	11	缍	duǒ	\N
6211	欠 76.9	6211	5496	\N	\N	13	歃	shà	to drink
6212	火 86.13	6212	6171	\N	\N	16	燠	yù	warm; warmth
6213	耒 127.5	6213	4710	\N	\N	11	耜	sì	spade-shaped tool; plow
6214	干 51.6	6214	4090	\N	\N	9	顸	hān	large face, flat face; stupid
6215	虫 142.5	6215	\N	\N	\N	11	蚵	hé	oyster
6216	口 30.6	6216	4203	\N	\N	9	哓	xiāo	garrulous; disturbed; restless
6217	水 85.12	6217	5998	\N	\N	15	澌	sī	to exhaust; to drain dry
6218	邑 163.7	6218	4250	\N	\N	9	郜	gào	name of fief in Shantong bestowed on the eldest son of Wen Wang
6219	彳 60.13	6219	6134	\N	\N	16	徼	jiǎo	frontier, border; inspect, patrol
6220	竹 118.13	6220	6398	\N	\N	19	籀	zhòu	recite, read; style of calligraphy
6221	阜 170.8	6221	4681	\N	\N	10	陬	zōu	corner, cranny, nook, niche
6222	艸 140.12	6222	5876	\N	\N	15	蕤	ruí	drooping leaves; fringe soft, delicate
6223	口 30.2	6223	3540	\N	\N	5	叻	lè	used in place names; (Cant.) smart, clever
6224	犬 94.8	6224	4927	\N	\N	11	猞	shē	a wild cat; 猞猁, a lynx
6225	水 85.6	6225	4336	\N	\N	9	洇	yīn	to soak, to blotch, to splotch
6226	金 167.7	6226	7381	\N	\N	12	锎	kāi	caesium
6227	舟 137.5	6227	7203	\N	\N	11	舳	zhú	stern of ship
6228	糸 120.9	6228	\N	\N	\N	12	缋	huì	draw, sketch, paint
6229	金 167.11	6229	6113	\N	\N	16	镗	tāng	boring tool
6230	衣 145.9	6230	5820	\N	\N	14	褙	bèi	paper or cloth pasted together
6231	老 125.6	6231	5070	\N	\N	12	耋	dié	in one's eighties, aged
6232	耳 128.10	6232	\N	\N	\N	16	聬	wěng	\N
6233	魚 195.13	6233	8083	\N	\N	21	鳡	gǎn	\N
6234	魚 195.5	6234	7559	\N	\N	13	鲌	bà	\N
6235	魚 195.11	6235	\N	\N	\N	22	鰽	qiú	herring
6236	竹 118.6	6236	\N	\N	\N	12	筆	bǐ	writing brush; write; stroke
6237	竹 118.12	6237	\N	\N	\N	18	簡	jiǎn	simple, terse, succinct; letter
6238	言 149.2	6238	\N	\N	\N	9	計	jì	plan, plot; strategem; scheme
6239	言 149.7	6239	\N	\N	\N	14	語	yǔ	language, words; saying, expression
6240	言 149.9	6240	\N	\N	\N	16	謂	wèi	say, tell; call, name; be called
6241	衣 145.6	6241	\N	\N	\N	11	袴	kù	pants; trousers; panties
6242	工 48.9	6242	5323	\N	\N	12	巯	qiú	an atom group
6243	口 30.3	6243	6532	\N	\N	6	吖	yā	used in translation; (Cant.) final particle
6244	犬 94.7	6244	4602	\N	\N	10	猁	lì	a kind of monkey
6245	木 75.7	6245	4775	\N	\N	11	桷	jué	rafter; malus toringo
6246	石 112.5	6246	4479	\N	\N	10	砼	tóng	concrete
6247	金 167.9	6247	7683	\N	\N	14	锾	huán	measure; money, coins
6248	頁 181.10	6248	6048	\N	\N	16	颟	mān	dawdling; thoughtless, careless
6249	足 157.7	6249	7673	\N	\N	14	跽	jì	to kneel for a long time, to go down on hands and knees
6250	心 61.7	6250	4664	\N	\N	10	悛	quān	repent, reform
6251	木 75.6	6251	4457	\N	\N	10	桕	jiù	tallow tree
6252	舟 137.14	6252	6402	\N	\N	19	艨	méng	long and narrow war-boat
6253	頁 181.10	6253	6191	\N	\N	16	颡	sǎng	the forehead; to kowtow
6254	髟 190.6	6254	6038	\N	\N	16	髹	xiū	red lacquer; to lacquer
6255	木 75.7	6255	4778	\N	\N	11	桫	suō	horse chestnut
6256	髟 190.8	6256	\N	\N	\N	18	鬆	sōng	lax, loose; loosen, relax
6257	糸 120.9	6257	\N	\N	\N	15	練	liàn	practice, drill, exercise, train
6258	糸 120.11	6258	\N	\N	\N	17	總	zǒng	collect; overall, altogether
6259	肉 130.13	6259	\N	\N	\N	17	膽	dǎn	gall bladder; bravery, courage
6260	貝 154.0	6260	\N	\N	\N	7	貝	bèi	sea shell; money, currency
6261	艸 140.9	6261	5085	\N	\N	12	葸	xǐ	afraid, bashful
6262	尸 44.11	6262	5828	\N	\N	14	屣	xǐ	straw sandals or slippers that have no heel-backs
6263	犬 94.11	6263	5624	\N	\N	14	獒	áo	mastiff, large fierce dog
6264	疒 104.9	6264	5781	\N	\N	14	瘌	là	severe; poisonous; dangerous; itch and other skin diseases
6265	人 9.6	6265	6693	\N	\N	8	佴	èr	a second, an assistant
6266	金 167.8	6266	7535	\N	\N	13	锫	péi	berkelium
6267	阜 170.14	6267	6189	\N	\N	16	隰	xí	low, damp land, marsh, swamp
6268	酉 164.8	6268	5890	\N	\N	15	醌	kūn	quinone (chemistry)
6269	艸 140.9	6269	\N	\N	\N	12	萬	wàn	ten thousand; innumerable
6270	矢 111.12	6270	\N	\N	\N	17	矯	jiǎo	correct, rectify, straighten out
6271	魚 195.9	6271	\N	\N	\N	20	鰕	xiā	shrimp, prawn
6272	山 46.5	6272	6682	\N	\N	8	岽	dōng	place name in Guangxi province
6273	日 72.4	6273	3900	\N	\N	8	昃	zè	afternoon; the sun in the afternoon sky; to decline
6274	虫 142.10	6274	\N	\N	\N	16	螓	qín	a small cicada with a square head
6275	土 32.6	6275	4104	\N	\N	9	垧	shǎng	variable unit of land measure
6276	广 53.13	6276	6152	\N	\N	16	廨	xiè	government office, public office
6277	骨 188.6	6277	5943	\N	\N	15	骺	hóu	tip of a long bone
6278	黑 203.8	6278	6433	\N	\N	20	黥	qíng	to tattoo; to brand the face of criminals
6279	豕 152.10	6279	6222	\N	\N	17	豳	bīn	a Zhou-dynasty state
6280	言 149.13	6280	\N	\N	\N	20	議	yì	consult, talk over, discuss
6281	糸 120.6	6281	\N	\N	\N	12	絡	luò	enmesh, wrap around; web, net
6282	言 149.14	6282	\N	\N	\N	20	護	hù	protect, guard, defend, shelter
6283	釆 165.13	6283	\N	\N	\N	20	釋	shì	interprete, elucidate; release
6284	阜 170.13	6284	\N	\N	\N	14	隨	suí	follow, listen to, submit; to accompany; subsequently, then
6285	艸 140.6	6285	4110	\N	\N	9	荑	tí	sprouts; tares
6286	艸 140.7	6286	6953	\N	\N	10	莶	xiān	vine
6287	艸 140.10	6287	5378	\N	\N	13	蓊	wěng	luxuriant vegetation; lush
6288	手 64.9	6288	\N	\N	\N	12	揎	xuān	to pull up the sleeves and stretch out the arms; to strike with bare fists
6289	女 38.6	6289	4304	\N	\N	9	娈	luán	lovely, beautiful; docile, obedie
6290	女 38.11	6290	7744	\N	\N	14	嫜	zhāng	husband's father
6291	毛 82.9	6291	5195	\N	\N	12	毽	jiàn	a shuttlecock
6292	石 112.4	6292	6810	\N	\N	9	砑	yà	to grind, to calender, to polish; to roll with a stone roller
6293	石 112.9	6293	7659	\N	\N	14	碶	qì	a flood-gate, a water-gate
6294	刀 18.6	6294	3933	\N	\N	8	剀	kǎi	sharpen; carefully, thorough
6295	艸 140.14	6295	6208	\N	\N	17	薷	rú	Elshotria paltrini
6296	心 61.5	6296	3783	\N	\N	7	怃	wǔ	regretful, disappointed
6297	心 61.5	6297	4034	\N	\N	8	怿	yì	enjoy, be glad, be pleased
6298	馬 187.8	6298	5028	\N	\N	11	骐	qí	piebald horse; excellent horse
6299	肉 130.9	6299	5521	\N	\N	13	腧	shù	insertion point in acupuncture; acupoint
6300	雨 173.7	6300	5897	\N	\N	15	霈	pèi	torrential rains, flow of water
6301	虫 142.9	6301	5922	\N	\N	15	蝻	nǎn	immature locusts
6302	鳥 196.8	6302	\N	\N	\N	19	鵰	diāo	eagle, vulture; Aquila species (various)
6303	言 149.15	6303	\N	\N	\N	22	讀	dú	read, study; pronounce
6304	土 32.13	6304	6065	\N	\N	16	墼	jī	\N
6305	土 32.5	6305	3836	\N	\N	8	坩	gān	earthenware, earthenware vessel
6306	瓦 98.12	6306	6041	\N	\N	16	甏	bèng	a squat jar for holding wine, sauces etc.
6307	鳥 196.7	6307	5265	\N	\N	12	鹇	xián	silver pheasant, Lophura nycthemera; Lophura species (various)
6308	鳥 196.10	6308	7811	\N	\N	15	鹣	jiān	fabulous mythical bird
6309	舟 137.5	6309	4917	\N	\N	11	舴	zé	small boat
6310	魚 195.8	6310	7885	\N	\N	16	鲭	qīng	mackerel
6311	人 9.11	6311	7547	\N	\N	13	傺	chì	to hinder; to detain
6312	木 75.4	6312	6665	\N	\N	8	枘	ruì	the handle of tools
6313	禾 115.4	6313	4251	\N	\N	9	秕	bǐ	empty grain or rice husk, chaff
6314	米 119.11	6314	6360	\N	\N	18	糨	jiàng	starch; paste. to starch
6315	心 61.2	6315	6518	\N	\N	5	忉	dāo	grieved; distressed in mind
6316	石 112.12	6316	6072	\N	\N	16	磲	qú	\N
6317	頁 181.9	6317	\N	\N	\N	18	顒	yóng	solemn, large, grand, majestic
6318	虫 142.12	6318	\N	\N	\N	18	蟲	chóng	worms; insects
6319	言 149.3	6319	\N	\N	\N	10	訓	xùn	teach, instruct; exegesis
6320	人 9.6	6320	3953	\N	\N	8	侑	yòu	help, assist, repay kindness
6321	艸 140.8	6321	4747	\N	\N	11	萁	qí	kind of grasses
6322	艸 140.9	6322	5083	\N	\N	12	葳	wēi	luxuriant, flourishing; used for various plants
6323	口 30.4	6323	6591	\N	\N	7	呙	guō	chat, jaw, gossip, talk; mouth
6324	鳥 196.9	6324	5374	\N	\N	13	鹋	miáo	emu
6325	豸 153.11	6325	6269	\N	\N	17	貘	mò	the panther; the tapir
6326	艸 140.9	6326	5089	\N	\N	12	葶	tíng	Draba nemerosa bebe carpa
6327	木 75.4	6327	3880	\N	\N	8	枨	chéng	door stop, door jam; touch; (Cant.) to use the body to move someone
6328	木 75.8	6328	5097	\N	\N	12	棹	zhào	oar; boat
6329	糸 120.19	6329	6493	\N	\N	25	纛	dào	a banner, a streamer
6330	竹 118.17	6330	\N	\N	\N	23	籤	qiān	tally; lot; marker
6331	見 147.4	6331	\N	\N	\N	11	規	guī	rules, regulations, customs, law
6332	貝 154.6	6332	\N	\N	\N	13	資	zī	property; wealth; capital
6333	山 46.14	6333	6240	\N	\N	17	嶷	yí	a range of mountains in Hunan province
6334	女 38.3	6334	3642	\N	\N	6	妁	shuò	act as go-between
6335	木 75.3	6335	6582	\N	\N	7	杩	mà	headboard
6336	鳥 196.9	6336	5829	\N	\N	14	鹛	méi	babbler (bird)
6337	羊 123.5	6337	7228	\N	\N	11	羝	dī	ram, he-goat
6338	馬 187.8	6338	5039	\N	\N	11	骖	cān	two outside ones in three horse
6339	示 113.6	6339	7080	\N	\N	10	祧	tiāo	an ancestral hall
6340	糸 120.6	6340	\N	\N	\N	12	給	gěi	give; by, for
6341	水 85.8	6341	4972	\N	\N	11	淠	pì	luxuriant (of water plants)
6342	田 102.4	6342	4205	\N	\N	9	畎	quǎn	a drain between fields, irrigation; to flow
6343	竹 118.8	6343	7690	\N	\N	14	箨	tuò	bamboo sheath, bamboo shoots
6344	魚 195.10	6344	6355	\N	\N	18	鳐	yáo	the nautilus; the ray
6345	言 149.12	6345	\N	\N	\N	19	識	shí	recognize, understand, know
6346	辵 162.10	6346	\N	\N	\N	13	遠	yuǎn	distant, remote, far; profound
6347	谷 150.10	6347	7959	\N	\N	17	谿	xī	valley, gorge; mountain stream
6348	刀 18.8	6348	4641	\N	\N	10	剡	shàn	sharp, sharp-pointed; sharpen
6349	口 30.4	6349	3711	\N	\N	7	吲	yǐn	smile at; sneer at
6350	女 38.11	6350	5605	\N	\N	13	嫫	mó	ugly woman
6351	戶 63.4	6351	4044	\N	\N	8	戽	hù	to bale out water
6352	米 119.10	6352	6167	\N	\N	16	糗	qiǔ	parched wheat or rice; broken grain
6353	鳥 196.5	6353	4503	\N	\N	10	鸮	xiāo	owl
6354	艸 140.12	6354	7757	\N	\N	15	蕰	wēn	hippuris or mare's tail
6355	土 32.5	6355	3846	\N	\N	8	坼	chè	split, tear, open
6356	玉 96.14	6356	6439	\N	\N	20	璺	wèn	a crack, as in porcelain
6357	木 75.5	6357	4143	\N	\N	9	栊	lóng	cage, pen; set of bars
6358	金 167.11	6358	6117	\N	\N	16	镝	dī	dysprosium
6359	疒 104.2	6359	3758	\N	\N	7	疔	dīng	carbuncle, boil, ulcer
6360	疒 104.11	6360	6154	\N	\N	16	瘰	luǒ	scrofula, swellings
6361	言 149.12	6361	5818	\N	\N	14	谮	zèn	to slander
6362	車 159.8	6362	5118	\N	\N	12	辋	wǎng	exterior rim of wheel, felly
6363	石 112.9	6363	7665	\N	\N	14	碥	biǎn	\N
6364	谷 150.11	6364	\N	\N	\N	18	豂	liáo	\N
6365	穴 116.13	6365	\N	\N	\N	18	竅	qiào	hole, opening, aperture
6366	言 149.17	6366	\N	\N	\N	24	讓	ràng	allow, permit, yield, concede
6367	黑 203.0	6367	\N	\N	\N	11	黒	hēi	black; dark; evil
6368	刀 18.12	6368	7666	\N	\N	14	劂	jué	chisel for engraving; engrave
6369	水 85.11	6369	5805	\N	\N	14	潋	liàn	waves, ripples; overflow
6370	子 39.0	6370	3506	\N	\N	3	孓	jué	beautiful
6371	虫 142.10	6371	5925	\N	\N	15	螋	sōu	spider millipede
6372	魚 195.8	6372	6142	\N	\N	16	鲳	chāng	the silvery pomfret, Stromateoides argenteus
6373	金 167.6	6373	4868	\N	\N	11	铙	náo	cymbals; hand bell; disturb
6374	土 32.9	6374	5068	\N	\N	12	塄	léng	elevated bank in field
6375	艸 140.8	6375	7127	\N	\N	11	萆	bì	the castor-oil plant also used for other plants
6376	石 112.9	6376	5679	\N	\N	14	碲	dì	tellurium
6377	米 119.4	6377	\N	\N	\N	10	粋	cuì	pure; unadulterated; select
6378	糸 120.4	6378	6641	\N	\N	7	纻	zhù	ramie; sack cloth
6379	水 85.5	6379	4010	\N	\N	8	沭	shù	river in Shantung
6380	示 113.5	6380	6904	\N	\N	9	祏	shí	shrine
6381	雨 173.5	6381	\N	\N	\N	13	電	diàn	electricity, electric; lightning
6382	魚 195.15	6382	\N	\N	\N	26	鱲	liè	(Cant.)赤鱲角, Hong Kong place name
6383	頁 181.7	6383	\N	\N	\N	16	頻	pín	frequently, again and again
6384	言 149.4	6384	\N	\N	\N	11	設	shè	build; establish; display; particle of hypothesis, supposing
6385	言 149.6	6385	\N	\N	\N	13	試	shì	test, try, experiment
6386	頁 181.3	6386	\N	\N	\N	12	項	xiàng	neck, nape of neck; sum; funds
6387	邑 163.12	6387	\N	\N	\N	14	鄩	xún	county in Shandong province
6388	魚 195.12	6388	\N	\N	\N	23	鱖	guì	mandarin fish
6389	魚 195.13	6389	\N	\N	\N	24	鱧	lǐ	snakehead
6390	心 61.5	6390	4030	\N	\N	8	怍	zuò	to be ashamed
6391	米 119.9	6391	5992	\N	\N	15	糍	cí	food made of crushed and cooked rice
6392	鳥 196.6	6392	4913	\N	\N	11	鸻	héng	plover
6393	人 9.4	6393	3606	\N	\N	6	仵	wǔ	similar
6394	木 75.5	6394	4139	\N	\N	9	柰	nài	crab-apple tree; endure, bear
6395	木 75.8	6395	5095	\N	\N	12	棼	fén	beams in the roof of a house confused, disordered
6396	毛 82.12	6396	6120	\N	\N	16	氇	lu	thick rough serge from Tibet
6397	毛 82.12	6397	6121	\N	\N	16	氆	pǔ	thick, rough serge from Tibet
6398	火 86.5	6398	4328	\N	\N	9	烀	hū	simmer
6399	金 167.10	6399	5953	\N	\N	15	镔	bīn	high quality iron
6400	玉 96.5	6400	4091	\N	\N	9	珉	mín	stone resembling jade
6401	革 177.9	6401	6207	\N	\N	17	鞬	jiān	a quiver on a horse; a store
6402	竹 118.9	6402	\N	\N	\N	15	範	fàn	pattern, model, rule, law
6403	肉 130.11	6403	\N	\N	\N	15	膠	jiāo	glue, gum, resin, rubber
6404	目 109.6	6404	\N	\N	\N	11	眾	zhòng	masses, people, multitude, crowd
6405	鳥 196.8	6405	\N	\N	\N	19	鶇	dōng	thrush; Turdus species (various)
6406	囗 31.3	6406	\N	\N	\N	6	囝	jiǎn	baby, infant
6407	犬 94.3	6407	6543	\N	\N	6	犴	àn	a wild dog, a not very large lock-up
6408	金 167.11	6408	6119	\N	\N	16	镠	liú	pure gold
6409	見 147.5	6409	4185	\N	\N	9	觇	chān	peek; spy on, watch; investigate
6410	金 167.1	6410	6536	\N	\N	6	钆	gá	gadolinium
6411	虫 142.5	6411	7167	\N	\N	11	蚺	rán	a boa constrictor
6412	虫 142.9	6412	5926	\N	\N	15	蝓	yú	snail
6413	走 156.6	6413	5353	\N	\N	13	趑	zī	to falter; unable to move
6414	豸 153.10	6414	6271	\N	\N	17	貔	pí	fox, leopard, panther
6415	足 157.17	6415	6488	\N	\N	24	躞	xiè	to walk
6416	人 9.4	6416	\N	\N	\N	6	氽	tǔn	to float; to deep fry; (Cant.) to turn inside-out
6417	糸 120.5	6417	4076	\N	\N	8	绂	fú	ribbon or cord used attach ornaments
6418	木 75.6	6418	4447	\N	\N	10	栲	kǎo	mangrove
6419	鳥 196.8	6419	7548	\N	\N	13	鹎	bēi	bird
6420	衣 145.19	6420	6492	\N	\N	24	襻	pàn	a loop; a belt or band
6421	艸 140.10	6421	\N	\N	\N	12	蓚	tiáo	oxalic (used in compounds)
6422	貝 154.4	6422	\N	\N	\N	11	貪	tān	greedy, covet; covetous
6423	示 113.5	6423	4366	\N	\N	9	祓	fú	exorcise, remove evil; clean
6424	糸 120.14	6424	\N	\N	\N	20	繼	jì	continue, maintain, carry on
6425	肉 130.7	6425	\N	\N	\N	11	脫	tuō	take off, peel off, strip
6426	邑 163.9	6426	5011	\N	\N	11	郿	méi	county in Shaanxi province
6427	馬 187.10	6427	5614	\N	\N	13	骝	liú	famous horse
6428	木 75.14	6428	7992	\N	\N	18	檫	chá	sassafras tzumu
6429	石 112.5	6429	4478	\N	\N	10	砟	zhǎ	stone tablet; monument
6430	虫 142.9	6430	5923	\N	\N	15	蝰	kuí	vipera russelii siamensis
6431	犬 94.9	6431	5245	\N	\N	12	猱	náo	a monkey with yellow hair
6432	糸 120.16	6432	6419	\N	\N	19	缵	zuǎn	continue, carry on, succeed
6433	水 85.4	6433	3768	\N	\N	7	沔	miǎn	flood; overflowing
6434	彐 58.6	6434	6923	\N	\N	9	彖	tuàn	a hog; a hedgehog; a porcupine
6435	黹 204.5	6435	6224	\N	\N	17	黻	fú	special pattern of embroidery
6436	目 109.5	6436	7038	\N	\N	10	眢	yuān	eyes without brightness
6437	車 159.0	6437	\N	\N	\N	7	車	chē	cart, vehicle; carry in cart
6438	阜 170.8	6438	\N	\N	\N	10	陳	chén	exhibit, display; plead; surname
6439	隹 172.10	6439	\N	\N	\N	18	雜	zá	mixed, blended; mix, mingle
6440	馬 187.13	6440	\N	\N	\N	22	驚	jīng	frighten, surprise, startle
6441	龍 212.0	6441	\N	\N	\N	16	龍	lóng	dragon; symbolic of emperor
6442	魚 195.6	6442	\N	\N	\N	17	鮠	wéi	a kind of shad with a head like a sturgeon
6443	艸 140.6	6443	6795	\N	\N	9	茛	gèn	ranunculus
6444	艸 140.12	6444	5874	\N	\N	15	蕈	xùn	mushrooms, fungus; mildew, mold
6445	馬 187.5	6445	4082	\N	\N	8	骀	dài	an old, tired horse, a jade; tired, exhausted
6446	木 75.11	6446	6063	\N	\N	16	樨	xī	scrambled eggs
6447	日 72.5	6447	4298	\N	\N	9	昝	zǎn	a dual pronoun, I, you and me, we two
6448	食 184.6	6448	\N	\N	\N	14	餂	tiǎn	to obtain by hook
6449	金 167.10	6449	7788	\N	\N	15	镎	ná	neptunium (Np)
6450	酉 164.5	6450	5110	\N	\N	12	酡	tuó	flushed; rubicund
6451	魚 195.12	6451	6442	\N	\N	20	鳜	guì	mandarin fish
6452	見 147.7	6452	4773	\N	\N	11	觋	xí	wizard
6453	石 112.12	6453	6217	\N	\N	17	礅	dūn	stone block
6454	土 32.5	6454	3841	\N	\N	8	垆	lú	black clods of earth; shop, hut
6455	土 32.5	6455	3847	\N	\N	8	坻	chí	an islet, a rock in a river; an embankment; to stop
6456	艸 140.6	6456	4121	\N	\N	9	荇	xìng	a water plant, Nymphoides peltalum
6457	戶 63.5	6457	4359	\N	\N	9	扃	jiōng	a door bar placed outside a door
6458	石 112.12	6458	7931	\N	\N	17	磻	pán	a tributary of the Wei river in Shanxi
6459	邑 163.7	6459	4273	\N	\N	9	郗	xī	city under the Chou Dyn. a surname
6460	門 169.9	6460	4945	\N	\N	11	阇	dū	a Buddhist high priest
6461	肉 130.8	6461	5227	\N	\N	12	腈	jīng	an organic compound
6462	金 167.5	6462	4540	\N	\N	10	铈	shì	cerium
6463	臣 131.2	6463	\N	\N	\N	8	臥	wò	lie down; crouch
6464	頁 181.16	6464	\N	\N	\N	25	顱	lú	skull
6465	糸 120.4	6465	\N	\N	\N	9	級	jí	level, rank, class; grade
6466	阜 170.9	6466	\N	\N	\N	11	階	jiē	stairs, steps; rank, degree
6467	頁 181.11	6467	\N	\N	\N	20	顟	láo	\N
6468	行 144.6	6468	\N	\N	\N	12	衖	xiàng	lane; alley
6469	玉 96.6	6469	4402	\N	\N	10	珙	gǒng	precious stone; county in Sichuan
6470	衣 145.13	6470	6417	\N	\N	19	襞	bì	fold, pleat, crease
6471	刀 18.12	6471	5759	\N	\N	14	劁	qiāo	to neuter livestock
6472	阜 170.9	6472	5012	\N	\N	11	隈	wēi	cove, bay, inlet
6473	肉 130.5	6473	5022	\N	\N	11	胬	nǔ	used in 胬肉
6474	糸 120.4	6474	6638	\N	\N	7	纮	hóng	string; vast, expansive
6475	羽 124.6	6475	7366	\N	\N	12	翙	huì	noise of bird's wings
6476	艸 140.5	6476	3872	\N	\N	8	茀	fú	overgrown with grass, weedy
6477	艸 140.6	6477	4112	\N	\N	9	荜	bì	species of bean; piper longtum
6478	水 85.10	6478	5567	\N	\N	13	溱	qín	river in Henan
6479	酉 164.5	6479	5108	\N	\N	12	酤	gū	to deal in spirits
6480	肉 130.9	6480	\N	\N	\N	13	腳	jiǎo	foot; base, leg, foundation
6481	言 149.3	6481	\N	\N	\N	10	記	jì	record; keep in mind, remember
6482	言 149.4	6482	\N	\N	\N	11	許	xǔ	allow, permit; promise; betroth
6483	金 167.8	6483	\N	\N	\N	16	錯	cuò	error, blunder, mistake, wrong
6484	魚 195.11	6484	\N	\N	\N	22	鱇	kāng	anglerfish
6485	土 32.3	6485	3577	\N	\N	6	圯	yí	bridge, bank
6486	木 75.5	6486	4160	\N	\N	9	柽	chēng	type of willow; tamarisk
6487	目 109.9	6487	5839	\N	\N	14	瞀	mào	to look at closely; nearsighted; dim; indistinct vision
6488	金 167.6	6488	7181	\N	\N	11	铖	chéng	person's name
6489	米 119.6	6489	5269	\N	\N	12	粞	xī	to mash rice
6490	手 64.12	6490	5866	\N	\N	15	撙	zǔn	economize; abide by, comply with
6491	金 167.5	6491	4542	\N	\N	10	铊	tā	thallium
6492	土 32.3	6492	3574	\N	\N	6	圹	kuàng	tomb, grave: prairie; open wilderness
6493	艸 140.8	6493	7120	\N	\N	11	菝	bá	smilax china
6494	辵 162.6	6494	\N	\N	\N	9	迴	huí	revolve, rotate; curving, zigzag
6495	山 46.4	6495	6600	\N	\N	7	岙	ào	island
6496	水 85.11	6496	5804	\N	\N	14	漶	huàn	indecipherable
6497	糸 120.9	6497	\N	\N	\N	12	缏	biàn	hem; plait, braid, queue
6498	豸 153.6	6498	5513	\N	\N	13	貊	mò	leopard; ancient tribe in northeastern China
6499	米 119.6	6499	\N	\N	\N	12	粫	ér	\N
6500	彳 60.5	6500	3970	\N	\N	8	徂	cú	go, advance; to; die
6501	水 85.6	6501	4340	\N	\N	9	洎	jì	until; till; soup; to soak
6502	石 112.13	6502	7995	\N	\N	18	礌	léi	used in 礌石
6503	肉 130.13	6503	\N	\N	\N	17	膿	nóng	pus
6504	艸 140.9	6504	\N	\N	\N	12	葉	yè	leaf, petal; page of book; period
6505	阜 170.13	6505	\N	\N	\N	15	險	xiǎn	narrow pass, strategic point, dangerous
6506	隹 172.10	6506	\N	\N	\N	18	雙	shuāng	set of two, pair, couple; both
6507	食 184.7	6507	\N	\N	\N	15	餘	yú	surplus, excess, remainder
6508	邑 163.4	6508	6542	\N	\N	6	邠	bīn	county in Shaanxi province
6509	邑 163.6	6509	6649	\N	\N	8	邽	guī	name of a county in Han dynasty
6510	水 85.10	6510	5573	\N	\N	13	溽	rù	moist, humid, muggy
6511	木 75.8	6511	5099	\N	\N	12	棰	chuí	to flog; whip
6512	舟 137.4	6512	7024	\N	\N	10	舭	bǐ	bilge
6513	舟 137.8	6513	5764	\N	\N	14	艋	měng	small boat
6514	青 174.8	6514	\N	\N	\N	16	靜	jìng	quiet, still, motionless; gentle
6515	耳 128.11	6515	6034	\N	\N	16	聱	áo	bent and twisted; too complicated
6516	尢 43.0	6516	6502	\N	\N	3	尢	yóu	weak; KangXi radical 43
6517	艸 140.15	6517	\N	\N	\N	18	藚	xù	water plant
6518	人 9.6	6518	3962	\N	\N	8	佾	yì	a row or file of dancers
6519	艸 140.13	6519	6046	\N	\N	16	蕻	hóng	budding; flourishing
6520	犬 94.4	6520	3747	\N	\N	7	狁	yǔn	a tribe of Scythian nomads
6521	糸 120.5	6521	4075	\N	\N	8	绁	xiè	to contract, draw in, reduce, shorten
6522	牛 93.7	6522	4889	\N	\N	11	牾	wǔ	to oppose; to gore
6523	心 61.11	6523	5626	\N	\N	14	慝	tè	do evil in secret; evil, vice
6524	虫 142.8	6524	5709	\N	\N	14	蜱	pí	a tick, mite
6525	髟 190.11	6525	8077	\N	\N	21	鬘	mán	beautiful hair
6526	肉 130.11	6526	\N	\N	\N	15	膚	fū	skin; superficial, shallow
6527	虍 141.11	6527	\N	\N	\N	17	虧	kuī	lose, fail; damage; deficient
6528	辵 162.15	6528	\N	\N	\N	18	邊	biān	edge, margin, side, border
6529	髟 190.5	6529	\N	\N	\N	15	髮	fà	hair
6530	土 32.7	6530	4417	\N	\N	10	埚	guō	crucible
6531	土 32.9	6531	5064	\N	\N	12	堙	yīn	bury; dam, block up
6532	艸 140.8	6532	7122	\N	\N	11	菥	xī	used in 菥蓂
6533	艸 140.8	6533	4760	\N	\N	11	萏	dàn	lotus
6534	玉 96.4	6534	6648	\N	\N	8	玟	wén	streaks in jade; gem
6535	木 75.8	6535	5096	\N	\N	12	椟	dú	cabinet, wardrobe; closet
6536	金 167.6	6536	4867	\N	\N	11	铗	jiá	tongs, pincers; dagger; sword
6537	頁 181.9	6537	5908	\N	\N	15	颙	yóng	solemn, large, grand, majestic
6538	足 157.8	6538	5915	\N	\N	15	踬	zhì	stumble, totter; fail, be frustrated
6539	竹 118.6	6539	5205	\N	\N	12	筚	bì	wicker, bamboo
6540	石 112.3	6540	6668	\N	\N	8	矻	kū	toil, slave away; busy
6541	手 64.10	6541	5361	\N	\N	13	搠	shuò	to daub; to thrust
6542	囗 31.8	6542	4837	\N	\N	11	圉	yǔ	stable, corral, enclosure; frontier, border
6543	水 85.6	6543	4342	\N	\N	9	浍	huì	irrigation ditch, trench; river
6544	門 169.7	6544	\N	\N	\N	15	閱	yuè	examine, inspect, review, read
6545	虫 142.7	6545	5459	\N	\N	13	蛸	shāo	long legged spider; octopus; chrysalis of mantis
6546	石 112.13	6546	\N	\N	\N	18	礎	chǔ	foundation stone, plinth
6547	言 149.3	6547	\N	\N	\N	10	討	tǎo	to discuss; ask for, beg; demand; dun; marry
6548	金 167.10	6548	\N	\N	\N	18	鎮	zhèn	town, market place; suppress
6549	魚 195.5	6549	\N	\N	\N	16	鮊	bà	\N
6550	艸 140.4	6550	6573	\N	\N	7	芘	pí	Malva sylvestris
6551	艸 140.8	6551	4754	\N	\N	11	萜	tiē	C5H8
6552	邑 163.10	6552	7413	\N	\N	12	鄗	hào	county in Hebei province
6553	心 61.8	6553	4986	\N	\N	11	惝	chǎng	alarmed, agitated
6554	毛 82.8	6554	7454	\N	\N	12	毵	sān	long feathers; scraggy
6555	魚 195.9	6555	6277	\N	\N	17	鲽	dié	flatfish; flounder; sole
6556	酉 164.4	6556	4786	\N	\N	11	酞	tài	phthalein
6557	糸 120.6	6557	\N	\N	\N	12	絕	jué	cut, sever, break off, terminate
6558	口 30.6	6558	4223	\N	\N	9	哚	duǒ	chemical element; (Cant.) backing, support of someone powerful; a little
6559	水 85.10	6559	5576	\N	\N	13	溷	hùn	privy, latrine; turbid, dirty
6560	糸 120.10	6560	7619	\N	\N	13	缞	cuī	sackcloth worn on breast during
6561	足 157.9	6561	\N	\N	\N	16	踰	yú	exceed, transgress; cross over
6562	手 64.10	6562	5365	\N	\N	13	搦	nuò	grasp, seize, take in hand
6563	巾 50.8	6563	4855	\N	\N	11	帻	zé	turban; conical cap
6564	金 167.6	6564	\N	\N	\N	11	铦	xiān	sharp, keen-edged; a kind of hoe
6565	魚 195.8	6565	6143	\N	\N	16	鲴	gù	fish guts
6566	髟 190.5	6566	5860	\N	\N	15	髫	tiáo	tufts of hair on children
6567	皿 108.9	6567	\N	\N	\N	14	盡	jǐn	exhaust, use up; deplete
6568	艸 140.10	6568	\N	\N	\N	13	蓋	gài	cover, hide, protect
6569	衣 145.8	6569	\N	\N	\N	14	製	zhì	make, manufacture; produce
6570	車 159.6	6570	\N	\N	\N	13	載	zài	load; carry; transport, convey
6571	辵 162.8	6571	\N	\N	\N	11	週	zhōu	week; turn, cycle; anniversary
6572	阜 170.8	6572	\N	\N	\N	10	陸	lù	land, continental; army; an accounting form of六(six)
6573	酉 164.10	6573	\N	\N	\N	17	醡	zhà	wine press
6574	人 9.13	6574	7792	\N	\N	15	儇	xuān	clever, nimble
6575	犬 94.7	6575	7035	\N	\N	10	狴	bì	a kind of tapir; a fierce beast depicted on the door of prisons
6576	辵 162.5	6576	3946	\N	\N	8	迮	zé	to rise; contracted; cramped
6577	金 167.9	6577	\N	\N	\N	17	鍬	qiāo	shovel
6578	走 156.16	6578	6478	\N	\N	23	趱	zǎn	go in hurry, hasten; urge
6579	木 75.8	6579	5119	\N	\N	12	椠	qiàn	wooden tablet; edition
6580	貝 154.12	6580	6153	\N	\N	16	赟	yūn	affable, agreeable, pleasant
6581	阜 170.6	6581	4063	\N	\N	8	陔	gāi	a step, a terrace, a grade a ledge
6582	土 32.4	6582	3741	\N	\N	7	坌	bèn	dust, earth; a bank of earth; to dig; to bring together
6583	心 61.7	6583	7068	\N	\N	10	悃	kǔn	sincere, genuine, honest, loyal
6584	土 32.10	6584	5522	\N	\N	13	塍	chéng	a raised path between fields, a dike
6585	疒 104.4	6585	4308	\N	\N	9	疬	lì	scrofulous lumps or swellings
6586	鹿 198.5	6586	6163	\N	\N	16	麈	zhǔ	species of deer
6587	糸 120.6	6587	7282	\N	\N	12	絜	jié	a marking line; ascertain, assess; measure
6588	肉 130.7	6588	7015	\N	\N	10	脩	xiū	dried meat (used as teachers payment in ancient times)
6589	貝 154.8	6589	7372	\N	\N	12	赒	zhōu	give for charity
6590	土 32.7	6590	4421	\N	\N	10	埒	liè	enclosure, dike, embankment
6591	金 167.12	6591	6245	\N	\N	17	镡	chán	dagger; small sword
6592	金 167.12	6592	7942	\N	\N	17	镨	pǔ	praseodymium
6593	馬 187.7	6593	4706	\N	\N	10	骎	qīn	galloping; speeding
6594	馬 187.9	6594	7460	\N	\N	12	骙	kuí	(of a horse) lively; vigorous
6595	艸 140.13	6595	\N	\N	\N	16	薑	jiāng	ginger
6596	鼠 208.5	6596	8011	\N	\N	18	鼩	qú	used in 鼩鼱
6597	雨 173.4	6597	\N	\N	\N	12	雰	fēn	atmosphere; mist, fog
6598	禾 115.14	6598	\N	\N	\N	19	穩	wěn	stable, firm, solid, steady
6599	艸 140.15	6599	\N	\N	\N	18	藴	yùn	collect
6600	貝 154.4	6600	\N	\N	\N	11	責	zé	duty, responsibility; to reproach, to blame
6601	魚 195.6	6601	\N	\N	\N	17	鮮	xiān	fresh, new, delicious; rare, few
6602	魚 195.10	6602	8015	\N	\N	18	鳑	páng	small carp
6603	豕 152.7	6603	5682	\N	\N	14	豨	xī	pig, hog
6604	玉 96.8	6604	5056	\N	\N	12	琚	jū	girdle ornaments
6605	角 148.7	6605	5774	\N	\N	14	觫	sù	to start, tremble with fear
6606	魚 195.7	6606	7800	\N	\N	15	鲦	tiáo	minnow
6607	刀 18.6	6607	3888	\N	\N	8	刳	kū	cut out, dig, rip up, scoop out
6608	手 64.6	6608	6782	\N	\N	9	拶	zā	press, squeeze hard; force
6609	手 64.8	6609	4735	\N	\N	11	掊	póu	to extract; injure
6610	水 85.5	6610	3782	\N	\N	7	泐	lè	to write; to indite; veins in minerals
6611	疒 104.9	6611	7716	\N	\N	14	瘗	yì	bury, inter
6612	雨 173.3	6612	4806	\N	\N	11	雩	yú	offer sacrifice for rain
6613	麻 200.7	6613	\N	\N	\N	17	麿	mo	I, personal name marker
6614	木 75.13	6614	6302	\N	\N	17	檗	bò	tree
6615	黽 205.5	6615	\N	\N	\N	18	鼂	cháo	a kind of sea turtle; surname
6616	言 149.6	6616	\N	\N	\N	13	詳	xiáng	detailed, complete, thorough
6617	阜 170.11	6617	\N	\N	\N	13	際	jì	border, boundary, juncture
6618	衣 145.9	6618	\N	\N	\N	14	褔	fù	complex; double
6619	金 167.6	6619	4869	\N	\N	11	铟	yīn	indium
6620	耳 128.16	6620	\N	\N	\N	22	聽	tīng	hear, listen; understand; obey
6621	角 148.13	6621	\N	\N	\N	20	觸	chù	touch; butt, ram, gore
6622	雨 173.16	6622	\N	\N	\N	24	靈	líng	spirit, soul; spiritual world
6623	魚 195.5	6623	7563	\N	\N	13	鲏	pí	small carp
6624	艸 140.10	6624	5389	\N	\N	13	蒗	làng	(herb); place name
6625	魚 195.3	6625	\N	\N	\N	14	魟	hóng	a ray, skate
6626	辵 162.12	6626	7830	\N	\N	15	遹	yù	comply with, obey; shun, avoid
6627	攴 66.0	6627	\N	\N	\N	4	攴	pū	rap, tap lightly; KangXi radical 66
6628	虫 142.9	6628	6020	\N	\N	15	蝥	máo	a fly which is used similarly to cantharides
6629	艸 140.5	6629	3867	\N	\N	8	茆	máo	species of grass, water mallows
6630	艸 140.10	6630	5367	\N	\N	13	蓁	zhēn	abundant, luxuriant vegetation
6631	口 30.14	6631	6088	\N	\N	16	嚆	hāo	give forth sound, make noise
6632	心 61.4	6632	6620	\N	\N	7	忮	zhì	stubborn; perverse; aggressive
6633	竹 118.9	6633	5958	\N	\N	15	篌	hóu	ancient music instrument; harp
6634	艸 140.8	6634	\N	\N	\N	11	菧	dǐ	stibene
6635	卩 26.6	6635	6740	\N	\N	8	卺	jǐn	(nuptial) winecups
6636	邑 163.8	6636	4580	\N	\N	10	郫	pí	place name
6637	竹 118.10	6637	\N	\N	\N	16	篠	xiǎo	dwarf bamboo
6638	衣 145.9	6638	\N	\N	\N	14	複	fù	repeat, double, overlap
6639	言 149.6	6639	\N	\N	\N	13	該	gāi	should, ought to, need to
6640	貝 154.5	6640	\N	\N	\N	12	貴	guì	expensive, costly, valuable
6641	辛 160.14	6641	\N	\N	\N	21	辯	biàn	dispute, argue, debate, discuss
6642	飛 183.0	6642	\N	\N	\N	9	飛	fēi	fly; go quickly; dart; high
6643	犬 94.2	6643	3549	\N	\N	5	犰	qiú	armadillo
6644	犬 94.7	6644	4603	\N	\N	10	狳	yú	armadillo
6645	阜 170.7	6645	\N	\N	\N	9	陠	pū	\N
6646	足 157.9	6646	6096	\N	\N	16	蹁	pián	to walk with a limp
6647	艸 140.10	6647	5372	\N	\N	13	蓐	rù	straw bed mat; rushes
6648	禾 115.8	6648	\N	\N	\N	13	稜	léng	corner, edge, angle; square block
6649	艸 140.8	6649	\N	\N	\N	10	菃	qú	\N
6650	土 32.8	6650	4728	\N	\N	11	埝	niàn	bank, dike; purtuberance from
6651	艸 140.12	6651	5877	\N	\N	15	蕞	zuì	little, small, tiny; petty
6652	口 30.9	6652	5134	\N	\N	12	喈	jiē	music; melody
6653	戈 62.1	6653	6509	\N	\N	5	戋	jiān	small, narrow, tiny, little
6654	貝 154.10	6654	5728	\N	\N	14	赙	fù	gift of money help pay funeral
6655	石 112.10	6655	7763	\N	\N	15	磉	sǎng	the stone base or plinth of a pillar
6656	邑 163.7	6656	4275	\N	\N	9	郤	xì	crack, opening; surname
6657	耳 128.5	6657	7119	\N	\N	11	聍	níng	earwax
6658	金 167.6	6658	4887	\N	\N	11	铷	rú	rubidium
6659	石 112.6	6659	\N	\N	\N	11	硏	yán	grind
6660	肉 130.11	6660	7401	\N	\N	12	腘	guó	knee pit; popliteal fossa (medicine)
6661	臼 134.9	6661	\N	\N	\N	16	興	xìng	thrive, prosper, flourish
6662	隹 172.10	6662	\N	\N	\N	18	雞	jī	chickens; domestic fowl
6663	鬯 192.19	6663	\N	\N	\N	29	鬱	yù	luxuriant; dense, thick; moody
6664	鳥 196.3	6664	\N	\N	\N	14	鳴	míng	cry of bird or animal; make sound
6665	麥 199.0	6665	\N	\N	\N	11	麥	mài	wheat, barley, oats; KangXi radical number 199
6666	魚 195.6	6666	\N	\N	\N	17	鮟	àn	anglerfish
6667	魚 195.9	6667	7967	\N	\N	17	鳈	quán	name of fish
6668	禾 115.13	6668	4891	\N	\N	11	秾	nóng	thick, lush, in clusters
6669	邑 163.3	6669	3528	\N	\N	5	邗	hán	an ancient place in the state of Wu
6670	里 166.11	6670	7982	\N	\N	18	釐	lí	manage, control; 1/1000 of a foot
6671	矢 111.4	6671	6852	\N	\N	9	矧	shěn	much more, still more; the gums
6672	臼 134.4	6672	6855	\N	\N	9	舁	yú	to lift, to raise
6673	豸 153.6	6673	5514	\N	\N	13	貅	xiū	brave, fierce, courageous
6674	目 109.10	6674	\N	\N	\N	14	瞇	mī	to close (the eyes); to squint
6675	馬 187.11	6675	5846	\N	\N	14	骢	cōng	horse with a bluish white color
6676	阜 170.5	6676	6634	\N	\N	7	阼	zuò	the steps leading to the eastern door
6677	土 32.7	6677	4424	\N	\N	10	垸	yuàn	a dyke, embankment
6678	土 32.11	6678	5632	\N	\N	14	墁	màn	to plaster; to pave
6679	手 64.22	6679	6495	\N	\N	25	攮	nǎng	to fend off; to stab
6680	木 75.5	6680	4152	\N	\N	9	柝	tuò	watchman's rattle
6681	木 75.7	6681	4455	\N	\N	10	梃	tǐng	a club; a stalk; straight
6682	目 109.5	6682	7010	\N	\N	10	眚	shěng	disease of the eyes; crime, fault
6683	竹 118.8	6683	5751	\N	\N	14	箜	kōng	ancient string music instrument
6684	竹 118.11	6684	7953	\N	\N	17	簏	lù	a box, a basket
6685	糸 120.8	6685	5817	\N	\N	14	綮	qǐ	embroidered banner
6686	魚 195.7	6686	5974	\N	\N	15	鲩	huàn	carp
6687	言 149.9	6687	\N	\N	\N	16	諡	shì	posthumous name, posthumous title
6688	艸 140.5	6688	\N	\N	\N	8	茇	bá	grass, thatch
6689	手 64.10	6689	5354	\N	\N	13	摅	shū	spread, disperse; vent, set forth
6690	頁 181.9	6690	\N	\N	\N	18	顐	wèn	\N
6691	虫 142.8	6691	7674	\N	\N	14	蜾	guǒ	the solitary wasp
6692	齒 211.4	6692	7346	\N	\N	12	龂	yín	gums (of the teeth); to dispute
6693	門 169.7	6693	\N	\N	\N	15	䦟	wěn	to struggle; struggle; to strive, firm; stable; secure
6694	肉 130.14	6694	\N	\N	\N	18	臍	qí	abdominal area of crab; navel
6695	肉 130.12	6695	\N	\N	\N	16	膩	nì	greasy, oily, dirty; smooth
6696	言 149.9	6696	\N	\N	\N	15	諸	zhū	several, various
6697	言 149.16	6697	\N	\N	\N	22	讉	yí	\N
6698	金 167.10	6698	\N	\N	\N	16	鎯	láng	large hammer
6699	肉 130.6	6699	4596	\N	\N	10	脒	mǐ	open; throw away
6700	竹 118.9	6700	5747	\N	\N	14	箬	ruò	the cuticle of the bamboo a broad-leaved bamboo
6701	魚 195.8	6701	6146	\N	\N	16	鲻	zī	mullet
6702	土 32.8	6702	4722	\N	\N	11	埸	yì	a border; a limit; a dike; a frontier; a boundary
6703	頁 181.4	6703	4624	\N	\N	10	颃	háng	fly down or downward
6704	艸 140.10	6704	5387	\N	\N	13	蒹	jiān	reed, phragmites communis
6705	目 109.10	6705	7670	\N	\N	14	瞍	sǒu	blind; no pupil in the eye
6706	金 167.6	6706	4879	\N	\N	11	铫	diào	large hoe; surname; a spear
6707	艸 140.10	6707	7313	\N	\N	12	蒐	sōu	collect, gather, assemble; seek; spring hunt; assemble for war
6708	足 157.12	6708	\N	\N	\N	19	蹻	juē	to raise the feet; to cross the legs; brave; sandals
6709	巾 50.12	6709	5939	\N	\N	15	幞	fú	turban
6710	阜 170.4	6710	\N	\N	\N	6	阯	zhǐ	foundation; site; address
6711	見 147.10	6711	5625	\N	\N	14	觏	gòu	meet or see unexpectedly
6712	女 38.10	6712	5523	\N	\N	13	媵	yìng	a maid who accompanies bride to her new home; to escort; a concubine
6713	金 167.4	6713	6850	\N	\N	9	钬	huǒ	holmium
6714	衣 145.14	6714	6415	\N	\N	19	襦	rú	short coat, jacket; fine silk fab
6715	竹 118.11	6715	6259	\N	\N	17	簋	guǐ	a square basket of bamboo for holding grain used at sacrifices, feast
6716	羽 124.10	6716	6067	\N	\N	16	翮	hé	stem of feather; quill
6717	足 157.12	6717	8035	\N	\N	19	蹯	fán	paws of animal
6718	舟 137.10	6718	\N	\N	\N	15	艖	chā	raft; boat; skiff
6719	豸 153.9	6719	\N	\N	\N	15	貓	māo	cat
6720	金 167.13	6720	\N	\N	\N	21	鐮	lián	sickle
6721	貝 154.2	6721	\N	\N	\N	9	負	fù	load, burden; carry, bear
6722	頁 181.3	6722	\N	\N	\N	12	順	shùn	obey, submit to, go along with
6723	魚 195.9	6723	7964	\N	\N	17	鲿	cháng	codfish
6724	糸 120.8	6724	\N	\N	\N	14	緊	jǐn	tense, tight, taut; firm, secure
6725	足 157.11	6725	\N	\N	\N	18	蹠	zhí	step on, tread on; sole
6726	手 64.16	6726	6367	\N	\N	19	攉	huō	to beckon; to urge
6727	示 113.9	6727	5601	\N	\N	13	禊	xì	semi-annual ceremony of purification
6728	竹 118.8	6728	5742	\N	\N	14	箐	qìng	to draw a bamboo bow or crossbow
6729	金 167.11	6729	\N	\N	\N	16	镟	xuàn	lathe
6730	疒 104.12	6730	6290	\N	\N	17	癍	bān	unhealthy marks on the skin
6731	雨 173.11	6731	6378	\N	\N	19	霪	yín	long and heavy rain
6732	衣 145.5	6732	7077	\N	\N	10	袪	qū	sleeves; cuff
6733	刀 18.14	6733	6130	\N	\N	16	劓	yì	cut off nose
6734	歹 78.5	6734	4174	\N	\N	9	殂	cú	to die
6735	肉 130.7	6735	7211	\N	\N	11	脞	cuǒ	minced meat; trifles
6736	雨 173.11	6736	6380	\N	\N	19	霨	wèi	clouding
6737	食 184.7	6737	\N	\N	\N	10	饾	dòu	food item set out for show only
6738	耳 128.2	6738	6656	\N	\N	8	耵	dīng	earwax
6739	水 85.5	6739	4017	\N	\N	8	泺	luò	river in Shandong province
6740	土 32.8	6740	4725	\N	\N	11	埤	pí	add, increase, attach; low fence
6741	石 112.8	6741	\N	\N	\N	13	碁	qí	chess; any game similar to chess
6742	魚 195.5	6742	5531	\N	\N	13	鲐	tái	globefish, tetraodon
6743	鳥 196.11	6743	\N	\N	\N	22	鷟	zhuó	phoenix
6744	肉 130.12	6744	\N	\N	\N	16	膬	cuì	\N
6745	艸 140.6	6745	\N	\N	\N	9	茲	zī	now, here; this; time, year
6746	米 119.7	6746	\N	\N	\N	13	粯	xiàn	\N
6747	米 119.11	6747	\N	\N	\N	17	糞	fèn	manure, dung, night soil
6748	耳 128.11	6748	\N	\N	\N	17	聲	shēng	sound, voice, noise; tone; music
6749	貝 154.5	6749	\N	\N	\N	12	貼	tiē	paste to, stick on; attached to
6750	阜 170.8	6750	7085	\N	\N	10	陴	pí	a parapet on a city wall
6751	木 75.12	6751	6064	\N	\N	16	橼	yuán	citrus
6752	馬 187.18	6752	\N	\N	\N	27	驩	huān	happy, pleased, glad; joy; to enjoy
6753	口 30.7	6753	4516	\N	\N	10	唣	zào	chatter
6754	虫 142.8	6754	5710	\N	\N	14	蜩	tiáo	cicada, broad locust
6755	土 32.8	6755	4718	\N	\N	11	埯	ǎn	cover with earth; a pit; a hole
6756	艸 140.10	6756	5390	\N	\N	13	蓥	yíng	polish
6757	衣 145.5	6757	\N	\N	\N	10	袝	fù	\N
6758	言 149.9	6758	7256	\N	\N	11	谞	xū	knowledge; discrimination; treachery
6759	首 185.8	6759	7971	\N	\N	17	馘	guó	cut off left ear; tally dead enemy
6760	言 149.11	6760	7608	\N	\N	13	谫	jiǎn	shallow; stupid
6761	車 159.9	6761	\N	\N	\N	16	輶	yóu	light carriage; trifling, light
6762	广 53.11	6762	7714	\N	\N	14	廑	jǐn	a hut; careful
6763	疒 104.9	6763	5544	\N	\N	13	瘐	yǔ	to die in prison from cold and hunger; to treat with cruelty
6764	足 157.15	6764	6471	\N	\N	22	躐	liè	to stride over; to step across
6765	黑 203.6	6765	6341	\N	\N	18	黟	yī	black and shining; ebony
6766	糸 120.17	6766	\N	\N	\N	23	纔	cái	talent, ability; just, only
6767	石 112.14	6767	\N	\N	\N	19	礙	ài	obstruct, hinder, block, deter
6768	肉 130.12	6768	\N	\N	\N	16	膯	tēng	\N
6769	艸 140.8	6769	\N	\N	\N	10	華	huá	flowery; illustrious; Chinese
6770	艸 140.15	6770	\N	\N	\N	18	藭	qióng	used in 芎藭
6771	示 113.8	6771	\N	\N	\N	12	禆	bēi	\N
6772	虍 141.7	6772	\N	\N	\N	13	號	hào	mark, sign; symbol; number
6773	言 149.8	6773	\N	\N	\N	15	談	tán	talk; conversation; surname
6774	貝 154.5	6774	\N	\N	\N	12	費	fèi	expenses, expenditures, fee
6775	頁 181.9	6775	\N	\N	\N	18	顏	yán	face, facial appearance
6776	食 184.4	6776	\N	\N	\N	12	飯	fàn	cooked rice; food; meal
6777	禾 115.8	6777	\N	\N	\N	13	稓	zuó	\N
6778	糸 120.10	6778	6043	\N	\N	16	縠	hú	crepe
6779	手 64.9	6779	5063	\N	\N	12	揠	yà	to pull up, to eradicate
6780	糸 120.5	6780	6754	\N	\N	8	绐	dài	cheat, fool, pretend
6781	鳥 196.5	6781	7029	\N	\N	10	鸰	líng	species of lark; wagtail; Motacilla species (various)
6782	手 64.10	6782	5360	\N	\N	13	搛	jiān	to pick up with chopsticks
6783	黹 204.0	6783	7348	\N	\N	12	黹	zhǐ	embroidery, needlework; radical
6784	心 61.6	6784	6973	\N	\N	10	恧	nǜ	ashamed
6785	米 119.4	6785	\N	\N	\N	10	粎	chǐ	metre
6786	木 75.5	6786	1666	\N	\N	9	柒	qī	number seven
6787	衣 145.7	6787	5252	\N	\N	12	裒	póu	collect, gather, assemble; praise
6788	木 75.6	6788	4448	\N	\N	10	栳	lǎo	a basket
6789	金 167.5	6789	\N	\N	\N	10	钸	bù	plutonium
6790	食 184.6	6790	4300	\N	\N	9	饸	hé	used in 饸饹
6791	言 149.13	6791	\N	\N	\N	20	譞	xuān	clever, intelligent, name
6792	貝 154.4	6792	\N	\N	\N	11	販	fàn	peddler, hawker, street merchant
6793	金 167.6	6793	7179	\N	\N	11	铕	yǒu	europium
6794	糸 120.6	6794	7298	\N	\N	12	絷	zhí	confine, tie up; imprison, shackle
6795	艸 140.10	6795	7485	\N	\N	13	蒨	qiàn	lush vegetation, luxuriant growth
6796	艸 140.10	6796	7491	\N	\N	13	蓣	yù	yam
6797	辵 162.6	6797	\N	\N	\N	9	迻	yí	to shift; to transfer; to transform
6798	釆 165.0	6798	\N	\N	\N	7	釆	biàn	distinguish; KangXi radical 165
6799	魚 195.6	6799	7700	\N	\N	14	鲕	ér	roe
6800	頁 181.5	6800	\N	\N	\N	14	頗	pō	lean one side; very, rather
6801	金 167.9	6801	\N	\N	\N	17	鍏	wéi	spade
6802	鳥 196.10	6802	\N	\N	\N	21	鷉	tī	 variant of 䴘
6803	邑 163.6	6803	3972	\N	\N	8	郄	qiè	surname
6804	土 32.7	6804	4415	\N	\N	10	埘	shí	roost
6805	艸 140.13	6805	6049	\N	\N	16	薤	xiè	allium bakeri; shallots, scallion
6806	魚 195.6	6806	5791	\N	\N	14	鲞	xiǎng	dried fish
6807	鼠 208.7	6807	6440	\N	\N	20	鼯	wú	flying squirrel
6808	土 32.5	6808	3850	\N	\N	8	坭	ní	mud, mire; to paste, to plaster
6809	艸 140.11	6809	7641	\N	\N	14	蔌	sù	vegetables
6810	糸 120.13	6810	6194	\N	\N	16	缳	huán	noose; hang death; tie, bind
6811	面 176.7	6811	\N	\N	\N	16	靦	tiǎn	timid, shy, bashful
6812	竹 118.7	6812	\N	\N	\N	13	筸	gān	name of a place in Honan
6813	艸 140.16	6813	\N	\N	\N	19	蘋	píng	apple
6814	大 37.3	6814	3587	\N	\N	6	夼	kuǎng	low ground; hollow; depression (used in Shandong place names)
6815	木 75.8	6815	5105	\N	\N	12	椐	jū	Zelkowa acuminata
6816	車 159.5	6816	6817	\N	\N	9	轹	lì	run over something with vehicle
6817	肉 130.7	6817	4921	\N	\N	11	脬	pāo	a bladder
6818	目 109.4	6818	4189	\N	\N	9	眍	kōu	sunken
6819	食 184.6	6819	4301	\N	\N	9	饹	le	used in 饸饹
6820	疒 104.10	6820	7717	\N	\N	14	瘥	chài	to recover from any disease; an epidemic
6821	疒 104.11	6821	6157	\N	\N	16	瘵	zhài	a wasting disease
6822	虫 142.9	6822	\N	\N	\N	15	蝦	xiā	shrimp, prawn
6823	言 149.7	6823	\N	\N	\N	14	誌	zhì	write down; record; magazine
6824	邑 163.5	6824	3684	\N	\N	7	邴	bǐng	name of a city in the ancient state of Song, in what is now Shandong; pleased
6825	金 167.5	6825	\N	\N	\N	13	鉁	zhēn	\N
6826	革 177.9	6826	7986	\N	\N	18	鞮	dī	leather shoes
6827	臼 134.6	6827	5210	\N	\N	12	舄	xì	a shoe; the sole of a shoe; magpie
6828	鹿 198.4	6828	\N	\N	\N	15	麄	cū	coarse, rough, rude
6829	羽 124.7	6829	7394	\N	\N	12	翛	xiāo	look of rumpled feathers; bedraggled; hasty; rapid flight
6830	見 147.9	6830	\N	\N	\N	15	覩	dǔ	see, gaze at, witness
6831	糸 120.3	6831	6554	\N	\N	6	纩	kuàng	cotton; silk
6832	艸 140.11	6832	\N	\N	\N	13	蓮	lián	lotus, water lily; paradise
6833	口 30.7	6833	4494	\N	\N	10	唛	mà	mark
6834	衣 145.5	6834	\N	\N	\N	10	袓	jù	\N
6835	示 113.3	6835	\N	\N	\N	7	祂	tā	he (honorific form, generally used for the Abrahamic God)
6836	車 159.12	6836	\N	\N	\N	19	轎	jiào	sedan-chair, palanquin
6837	糸 120.3	6837	\N	\N	\N	9	紀	jì	record, annal, historical account
6838	糸 120.17	6838	\N	\N	\N	23	纖	xiān	fine, delicate; minute; graceful
6839	車 159.7	6839	\N	\N	\N	14	輔	fǔ	cheek bone; protective; assist
6840	金 167.5	6840	\N	\N	\N	13	鉀	jiǎ	potassium kalium
6841	頁 181.5	6841	\N	\N	\N	14	領	lǐng	neck; collar; lead, guide
6842	虫 142.11	6842	6232	\N	\N	17	螵	piāo	a chrysalis
6843	鳥 196.13	6843	\N	\N	\N	24	鸊	pì	Podiceps ruficolus (a kind of duck)
6844	魚 195.6	6844	\N	\N	\N	17	鮡	zhào	\N
6845	示 113.10	6845	7739	\N	\N	14	禛	zhēn	to receive blessings in a sincere spirit
6846	衣 145.4	6846	6903	\N	\N	9	袆	huī	ceremonial gowns of a queen
6847	言 149.11	6847	\N	\N	\N	18	謴	gùn	\N
6848	邑 163.6	6848	3945	\N	\N	8	邾	zhū	a feudal state which existed B.C.700-469; now in Shandong
6849	魚 195.5	6849	\N	\N	\N	16	鮣	yìn	\N
6850	酉 164.7	6850	7657	\N	\N	14	酲	chéng	hangover; uncomfortable
6851	齒 211.3	6851	7153	\N	\N	11	龁	hé	gnaw, bite, nibble
6852	水 85.3	6852	3624	\N	\N	6	汔	qì	near
6853	目 109.4	6853	4188	\N	\N	9	眄	miǎn	to look askance; looking dull
6854	目 109.4	6854	4193	\N	\N	9	眊	mào	dim-sighted; dull, bewildered
6855	鬲 193.0	6855	4467	\N	\N	10	鬲	gé	type of caldron with three hollow legs; name of a state; KangXi radical number 193
6856	阜 170.4	6856	\N	\N	\N	6	阨	è	in distress; adverse; strategic; (Cant.) to swindle
6857	革 177.4	6857	5082	\N	\N	12	靸	sǎ	children's shoe (old); to wear one's shoes babouche style
6858	肉 130.13	6858	\N	\N	\N	17	臉	liǎn	face; cheek; reputation
6859	貝 154.12	6859	\N	\N	\N	19	贇	yūn	affable, agreeable, pleasant
6860	酉 164.7	6860	7655	\N	\N	14	酺	pú	drink with others; drink heavily
6861	犬 94.4	6861	6608	\N	\N	7	狃	niǔ	to covet; to be accustomed
6862	車 159.5	6862	6818	\N	\N	9	轺	yáo	small light carriage
6863	雨 173.7	6863	7766	\N	\N	15	霅	zhà	thunder
6864	髟 190.7	6864	\N	\N	\N	17	鬂	bìn	the hair on the temples
6865	鼠 208.10	6865	8099	\N	\N	23	鼷	xī	a mouse
6866	虫 142.13	6866	8048	\N	\N	19	蠃	luǒ	the solitary wasp
6867	土 32.8	6867	4717	\N	\N	11	埴	zhí	soil with large clay content
6868	鳥 196.5	6868	\N	\N	\N	16	鴥	yù	swoop
6869	阜 170.9	6869	\N	\N	\N	11	隊	duì	team, group; army unit
6870	骨 188.10	6870	\N	\N	\N	19	髆	bó	shoulder blade
6871	糸 120.8	6871	\N	\N	\N	14	綱	gāng	heavy rope, hawser; main points
6872	肉 130.12	6872	\N	\N	\N	16	膮	xiāo	\N
6873	言 149.11	6873	\N	\N	\N	18	謹	jǐn	prudent, cautious; attentive
6874	金 167.6	6874	4878	\N	\N	11	铪	hā	hafnium
6875	鹵 197.13	6875	\N	\N	\N	24	鹼	jiǎn	alkaline, alkali, lye, salt
6876	竹 118.13	6876	\N	\N	\N	19	簳	gǎn	\N
6877	糸 120.5	6877	\N	\N	\N	11	終	zhōng	end; finally, in the end
6878	糸 120.8	6878	\N	\N	\N	14	綜	zōng	arrange threads for weaving
6879	衣 145.7	6879	\N	\N	\N	13	裝	zhuāng	dress, clothes; decorate; fill
6880	言 149.3	6880	\N	\N	\N	10	訉	fān	\N
6881	金 167.6	6881	\N	\N	\N	14	銀	yín	silver; cash, money, wealth
6882	魚 195.5	6882	7557	\N	\N	13	鲉	yóu	\N
6883	艸 140.13	6883	\N	\N	\N	16	蕿	xuān	variant of 萱
6884	衣 145.5	6884	\N	\N	\N	10	袊	lǐng	\N
6885	水 85.2	6885	3612	\N	\N	6	汆	cuān	to parboil; hot water kettle; to boil
6886	石 112.6	6886	\N	\N	\N	11	硃	zhū	a red mole; cinnabar
6887	人 9.3	6887	6513	\N	\N	5	仝	tóng	together, same; surname
6888	足 157.4	6888	\N	\N	\N	11	趽	fàng	\N
6889	土 32.8	6889	4730	\N	\N	11	堍	tù	side of bridge
6890	手 64.9	6890	5062	\N	\N	12	揸	zhā	handful; to grasp, seize, pick up with fingers; (Cant.) to take, carry
6891	心 61.4	6891	3792	\N	\N	7	忭	biàn	delighted; pleased
6892	金 167.6	6892	\N	\N	\N	14	銧	guāng	point of a sword
6893	女 38.4	6893	3815	\N	\N	7	妤	yú	beautiful, fair, handsome
6894	頁 181.6	6894	\N	\N	\N	15	頫	fǔ	bow; nod; condescend
6895	糸 120.9	6895	\N	\N	\N	15	緡	mín	a fishing-line; cord; string of coins; a paper or straw string
6896	言 149.22	6896	\N	\N	\N	29	讟	dú	slander, utter evil words
6897	龠 214.0	6897	6267	\N	\N	17	龠	yuè	flute; pipe, ancient measure
6898	土 32.6	6898	4098	\N	\N	9	垤	dié	ant-hill, small mound; hill
6899	手 64.13	6899	7836	\N	\N	16	擐	huàn	to put on
6900	口 30.12	6900	5932	\N	\N	15	噍	jiào	chew; eat; munch
6901	水 85.6	6901	4341	\N	\N	9	洫	xù	to ditch; a moat
6902	水 85.10	6902	5580	\N	\N	13	滏	fǔ	name of a river in Hebei
6903	玉 96.11	6903	5855	\N	\N	15	璁	cōng	turquoise
6904	疒 104.12	6904	6159	\N	\N	16	癃	lóng	weakness, infirmity retention of urine
6905	邑 163.4	6905	6545	\N	\N	6	邡	fāng	name of a district in Sichuan
6906	糸 120.5	6906	\N	\N	\N	11	絁	shī	rough, indelicate silk
6907	金 167.9	6907	\N	\N	\N	16	鍩	tiǎn	nobelium
6908	走 156.10	6908	\N	\N	\N	17	趨	qū	hasten, hurry; be attracted to
6909	艸 140.10	6909	5375	\N	\N	13	蒽	ēn	anthracene
6910	糸 120.6	6910	\N	\N	\N	12	絲	sī	silk; fine thread; wire; strings
6911	肉 130.12	6911	\N	\N	\N	16	膫	liáo	the fat covering the intestines; the omentum
6912	肉 130.13	6912	\N	\N	\N	17	臅	chù	\N
6913	艸 140.6	6913	\N	\N	\N	9	茖	gé	allium victorialis
6914	艸 140.16	6914	\N	\N	\N	19	蘇	sū	abbr. for Soviet Union, Perilla frutescens, surname
6915	言 149.5	6915	\N	\N	\N	12	詞	cí	words; phrase, expression
6916	言 149.6	6916	\N	\N	\N	13	詾	xiōng	noisily; uproarious; troublesome
6917	貝 154.12	6917	\N	\N	\N	19	贆	biāo	\N
6918	足 157.12	6918	\N	\N	\N	19	蹨	niǎn	(Cant.) to stand on tiptoe
6919	辰 161.6	6919	\N	\N	\N	13	農	nóng	agriculture, farming; farmer
6920	金 167.8	6920	\N	\N	\N	16	錄	lù	copy, write down, record
6921	金 167.12	6921	\N	\N	\N	20	鐘	zhōng	clock; bell
6922	魚 195.10	6922	\N	\N	\N	21	鰜	qiàn	big-mouthed flounder
6923	鹵 197.13	6923	\N	\N	\N	24	鹽	yán	(same as of塩) salt
6924	貝 154.8	6924	5177	\N	\N	12	赕	dǎn	fine
6925	魚 195.8	6925	\N	\N	\N	19	鯔	zī	mullet
6926	魚 195.8	6926	\N	\N	\N	19	鯮	zōng	\N
6927	艸 140.11	6927	\N	\N	\N	13	蔯	chén	a variety of artemisia
6928	豸 153.11	6928	\N	\N	\N	18	貙	chū	a kind of animal like a tiger; fierce wild beasts
6929	食 184.9	6929	\N	\N	\N	17	餬	hú	porridge, gruel, congee; paste
6930	足 157.16	6930	6482	\N	\N	23	躜	zuān	to jump
6931	魚 195.9	6931	6278	\N	\N	17	鳀	tí	anchovy
6932	鳥 196.10	6932	7806	\N	\N	15	鹡	jí	wagtail
6933	鳥 196.10	6933	7795	\N	\N	21	䴘	tī	a kind of bird
6934	虫 142.13	6934	8036	\N	\N	19	蠋	zhú	caterpillar
6935	金 167.5	6935	4528	\N	\N	10	钲	zhēng	kind of gong used in ancient times by troops on the march
6936	虫 142.7	6936	\N	\N	\N	13	蜁	xuán	\N
6937	儿 10.6	6937	3718	\N	\N	7	兕	sì	a female rhinoceros
6938	阜 170.5	6938	6632	\N	\N	7	阽	diàn	dangerous
6939	金 167.10	6939	\N	\N	\N	18	鎰	yì	measure of weight for gold
6940	糸 120.5	6940	6753	\N	\N	8	绋	fú	large rope; rope attached to bier
6941	金 167.7	6941	\N	\N	\N	11	铓	máng	point of sword; sharp point
6942	火 86.18	6942	6458	\N	\N	21	爝	jué	torch
6943	石 112.12	6943	\N	\N	\N	17	磾	dī	\N
6944	艸 140.9	6944	\N	\N	\N	12	葷	hūn	meat diet; strong smelling
6945	虫 142.10	6945	\N	\N	\N	16	螘	yǐ	ant
6946	人 9.2	6946	3517	\N	\N	4	仂	lè	surplus or excess; remainder
6947	雨 173.4	6947	\N	\N	\N	12	雲	yún	clouds; Yunnan province
6948	頁 181.10	6948	\N	\N	\N	19	顗	yǐ	quiet
6949	虫 142.12	6949	7999	\N	\N	18	蟫	yín	silverfish
6950	艸 140.13	6950	5878	\N	\N	15	蕺	jí	Houttuynia cordata
6951	馬 187.6	6951	6918	\N	\N	9	骃	yīn	grey horse
6952	艸 140.11	6952	7487	\N	\N	13	蔀	bù	screen
6953	言 149.14	6953	\N	\N	\N	9	诪	zhōu	deceive, cheat; hurried, bustling
6954	犬 94.9	6954	5240	\N	\N	12	猹	chá	wild animal mentioned in short story by Lu Xun
6955	金 167.7	6955	\N	\N	\N	15	鋬	pàn	\N
6956	皿 108.10	6956	\N	\N	\N	15	盤	pán	tray, plate, dish; examine
6957	齒 211.20	6957	\N	\N	\N	35	齾	yà	dented, chipped; gap-toothed, toothless
6958	土 32.7	6958	4414	\N	\N	10	埕	chéng	a large, pear-shaped earthenware jar
6959	耳 128.8	6959	\N	\N	\N	14	聞	wén	hear; smell; make known; news
6960	臼 134.10	6960	\N	\N	\N	16	舉	jǔ	raise, lift up; recommend
6961	虍 141.8	6961	\N	\N	\N	13	虡	jù	support structure for bell
6962	言 149.5	6962	\N	\N	\N	12	評	píng	appraise, criticize, evaluate
6963	金 167.9	6963	\N	\N	\N	16	鍋	guō	cooking-pot, saucepan
6964	阜 170.7	6964	\N	\N	\N	9	陣	zhèn	column, row or file of troops
6965	糸 120.5	6965	\N	\N	\N	11	紬	chóu	kind of thin silk
6966	言 149.4	6966	\N	\N	\N	11	訢	xīn	pleased, delighted; happy
6967	艸 140.11	6967	\N	\N	\N	14	蔎	shè	Thea sinensis
6968	糸 120.13	6968	\N	\N	\N	18	繸	suì	hem or border of a garment; tassel
6969	糸 120.6	6969	6917	\N	\N	9	绖	dié	white hempen cloth worn by mourners
6970	土 32.8	6970	4741	\N	\N	11	埭	dài	a dam, a jock; inclined plane on a canal, where boats can be hauled up or down
6971	馬 187.6	6971	\N	\N	\N	16	駮	bó	a kind of fierce animal; join; argue; transfer; piebald horse, variegated
6972	魚 195.10	6972	\N	\N	\N	21	鰡	liú	\N
6973	鳥 196.8	6973	\N	\N	\N	19	鵳	jiān	\N
6974	木 75.5	6974	4158	\N	\N	9	柁	duò	large tie-beams
6975	竹 118.7	6975	\N	\N	\N	13	筴	cè	type of grass used in divination; to divine; pincers
6976	玉 96.6	6976	4406	\N	\N	10	珧	yáo	mother-of-pearl
6977	貝 154.5	6977	4111	\N	\N	9	贳	shì	borrow; pardon; loan
6978	貝 154.5	6978	4238	\N	\N	9	贶	kuàng	give, grant, bestow; surname
6979	肉 130.9	6979	5518	\N	\N	13	腩	nǎn	brisket; belly beef, spongy meat from cow's underside and neighboring ribs
6980	肉 130.13	6980	6272	\N	\N	17	臌	gǔ	dropsical swelling; puffy bloated
6981	石 112.13	6981	6325	\N	\N	18	礓	jiāng	a small stone
6982	衣 145.5	6982	\N	\N	\N	10	袛	dī	\N
6983	豸 153.9	6983	\N	\N	\N	16	貐	yǔ	\N
6984	足 157.10	6984	7934	\N	\N	17	蹐	jí	take short steps
6985	土 32.3	6985	3569	\N	\N	6	圬	wū	plaster over with layer of mud
6986	土 32.9	6986	7297	\N	\N	12	堠	hòu	battlements, battlemented walls
6987	尸 44.12	6987	6016	\N	\N	15	屦	jù	straw sandals; tread on
6988	馬 187.5	6988	6748	\N	\N	8	驵	zǎng	excellent horse, noble steed
6989	金 167.14	6989	\N	\N	\N	22	鑑	jiàn	mirror, looking glass; reflect
6990	木 75.6	6990	6960	\N	\N	10	桄	guāng	a coir-palm
6991	雨 173.8	6991	\N	\N	\N	16	霑	zhān	be moistened, soaked; moisten
6992	心 61.12	6992	\N	\N	\N	16	憝	duì	to dislike, to abhor, to hate
6993	疒 104.11	6993	6160	\N	\N	16	瘳	chōu	to be healed; to reform
6994	馬 187.7	6994	\N	\N	\N	17	騃	ái	stupid; foolish
6995	艸 140.5	6995	3863	\N	\N	8	茌	chí	name of a district in Shandong
6996	車 159.6	6996	6977	\N	\N	10	辀	zhōu	shaft
6997	肉 130.5	6997	6866	\N	\N	9	胠	qū	open; throw away
6998	土 32.7	6998	6771	\N	\N	9	埏	shān	a boundary, a limit
6999	肉 130.9	6999	5517	\N	\N	13	腠	còu	between the skin and the flesh
7000	革 177.3	7000	5081	\N	\N	12	靰	wù	leg warmer
7001	革 177.8	7001	6206	\N	\N	17	鞡	la	leg warmer
7002	缶 121.5	7002	\N	\N	\N	10	缻	fǒu	pottery, earthenware
7003	車 159.9	7003	\N	\N	\N	16	輳	còu	hubs of wheel; converge around
7004	門 169.9	7004	\N	\N	\N	17	闆	bǎn	boss, the owner, person in charge
7005	金 167.7	7005	5179	\N	\N	12	铼	lái	rhenium
7006	糸 120.4	7006	\N	\N	\N	10	紤	jiǔ	\N
7007	羽 124.12	7007	\N	\N	\N	18	翹	qiào	turn up, lift, elevate, raise
7008	耳 128.11	7008	\N	\N	\N	17	聯	lián	connect, join; associate, ally
7009	言 149.6	7009	\N	\N	\N	13	詢	xún	inquire into, ask about; consult
7010	言 149.8	7010	\N	\N	\N	15	課	kè	lesson; course; classwork
7011	豆 151.11	7011	\N	\N	\N	18	豐	fēng	abundant, lush, bountiful, plenty
7012	貝 154.9	7012	\N	\N	\N	16	賴	lài	rely, depend on; accuse falsely
7013	車 159.9	7013	\N	\N	\N	16	輸	shū	transport, carry, haul
7014	辵 162.12	7014	\N	\N	\N	15	遲	chí	late, tardy; slow; delay
7015	金 167.12	7015	\N	\N	\N	20	鐣	zhang	\N
7016	齒 211.5	7016	\N	\N	\N	20	齡	líng	age; years
7017	艸 140.7	7017	\N	\N	\N	10	莤	sù	\N
7018	魚 195.14	7018	\N	\N	\N	24	鱯	hù	a species of freshwater catfish
7019	缶 121.5	7019	\N	\N	\N	11	缽	bō	earthenware basin; alms bowl
7020	邑 163.5	7020	6626	\N	\N	7	邲	bì	good-looking; name of a place
7021	口 30.8	7021	4846	\N	\N	11	唼	shà	speaking evil. gobbling sound made by ducks
7022	金 167.13	7022	\N	\N	\N	21	鐻	jù	drumstick
7023	門 169.5	7023	\N	\N	\N	13	閟	bì	hide, keep secret; hideaway
7024	馬 187.5	7024	\N	\N	\N	15	駚	yǎng	\N
7025	竹 118.10	7025	6125	\N	\N	16	篥	lì	bugle,觱篥bìlì Tatar (Tartar) horn
7026	艸 140.5	7026	6787	\N	\N	9	茈	cí	a plant yielding a red dye
7027	肉 130.2	7027	\N	\N	\N	8	肏	cào	copulate, expletive (fuck)
7028	艸 140.9	7028	7312	\N	\N	12	萩	qiū	scandent hop; tree
7029	足 157.5	7029	5455	\N	\N	13	跐	cī	to trample, to step, to walk on the ball of the foot
7030	足 157.9	7030	7863	\N	\N	16	蹅	chǎ	to tread on, walk through
7031	目 109.11	7031	5879	\N	\N	15	瞢	méng	eyesight obscured; to feel ashamed
7032	网 122.12	7032	6238	\N	\N	17	罽	jì	a kind of woolen fabric
7033	耳 128.10	7033	\N	\N	\N	15	聭	kuì	\N
7034	辵 162.2	7034	\N	\N	\N	5	辻	shí	crossroads; street
7035	金 167.6	7035	7183	\N	\N	11	铚	zhì	a sickle
7036	竹 118.8	7036	5743	\N	\N	14	箦	zé	bed mat; mat
7037	足 157.8	7037	7771	\N	\N	15	踣	bó	to stumble and fall prone stiff in death
7038	艸 140.8	7038	\N	\N	\N	11	菑	zāi	to weed grass; land which has been under cultivation for one year
7039	足 157.11	7039	\N	\N	\N	18	蹟	jī	trace, tracks; footprints
7040	手 64.7	7040	4425	\N	\N	10	捃	jùn	gather; to sort
7041	疒 104.9	7041	7718	\N	\N	14	瘕	jiǎ	asthma; disese of the bowels
7042	目 109.9	7042	\N	\N	\N	14	睺	hóu	(Cant.) to watch
7043	門 169.4	7043	\N	\N	\N	12	閒	xián	liesure; idle; peaceful, tranquil, calm
7044	金 167.4	7044	\N	\N	\N	12	鈦	tài	titanium
7045	頁 181.13	7045	\N	\N	\N	22	顩	yǎn	\N
7046	魚 195.11	7046	6403	\N	\N	19	鳓	lè	Chinese herring; shad
7047	門 169.9	7047	\N	\N	\N	17	闇	àn	close, shut; dark, dismal
7048	鹵 197.9	7048	\N	\N	\N	20	鹹	xián	salty, briny; salted; pickled
7049	金 167.10	7049	\N	\N	\N	18		shàn	chemical element; Sarmarium (Sm); old translation of (鋱) Tb, (same as釤) a sickle with a long handle, to swing a sickle to cut (grass or wheat)
7050	示 113.9	7050	\N	\N	\N	12	禍	huò	misfortune, calamity, disaster
7051	穴 116.9	7051	\N	\N	\N	13	窩	wō	nest; cave, den; hiding place
7052	糸 120.4	7052	\N	\N	\N	10	純	chún	pure, clean, simple
7053	糸 120.11	7053	\N	\N	\N	17	縱	zòng	indulge in, give free reign to
7054	耳 128.7	7054	\N	\N	\N	13	聖	shèng	holy, sacred; sage
7055	耳 128.8	7055	\N	\N	\N	14	聛	bǐ	\N
7056	肉 130.7	7056	\N	\N	\N	11	脮	něi	\N
7057	行 144.9	7057	\N	\N	\N	15	衝	chōng	rush against, charge ahead
7058	言 149.3	7058	\N	\N	\N	10	訊	xùn	inquire; ask; examine; reproach
7059	馬 187.0	7059	\N	\N	\N	10	馬	mǎ	horse; surname; KangXi radical 187
7060	言 149.9	7060	\N	\N	\N	16	諹	yáng	\N
7061	言 149.7	7061	\N	\N	\N	14	誖	bèi	obstinate; disorderly; perverse
7062	艸 140.12	7062	\N	\N	\N	15	蕅	ǒu	\N
7063	魚 195.10	7063	\N	\N	\N	21	鰨	tǎ	sole
7064	目 109.8	7064	\N	\N	\N	13	睒	shǎn	to glance at, to peep; glittering; to shine
7065	竹 118.5	7065	\N	\N	\N	11	笰	fú	curtain
7066	竹 118.17	7066	8098	\N	\N	23	籥	yuè	key; woodwind instrument
7067	羽 124.9	7067	\N	\N	\N	15	翧	xuān	\N
7068	金 167.12	7068	6250	\N	\N	17	镩	cuān	pick, poker
7069	耒 127.9	7069	5850	\N	\N	15	耧	lóu	drill for sowing grain
7070	虫 142.8	7070	5704	\N	\N	14	蜞	qí	a kind of crab; worm, leech
7071	舟 137.3	7071	\N	\N	\N	9	舡	chuán	boat, ship
7072	魚 195.11	7072	\N	\N	\N	21	鰲	áo	huge sea turtle
7073	鳥 196.7	7073	7327	\N	\N	12	鹀	wú	bunting (bird)
7074	鳥 196.13	7074	8029	\N	\N	24	䴙	pì	a kind of bird resembling the duck; much smaller
7075	网 122.6	7075	\N	\N	\N	11	罣	guà	hinder, disturb, obstruct
7076	見 147.8	7076	\N	\N	\N	12	觍	tiǎn	ashamed
7077	糸 120.7	7077	\N	\N	\N	12	絽	lǚ	a silk gauze
7078	羊 123.13	7078	\N	\N	\N	19	羶	shān	rank odor
7079	肉 130.16	7079	6441	\N	\N	20	臜	zā	dirty; filthy
7080	艸 140.13	7080	\N	\N	\N	16	薙	tì	weed; shave
7081	角 148.2	7081	\N	\N	\N	9	觔	jīn	catty
7082	身 158.8	7082	\N	\N	\N	15	躼	lào	\N
7083	山 46.4	7083	3714	\N	\N	7	岈	yá	\N
7084	水 85.12	7084	6001	\N	\N	15	潲	shào	driving rain; to sprinkle
7085	木 75.4	7085	3878	\N	\N	8	枧	jiǎn	bamboo tube, wooden peg; spout
7086	見 147.8	7086	7337	\N	\N	12	觌	dí	see; interview; be admitted to audience
7087	肉 130.12	7087	6137	\N	\N	16	膦	lìn	phosphine
7088	石 112.14	7088	7994	\N	\N	18	礞	méng	(mineral)
7089	虫 142.9	7089	7775	\N	\N	15	蝤	qiú	larva; grub
7090	虫 142.10	7090	7866	\N	\N	16	螗	táng	a kind of cicada
7091	酉 164.7	7091	5674	\N	\N	14	酹	lèi	to pour out a libation; to sprinkle
7092	酉 164.8	7092	5891	\N	\N	15	醅	pēi	unstrained spirits
7093	糸 120.5	7093	\N	\N	\N	11	絅	jiōng	unlined garment, dust coat
7094	糸 120.14	7094	\N	\N	\N	20	纁	xūn	light red, pink
7095	艸 140.9	7095	7314	\N	\N	12	葰	suī	\N
7096	邑 163.6	7096	3984	\N	\N	8	郇	huán	an ancient feudal State in Shaanxi
7097	足 157.13	7097	\N	\N	\N	20	躄	bì	cripple, lame
7098	艸 140.6	7098	4114	\N	\N	9	茼	tóng	Chrysanthemum coronarium
7099	水 85.6	7099	4333	\N	\N	9	洧	wěi	name of a river in honan
7100	水 85.10	7100	7587	\N	\N	13	滠	shè	river in Hubei province
7101	水 85.12	7101	5811	\N	\N	14	澉	gǎn	to wash name of a place
7102	金 167.10	7102	\N	\N	\N	18	鎭	zhèn	town, market place; suppress
7103	金 167.6	7103	7176	\N	\N	11	铏	xíng	sacrificial cauldron
7104	門 169.6	7104	\N	\N	\N	14	閤	gé	small side door; chamber
7105	貝 154.6	7105	7003	\N	\N	10	赆	jìn	farewell present
7106	貝 154.7	7106	4862	\N	\N	11	赇	qiú	bribe
7107	頁 181.11	7107	\N	\N	\N	20	顣	cù	frown
7108	馬 187.12	7108	7280	\N	\N	11	骕	sù	name of a famous horse
7109	風 182.5	7109	4293	\N	\N	9	飑	biāo	storm
7110	言 149.2	7110	6873	\N	\N	9	訄	qiú	(literary) to coerce sb; to compel sb
7111	車 159.7	7111	\N	\N	\N	14	輓	wǎn	mourn; pull; draw
7112	金 167.5	7112	\N	\N	\N	13	鉤	gōu	hook, barb; sickle; stroke with
7113	金 167.8	7113	\N	\N	\N	16	鋹	chǎng	sharp; a keen edge; sharp point
7114	金 167.4	7114	6843	\N	\N	9	钘	xíng	ancient wine vessel
7115	阜 170.5	7115	\N	\N	\N	7	陁	tuó	a steep bank, a declivity
7116	耒 127.16	7116	6464	\N	\N	22	耱	mò	a kind of farm tool
7117	糸 120.13	7117	\N	\N	\N	19	繫	xì	attach, connect, unite, fasten
7118	金 167.7	7118	\N	\N	\N	15	鋵	tū	\N
7119	魚 195.15	7119	\N	\N	\N	26	鱵	zhēn	Hyporhampus sajuri
7120	黑 203.8	7120	\N	\N	\N	20	黨	dǎng	political party, gang, faction
7121	禾 115.2	7121	\N	\N	\N	7	禿	tū	bald, bare, stripped
7122	貝 154.4	7122	\N	\N	\N	11	貧	pín	poor, impoverished, needy
7123	貝 154.5	7123	\N	\N	\N	12	買	mǎi	buy, purchase; bribe, persuade
7124	貝 154.6	7124	\N	\N	\N	13	賈	jiǎ	surname; merchant; buy, trade
7125	木 75.9	7125	\N	\N	\N	13	榀	pǐn	classifier for roof beams and trusses
7126	糸 120.9	7126	\N	\N	\N	15	緣	yuán	hem, margin; reason, cause; karma, fate
7127	月 74.12	7127	\N	\N	\N	16	膶	rùn	(Cant.) liver
7128	艸 140.5	7128	\N	\N	\N	8	茐	cong	\N
7129	虫 142.10	7129	\N	\N	\N	15	螝	guī	\N
7130	言 149.3	7130	\N	\N	\N	10	訙	xùn	\N
7131	言 149.7	7131	\N	\N	\N	14	誘	yòu	persuade, entice, induce; guide
7132	貝 154.8	7132	\N	\N	\N	15	賦	fù	tax; give; endow; army; diffuse
7133	貝 154.11	7133	\N	\N	\N	17	贅	zhuì	unnecessary, superfluous
7134	邑 163.12	7134	\N	\N	\N	14	鄬	wéi	place in Henan province
7135	金 167.3	7135	\N	\N	\N	11	釤	shàn	samarium
7136	金 167.9	7136	\N	\N	\N	16	鍵	jiàn	door bolt, lock bolt; key
7137	門 169.7	7137	\N	\N	\N	14	閮	tíng	\N
7138	隹 172.2	7138	\N	\N	\N	10	隻	zhī	single, one of pair, lone
7139	食 184.5	7139	\N	\N	\N	13	飽	bǎo	to eat till full; satisfied
7140	齒 211.0	7140	\N	\N	\N	15	齒	chǐ	teeth; gears, cogs; age; KangXi radical 211
7141	魚 195.7	7141	\N	\N	\N	18	鯆	pū	the skate or ray
7142	辵 162.9	7142	\N	\N	\N	12	逿	dàng	a time; a row; to fall, miss
7143	魚 195.5	7143	\N	\N	\N	16	鮀	tuó	snakefish
7144	魚 195.8	7144	\N	\N	\N	19	鯝	gù	fish guts
7145	魚 195.9	7145	\N	\N	\N	20	鰁	quán	name of fish
7146	魚 195.13	7146	\N	\N	\N	24	鱤	gǎn	\N
7147	邑 163.7	7147	\N	\N	\N	8	郕	chéng	state in Shandong province
7148	金 167.15	7148	6436	\N	\N	20	镴	là	solder; tin
7149	音 180.10	7149	\N	\N	\N	19	韻	yùn	rhyme; vowel
7150	魚 195.5	7150	\N	\N	\N	16	鮄	fú	gurnard
7151	魚 195.6	7151	7705	\N	\N	14	鲙	kuài	minced fish; hash
7152	魚 195.9	7152	7965	\N	\N	17	鳁	wēn	sardine
7153	鼻 209.5	7153	6400	\N	\N	19	齁	hōu	snore loudly; very, extremely
7154	舌 135.9	7154	\N	\N	\N	15	舖	pù	store, shop
7155	肉 130.13	7155	\N	\N	\N	16	膹	fèn	\N
7156	衣 145.5	7156	\N	\N	\N	10	袣	yì	\N
7157	言 149.12	7157	\N	\N	\N	19	謿	cháo	ridicule, deride, scorn, jeer at
7158	阜 170.7	7158	6908	\N	\N	9	陧	niè	in disorder; a dangerous condition of the State
7159	土 32.4	7159	6561	\N	\N	7	坜	lì	a hole, pit
7160	土 32.5	7160	3839	\N	\N	8	坫	diàn	a stand on which to replace goblets after drinking
7161	瓦 98.11	7161	5649	\N	\N	14	甍	méng	rafters supporting roof tiles
7162	糸 120.7	7162	4699	\N	\N	10	绠	gěng	well rope
7163	心 61.6	7163	6925	\N	\N	10	恝	jiá	carefree; indifferent manner; without sorrow
7164	風 182.10	7164	7711	\N	\N	14	飗	liú	soughing of wind; noise
7165	金 167.11	7165	\N	\N	\N	16	镙	luó	\N
7166	金 167.13	7166	8004	\N	\N	18	镱	yì	ytterbium
7167	馬 187.11	7167	\N	\N	\N	21	騾	luó	mule
7168	鬼 194.8	7168	7955	\N	\N	17	魋	tuí	bear
7169	石 112.7	7169	\N	\N	\N	12	硱	kǔn	\N
7170	示 113.6	7170	\N	\N	\N	10	祫	xiá	triennial sacrifice to ancestors
7171	竹 118.6	7171	\N	\N	\N	12	筍	sǔn	bamboo shoot; joint; tendon
7172	竹 118.8	7172	7691	\N	\N	14	箖	lín	\N
7173	衣 145.5	7173	\N	\N	\N	10	袧	gōu	\N
7174	辵 162.5	7174	\N	\N	\N	8	迯	táo	escape, flee; abscond, dodge
7175	邑 163.7	7175	\N	\N	\N	9	郙	fǔ	to be exiled; delay payment for
7176	酉 164.4	7176	\N	\N	\N	11	酖	zhèn	wine with bird poison added
7177	辵 162.10	7177	7475	\N	\N	13	遘	gòu	to meet; to come across
7178	門 169.10	7178	7579	\N	\N	13	阘	dá	upper-story door or window
7179	目 109.6	7179	4809	\N	\N	11	眭	suī	evil look of deep-set eyes
7180	食 184.7	7180	\N	\N	\N	15	餗	sù	a pot of cooked rice
7181	耒 127.4	7181	4399	\N	\N	10	耖	chào	\N
7182	魚 195.7	7182	\N	\N	\N	18	鯒	yǒng	a flathead (fish)
7183	邑 163.5	7183	3693	\N	\N	7	邶	bèi	name of a feudal state
7184	糸 120.7	7184	\N	\N	\N	13	絼	zhěn	\N
7185	頁 181.14	7185	8055	\N	\N	20	颥	rú	the temporal bone
7186	竹 118.10	7186	7877	\N	\N	16	篚	fěi	round or oval covered-baskets with short legs
7187	魚 195.11	7187	8038	\N	\N	19	鳘	mǐn	codfish
7188	金 167.4	7188	\N	\N	\N	12	䥺	yé	(same as鋣) name of a double-edged sword, (simplified form釾) a chemical element (鎄) (Es)
7189	虍 141.4	7189	7023	\N	\N	10	虒	sī	an amphibious beast resembling a tiger with one horn; place name
7190	衣 145.6	7190	7252	\N	\N	11	裈	kūn	trousers, pants, shorts, drawers
7191	辵 162.9	7191	7419	\N	\N	12	遆	tí	\N
7192	鹿 198.8	7192	8046	\N	\N	19	麑	ní	fawn, young deer
7193	米 119.5	7193	\N	\N	\N	11	粚	lí	variant of 黐
7194	言 149.3	7194	\N	\N	\N	10	託	tuō	entrust, rely on; commission
7195	邑 163.11	7195	7309	\N	\N	12	鄚	mào	surname
7196	車 159.2	7196	\N	\N	\N	9	軌	guǐ	track, rut, path
7197	食 184.12	7197	\N	\N	\N	20	饋	kuì	offer food superior; send gift
7198	金 167.7	7198	\N	\N	\N	15	銳	ruì	sharp, keen, acute, pointed
7199	米 119.4	7199	\N	\N	\N	10	粌	yin	\N
7200	糸 120.4	7200	\N	\N	\N	10	紙	zhǐ	paper
7201	耳 128.12	7201	\N	\N	\N	18	職	zhí	duty, profession; office, post
7202	肉 130.14	7202	\N	\N	\N	18	臏	bìn	the kneecap
7203	艸 140.7	7203	\N	\N	\N	10	莖	jīng	stem, stalk
7204	艸 140.9	7204	\N	\N	\N	12	葌	jiān	\N
7205	豕 152.9	7205	\N	\N	\N	15	豬	zhū	pig, hog
7206	豸 153.8	7206	\N	\N	\N	15	貏	bǐ	\N
7207	辵 162.9	7207	\N	\N	\N	12	違	wéi	disobey, violate, defy; be apart from
7208	邑 163.9	7208	\N	\N	\N	11	鄉	xiāng	country; rural; village
7209	門 169.9	7209	\N	\N	\N	17	闅	wén	\N
7210	門 169.9	7210	\N	\N	\N	17	闊	kuò	broad, ample, wide; be apart
7211	頁 181.2	7211	\N	\N	\N	11	頂	dǐng	top, peak; carry on head; very
7212	食 184.2	7212	\N	\N	\N	10	飢	jī	hunger, starving; hungry; a famine
7213	馬 187.11	7213	\N	\N	\N	21	驅	qū	spur a horse on; expel, drive away
7214	魚 195.0	7214	\N	\N	\N	11	魚	yú	fish; surname; KangXi radical 195
7215	魚 195.9	7215	7968	\N	\N	17	鳉	jiāng	name of fish
7216	鳥 196.6	7216	\N	\N	\N	16	鴱	ài	\N
7217	鳥 196.8	7217	\N	\N	\N	19	鶎	zun	\N
7218	黑 203.11	7218	\N	\N	\N	23	黴	méi	mold, mildew; bacteria, fungi
7219	示 113.8	7219	7446	\N	\N	12	祼	guàn	libation
7220	髟 190.12	7220	\N	\N	\N	22	鬛	liè	variant of鬣U+9B23, a mane
7221	金 167.10	7221	7786	\N	\N	15	镈	bó	large bell; hoe, spade
7222	目 109.10	7222	\N	\N	\N	15	瞓	shuì	to sleep
7223	网 122.10	7223	7779	\N	\N	15	罶	liǔ	fishing trap
7224	羊 123.3	7224	4320	\N	\N	9	羑	yǒu	a guide to goodness
7225	黃 201.5	7225	7912	\N	\N	16	黉	hóng	school
7226	雨 173.9	7226	\N	\N	\N	17	霚	wù	\N
7227	竹 118.5	7227	\N	\N	\N	11	笹	ti	small bamboo
7228	邑 163.6	7228	6706	\N	\N	8	郐	kuài	name of a feudal state, surname
7229	水 85.10	7229	5575	\N	\N	13	溻	tā	wet
7230	骨 188.4	7230	\N	\N	\N	13	骯	āng	dirty
7231	石 112.14	7231	\N	\N	\N	18	礡	bó	fill, extend
7232	衣 145.5	7232	\N	\N	\N	10	袉	tuó	\N
7233	言 149.3	7233	4631	\N	\N	10	訚	yín	speak gently; respectful
7234	言 149.8	7234	\N	\N	\N	10	谉	shěn	to investigate; to try (in court)
7235	艸 140.7	7235	4117	\N	\N	9	莛	tíng	stalks of grasses, etc.
7236	口 30.6	7236	4215	\N	\N	9	哕	huì	belch; vomit
7237	水 85.10	7237	5577	\N	\N	13	滗	bì	drain
7238	水 85.17	7238	8067	\N	\N	20	瀹	yuè	to boil; to wash, to cleanse, to soak
7239	金 167.11	7239	\N	\N	\N	19	鏰	bèng	coin, money
7240	禾 115.7	7240	5203	\N	\N	12	稃	fū	husk; outside shell of grain
7241	目 109.6	7241	\N	\N	\N	11	眰	diè	variant of 眣
7242	目 109.6	7242	\N	\N	\N	11	眳	míng	space between the eyebrows and the eyelashes
7243	矛 110.7	7243	7455	\N	\N	12	矞	yù	bore with awl; bright, charming
7244	石 112.12	7244	7148	\N	\N	11	硚	qiáo	used in place names
7245	示 113.9	7245	7604	\N	\N	13	禋	yīn	offer sacrifice; sacrifice
7246	羽 124.4	7246	7090	\N	\N	10	翀	chōng	fly upward
7247	艸 140.5	7247	6661	\N	\N	8	苾	bì	smell, fragrance, aroma
7248	衣 145.12	7248	7972	\N	\N	17	襕	lán	full length gown (old)
7249	走 156.9	7249	\N	\N	\N	16	趥	qiū	\N
7250	艸 140.6	7250	6790	\N	\N	9	茺	chōng	\N
7251	車 159.6	7251	\N	\N	\N	13	軿	píng	curtained carriage used by women
7252	辵 162.7	7252	\N	\N	\N	10	逌	yōu	please; smiling; complacent
7253	口 30.8	7253	7155	\N	\N	11	唪	fěng	to recite, to intone or chant
7254	广 53.8	7254	7222	\N	\N	11	庳	bì	a low-built house
7255	歹 78.12	7255	6075	\N	\N	16	殪	yì	die; kill, exterminate
7256	阜 170.9	7256	7261	\N	\N	11	隃	shù	to exceed; a state in Shanxi province
7257	米 119.9	7257	7808	\N	\N	15	糈	xǔ	sacrificial rice; rations; pay
7258	魚 195.5	7258	\N	\N	\N	13	鲄	hé	\N
7259	龜 213.0	7259	\N	\N	\N	17	龜	guī	turtle or tortoise; cuckold
7260	石 112.8	7260	\N	\N	\N	13	碕	qí	a cape, spit, promontory
7261	魚 195.7	7261	5971	\N	\N	15	鲣	jiān	skipjack, bonito
7262	糸 120.7	7262	\N	\N	\N	12	綎	tīng	silk braided cord
7263	木 75.6	7263	4456	\N	\N	10	栝	guā	Juniperus chinensis; measuring-frame
7264	車 159.5	7264	6815	\N	\N	9	轵	zhǐ	end of axle; divergent
7265	隹 172.8	7265	\N	\N	\N	16	雔	chóu	\N
7266	頁 181.6	7266	\N	\N	\N	15	頠	wěi	quiet
7267	禾 115.11	7267	\N	\N	\N	16	穈	méi	millet
7268	羽 124.4	7268	6974	\N	\N	10	翃	hóng	fly
7269	肉 130.12	7269	\N	\N	\N	16	膭	guī	\N
7270	行 144.5	7270	7202	\N	\N	11	衒	xuàn	brag; show off, promote oneself
7271	皿 108.4	7271	\N	\N	\N	9	盇	hé	why not? would it not be better to?
7272	石 112.15	7272	\N	\N	\N	19	礦	kuàng	mine; mineral, ore
7273	言 149.13	7273	\N	\N	\N	19	譢	suì	\N
7274	鳥 196.2	7274	\N	\N	\N	13	鳰	ru	\N
7275	辵 162.10	7275	\N	\N	\N	13	遞	dì	hand over, deliver; substitute
7276	鳥 196.5	7276	\N	\N	\N	16	鴫	tian	a snipe
7277	竹 118.5	7277	\N	\N	\N	11	笟	gū	\N
7278	艸 140.8	7278	\N	\N	\N	11	莾	mǎng	\N
7279	艸 140.10	7279	\N	\N	\N	13	蒼	cāng	blue; green
7280	虫 142.12	7280	\N	\N	\N	18	蟬	chán	cicada; continuous
7281	衣 145.5	7281	\N	\N	\N	10	袑	shào	\N
7282	言 149.3	7282	\N	\N	\N	10	訒	rèn	hesitate to say, reluctant to speak
7283	言 149.10	7283	\N	\N	\N	17	講	jiǎng	explain; discuss; talk
7284	言 149.20	7284	\N	\N	\N	26	讝	zhán	\N
7285	貝 154.10	7285	\N	\N	\N	17	購	gòu	buy, purchase; hire
7286	走 156.7	7286	\N	\N	\N	14	趕	gǎn	pursue, follow; expel, drive away
7287	金 167.4	7287	\N	\N	\N	12	鈧	kàng	scandium
7288	金 167.4	7288	\N	\N	\N	12	鈩	lu	fireplace, stove, oven, furnace
7289	門 169.2	7289	\N	\N	\N	10	閃	shǎn	flash; avoid, dodge, evade
7290	門 169.9	7290	\N	\N	\N	16	閷	shài	\N
7291	頁 181.3	7291	\N	\N	\N	13	頉	yí	cheeks; jaw; chin; rear; nourish
7292	髟 190.4	7292	\N	\N	\N	14	髤	xiū	\N
7293	龠 214.9	7293	\N	\N	\N	26	龤	xié	to harmonize; to accord with; to agree
7294	艸 140.14	7294	7923	\N	\N	17	薿	nǐ	flower
7295	魚 195.13	7295	\N	\N	\N	24	鱥	guì	\N
7296	角 148.5	7296	\N	\N	\N	12	觝	dǐ	gore, butt; resist; push
7297	魚 195.7	7297	\N	\N	\N	18	鮻	suō	dace; Canton dace
7298	魚 195.14	7298	8096	\N	\N	22	鳤	guǎn	minnow
7299	禾 115.12	7299	\N	\N	\N	17	穉	zhì	young grain; young, tender
7300	角 148.9	7300	7849	\N	\N	16	觱	bì	tartar horn; chilly wind
7301	車 159.13	7301	\N	\N	\N	20	轘	huán	tear asunder between chariots
7302	金 167.12	7302	\N	\N	\N	20	鐓	duì	ferrule; castrate
7303	竹 118.6	7303	7388	\N	\N	12	筘	kòu	(a measure of width of cloth)
7304	魚 195.6	7304	7719	\N	\N	14	鲝	zhǎ	variant of 苲
7305	目 109.7	7305	\N	\N	\N	12	睏	kùn	be tired, sleepy
7306	艸 140.11	7306	5650	\N	\N	14	蔸	dōu	counter for plant
7307	金 167.11	7307	6115	\N	\N	16	镚	bèng	small coin
7308	疒 104.7	7308	5255	\N	\N	12	痦	wù	(flat) mole
7309	禾 115.6	7309	\N	\N	\N	11	秵	yīn	\N
7310	肉 130.14	7310	\N	\N	\N	18	臎	cuì	\N
7311	艸 140.9	7311	7306	\N	\N	12	葴	zhēn	Physalis alkekengi
7312	虫 142.9	7312	\N	\N	\N	15	蝟	wèi	hedgehog
7313	言 149.2	7313	\N	\N	\N	9	訂	dìng	draw up agreement; arrange
7314	水 85.5	7314	4018	\N	\N	8	泖	mǎo	still waters; river in Jiangsu
7315	馬 187.10	7315	5619	\N	\N	13	骟	shàn	geld, castrate
7316	金 167.9	7316	7681	\N	\N	14	锽	huáng	weapon
7317	牛 93.8	7317	5198	\N	\N	12	犋	jù	\N
7318	目 109.6	7318	4815	\N	\N	11	眵	chī	eyes diseased and dim
7319	耒 127.10	7319	6026	\N	\N	16	耩	jiǎng	to plough. to sow
7320	竹 118.7	7320	5501	\N	\N	13	筢	pá	rake
7321	足 157.15	7321	8093	\N	\N	22	躔	chán	follow in, imitate; rut, path
7322	髟 190.9	7322	6366	\N	\N	19	鬏	jiū	a coiffure on top of the head
7323	黑 203.8	7323	6434	\N	\N	20	黪	cǎn	grey black
7324	貝 154.8	7324	\N	\N	\N	15	䞍	qíng	(simplified form of䝼) to bestow, to confer upon; to grant to
7325	示 113.5	7325	\N	\N	\N	9	祔	fù	worship ancestors
7326	竹 118.8	7326	\N	\N	\N	14	箠	chuí	horse whip; flog
7327	舟 137.5	7327	7204	\N	\N	11	舲	líng	small boat with windows; houseboat
7328	艸 140.10	7328	\N	\N	\N	13	蒷	yún	\N
7329	虫 142.8	7329	\N	\N	\N	14	蜺	ní	reflection of rainbow
7330	衣 145.13	7330	\N	\N	\N	18	襢	tǎn	strip; lay bare; bared; naked
7331	言 149.11	7331	\N	\N	\N	18	謺	zhé	\N
7332	刀 18.14	7332	7755	\N	\N	15	劐	huō	destroy
7333	貝 154.5	7333	\N	\N	\N	12	貯	zhù	store, stockpile, hoard
7334	手 64.10	7334	5357	\N	\N	13	搋	chuāi	to thump
7335	酉 164.8	7335	\N	\N	\N	15	醊	zhuì	to pour wine in a libation
7336	广 53.11	7336	7571	\N	\N	13	廒	áo	a granary
7337	水 85.6	7337	6892	\N	\N	9	洚	jiàng	a flood
7338	肉 130.6	7338	7032	\N	\N	10	胲	hǎi	hydroxylamine (chemistry)
7339	韋 178.15	7339	\N	\N	\N	24	韥	dú	\N
7340	食 184.13	7340	\N	\N	\N	21	饘	zhān	gruel
7341	食 184.7	7341	\N	\N	\N	10	馂	jùn	leftovers
7342	竹 118.6	7342	7391	\N	\N	12	筅	xiǎn	bamboo brush; halberd
7343	魚 195.9	7343	\N	\N	\N	17	鳆	fù	abalone
7344	魚 195.5	7344	7558	\N	\N	13	鲊	zhǎ	minced and salted fish; to preserve
7345	鹿 198.8	7345	\N	\N	\N	19	麗	lì	beautiful, magnificent, elegant
7346	竹 118.11	7346	\N	\N	\N	17	篸	cǎn	a basket, hod, scuttle; a hairclasp
7347	肉 130.8	7347	\N	\N	\N	12	腄	chuí	callus on the hand or foot; upper leg bone of horse or bird; buttocks
7348	肉 130.14	7348	8013	\N	\N	18	臑	nào	soft
7349	言 149.5	7349	6628	\N	\N	7	诐	bì	argue; biased; one-sided
7350	人 9.4	7350	6537	\N	\N	6	仳	pǐ	separate, part company
7351	走 156.12	7351	\N	\N	\N	18	趩	chì	\N
7352	竹 118.10	7352	\N	\N	\N	16	篩	shāi	sieve, filter, screen; sift
7353	竹 118.13	7353	\N	\N	\N	19	簾	lián	a blind, screen, curtain
7354	糸 120.6	7354	\N	\N	\N	12	絪	yīn	matting; coverlet; cloudy
7355	糸 120.8	7355	7277	\N	\N	11	绹	táo	to braid, twist; twisted or braided
7356	肉 130.12	7356	\N	\N	\N	15	膵	cuì	pancreas
7357	艸 140.12	7357	7842	\N	\N	16	蕗	lù	leucacene
7358	虫 142.9	7358	7773	\N	\N	15	蝘	yǎn	gecko, kind of cicada
7359	衣 145.5	7359	\N	\N	\N	11	袠	zhì	book cover; satchel or bag
7360	貝 154.10	7360	\N	\N	\N	17	賸	shèng	leftovers, residue, remains
7361	艸 140.9	7361	7304	\N	\N	12	葙	xiāng	feather cockscomb (Celosia argentea)
7362	辵 162.9	7362	\N	\N	\N	12	遊	yóu	wander, roam, travel
7363	食 184.12	7363	\N	\N	\N	20	饑	jī	starve, be hungry; famine
7364	馬 187.11	7364	\N	\N	\N	20	驀	mò	suddenly, quickly, abruptly
7365	示 113.6	7365	\N	\N	\N	10	祪	guǐ	\N
7366	示 113.9	7366	7606	\N	\N	13	禘	dì	imperial ancestor worship
7367	至 133.8	7367	\N	\N	\N	14	臺	tái	tower, lookout; stage, platform
7368	艸 140.8	7368	7129	\N	\N	11	菍	niè	\N
7369	骨 188.13	7369	\N	\N	\N	21	髒	zāng	dirty; firm; fat
7370	車 159.5	7370	\N	\N	\N	12	軸	zhóu	axle, axletree; pivot; axis
7371	金 167.2	7371	\N	\N	\N	10	釘	dīng	nail, spike; pursue closely
7372	頁 181.2	7372	\N	\N	\N	11	頃	qǐng	a moment; a measure of area equal to 100 mu or 6.7 hectares; to lean
7373	人 9.2	7373	3516	\N	\N	4	仉	zhǎng	surname of the mother of Mencius
7374	气 84.1	7374	6511	\N	\N	5	氕	piē	hydrogen-1, protium
7375	目 109.18	7375	\N	\N	\N	22	矔	guàn	brilliant (of eyes)
7376	糸 120.8	7376	\N	\N	\N	14	緒	xù	end of thread; thread
7377	肉 130.6	7377	\N	\N	\N	10	脅	xié	ribs; armpits; flank; threaten
7378	肉 130.14	7378	\N	\N	\N	17	臒	wò	\N
7379	艸 140.5	7379	\N	\N	\N	8	苿	wèi	\N
7380	艸 140.8	7380	\N	\N	\N	11	菢	bào	to incubate; to brood; to hatch
7381	艸 140.11	7381	\N	\N	\N	14	蔂	léi	basket, hod
7382	艸 140.15	7382	\N	\N	\N	18	藞	lǎ	\N
7383	衣 145.5	7383	\N	\N	\N	10	袩	zhé	\N
7384	貝 154.2	7384	\N	\N	\N	9	貞	zhēn	virtuous, chaste, pure; loyal
7385	貝 154.8	7385	\N	\N	\N	15	賣	mài	sell; betray; show off
7386	足 157.5	7386	\N	\N	\N	12	跍	kū	to squat
7387	足 157.5	7387	\N	\N	\N	12	跓	zhù	\N
7388	足 157.11	7388	\N	\N	\N	18	蹤	zōng	footprints, traces, tracks
7389	車 159.2	7389	\N	\N	\N	9	軍	jūn	army, military; soldiers, troops
7390	邑 163.6	7390	6650	\N	\N	8	邿	shī	a state in Shandong province
7391	邑 163.12	7391	\N	\N	\N	14	鄰	lín	neighbor; neighborhood
7392	酉 164.17	7392	\N	\N	\N	24	醿	mí	\N
7393	金 167.4	7393	\N	\N	\N	12	鈨	yuan	\N
7394	金 167.8	7394	\N	\N	\N	16	鋼	gāng	steel; hard, strong, tough
7395	馬 187.7	7395	\N	\N	\N	17	駵	liú	variant of 骝
7396	馬 187.7	7396	\N	\N	\N	17	駸	qīn	galloping; speeding
7397	魚 195.10	7397	\N	\N	\N	21	鰪	é	\N
7398	魚 195.3	7398	7214	\N	\N	11	鱾	jǐ	name of fish
7399	貝 154.8	7399	\N	\N	\N	15	䝼	jìng	to bestow, to confer upon; to grant to
7400	貝 154.8	7400	\N	\N	\N	15	賨	cóng	tribute paid in cloth by the tribes in Szechwan and Yunnan under the Han dynasty
7401	舟 137.12	7401	\N	\N	\N	18	艞	yào	\N
7402	鳥 196.10	7402	7798	\N	\N	15	鹟	wēng	flycatcher (bird)
7403	金 167.20	7403	\N	\N	\N	28	钁	jué	a mattock; a billhook
7404	革 177.7	7404	\N	\N	\N	16	鞓	tīng	\N
7405	魚 195.9	7405	\N	\N	\N	20	鰉	huáng	sturgeon
7406	皿 108.9	7406	\N	\N	\N	14	監	jiān	supervise, control, direct
7407	禾 115.11	7407	\N	\N	\N	14	穊	jì	plough deep; sown slowly
7408	艸 140.12	7408	\N	\N	\N	15	蕡	fén	hemp seeds; plant with abundant
7409	金 167.16	7409	\N	\N	\N	24	鑨	lóng	\N
7410	木 75.9	7410	\N	\N	\N	13	楱	zòu	\N
7411	革 177.4	7411	\N	\N	\N	13	靹	nà	\N
7412	鳥 196.10	7412	\N	\N	\N	21	鷃	yàn	quail
7413	鼠 208.8	7413	8081	\N	\N	21	鼱	jīng	used in 鼩鼱
7414	目 109.5	7414	\N	\N	\N	10	眫	mǐ	\N
7415	舟 137.7	7415	\N	\N	\N	13	艆	láng	\N
7416	衣 145.10	7416	7826	\N	\N	15	褯	jiè	diaper
7417	刀 18.8	7417	4482	\N	\N	10	剞	jī	carving or engraving knife; grave
7418	艸 140.11	7418	5651	\N	\N	14	蔟	cù	frame on which silkworms spin
7419	革 177.5	7419	5648	\N	\N	14	靿	yào	the leg of a boot
7420	食 184.4	7420	\N	\N	\N	12	飭	chì	order; command; give command
7421	疒 104.11	7421	5983	\N	\N	15	瘼	mò	sickness; distress
7422	酉 164.7	7422	7658	\N	\N	14	酴	tú	leaven, yeast; wine
7423	鼠 208.4	7423	6260	\N	\N	17	鼢	fén	a variety of mole
7424	目 109.7	7424	\N	\N	\N	12	睆	huàn	bright
7425	石 112.5	7425	6972	\N	\N	10	硁	kēng	the sound of stones knocking together
7426	禾 115.5	7426	6853	\N	\N	9	秬	jù	black millet
7427	禾 115.14	7427	\N	\N	\N	19	穪	chēng	to praise
7428	竹 118.7	7428	7545	\N	\N	13	筦	guǎn	a key; to be in charge; a pipe
7429	米 119.6	7429	\N	\N	\N	12	粡	tóng	\N
7430	米 119.5	7430	\N	\N	\N	11	粣	cè	\N
7431	糸 120.7	7431	\N	\N	\N	12	綖	yán	the hanging flap in the front of a hat
7432	衣 145.7	7432	\N	\N	\N	13	裏	lǐ	inside, interior, within
7433	刀 18.5	7433	3818	\N	\N	7	刭	jǐng	cut throat
7434	足 157.7	7434	\N	\N	\N	14	跼	jú	bent, stooped, crouched; contract
7435	艸 140.9	7435	7307	\N	\N	12	蒇	chǎn	finish, complete; solve; complete
7436	手 64.6	7436	\N	\N	\N	9	挢	jiǎo	correct
7437	辵 162.12	7437	\N	\N	\N	15	邆	téng	\N
7438	彡 59.0	7438	\N	\N	\N	3	彡	shān	hair; KangXi radical 59
7439	犬 94.7	7439	4604	\N	\N	10	猃	xiǎn	dog
7440	門 169.9	7440	\N	\N	\N	17	闉	yīn	curved, bent; a curved wall
7441	門 169.9	7441	\N	\N	\N	12	阓	huì	gate of a market
7442	門 169.13	7442	\N	\N	\N	16	阛	huán	wall around market place
7443	革 177.5	7443	5645	\N	\N	14	靺	mò	stocking; the Tungusic tribe
7444	革 177.9	7444	6316	\N	\N	18	鞨	hé	tribe
7445	金 167.6	7445	7185	\N	\N	11	铥	diū	thulium
7446	疒 104.8	7446	7573	\N	\N	13	瘅	dān	to hate bitterly; drought; dry
7447	馬 187.6	7447	\N	\N	\N	16	駰	yīn	grey horse
7448	馬 187.11	7448	\N	\N	\N	21	騻	shuāng	horse
7449	竹 118.8	7449	5748	\N	\N	14	箅	bì	\N
7450	竹 118.8	7450	5752	\N	\N	14	箢	yuān	\N
7451	角 148.4	7451	7218	\N	\N	11	觖	jué	to long for; dissatisfied to criticize
7452	鹿 198.5	7452	\N	\N	\N	16	麆	zhù	\N
7453	齒 211.8	7453	\N	\N	\N	23	齮	yǐ	bite
7454	米 119.7	7454	\N	\N	\N	13	糀	hua	\N
7455	虫 142.2	7455	\N	\N	\N	8	虯	qiú	young dragon
7456	疒 104.9	7456	5782	\N	\N	14	瘊	hóu	warts, pimples
7457	糸 120.7	7457	\N	\N	\N	12	絛	tāo	silk braid, sash
7458	耳 128.12	7458	\N	\N	\N	17	聴	tīng	hear, listen; understand; obey
7459	艸 140.17	7459	\N	\N	\N	20	蘭	lán	orchid; elegant, graceful
7460	言 149.3	7460	\N	\N	\N	5	讬	tuō	entrust, rely on; commission
7461	手 64.9	7461	\N	\N	\N	12	揲	dié	to sort out the stalks used in divination; to fold
7462	金 167.13	7462	8003	\N	\N	18	镮	huán	metal ring; measure of currency
7463	金 167.5	7463	7005	\N	\N	10	钷	pǒ	promethium
7464	目 109.8	7464	\N	\N	\N	13	睪	yì	spy on
7465	石 112.5	7465	\N	\N	\N	10	砲	pào	gun, cannon
7466	禾 115.7	7466	\N	\N	\N	12	稅	shuì	taxes, revenue, duty; tax
7467	羽 124.9	7467	\N	\N	\N	15	翫	wán	careless, play; a legendary archer
7468	艸 140.6	7468	\N	\N	\N	9	荅	dā	answer: small bean; thick
7469	艸 140.8	7469	7133	\N	\N	11	菉	lù	the green bamboo; greenish bamboo
7470	衣 145.5	7470	\N	\N	\N	10	袚	bō	greave; knee-pads; buskins
7471	衣 145.9	7471	\N	\N	\N	14	褋	dié	\N
7472	貝 154.2	7472	\N	\N	\N	6	贠	yuán	member; personnel, staff member
7473	足 157.6	7473	\N	\N	\N	13	跡	jī	search, track, trace
7474	足 157.8	7474	7770	\N	\N	15	踦	yǐ	the shin; to pierce; to touch
7475	辵 162.11	7475	\N	\N	\N	14	遯	dùn	deceive, hide, conceal; flee
7476	金 167.5	7476	\N	\N	\N	12	鉅	jù	steel, iron; great
7477	金 167.10	7477	\N	\N	\N	18	鎌	lián	sickle
7478	雨 173.17	7478	\N	\N	\N	25	靉	ài	cloudy sky; dark, obscure
7479	韭 179.10	7479	\N	\N	\N	19	韲	jī	break or smash into pieces, pulverize
7480	食 184.7	7480	\N	\N	\N	15	餖	dòu	food item set out for show only
7481	鳥 196.10	7481	\N	\N	\N	21	鶺	jí	wagtail
7482	鹿 198.8	7482	\N	\N	\N	19	麕	jūn	muntjac deer, hornless river deer
7483	目 109.13	7483	\N	\N	\N	18	瞼	jiǎn	eyelid
7484	艸 140.8	7484	\N	\N	\N	11	菵	wǎng	\N
7485	虫 142.12	7485	\N	\N	\N	18	蟭	jiāo	very small bug
7486	金 167.8	7486	\N	\N	\N	16	錏	yā	soft steel; ammonium
7487	足 157.8	7487	\N	\N	\N	15	踐	jiàn	trample, tread upon, walk on
7488	車 159.10	7488	\N	\N	\N	17	輾	zhǎn	turn over, roll
7489	金 167.7	7489	\N	\N	\N	15	銷	xiāo	melt, fuse; market, sell; to pass time, finish, cancel
7490	門 169.6	7490	\N	\N	\N	14	閣	gé	chamber, pavilion; cabinet
7491	頁 181.0	7491	\N	\N	\N	9	頁	yè	page, sheet, leaf; rad. no. 181
7492	馬 187.14	7492	\N	\N	\N	24	驟	zhòu	procedure; gallop; sudden(ly)
7493	石 112.10	7493	\N	\N	\N	15	碼	mǎ	number, numerals; yard; symbol
7494	示 113.9	7494	\N	\N	\N	13	禎	zhēn	lucky, auspicious, good omen
7495	示 113.11	7495	\N	\N	\N	17	禦	yù	defend, resist, hold out against
7496	禾 115.8	7496	\N	\N	\N	13	稖	bàng	\N
7497	禾 115.8	7497	\N	\N	\N	13	稟	bǐng	report to, petition
7498	穴 116.15	7498	\N	\N	\N	20	竇	dòu	surname; hole, burrow; corrupt
7499	竹 118.4	7499	\N	\N	\N	10	笇	suàn	\N
7500	竹 118.9	7500	\N	\N	\N	15	篂	xīng	\N
7501	糸 120.9	7501	\N	\N	\N	15	緛	ruǎn	\N
7502	糸 120.9	7502	\N	\N	\N	15	編	biān	knit, weave; arrange; compile
7503	糸 120.11	7503	\N	\N	\N	17	縿	shān	streamer
7504	臼 134.12	7504	\N	\N	\N	17	舊	jiù	old, ancient; former, past
7505	艸 140.11	7505	\N	\N	\N	14	蓴	chún	edible water plant, bracenia
7506	艸 140.12	7506	\N	\N	\N	15	蕚	è	the calyx of a flower; younger brother
7507	艸 140.16	7507	\N	\N	\N	19	蘆	lú	rushes, reeds
7508	虫 142.9	7508	\N	\N	\N	15	蝿	yíng	flies
7509	衣 145.4	7509	\N	\N	\N	10	袃	chài	\N
7510	見 147.9	7510	\N	\N	\N	16	親	qīn	relatives, parents; intimate
7511	言 149.5	7511	\N	\N	\N	12	訴	sù	accuse; sue; inform; narrate
7512	言 149.17	7512	\N	\N	\N	24	讕	lán	accuse falsely; slander, libel
7513	言 149.19	7513	\N	\N	\N	26	讚	zàn	praise, commend, eulogize
7514	貝 154.3	7514	\N	\N	\N	10	財	cái	wealth, valuables, riches
7515	貝 154.13	7515	\N	\N	\N	20	贏	yíng	win; surplus, gain, profit
7516	身 158.12	7516	\N	\N	\N	19	軅	yan	\N
7517	車 159.3	7517	\N	\N	\N	10	軓	fàn	\N
7518	金 167.2	7518	\N	\N	\N	10	釙	pò	polonium
7519	金 167.5	7519	\N	\N	\N	13	鉄	zhí	iron; strong, solid, firm
7520	金 167.8	7520	\N	\N	\N	16	錆	qiāng	the color of a mineral
7521	門 169.8	7521	\N	\N	\N	16	閶	chāng	gate of heaven; main gate of palace
7522	魚 195.8	7522	\N	\N	\N	19	鯕	qí	coryphaena hippurus
7523	鳥 196.9	7523	\N	\N	\N	20	鶕	ān	variant of 鹌
7524	麥 199.4	7524	\N	\N	\N	15	麨	chǎo	\N
7525	言 149.16	7525	\N	\N	\N	23	䜩	yàn	(simplified form of讌) a feast, banquet; to entertain, feast
7526	鳥 196.9	7526	7668	\N	\N	20	䴗	jú	a shrike
7527	肉 130.7	7527	\N	\N	\N	11	脭	chéng	\N
7528	魚 195.8	7528	7886	\N	\N	16	鲯	qí	coryphaena hippurus
7529	金 167.12	7529	\N	\N	\N	20	鐏	zūn	cap
7530	魚 195.5	7530	\N	\N	\N	16	魾	pī	\N
7531	目 109.5	7531	\N	\N	\N	10	眎	shì	look at, inspect, observe, see
7532	目 109.8	7532	\N	\N	\N	13	睞	lài	squint at; sidelong glance
7533	穴 116.5	7533	\N	\N	\N	10	窋	zhú	in a hole
7534	竹 118.16	7534	\N	\N	\N	22	籠	lóng	cage; cage-like basket
7535	糸 120.8	7535	\N	\N	\N	14	綠	lǜ	green; chlorine
7536	糸 120.10	7536	\N	\N	\N	16	縡	zài	matter, affair
7537	糸 120.11	7537	\N	\N	\N	16	縫	fèng	sew, mend
7538	聿 129.7	7538	\N	\N	\N	13	肅	sù	pay respects; reverently
7539	金 167.5	7539	\N	\N	\N	13	鉏	chú	hoe; eradicate, eliminate
7540	言 149.11	7540	\N	\N	\N	18	謦	qìng	to speak softly
7541	麥 199.8	7541	7748	\N	\N	15	麹	qū	yeast, leaven; surname
7542	艸 140.11	7542	\N	\N	\N	14	蔔	bó	radish; other root vegetables
7543	糸 120.12	7543	\N	\N	\N	18	繐	suì	fine cloth
7544	目 109.5	7544	\N	\N	\N	11	眥	zì	eye sockets; corner of the eyes
7545	米 119.8	7545	\N	\N	\N	14	粺	bài	polished rice or millet
7546	糸 120.10	7546	7458	\N	\N	12	缊	yūn	tangled hemp, raveled silk; vague, confused
7547	舟 137.7	7547	\N	\N	\N	13	艈	yù	\N
7548	艸 140.10	7548	7311	\N	\N	12	蓇	gǔ	follicles of plants
7549	虫 142.6	7549	\N	\N	\N	12	蛣	qī	(dung) beetle
7550	足 157.12	7550	6388	\N	\N	19	蹾	dūn	to squat; to crouch
7551	手 64.8	7551	7110	\N	\N	11	掎	jǐ	drag aside, pull; drag one foot
7552	口 30.6	7552	\N	\N	\N	9	哜	jì	sip
7553	邑 163.12	7553	\N	\N	\N	14	鄦	xǔ	vassal state during the Zhou Dynasty, surname
7554	阜 170.7	7554	6909	\N	\N	9	陞	shēng	promote, rise, ascend
7555	韭 179.7	7555	\N	\N	\N	16	韰	xiè	\N
7556	風 182.10	7556	\N	\N	\N	14	飖	yáo	floating in air, drifting with wind
7557	金 167.13	7557	6397	\N	\N	19	镲	chǎ	cymbals
7558	鹿 198.4	7558	\N	\N	\N	15	麃	páo	till, plow
7559	示 113.9	7559	\N	\N	\N	13	禑	wú	happy; used in historical names
7560	竹 118.7	7560	\N	\N	\N	13	筰	zuó	cable
7561	耳 128.6	7561	\N	\N	\N	12	聠	pīng	\N
7562	艸 140.6	7562	\N	\N	\N	9	茷	fá	flutter; flower
7563	虫 142.9	7563	\N	\N	\N	15	螀	jiāng	kind of cicada
7564	衣 145.5	7564	\N	\N	\N	11	袞	gǔn	ceremonial dress worn by the emperor
7565	衣 145.10	7565	\N	\N	\N	16	褧	jiǒng	unlined clothes; light overcoat
7566	貝 154.9	7566	\N	\N	\N	16	賮	jìn	farewell gift
7567	貝 154.9	7567	7526	\N	\N	13	赗	fèng	gift
7568	足 157.8	7568	\N	\N	\N	15	踡	quán	curled, coiled
7569	手 64.9	7569	\N	\N	\N	12	揞	ǎn	to cover (with the hand)
7570	辵 162.10	7570	\N	\N	\N	13	遝	tà	mixed, abundant, assorted
7571	邑 163.16	7571	8005	\N	\N	18	酂	cuó	collect; small administration
7572	邑 163.19	7572	\N	\N	\N	21	酇	zàn	collect; small administration
7573	酉 164.10	7573	\N	\N	\N	16	醜	chǒu	ugly looking, homely; disgraceful
7574	木 75.13	7574	7925	\N	\N	17	檑	léi	logs rolled down in defense of city
7575	雨 173.4	7575	\N	\N	\N	12	雮	mù	\N
7576	毛 82.18	7576	6469	\N	\N	22	氍	qú	fine woollen cloth; a mat used by the emperor in worshipping god
7577	肉 130.8	7577	7403	\N	\N	12	腙	zōng	an organic compound
7578	食 184.4	7578	\N	\N	\N	12	飩	tún	stuffed dumplings
7579	疒 104.6	7579	\N	\N	\N	11	痖	yǎ	dumb
7580	髟 190.4	7580	\N	\N	\N	14	髣	fǎng	similar to, like
7581	髟 190.5	7581	\N	\N	\N	15	髳	máo	state
7582	酉 164.3	7582	6965	\N	\N	10	酎	zhòu	double-fermented wine, vintage wine
7583	魚 195.6	7583	7699	\N	\N	14	鲒	jié	clam; oyster
7584	魚 195.7	7584	7801	\N	\N	15	鲪	jūn	Sebastodes guntheri
7585	鳥 196.13	7585	8018	\N	\N	18	鹯	zhān	hawk; Butastur indicus
7586	鹿 198.10	7586	\N	\N	\N	21	麜	lì	\N
7587	齒 211.10	7587	\N	\N	\N	25	齸	yì	\N
7588	齒 211.10	7588	\N	\N	\N	25	齻	diān	\N
7589	米 119.6	7589	\N	\N	\N	12	粩	lao	\N
7590	言 149.6	7590	\N	\N	\N	13	詣	yì	reach; achievement, accomplishment
7591	阜 170.9	7591	\N	\N	\N	11	隄	dī	dike, embankment
7592	竹 118.12	7592	8009	\N	\N	18	簰	pái	bamboo raft
7593	艸 140.10	7593	\N	\N	\N	12	蒾	mí	\N
7594	艸 140.10	7594	7486	\N	\N	13	蓏	luǒ	fruit of plant; melon
7595	艸 140.14	7595	7838	\N	\N	16	薳	wěi	name of a herb; surname; (Cant.) a plant stem
7596	艸 140.15	7596	\N	\N	\N	18	藛	xiě	\N
7597	虫 142.4	7597	\N	\N	\N	10	蚢	háng	\N
7598	艸 140.10	7598	5384	\N	\N	13	蓠	lí	gracilaria verrucosa
7599	艸 140.11	7599	7643	\N	\N	14	蓰	xǐ	to increase five-fold
7600	辵 162.10	7600	\N	\N	\N	13	遡	sù	go upstream; trace source; formerly
7601	邑 163.6	7601	\N	\N	\N	8	郋	xí	\N
7602	邑 163.11	7602	7576	\N	\N	13	鄜	fū	county in Shanxi province
7603	金 167.8	7603	\N	\N	\N	16	錞	chún	instrument
7604	面 176.0	7604	\N	\N	\N	8	靣	miàn	variant of 面
7605	鳥 196.13	7605	\N	\N	\N	24	鸂	xī	Mandarin duck, Aix galericulata
7606	鹿 198.7	7606	\N	\N	\N	18	麐	lín	female of Chinese unicorn
7607	鹿 198.9	7607	\N	\N	\N	20	麚	jiā	buck, stag
7608	齒 211.6	7608	\N	\N	\N	21	齧	niè	bite, gnaw; wear down, erode
7609	糸 120.5	7609	\N	\N	\N	11	䌷	chōu	(simplified form of紬) a thread; a clue
7610	目 109.7	7610	\N	\N	\N	12	睊	juàn	see, look, gaze at; askance
7611	石 112.5	7611	\N	\N	\N	10	砢	kē	pile of stones
7612	石 112.10	7612	\N	\N	\N	15	碻	què	solid
7613	糸 120.5	7613	\N	\N	\N	11	絃	xián	string on musical instrument
7614	艸 140.7	7614	6950	\N	\N	10	茝	chǎi	aromatic plant, possibly Dahurian angelica
7615	艸 140.8	7615	\N	\N	\N	11	菴	ān	small Buddhist monastery
7616	衣 145.5	7616	\N	\N	\N	10	袥	tuō	\N
7617	衣 145.12	7617	\N	\N	\N	17	襍	zá	mixed, blended; mix, mingle
7618	見 147.5	7618	\N	\N	\N	12	覗	sì	peek
7619	言 149.6	7619	\N	\N	\N	13	詩	shī	poetry; poem, verse, ode
7620	言 149.9	7620	\N	\N	\N	16	諥	zhòng	\N
7621	足 157.4	7621	7163	\N	\N	11	跂	qí	creeping, crawling
7622	辵 162.0	7622	\N	\N	\N	7	辵	chuò	walk; walking; KangXi radical 162
7623	辵 162.13	7623	\N	\N	\N	16	邅	zhān	hesitant, faltering
7624	酉 164.11	7624	7928	\N	\N	17	醨	lí	dregs of wine
7625	頁 181.4	7625	\N	\N	\N	13	頍	kuǐ	raise one's head
7626	疒 104.5	7626	7042	\N	\N	10	疰	zhù	\N
7627	角 148.6	7627	7515	\N	\N	13	觜	zī	beak
7628	鳥 196.6	7628	\N	\N	\N	17	鴿	gē	pigeon, dove; Columba species (various)
7629	竹 118.5	7629	\N	\N	\N	11	笭	líng	bamboo screen
7630	米 119.21	7630	\N	\N	\N	26	糷	làn	\N
7631	糸 120.19	7631	\N	\N	\N	25	纘	zuǎn	continue, carry on, succeed
7632	羽 124.5	7632	\N	\N	\N	11	翉	běn	\N
7633	肉 130.6	7633	\N	\N	\N	10	胵	chī	(Cant.)芙胵, the gizzard and liver of domestic fowl
7634	艸 140.3	7634	\N	\N	\N	6	芖	zhì	\N
7635	艸 140.11	7635	\N	\N	\N	14	蔣	jiǎng	surname; Hydropyrum latifalium
7636	艸 140.11	7636	\N	\N	\N	14	蔦	niǎo	the convovulvus; parasitic plants such as mistletoe; Ribes ambiguum
7637	虫 142.6	7637	\N	\N	\N	12	蛚	liè	Cyrtoxiphus ritsemae
7638	虫 142.6	7638	\N	\N	\N	12	蛯	lao	shrimp
7639	虫 142.7	7639	\N	\N	\N	13	蜏	yǒu	\N
7640	言 149.20	7640	\N	\N	\N	27	讞	yàn	to decide, judge; a verdict, decision
7641	貝 154.9	7641	\N	\N	\N	16	賲	bǎo	\N
7642	金 167.21	7642	\N	\N	\N	29	钃	shǔ	metal
7643	食 184.6	7643	\N	\N	\N	15	餈	cí	rice cake
7644	香 186.10	7644	8006	\N	\N	18	馧	yūn	\N
7645	鹿 198.22	7645	\N	\N	\N	33	麤	cū	rough, coarse, big, rough
7646	鼠 208.10	7646	\N	\N	\N	23	鼶	sī	\N
7647	示 113.14	7647	\N	\N	\N	18	禱	dǎo	pray; entreat, beg, plead; prayer
7648	肉 130.14	7648	\N	\N	\N	18	臓	zàng	internal organs, viscera
7649	金 167.4	7649	\N	\N	\N	12	鈍	dùn	blunt, obtuse; dull; flat; dull-witted
7650	金 167.8	7650	\N	\N	\N	16	錫	xī	tin, stannum; bestow, confer
7651	糸 120.4	7651	\N	\N	\N	10	紛	fēn	in disorder, scattered, tangled
7652	辵 162.10	7652	\N	\N	\N	13	遙	yáo	far away, distant, remote
7653	虫 142.10	7653	7883	\N	\N	16	螣	tè	mythological wingless dragon of
7654	金 167.7	7654	7376	\N	\N	12	铽	tè	terbium
7655	立 117.5	7655	\N	\N	\N	10	竝	bìng	variant of 并
7656	米 119.4	7656	\N	\N	\N	10	粊	bì	\N
7657	糸 120.4	7657	\N	\N	\N	10	紗	shā	gauze, thin silk; yarn, thread
7658	糸 120.5	7658	\N	\N	\N	11	紮	zā	tie, fasten, bind
7659	糸 120.7	7659	\N	\N	\N	13	絺	chī	fine linen; fine hemp fiber
7660	糸 120.7	7660	\N	\N	\N	13	絿	qiú	urgent
7661	糸 120.9	7661	\N	\N	\N	15	緯	wěi	woof; parallels of latitude
7662	肉 130.7	7662	\N	\N	\N	11	脦	de	\N
7663	肉 130.13	7663	\N	\N	\N	16	臇	juǎn	fat, rich; a stew of fish
7664	肉 130.13	7664	\N	\N	\N	19	臋	tún	variant of 臀
7665	艸 140.9	7665	\N	\N	\N	12	葍	fú	plant
7666	艸 140.9	7666	\N	\N	\N	12	葞	mǐ	\N
7667	艸 140.9	7667	\N	\N	\N	12	葯	yào	orris root; leaf of the iris; medicine
7668	艸 140.9	7668	\N	\N	\N	12	葻	lán	\N
7669	艸 140.15	7669	\N	\N	\N	18	藙	yì	dogwood
7670	虫 142.7	7670	\N	\N	\N	13	蜔	diàn	inlaid shell-work
7671	虫 142.10	7671	\N	\N	\N	16	螕	bī	a tick, mite
7672	虫 142.13	7672	\N	\N	\N	19	蟻	yǐ	ants
7673	衣 145.16	7673	\N	\N	\N	22	襲	xí	raid, attack; inherit
7674	角 148.15	7674	\N	\N	\N	21	觼	jué	buckle
7675	角 148.18	7675	8104	\N	\N	25	觿	xī	a bodkin made of ivory, horn
7676	言 149.6	7676	\N	\N	\N	13	詼	huī	tease, joke with; ridicule, mock
7677	言 149.9	7677	\N	\N	\N	16	諝	xū	knowledge; discrimination; treachery
7678	貝 154.4	7678	\N	\N	\N	11	貨	huò	goods, commodities, products
7679	貝 154.5	7679	\N	\N	\N	12	賀	hè	congratulate; send present
7680	走 156.9	7680	\N	\N	\N	16	趧	tí	\N
7681	足 157.5	7681	\N	\N	\N	12	跉	líng	\N
7682	足 157.14	7682	\N	\N	\N	21	躍	yuè	skip, jump, frolic
7683	車 159.3	7683	\N	\N	\N	10	軒	xuān	carriage; high; wide; balcony; surname of the Yellow Emperor
7684	車 159.8	7684	\N	\N	\N	15	輪	lún	wheel; revolve, turn; recur
7685	辵 162.13	7685	\N	\N	\N	17	邉	biān	edge, margin, side, border
7686	邑 163.13	7686	\N	\N	\N	15	鄶	kuài	name of a feudal state, surname
7687	邑 163.17	7687	\N	\N	\N	19	酁	chán	\N
7688	酉 164.17	7688	\N	\N	\N	24	釀	niàng	brew, ferment
7689	金 167.5	7689	\N	\N	\N	13	鈾	yóu	uranium
7690	金 167.5	7690	\N	\N	\N	13	鈿	tián	hairpin; gold inlaid work, filigree
7691	金 167.9	7691	\N	\N	\N	17	鍊	liàn	smelt metals, forge; refine
7692	門 169.8	7692	\N	\N	\N	17	闀	xiàng	\N
7693	門 169.9	7693	\N	\N	\N	17	闄	yǎo	\N
7694	肉 130.9	7694	7554	\N	\N	13	腽	wà	fat
7695	雨 173.11	7695	\N	\N	\N	18	霧	wù	fog, mist, vapor, fine spray
7696	韋 178.3	7696	\N	\N	\N	12	韌	rèn	strong and pliable, resilient; (Cant.) tough, elastic
7697	頁 181.4	7697	\N	\N	\N	13	頎	qí	tall and slim
7698	頁 181.9	7698	\N	\N	\N	18	額	é	forehead; tablet, plaque; fixed
7699	頁 181.13	7699	\N	\N	\N	22	顫	chàn	shiver, tremble; trembling
7700	頁 181.14	7700	\N	\N	\N	23	顬	rú	the temporal bone
7701	髟 190.7	7701	\N	\N	\N	17	髿	suō	\N
7702	鳥 196.5	7702	\N	\N	\N	16	鴣	gū	species of Taiwan pigeon
7703	鳥 196.9	7703	\N	\N	\N	20	鶝	fú	\N
7704	鳥 196.12	7704	\N	\N	\N	23	鷣	yín	\N
7705	齊 210.3	7705	\N	\N	\N	17	齋	zhāi	vegetarian diet; study; to fast, abstain
7706	金 167.7	7706	\N	\N	\N	15	鋊	yù	a poker; brass filings; to file
7707	阜 170.12	7707	\N	\N	\N	14	隤	tuí	to fall in ruins; to collapse
7708	舟 137.14	7708	\N	\N	\N	20	艦	jiàn	warship
7709	言 149.13	7709	\N	\N	\N	20	譟	zào	clamor, noise, din; slander
7710	艸 140.9	7710	7310	\N	\N	12	蒉	kuì	edible amaranth; straw basket
7711	石 112.10	7711	7852	\N	\N	16	磜	qì	\N
7712	糸 120.8	7712	\N	\N	\N	14	綼	bì	\N
7713	車 159.6	7713	\N	\N	\N	13	輋	shē	沙田禾輋, Hong Kong toponym
7714	頁 181.6	7714	\N	\N	\N	15	頨	yǔ	\N
7715	門 169.4	7715	\N	\N	\N	12	閗	dòu	variant of 鬥|斗
7716	魚 195.5	7716	\N	\N	\N	16	鮍	pī	small carp
7717	魚 195.8	7717	\N	\N	\N	19	鯡	fèi	herring
7718	魚 195.8	7718	7889	\N	\N	16	鲹	shēn	a horse mackerel
7719	示 113.10	7719	\N	\N	\N	14	禣	fu	\N
7720	米 119.4	7720	\N	\N	\N	10	粏	tai	\N
7721	糸 120.8	7721	\N	\N	\N	14	綿	mián	cotton wad; wool; soft, downy
7722	肉 130.14	7722	\N	\N	\N	18	臐	xūn	broth
7723	辵 162.4	7723	\N	\N	\N	7	迏	tì	\N
7724	金 167.8	7724	\N	\N	\N	16	鋾	táo	\N
7725	金 167.12	7725	\N	\N	\N	20	鐇	fán	vanadium
7726	金 167.7	7726	5178	\N	\N	12	铻	wú	misfit; disordant; music instrument; hoe
7727	魚 195.7	7727	\N	\N	\N	18	鮼	qīn	\N
7728	黽 205.12	7728	\N	\N	\N	24	鼈	biē	a fresh-water turtle, Trionyx sinensis
7729	辵 162.2	7729	\N	\N	\N	5	込	ru	crowd into, go into
7730	竹 118.11	7730	\N	\N	\N	16	篰	bù	a bamboo basket
7731	疒 104.5	7731	7041	\N	\N	10	痄	zhà	scrofulous swellings and sores, mumps
7732	目 109.7	7732	5123	\N	\N	12	睄	shào	(Cant.) to glance
7733	石 112.11	7733	7850	\N	\N	16	磡	kàn	cliff, ledge, bank; step
7734	穴 116.6	7734	\N	\N	\N	11	窔	yào	corner
7735	竹 118.6	7735	\N	\N	\N	12	筊	xiáo	bamboo rope; bamboo object used
7736	羊 123.14	7736	\N	\N	\N	20	羺	nóu	\N
7737	肉 130.9	7737	\N	\N	\N	13	腪	yùn	\N
7738	肉 130.19	7738	\N	\N	\N	23	臢	zā	dirty; filthy
7739	艸 140.6	7739	6789	\N	\N	9	荄	gāi	roots
7740	艸 140.10	7740	\N	\N	\N	13	蓡	shēn	variant of 参
7741	虫 142.8	7741	\N	\N	\N	14	蝀	dōng	rainbow
7742	言 149.6	7742	\N	\N	\N	13	詥	hé	\N
7743	谷 150.10	7743	\N	\N	\N	17	豀	xī	to quarrel; mean and petty
7744	艸 140.5	7744	6662	\N	\N	8	苠	mín	multitude; skin of bamboo
7745	邑 163.7	7745	\N	\N	\N	9	郞	láng	gentleman
7746	馬 187.8	7746	5032	\N	\N	11	骒	kè	mother horse
7747	戈 62.9	7747	7614	\N	\N	13	戤	gài	to infringe a trade-mark to pledge an article
7748	金 167.6	7748	7184	\N	\N	11	铞	diào	\N
7749	耒 127.7	7749	5339	\N	\N	13	耢	lào	a kind of farm tool
7750	麥 199.6	7750	\N	\N	\N	17	麯	qū	yeast, leaven
7751	禾 115.6	7751	\N	\N	\N	11	秱	tóng	\N
7752	竹 118.7	7752	7543	\N	\N	13	筼	yún	tall bamboo
7753	糸 120.7	7753	\N	\N	\N	13	綈	tí	coarse pongee, kind of heavy silk
7754	羽 124.9	7754	\N	\N	\N	15	翬	huī	pheasant; variegated; to fly
7755	肉 130.7	7755	\N	\N	\N	11	脧	juān	reduce, contract; exploit; reproductive organ of infant
7756	艸 140.7	7756	\N	\N	\N	10	茣	wú	mat, matting
7757	艸 140.8	7757	\N	\N	\N	11	菒	gǎo	\N
7758	艸 140.11	7758	\N	\N	\N	14	蓯	cōng	medicinal herb
7759	艸 140.12	7759	\N	\N	\N	15	蕝	jué	handful
7760	言 149.5	7760	\N	\N	\N	12	詝	zhǔ	wisdom
7761	言 149.11	7761	\N	\N	\N	18	謱	lóu	\N
7762	八 12.16	7762	8023	\N	\N	18	冁	chǎn	smile
7763	足 157.8	7763	\N	\N	\N	15	踧	cù	uneasiness, nervousness; level
7764	艸 140.6	7764	3866	\N	\N	8	茚	yìn	an organic compound
7765	車 159.8	7765	7344	\N	\N	12	辌	liáng	a hearse; a carriage
7766	車 159.9	7766	7511	\N	\N	13	辒	wēn	hearse
7767	邑 163.8	7767	6975	\N	\N	10	郪	qī	name of a stream in Sichuan province
7768	邑 163.11	7768	7574	\N	\N	13	鄘	yōng	state in Henan province
7769	邑 163.11	7769	7510	\N	\N	13	鄠	hù	county in Shanxi province
7770	巾 50.7	7770	6996	\N	\N	10	帱	chóu	cover up; curtain
7771	金 167.4	7771	\N	\N	\N	12	鈇	fū	an ax; a hatchet
7772	糸 120.13	7772	6193	\N	\N	16	缲	qiāo	to reel
7773	隹 172.10	7773	\N	\N	\N	17	雚	guàn	a heron; small cup
7774	隹 172.10	7774	\N	\N	\N	18	雟	xī	sparrow; revolve; place name
7775	音 180.9	7775	\N	\N	\N	17	韺	yīng	music
7776	頁 181.7	7776	\N	\N	\N	16	頵	yūn	(Cant.)大頭頵, a big head
7777	頁 181.10	7777	\N	\N	\N	18	顝	kuī	\N
7778	金 167.11	7778	6114	\N	\N	16	镘	màn	trowel
7779	髟 190.9	7779	\N	\N	\N	19	鬋	jiǎn	forelock, bangs
7780	酉 164.7	7780	7656	\N	\N	14	酾	shāi	strain
7781	魚 195.13	7781	8084	\N	\N	21	鳣	zhān	sturgeon
7782	鳥 196.5	7782	\N	\N	\N	16	鴦	yāng	female mandarin duck (Aix galericulata)
7783	鹿 198.2	7783	7577	\N	\N	13	麀	yōu	female deer; roe, doe
7784	鹿 198.6	7784	\N	\N	\N	17	麉	jiān	\N
7785	鹿 198.6	7785	\N	\N	\N	17	麊	mí	\N
7786	鹿 198.20	7786	\N	\N	\N	30	麣	yán	goat (archaic)
7787	艸 140.15	7787	\N	\N	\N	17	藬	tuī	\N
7788	金 167.11	7788	\N	\N	\N	19	鏘	qiāng	tinkle, clang, jingle
7789	革 177.8	7789	\N	\N	\N	17	鞚	kòng	bridle
7790	風 182.9	7790	7566	\N	\N	13	飔	sī	cool breeze of autumn
7791	鳥 196.4	7791	\N	\N	\N	15	鴃	jué	shrike; butcherbird
7792	齊 210.9	7792	\N	\N	\N	23	齏	jī	break or smash into pieces, pulverize; hash
7793	石 112.12	7793	\N	\N	\N	17	礄	qiáo	place in Sichuan province
7794	言 149.7	7794	\N	\N	\N	14	誥	gào	inform, notify, admonish, order
7795	酉 164.13	7795	\N	\N	\N	20	醲	nóng	strong wine; dense, thick
7796	毛 82.8	7796	5194	\N	\N	12	毳	cuì	fine hair or fur on animals
7797	竹 118.10	7797	\N	\N	\N	16	築	zhú	build, erect; building
7798	糸 120.6	7798	\N	\N	\N	12	絫	lěi	to accumulate
7799	肉 130.8	7799	\N	\N	\N	12	脺	cuì	\N
7800	艸 140.5	7800	6660	\N	\N	8	苧	níng	China grass, ramie (Boehmeria nivea)
7801	虫 142.4	7801	\N	\N	\N	10	蚘	huí	tapeworm
7802	虫 142.9	7802	\N	\N	\N	15	蝺	qǔ	\N
7803	虫 142.18	7803	\N	\N	\N	24	蠶	cán	silkworms
7804	衣 145.6	7804	\N	\N	\N	11	裀	yīn	mat, coverlet; underwear
7805	言 149.6	7805	\N	\N	\N	13	詧	chá	to examine into judicially to find out
7806	豸 153.7	7806	\N	\N	\N	14	貍	lí	a fox-like animal
7807	足 157.8	7807	\N	\N	\N	15	踘	jū	ball
7808	足 157.12	7808	\N	\N	\N	19	蹷	jué	to kick back; to stumble, slip, fall
7809	虫 142.12	7809	\N	\N	\N	17	蟓	xiàng	silkworm
7810	皿 108.11	7810	7882	\N	\N	16	盦	ān	lid of a caldron; Buddhist cloister
7811	目 109.12	7811	\N	\N	\N	14	瞆	kuì	dim
7812	矢 111.12	7812	7947	\N	\N	17	矰	zēng	arrow with attached silk cord
7813	石 112.11	7813	\N	\N	\N	16	磥	lěi	a heap of stones; boulders
7814	示 113.6	7814	\N	\N	\N	10	祮	gào	\N
7815	禾 115.8	7815	\N	\N	\N	13	稛	kǔn	bind
7816	竹 118.9	7816	\N	\N	\N	15	箾	shuò	musical instrument like pan-pipes, bamboo flute
7817	羽 124.4	7817	7091	\N	\N	10	翂	fēn	\N
7818	肉 130.5	7818	\N	\N	\N	9	胊	qú	yoke
7819	艸 140.11	7819	\N	\N	\N	14	蓺	yì	art; talent, ability; craft
7820	艸 140.14	7820	\N	\N	\N	17	薾	ěr	luxuriant growth of flower
7821	衣 145.16	7821	\N	\N	\N	21	襱	lóng	legs of trousers; overalls worn by workmen
7822	襾 146.7	7822	\N	\N	\N	13	覅	fiào	(fanqie contraction of 勿 and 要)
7823	言 149.16	7823	\N	\N	\N	23	讏	wèi	variant of 讆
7824	足 157.5	7824	\N	\N	\N	12	跅	tuò	careless, lax; dissolute
7825	足 157.7	7825	\N	\N	\N	14	踆	cūn	squat
7826	足 157.11	7826	\N	\N	\N	18	蹔	zàn	temporary; fleeting; ephemeral
7827	車 159.3	7827	\N	\N	\N	10	軐	xìn	\N
7828	車 159.3	7828	6585	\N	\N	7	轪	dài	\N
7829	邑 163.11	7829	\N	\N	\N	13	鄤	màn	place in Henan province
7830	酉 164.12	7830	\N	\N	\N	19	醰	tán	bitter taste in wine; rich; full flavoured
7831	金 167.15	7831	\N	\N	\N	23	鑟	dú	\N
7832	金 167.8	7832	\N	\N	\N	11	铔	yà	soft steel; ammonium
7833	門 169.5	7833	\N	\N	\N	13	閛	pēng	the sound of opening or closing the door
7834	阜 170.7	7834	\N	\N	\N	9	陙	chún	\N
7835	雨 173.12	7835	\N	\N	\N	19	霳	lóng	\N
7836	頁 181.9	7836	\N	\N	\N	18	顑	kǎn	yellow
7837	金 167.12	7837	7938	\N	\N	17	镤	pú	protactinium (Pa)
7838	鳥 196.8	7838	\N	\N	\N	19	鵲	què	magpie; Pica species (various)
7839	立 117.5	7839	\N	\N	\N	10	竚	zhù	stand and wait for long time
7840	糸 120.5	7840	\N	\N	\N	11	紩	zhì	to sew
7841	耳 128.9	7841	\N	\N	\N	15	聦	cōng	the hearing, to listen; astute; clever; quick of apprehension
7842	食 184.8	7842	\N	\N	\N	14	餅	bǐng	rice-cakes, biscuits
7843	鳥 196.8	7843	\N	\N	\N	19	鶄	jīng	a kind of water bird
7844	立 117.15	7844	\N	\N	\N	20	競	jìng	contend, vie, compete
7845	竹 118.13	7845	\N	\N	\N	19	簷	yán	eaves of house; brim
7846	米 119.17	7846	8089	\N	\N	22	糵	niè	fermenting grain; grain which has sprouted; yeast
7847	糸 120.4	7847	\N	\N	\N	10	紖	zhèn	a rope for leading cattle or horse
7848	言 149.4	7848	\N	\N	\N	11	訪	fǎng	visit; ask, inquire
7849	豆 151.8	7849	\N	\N	\N	15	豎	shù	vertical; perpendicular; upright
7850	走 156.9	7850	\N	\N	\N	16	趦	zī	unable to move; to falter
7851	隶 171.9	7851	\N	\N	\N	17	隸	lì	be subservient to; servant
7852	示 113.10	7852	\N	\N	\N	14	禠	sī	happy
7853	竹 118.15	7853	\N	\N	\N	21	籓	fān	sieve; basket
7854	金 167.12	7854	7941	\N	\N	17	镥	lǔ	lutetium
7855	皿 108.7	7855	\N	\N	\N	12	盜	dào	rob, steal; thief, bandit
7856	矛 110.5	7856	\N	\N	\N	10	矝	lín	\N
7857	竹 118.5	7857	\N	\N	\N	10	笖	yǐ	\N
7858	竹 118.5	7858	\N	\N	\N	11	笧	cè	to entwine around; check (a current) with a weir
7859	竹 118.12	7859	\N	\N	\N	18	簢	mǐn	\N
7860	竹 118.13	7860	\N	\N	\N	17	簻	zhuā	empty
7861	竹 118.14	7861	\N	\N	\N	20	籌	chóu	chip, tally, token; raise money
7862	米 119.4	7862	\N	\N	\N	10	粍	zhé	millimetre
7863	糸 120.7	7863	\N	\N	\N	13	綍	fú	rope
7864	糸 120.10	7864	\N	\N	\N	16	縕	yūn	tangled hemp, raveled silk; vague, confused
7865	缶 121.13	7865	\N	\N	\N	19	罋	wèng	earthen jar; jar for ashes
7866	网 122.10	7866	\N	\N	\N	15	罷	bà	cease, finish, stop; give up
7867	羽 124.7	7867	\N	\N	\N	13	翜	shà	\N
7868	肉 130.12	7868	\N	\N	\N	16	膰	fán	to cook meat for a sacrifice or offering
7869	肉 130.12	7869	\N	\N	\N	16	膲	jiāo	(medicine) the three divisions of the viscera
7870	艸 140.8	7870	7128	\N	\N	11	菂	dì	\N
7871	艸 140.9	7871	\N	\N	\N	12	葦	wěi	reed
7872	艸 140.13	7872	7843	\N	\N	16	薢	xiè	woody climbing plant
7873	艸 140.16	7873	\N	\N	\N	18	藷	shǔ	yam, tuber, potato
7874	虫 142.10	7874	\N	\N	\N	16	螞	mǎ	ant; leech
7875	虫 142.19	7875	\N	\N	\N	25	蠻	mán	barbarians; barbarous, savage
7876	衣 145.4	7876	\N	\N	\N	9	袀	jūn	\N
7877	衣 145.5	7877	\N	\N	\N	10	袐	bì	\N
7878	見 147.3	7878	\N	\N	\N	10	覍	biàn	\N
7879	言 149.3	7879	\N	\N	\N	10	訌	hòng	confusion; internal strife
7880	言 149.4	7880	\N	\N	\N	11	訛	é	swindle, cheat; erroneous, wrong
7881	言 149.6	7881	\N	\N	\N	13	詿	guà	error, mistake; deceive, mislead
7882	言 149.8	7882	\N	\N	\N	15	諄	zhūn	patient, earnest; earnestly
7883	言 149.12	7883	\N	\N	\N	19	譜	pǔ	register, list, table; musical score
7884	豆 151.3	7884	\N	\N	\N	10	豈	qǐ	how? what?
7885	貝 154.8	7885	\N	\N	\N	15	賢	xián	virtuous, worthy, good; able
7886	貝 154.10	7886	\N	\N	\N	17	賹	yì	\N
7887	辵 162.12	7887	\N	\N	\N	15	遷	qiān	move, shift, change; transfer
7888	金 167.2	7888	\N	\N	\N	10	釛	bā	\N
7889	金 167.4	7889	\N	\N	\N	12	鈣	gài	calcium
7890	金 167.5	7890	\N	\N	\N	13	鈱	mín	\N
7891	金 167.5	7891	\N	\N	\N	13	鈶	sì	\N
7892	金 167.9	7892	\N	\N	\N	17	鍛	duàn	forge metal; temper, refine
7893	金 167.9	7893	\N	\N	\N	17	鍦	shī	\N
7894	金 167.13	7894	\N	\N	\N	21	鐵	tiě	iron; strong, solid, firm
7895	門 169.7	7895	\N	\N	\N	15	閯	shà	\N
7896	門 169.8	7896	\N	\N	\N	16	閺	wén	to look down
7897	門 169.8	7897	\N	\N	\N	16	閻	yán	village gate; surname
7898	阜 170.9	7898	\N	\N	\N	11	隂	yīn	shady, secret, dark; mysterious; cold; the negative of female principle in nature
7899	頁 181.4	7899	\N	\N	\N	13	頌	sòng	laud, acclaim; hymn; ode
7900	頁 181.7	7900	\N	\N	\N	16	頰	jiá	cheeks, jaw
7901	頁 181.8	7901	\N	\N	\N	17	顆	kē	grain, kernel
7902	頁 181.13	7902	\N	\N	\N	22	顪	huì	\N
7903	食 184.5	7903	\N	\N	\N	13	飼	sì	raise animals; feed; nourish
7904	馬 187.5	7904	\N	\N	\N	15	駕	jià	to drive, sail, fly; a cart, carriage
7905	馬 187.5	7905	\N	\N	\N	15	駝	tuó	a camel; humpbacked; to carry on the back
7906	馬 187.12	7906	\N	\N	\N	23	驌	sù	name of a famous horse
7907	馬 187.13	7907	\N	\N	\N	23	驘	luó	mule
7908	魚 195.9	7908	\N	\N	\N	20	鰠	sāo	carp
7909	魚 195.11	7909	\N	\N	\N	22	鰹	jiān	skipjack, bonito
7910	魚 195.6	7910	7703	\N	\N	14	鲗	zéi	cuttlefish
7911	鳥 196.9	7911	\N	\N	\N	20	鶒	chì	a duck-like bird
7912	鳥 196.9	7912	\N	\N	\N	20	鶗	tí	a kind of hawk; cuckoo
7913	鳥 196.12	7913	\N	\N	\N	23	鷥	sī	egret; Egretta garzetta
7914	鳥 196.13	7914	\N	\N	\N	24	鷹	yīng	eagle, falcon; Accipiter species (various)
7915	齊 210.0	7915	\N	\N	\N	14	齊	qí	even, uniform, of equal length
7916	石 112.6	7916	7147	\N	\N	11	硙	wéi	stone mill; grind; break apart
7917	示 113.10	7917	\N	\N	\N	15	禜	yǒng	sacrifice
7918	米 119.11	7918	\N	\N	\N	16	糢	mó	rice snacks
7919	艸 140.15	7919	6321	\N	\N	18	藠	jiào	\N
7920	金 167.12	7920	6248	\N	\N	17	镦	duì	ferrule; castrate
7921	艸 140.12	7921	\N	\N	\N	15	蕂	shèng	sesame
7922	雨 173.12	7922	\N	\N	\N	20	霮	dàn	denseness of clouds
7923	水 85.4	7923	3781	\N	\N	7	沩	wéi	name of a river in Shanxi
7924	風 182.10	7924	\N	\N	\N	18	颼	sōu	sound of wind; blow chilly
7925	示 113.13	7925	\N	\N	\N	17	禬	guì	\N
7926	鳥 196.5	7926	\N	\N	\N	16	鴪	yù	swoop
7927	魚 195.6	7927	\N	\N	\N	17	鮨	yì	seasoned rice mixed with fish or vegetables
7928	魚 195.13	7928	\N	\N	\N	24	鱣	zhān	sturgeon
7929	皿 108.8	7929	\N	\N	\N	13	盝	lù	drip
7930	目 109.6	7930	\N	\N	\N	11	眹	zhèn	pupil
7931	目 109.8	7931	\N	\N	\N	13	睖	lèng	to stare straight ahead
7932	石 112.11	7932	\N	\N	\N	16	磫	zōng	\N
7933	示 113.12	7933	\N	\N	\N	16	禫	dàn	sacrifice at the end of mourning
7934	糸 120.13	7934	\N	\N	\N	18	繨	da	a knot (of a rope)
7935	艸 140.13	7935	\N	\N	\N	16	薦	jiàn	offer, present; recommend
7936	衣 145.10	7936	\N	\N	\N	16	褱	huái	to carry in the bosom or the sleeve; to wrap, to conceal
7937	金 167.11	7937	\N	\N	\N	19	鏏	wèi	\N
7938	魚 195.5	7938	\N	\N	\N	16	鮁	bō	the bonito
7939	鳥 196.8	7939	\N	\N	\N	13	鹓	yuān	co-worker
7940	糸 120.12	7940	\N	\N	\N	18	繟	chǎn	\N
7941	糸 120.13	7941	\N	\N	\N	19	繺	shǎi	\N
7942	水 85.5	7942	\N	\N	\N	8	沲	tuó	float
7943	食 184.8	7943	\N	\N	\N	16	餦	zhāng	candy, pastry
7944	竹 118.10	7944	\N	\N	\N	16	篤	dǔ	deep, true, sincere, genuine
7945	足 157.8	7945	5918	\N	\N	15	踺	jiàn	somersault (in gymnastics or dance); head-over-heels; aerial flip
7946	示 113.7	7946	\N	\N	\N	11	祦	wú	happiness; good fortune good luck; blessing; bliss
7947	竹 118.11	7947	\N	\N	\N	17	篲	huì	broomstick
7948	米 119.14	7948	\N	\N	\N	20	糰	tuán	rice ball
7949	糸 120.6	7949	\N	\N	\N	12	絙	huán	\N
7950	糸 120.15	7950	\N	\N	\N	19	纄	péng	\N
7951	肉 130.7	7951	\N	\N	\N	11	脝	hēng	distend
7952	艸 140.5	7952	\N	\N	\N	8	茊	zī	variant of 兹
7953	艸 140.8	7953	\N	\N	\N	11	菫	jǐn	celery, aconite
7954	艸 140.10	7954	\N	\N	\N	16	蓞	dàn	\N
7955	酉 164.6	7955	7336	\N	\N	12	酦	fā	fermentation, brewing
7956	酉 164.17	7956	8102	\N	\N	24	醾	mí	unfiltered wine; wine brewed twice
7957	金 167.8	7957	7531	\N	\N	13	锳	yīng	(onom.) ring; tinkle
7958	金 167.5	7958	\N	\N	\N	10	钶	ē	columbium
7959	魚 195.9	7959	6276	\N	\N	17	鲼	fèn	fish
7960	鼻 209.9	7960	\N	\N	\N	23	齄	zhā	red sores on nose
7961	鳥 196.5	7961	\N	\N	\N	16	鴨	yā	duck; Anas species (various)
7962	鳥 196.12	7962	\N	\N	\N	23	鷧	yì	cormorant
7963	手 64.5	7963	3848	\N	\N	8	㧟	kuǎi	(simplified form of擓) to wipe; to scrub; to rub, to dust; to clean, (a dialect) to scratch with fingers lightly, (a dialect) to carry on the arm
7964	示 113.4	7964	6728	\N	\N	8	祋	duì	\N
7965	竹 118.9	7965	\N	\N	\N	15	箯	biān	bamboo palanquin
7966	米 119.4	7966	\N	\N	\N	10	粐	hu	\N
7967	米 119.6	7967	\N	\N	\N	12	粦	lín	phosphorus
7968	米 119.6	7968	\N	\N	\N	12	粭	he	\N
7969	糸 120.3	7969	\N	\N	\N	9	紃	xún	a cord
7970	肉 130.7	7970	\N	\N	\N	11	脰	dòu	the neck
7971	艸 140.3	7971	6526	\N	\N	6	芃	péng	luxuriant growth
7972	艸 140.5	7972	\N	\N	\N	8	苽	gū	bulrush, Zizania latifolia
7973	艸 140.8	7973	7123	\N	\N	11	莿	cì	thorn
7974	艸 140.8	7974	\N	\N	\N	11	菆	zōu	jungle
7975	艸 140.15	7975	\N	\N	\N	17	藗	sù	\N
7976	艸 140.15	7976	\N	\N	\N	18	藧	huàn	\N
7977	衣 145.6	7977	\N	\N	\N	11	袵	rèn	lapel; hidden lapel of coat
7978	衣 145.8	7978	\N	\N	\N	13	裯	chóu	coverlet; bedspread
7979	衣 145.11	7979	\N	\N	\N	15	褵	lí	bridal veil
7980	衣 145.12	7980	\N	\N	\N	17	襆	fú	hood or cowl
7981	言 149.6	7981	\N	\N	\N	13	詤	huǎng	to make wild statements to lie; to misstate; lies falsehood
7982	言 149.12	7982	\N	\N	\N	19	譓	huì	\N
7983	足 157.5	7983	\N	\N	\N	12	跊	mèi	\N
7984	身 158.17	7984	\N	\N	\N	24	軈	ying	soon after, soon; almost; no more than; after all
7985	艸 140.5	7985	3862	\N	\N	8	苘	qǐng	Indian mallow
7986	辵 162.6	7986	6807	\N	\N	9	迺	nǎi	then, thereupon, only then
7987	手 64.8	7987	7106	\N	\N	11	掭	tiàn	to manipulate; a pricker for a lamp-wick
7988	辵 162.14	7988	\N	\N	\N	17	邇	ěr	be near, be close; recently
7989	邑 163.3	7989	6508	\N	\N	5	邘	yú	state in Henan province
7990	邑 163.13	7990	\N	\N	\N	15	鄳	méng	\N
7991	犬 94.9	7991	\N	\N	\N	12	猸	méi	a kind of animal
7992	色 139.5	7992	7257	\N	\N	11	艴	fú	the countenance changing
7993	金 167.15	7993	\N	\N	\N	23	鑕	zhì	tungsten, wolfram
7994	木 75.5	7994	6799	\N	\N	9	柃	líng	Eurya japonica
7995	門 169.10	7995	\N	\N	\N	18	闒	tà	upper-story door or window
7996	毛 82.9	7996	5512	\N	\N	13	毹	shū	rug
7997	肉 130.7	7997	7210	\N	\N	11	脶	luó	lines
7998	頁 181.6	7998	7385	\N	\N	12	颋	tǐng	straight
7999	鳥 196.6	7999	\N	\N	\N	17	鵀	rén	hoopoe
8000	鳥 196.9	8000	\N	\N	\N	19	鶜	máo	\N
8001	鳥 196.9	8001	\N	\N	\N	20	鶟	tú	\N
8002	鳥 196.12	8002	\N	\N	\N	23	鷱	gāo	\N
8003	鳥 196.12	8003	\N	\N	\N	23	鷲	jiù	condor, vulture
8004	鳥 196.8	8004	7518	\N	\N	13	鹍	kūn	a bird resembling the crane
8005	鹿 198.8	8005	8047	\N	\N	19	麖	jīng	red deer
8006	金 167.19	8006	\N	\N	\N	28	䦆	jué	(simplified form) a big hoe, to eliminate; to uproot; to clear; to dig; to excavate
8007	車 159.3	8007	\N	\N	\N	10	軎	wèi	a brass parts for a cart in ancient China
8008	禾 115.7	8008	5204	\N	\N	12	稂	láng	grass; weeds
8009	艸 140.10	8009	\N	\N	\N	13	蒞	lì	reach, arrive; manage
8010	虫 142.13	8010	\N	\N	\N	18	蠆	chài	a kind of scorpion; a sting in the tail
8011	衣 145.10	8011	\N	\N	\N	15	褲	kù	trousers, pants
8012	人 9.5	8012	\N	\N	\N	7	佧	kǎ	ancient name for an ethnic group in China
8013	糸 120.5	8013	\N	\N	\N	11	紵	zhù	ramie; sack cloth
8014	糸 120.8	8014	\N	\N	\N	14	緌	ruí	tassels hanging from hat
8015	虫 142.21	8015	\N	\N	\N	27	蠾	zhú	\N
8016	衣 145.8	8016	\N	\N	\N	13	裲	liǎng	waistcoat
8017	邑 163.6	8017	6704	\N	\N	8	郈	hòu	place in Shandong province
8018	金 167.7	8018	\N	\N	\N	15	鋐	hóng	utensil; implement
8019	食 184.9	8019	\N	\N	\N	17	餱	hóu	dry goods, dry provisions
8020	瓜 97.5	8020	7027	\N	\N	10	瓞	dié	young melons just forming
8021	馬 187.13	8021	\N	\N	\N	23	驙	zhān	(horse)
8022	魚 195.8	8022	\N	\N	\N	19	鯙	chún	Scomberomorus sinensis
8023	目 109.4	8023	\N	\N	\N	9	眆	fǎng	indistinct
8024	目 109.8	8024	\N	\N	\N	13	睠	juàn	to care for; love
8025	目 109.12	8025	7932	\N	\N	17	瞫	shěn	look
8026	目 109.14	8026	\N	\N	\N	19	矅	yào	\N
8027	石 112.8	8027	7504	\N	\N	13	碃	qìng	(stone)
8028	示 113.8	8028	\N	\N	\N	12	禃	zhí	\N
8029	禾 115.4	8029	\N	\N	\N	9	秔	jīng	non-glutinous rice
8030	穴 116.3	8030	\N	\N	\N	8	穻	yū	\N
8031	竹 118.8	8031	\N	\N	\N	14	箇	gè	numerary adjunct, piece; single
8032	竹 118.15	8032	\N	\N	\N	21	籐	téng	climbing plants, vines, cane
8033	糸 120.6	8033	\N	\N	\N	12	絏	xiè	rope, cable; reins; to tie up, bind
8034	糸 120.17	8034	\N	\N	\N	23	纕	rǎng	belt
8035	羽 124.5	8035	\N	\N	\N	11	翐	zhì	\N
8036	老 125.5	8036	\N	\N	\N	11	耈	gǒu	old age
8037	而 126.3	8037	\N	\N	\N	9	耎	ruǎn	weak, pliable, soft, yielding
8038	肉 130.7	8038	\N	\N	\N	11	脷	lì	(Cant.) tongue
8039	肉 130.11	8039	\N	\N	\N	15	膕	guó	hollow
8040	舟 137.9	8040	\N	\N	\N	15	艐	kè	\N
8041	色 139.18	8041	\N	\N	\N	24	艷	yàn	beautiful, sexy, voluptuous
8042	艸 140.5	8042	\N	\N	\N	8	苙	lì	a pig-sty; a kind of medicinal plant
8043	艸 140.9	8043	\N	\N	\N	12	葹	shī	kind of chrysanthemum, xanthium
8044	艸 140.10	8044	7489	\N	\N	13	蓂	míng	lucky place
8045	艸 140.11	8045	\N	\N	\N	14	蔲	kòu	nutmeg
8046	艸 140.13	8046	\N	\N	\N	16	薋	cí	\N
8047	虫 142.7	8047	\N	\N	\N	13	蛷	qiú	\N
8048	虫 142.7	8048	\N	\N	\N	12	蜑	dàn	egg
8049	血 143.3	8049	\N	\N	\N	9	衂	niù	to be defeated
8050	血 143.18	8050	\N	\N	\N	24	衋	xì	sad (old)
8051	衣 145.6	8051	\N	\N	\N	11	袿	guī	gown
8052	言 149.3	8052	\N	\N	\N	10	訕	shàn	abuse, slander; vilify; ridicule
8053	言 149.4	8053	\N	\N	\N	11	訝	yà	express surprise, be surprised
8054	言 149.5	8054	\N	\N	\N	12	詠	yǒng	sing, hum, chant
8055	言 149.8	8055	\N	\N	\N	15	誳	qū	\N
8056	言 149.8	8056	\N	\N	\N	15	諆	qī	to cheat
8057	言 149.3	8057	6521	\N	\N	5	讱	rèn	hesitate to say, reluctant to speak
8058	身 158.12	8058	\N	\N	\N	19	軃	duǒ	variant of 亸
8059	車 159.14	8059	\N	\N	\N	20	轝	yù	envy; hate, dislike; resentment
8060	邑 163.6	8060	\N	\N	\N	8	郀	kū	\N
8061	邑 163.8	8061	\N	\N	\N	10	郵	yóu	postal, mail; post office
8062	金 167.5	8062	\N	\N	\N	13	鉐	shí	\N
8063	金 167.9	8063	\N	\N	\N	17	鍧	hōng	\N
8064	金 167.9	8064	\N	\N	\N	17	鍼	zhēn	needle, pin, tack; prick; inject
8065	金 167.11	8065	\N	\N	\N	19	鏦	cōng	a short spear
8066	金 167.17	8066	6473	\N	\N	22	镵	chán	spade, trowel
8067	門 169.7	8067	\N	\N	\N	14	閭	lǘ	village of twenty-five families
8068	門 169.13	8068	\N	\N	\N	21	闢	pì	open; settle, develop, open up
8069	阜 170.7	8069	\N	\N	\N	9	陗	qiào	a steep hill; precipitous
8070	阜 170.9	8070	\N	\N	\N	10	陼	zhǔ	islet
8071	革 177.15	8071	\N	\N	\N	23	韈	wà	socks, stockings
8072	骨 188.3	8072	\N	\N	\N	12	骫	wěi	be bent, crooked (of bones)
8073	骨 188.5	8073	\N	\N	\N	14	骳	bèi	\N
8074	骨 188.6	8074	\N	\N	\N	15	骹	qiāo	(Cant.) a joint
8075	髟 190.2	8075	\N	\N	\N	12	髠	kūn	shave head as punishment; prune
8076	髟 190.4	8076	\N	\N	\N	14	髥	rán	beard; mustache
8077	魚 195.10	8077	8016	\N	\N	18	鳒	jiān	big-mouthed flounder
8078	鳥 196.9	8078	\N	\N	\N	20	鶡	hé	crossbill, species of nightingale
8079	龍 212.5	8079	\N	\N	\N	21	龒	lóng	dragon
8080	竹 118.13	8080	\N	\N	\N	19	籂	shi	\N
8081	羽 124.10	8081	7915	\N	\N	16	翯	hè	glistening plumage; reflection of the sun on water
8082	艸 140.7	8082	\N	\N	\N	9	莚	yán	bamboo mat; feast, banquet
8083	艸 140.8	8083	\N	\N	\N	11	萗	cè	\N
8084	車 159.4	8084	\N	\N	\N	11	転	zhuǎn	shift, move, turn
8085	邑 163.13	8085	\N	\N	\N	15	鄷	fēng	variant of 酆
8086	革 177.3	8086	\N	\N	\N	12	靭	rèn	strong and pliable, resilient
8087	食 184.10	8087	7411	\N	\N	12	馉	gǔ	\N
8088	馬 187.9	8088	\N	\N	\N	19	騙	piàn	swindle, cheat out of, defraud
8089	馬 187.12	8089	\N	\N	\N	20	驊	huá	an excellent horse
8090	鼠 208.7	8090	\N	\N	\N	20	鼰	niàn	\N
8091	糸 120.7	8091	\N	\N	\N	13	綑	kǔn	coil, roll, bundle, tie up
8092	糸 120.11	8092	\N	\N	\N	17	績	jī	spin; achievements
8093	肉 130.15	8093	\N	\N	\N	19	臘	là	year end sacrifice; dried meat
8094	肉 130.16	8094	\N	\N	\N	20	臛	huò	broth
8095	貝 154.8	8095	\N	\N	\N	15	賜	cì	give, bestow favors; appoint
8096	貝 154.12	8096	\N	\N	\N	19	贈	zèng	give present; bestow, confer
8097	足 157.11	8097	\N	\N	\N	18	蹣	pán	to jump over; to limp
8098	車 159.4	8098	\N	\N	\N	11	軡	qián	variant of 黔
8099	金 167.8	8099	\N	\N	\N	16	鋸	jù	a saw; to saw; amputate
8100	金 167.8	8100	\N	\N	\N	16	錐	zhuī	gimlet, awl, drill, auger; bore
8101	頁 181.9	8101	\N	\N	\N	18	顎	è	jaw
8102	目 109.10	8102	\N	\N	\N	15	瞐	mò	\N
8103	金 167.7	8103	\N	\N	\N	15	銶	qiú	chisel
8104	金 167.3	8104	6691	\N	\N	8	钖	yáng	frontlet
8105	目 109.14	8105	\N	\N	\N	19	矊	mián	\N
8106	目 109.20	8106	\N	\N	\N	25	矘	tǎng	\N
8107	目 109.21	8107	\N	\N	\N	26	矚	zhǔ	watch carefully, stare at, focus on
8108	矛 110.20	8108	\N	\N	\N	25	矡	jué	\N
8109	石 112.8	8109	\N	\N	\N	13	硽	yān	\N
8110	石 112.12	8110	\N	\N	\N	17	磿	lì	\N
8111	石 112.13	8111	\N	\N	\N	17	礈	zhuì	\N
8112	石 112.14	8112	\N	\N	\N	18	礜	yù	arsenic
8113	禾 115.6	8113	\N	\N	\N	11	秲	zhì	\N
8114	穴 116.10	8114	\N	\N	\N	15	窮	qióng	poor, destitute, impoverished
8115	穴 116.13	8115	\N	\N	\N	18	竄	cuàn	run away; revise, edit; expel
8116	竹 118.5	8116	\N	\N	\N	11	笗	dōng	\N
8117	竹 118.8	8117	\N	\N	\N	14	箘	jùn	fine bamboo
8118	竹 118.9	8118	\N	\N	\N	15	箽	dǒng	\N
8119	竹 118.11	8119	\N	\N	\N	17	簍	lǒu	bamboo basket
8120	竹 118.12	8120	\N	\N	\N	18	簜	dàng	bamboo
8121	米 119.8	8121	\N	\N	\N	14	粷	jú	\N
8122	糸 120.6	8122	\N	\N	\N	12	絨	róng	silk, cotton, or woolen fabric
8123	糸 120.7	8123	\N	\N	\N	13	絹	juàn	kind of thick stiff silk
8124	糸 120.9	8124	\N	\N	\N	15	緷	yùn	\N
8125	糸 120.9	8125	\N	\N	\N	16	緻	zhì	delicate, fine; dense
8126	糸 120.11	8126	\N	\N	\N	17	繉	hún	\N
8127	糸 120.12	8127	\N	\N	\N	18	繙	fān	to interpret; to flap, flutter in the wind
8128	缶 121.8	8128	\N	\N	\N	14	罁	gāng	a cistern; an earthenware jar of large dimensions; a vat; a crock
8129	网 122.14	8129	\N	\N	\N	19	羅	luó	net for catching birds; gauze
8130	网 122.17	8130	\N	\N	\N	22	羇	jī	inn; lodge; travel
8131	耳 128.8	8131	\N	\N	\N	14	聣	ní	\N
8132	耳 128.11	8132	\N	\N	\N	17	聰	cōng	intelligent, clever, bright
8133	肉 130.7	8133	\N	\N	\N	11	脙	xiū	\N
8134	肉 130.7	8134	\N	\N	\N	11	脛	jìng	shinbone; calf of leg
8135	肉 130.8	8135	\N	\N	\N	12	脻	jiē	\N
8136	肉 130.8	8136	\N	\N	\N	12	脼	liǎng	\N
8137	肉 130.8	8137	\N	\N	\N	12	腗	pí	\N
8138	舟 137.11	8138	\N	\N	\N	17	艜	dài	a long narrow vessel with two masts; (Cant.) a rudder
8139	艸 140.8	8139	\N	\N	\N	11	萊	lái	goosefoot, weed; fallow field
8140	艸 140.9	8140	\N	\N	\N	12	葘	zī	\N
8141	艸 140.9	8141	\N	\N	\N	12	葢	gài	cover, hide, protect
8142	艸 140.11	8142	\N	\N	\N	14	蔥	cōng	scallions, onions, leeks
8143	艸 140.14	8143	\N	\N	\N	17	藍	lán	blue; indigo plant; surname
8144	艸 140.15	8144	\N	\N	\N	18	藘	lǘ	madder
8145	艸 140.15	8145	\N	\N	\N	18	藝	yì	art; talent, ability; craft
8146	艸 140.19	8146	\N	\N	\N	22	蘿	luó	type of creeping plant; turnip
8147	虫 142.6	8147	\N	\N	\N	12	蛬	qióng	\N
8148	虫 142.10	8148	\N	\N	\N	15	螁	ban	\N
8149	虫 142.10	8149	\N	\N	\N	16	螚	nài	Eristalis tenax
8150	虫 142.10	8150	\N	\N	\N	16	螤	zhōng	\N
8151	衣 145.4	8151	\N	\N	\N	9	袇	rán	\N
8152	衣 145.5	8152	\N	\N	\N	11	袌	bào	\N
8153	衣 145.5	8153	\N	\N	\N	10	袔	hè	\N
8154	衣 145.5	8154	\N	\N	\N	10	袦	nà	\N
8155	衣 145.5	8155	\N	\N	\N	10	袨	xuàn	\N
8156	襾 146.5	8156	\N	\N	\N	10	覂	fěng	to throw a rider
8157	言 149.2	8157	\N	\N	\N	9	訃	fù	obituary; give notice of death
8158	言 149.3	8158	\N	\N	\N	10	訋	diào	\N
8159	言 149.6	8159	\N	\N	\N	13	詫	chà	to brag; exaggerated; to wonder at
8160	言 149.6	8160	\N	\N	\N	13	詬	gòu	abuse, scold, berate, insult
8161	言 149.6	8161	\N	\N	\N	13	詮	quán	explain, expound, comment on
8162	言 149.6	8162	\N	\N	\N	13	詻	è	orders
8163	言 149.7	8163	\N	\N	\N	13	誠	chéng	sincere, honest; true, real
8164	言 149.11	8164	\N	\N	\N	18	謬	miù	error, exaggeration; erroneous
8165	言 149.12	8165	\N	\N	\N	18	譃	xū	\N
8166	言 149.12	8166	\N	\N	\N	19	譄	zēng	\N
8167	言 149.13	8167	\N	\N	\N	20	譯	yì	translate; decode; encode
8168	言 149.14	8168	\N	\N	\N	20	譽	yù	fame, reputation; praise
8169	貝 154.9	8169	\N	\N	\N	16	賰	chǔn	plentiful, wealthy or rich; handsome (pay, gifts, etc.)
8170	走 156.13	8170	\N	\N	\N	20	趮	zào	easily provoked, hasty; fierce, cruel
8171	足 157.12	8171	\N	\N	\N	19	蹱	zhōng	to stagger along; to fall
8172	車 159.4	8172	\N	\N	\N	11	軙	chén	a Chinese family name to arrange; to display wheel
8173	車 159.4	8173	\N	\N	\N	11	軠	rèn	variant of 軖
8174	車 159.8	8174	\N	\N	\N	15	輩	bèi	generation, lifetime; class
8175	辛 160.12	8175	\N	\N	\N	19	辭	cí	words, speech, expression, phrase
8176	辵 162.10	8176	\N	\N	\N	13	遜	xùn	humble, modest; yield
8177	邑 163.12	8177	\N	\N	\N	14	鄧	dèng	surname
8178	邑 163.12	8178	7720	\N	\N	14	鄫	zēng	Zhou vassal state, surname
8179	邑 163.16	8179	\N	\N	\N	17	鄿	jī	county in Xinjiang province
8180	邑 163.16	8180	\N	\N	\N	18	酀	yàn	\N
8181	金 167.2	8181	\N	\N	\N	10	釡	fǔ	cauldron, pot, kettle
8182	金 167.2	8182	\N	\N	\N	10	釢	nǎi	(old) neodymium; neptunium (chemistry)
8183	金 167.5	8183	\N	\N	\N	13	鉃	shì	\N
8184	金 167.9	8184	\N	\N	\N	17	鍍	dù	plate, coat, gild
8185	金 167.9	8185	\N	\N	\N	17	鍎	tú	\N
8186	金 167.10	8186	\N	\N	\N	18	鎖	suǒ	lock, padlock; shackles, chains
8187	門 169.9	8187	\N	\N	\N	17	闃	qù	alone; quiet, still
8188	革 177.7	8188	\N	\N	\N	15	鞗	tiáo	reins
8189	韭 179.8	8189	\N	\N	\N	17	韱	xiān	wild onions or leeks
8190	頁 181.7	8190	\N	\N	\N	16	頹	tuí	ruined, decayed; disintegrate
8191	頁 181.10	8191	\N	\N	\N	19	願	yuàn	desire, want; wish; ambition
8192	頁 181.18	8192	\N	\N	\N	27	顳	niè	the temporal bone
8193	食 184.6	8193	\N	\N	\N	14	餁	rèn	cooked food; cook until well done
8194	食 184.6	8194	\N	\N	\N	14	餃	jiǎo	stuffed dumplings
8195	食 184.9	8195	\N	\N	\N	17	餵	wèi	to feed, to raise
8196	馬 187.2	8196	\N	\N	\N	12	馮	féng	surname; gallop; by dint of
8197	馬 187.3	8197	\N	\N	\N	13	馳	chí	go quickly or swiftly; hurry
8198	馬 187.5	8198	\N	\N	\N	15	駛	shǐ	sail, drive, pilot; fast, quick
8199	馬 187.8	8199	\N	\N	\N	18	騎	qí	ride horseback; mount; cavalry
8200	馬 187.11	8200	\N	\N	\N	21	騺	zhì	heavy horse; horse unable to move because of twisted leg; plodding
8201	魚 195.8	8201	\N	\N	\N	19	鯚	jì	\N
8202	魚 195.10	8202	\N	\N	\N	21	鰟	fáng	small carp
8203	魚 195.12	8203	\N	\N	\N	22	鱉	biē	turtle
8204	魚 195.11	8204	8045	\N	\N	19	鳛	xí	the weather or dojo loach, Misgurnus anguillicaudatus
8205	鳥 196.5	8205	\N	\N	\N	16	鴟	chī	kite, horned owl; wine cups
8206	鳥 196.6	8206	\N	\N	\N	17	鴮	wū	\N
8207	鳥 196.6	8207	\N	\N	\N	17	鴲	zhī	\N
8208	鳥 196.6	8208	\N	\N	\N	17	鴷	liè	a woodpecker
8209	鳥 196.12	8209	\N	\N	\N	23	鷷	zūn	\N
8210	鳥 196.13	8210	\N	\N	\N	24	鸀	chǔ	\N
8211	鹿 198.7	8211	\N	\N	\N	18	麎	chén	\N
8212	鹿 198.14	8212	\N	\N	\N	25	麡	qí	\N
8213	麥 199.3	8213	\N	\N	\N	14	麧	hé	\N
8214	黽 205.10	8214	\N	\N	\N	23	鼇	áo	huge sea turtle
8215	鼓 207.11	8215	\N	\N	\N	24	鼞	tāng	\N
8216	鼠 208.4	8216	\N	\N	\N	17	鼤	wén	\N
8217	齒 211.10	8217	\N	\N	\N	25	齺	zōu	\N
8218	齒 211.13	8218	\N	\N	\N	28	齽	jìn	\N
8219	龍 212.4	8219	\N	\N	\N	20	龑	yǎn	high and bright
8220	衣 145.7	8220	\N	\N	\N	13	裏	lǐ	inside, interior, within
8221	門 169.6	8221	\N	\N	\N	14	䦶	zhèng	(simplified form of 䦛) to struggle; struggle; to strive
8222	魚 195.9	8222	\N	\N	\N	20	䲡	qiū	(simplified form 鰍) loach
8223	石 112.5	8223	7087	\N	\N	10	砮	nǔ	arrow-tip
8224	糸 120.8	8224	\N	\N	\N	14	綟	lì	\N
8225	糸 120.9	8225	\N	\N	\N	15	緜	mián	cotton wad; wool; soft, downy
8226	糸 120.12	8226	\N	\N	\N	18	繑	qiāo	\N
8227	糸 120.16	8227	\N	\N	\N	22	纑	lú	to soften hemp by boiling; thread
8228	缶 121.12	8228	\N	\N	\N	18	罈	tán	an earthenware jar, a jug
8229	虫 142.14	8229	\N	\N	\N	20	蠙	pín	oyster
8230	車 159.9	8230	\N	\N	\N	16	輴	chūn	sled
8231	酉 164.6	8231	\N	\N	\N	13	酨	zài	\N
8232	金 167.11	8232	\N	\N	\N	19	鏂	ōu	\N
8233	馬 187.7	8233	\N	\N	\N	17	駹	máng	black horse with a white face
8234	金 167.10	8234	\N	\N	\N	17	鎪	sōu	to engrave (metal of wood)
8235	目 109.11	8235	\N	\N	\N	16	瞕	zhàng	cataract in the eye
8236	穴 116.9	8236	\N	\N	\N	14	窪	wā	hollow; pit; depression; swamp
8237	肉 130.4	8237	\N	\N	\N	8	肻	kěn	\N
8238	虫 142.14	8238	\N	\N	\N	20	蠔	háo	oyster
8239	金 167.13	8239	\N	\N	\N	21	鐰	qiāo	\N
8240	糸 120.8	8240	\N	\N	\N	14	綵	cǎi	varicolored silk; variegated
8241	魚 195.6	8241	\N	\N	\N	17	鮰	huí	a small sturgeon found in the Yangzi; catfish
8242	鳥 196.4	8242	\N	\N	\N	15	鳾	shī	general term for a group of small birds
8243	虫 142.2	8243	\N	\N	\N	8	虰	dīng	variant of 虰蛵
8244	馬 187.12	8244	\N	\N	\N	22	驎	lín	female unicorn
8245	艸 140.6	8245	4137	\N	\N	9	荬	mǎi	a plant name
8246	金 167.15	8246	\N	\N	\N	22	鑛	kuàng	mine; mineral, ore
8247	牛 93.9	8247	5495	\N	\N	13	犏	piān	yak-ox
8248	革 177.9	8248	6318	\N	\N	18	鞧	qiū	a leather strap
8249	魚 195.5	8249	\N	\N	\N	16	鮋	yóu	\N
8250	魚 195.11	8250	\N	\N	\N	21	鰷	tiáo	minnow
8251	鳥 196.10	8251	\N	\N	\N	21	鶲	wēng	flycatcher (bird)
8252	皿 108.6	8252	\N	\N	\N	11	盕	fàn	\N
8253	皿 108.12	8253	\N	\N	\N	17	盩	zhōu	callus
8254	目 109.4	8254	\N	\N	\N	9	盻	xì	glare; stare
8255	目 109.5	8255	\N	\N	\N	10	眖	kuàng	\N
8256	石 112.4	8256	\N	\N	\N	9	砛	jin	\N
8257	石 112.6	8257	\N	\N	\N	11	硈	qià	\N
8258	示 113.10	8258	\N	\N	\N	14	禢	tà	surname
8259	示 113.11	8259	\N	\N	\N	15	禥	qí	variant of 祺
8260	穴 116.11	8260	\N	\N	\N	16	窼	zhāo	\N
8261	立 117.3	8261	\N	\N	\N	8	竏	qian	kiloliter
8262	竹 118.6	8262	\N	\N	\N	12	筈	kuò	arrow end
8263	竹 118.7	8263	\N	\N	\N	13	筽	o	\N
8264	竹 118.11	8264	\N	\N	\N	16	篴	dí	bamboo flute; whistle
8265	竹 118.14	8265	\N	\N	\N	19	籆	yuè	\N
8266	竹 118.14	8266	\N	\N	\N	20	籇	háo	\N
8267	糸 120.4	8267	\N	\N	\N	10	紏	tǒu	\N
8268	肉 130.4	8268	\N	\N	\N	8	肣	hán	\N
8269	肉 130.5	8269	\N	\N	\N	9	胑	zhī	the limbs; the upper arm; wings of birds; legs of animals
8270	自 132.6	8270	\N	\N	\N	12	臮	jì	\N
8271	艸 140.5	8271	\N	\N	\N	8	苲	zhǎ	 used in 苲草
8272	艸 140.9	8272	\N	\N	\N	12	蒃	zhuàn	\N
8273	虍 141.5	8273	\N	\N	\N	11	虗	xū	variant of 虚
8274	虫 142.7	8274	\N	\N	\N	13	蜌	bì	\N
8275	足 157.5	8275	\N	\N	\N	12	跘	pán	\N
8276	革 177.9	8276	\N	\N	\N	18	鞦	qiū	leather stap; swing
8277	馬 187.11	8277	\N	\N	\N	21	驄	cōng	horse with a bluish white color
8278	鳥 196.12	8278	\N	\N	\N	23	鷭	fán	water-hen; gallinula
8279	鳥 196.6	8279	7205	\N	\N	11	鸼	zhōu	\N
8280	鳥 196.8	8280	5533	\N	\N	13	鹐	qiān	to peck, as birds
8281	目 109.14	8281	\N	\N	\N	19	矄	xūn	\N
8282	鬼 194.12	8282	\N	\N	\N	20	魖	xū	black
8283	鳥 196.5	8283	\N	\N	\N	16	鴐	gē	\N
8284	艸 140.13	8284	\N	\N	\N	16	薀	yùn	hippuris or mare's tail
8285	言 149.10	8285	\N	\N	\N	16	謏	xiǎo	scold, censure; lead people toward virtuous ways; small, little
8286	肉 130.6	8286	7030	\N	\N	10	脎	sà	an organic compound
8287	糸 120.9	8287	\N	\N	\N	15	締	dì	tie, join, connect; connection
8288	耳 128.9	8288	\N	\N	\N	15	聧	kuī	\N
8289	肉 130.7	8289	\N	\N	\N	11	脜	yǒu	\N
8290	舟 137.13	8290	\N	\N	\N	19	艤	yǐ	to moor a boat to the bank
8291	艸 140.6	8291	6783	\N	\N	9	荖	lǎo	betel pepper
8292	艸 140.12	8292	\N	\N	\N	15	蕌	lěi	\N
8293	虫 142.18	8293	\N	\N	\N	24	蠷	qú	\N
8294	衣 145.9	8294	\N	\N	\N	14	褏	xiù	sleeve; ample flowing robes
8295	角 148.16	8295	\N	\N	\N	22	觽	xī	ivory bodkin for undoing knots
8296	足 157.9	8296	\N	\N	\N	15	踫	pèng	collide, bump into
8297	足 157.12	8297	6385	\N	\N	19	蹽	liāo	to run, to slip away, to stride
8298	身 158.20	8298	\N	\N	\N	27	軉	yù	\N
8299	車 159.4	8299	\N	\N	\N	11	軛	è	yoke, collar; to restrain
8300	土 32.11	8300	7636	\N	\N	14	墚	liáng	mountain range
8301	手 64.10	8301	7483	\N	\N	13	搌	zhǎn	to wipe tears; to bind
8302	手 64.13	8302	\N	\N	\N	16	擗	pǐ	to beat the breast
8303	口 30.7	8303	6986	\N	\N	10	哳	zhā	twitter
8304	金 167.8	8304	\N	\N	\N	16	鋻	jiàn	variant of 鉴
8305	木 75.9	8305	7333	\N	\N	12	楗	jiàn	bar of door, bolt of lock
8306	革 177.13	8306	8088	\N	\N	22	韂	chàn	a saddle-flap. trappings
8307	風 182.12	8307	\N	\N	\N	21	飆	biāo	whirlwind, stormy gale
8308	食 184.12	8308	\N	\N	\N	20	饏	dàn	\N
8309	耒 127.8	8309	5620	\N	\N	14	耥	tāng	farm tool
8310	髟 190.7	8310	\N	\N	\N	17	髼	péng	\N
8311	竹 118.11	8311	6257	\N	\N	17	篼	dōu	mountain sedan chair; (Cant.) a simple container without a cover
8312	髟 190.10	8312	\N	\N	\N	20	鬑	lián	long, flowing hair
8313	酉 164.9	8313	7848	\N	\N	16	醑	xǔ	to strain spirits
8314	鳥 196.5	8314	\N	\N	\N	16	鴧	ròng	\N
8315	目 109.5	8315	\N	\N	\N	10	眜	mò	\N
8316	目 109.12	8316	\N	\N	\N	17	瞷	jiàn	to spy
8317	石 112.11	8317	\N	\N	\N	16	磦	biāo	\N
8318	石 112.15	8318	\N	\N	\N	20	礨	lěi	\N
8319	示 113.3	8319	6624	\N	\N	7	祃	mà	a sacrifice at the beginning of a military campaign
8320	示 113.7	8320	7253	\N	\N	11	祲	jìn	ominous or sinister spirit; vigor
8321	示 113.8	8321	\N	\N	\N	12	祻	gù	disaster
8322	穴 116.5	8322	7073	\N	\N	10	窊	wā	pit, vault; store in pit; (Cant.)手窊, the arm
8323	竹 118.12	8323	\N	\N	\N	18	簥	jiāo	a large pipe; a farm tool
8324	竹 118.26	8324	\N	\N	\N	32	籲	yù	appeal; request; implore
8325	糸 120.10	8325	7884	\N	\N	16	縢	téng	bind, tie up, restrain; cord
8326	糸 120.11	8326	\N	\N	\N	17	繌	sha	\N
8327	糸 120.12	8327	\N	\N	\N	18	繒	zēng	silk fabrics; surname
8328	耳 128.8	8328	\N	\N	\N	14	聜	dǐ	\N
8329	肉 130.5	8329	\N	\N	\N	12	胔	zì	rotten meat; bones of dead animals
8330	肉 130.6	8330	\N	\N	\N	12	胾	zì	minced meat; to cut meat into pieces
8331	肉 130.7	8331	\N	\N	\N	11	脨	cù	variant of 瘠
8332	肉 130.13	8332	\N	\N	\N	15	膼	zhuā	\N
8333	舟 137.10	8333	\N	\N	\N	16	艕	bàng	two boats fastened side by side
8334	艸 140.5	8334	\N	\N	\N	8	苼	shēng	\N
8335	匕 21.9	8335	\N	\N	\N	13	莻	gòng	late
8336	艸 140.11	8336	\N	\N	\N	13	蓨	tiáo	\N
8337	艸 140.11	8337	\N	\N	\N	14	蓵	jié	\N
8338	艸 140.11	8338	\N	\N	\N	14	蓾	lǔ	\N
8339	艸 140.15	8339	7989	\N	\N	18	藦	mò	edible mushrooms
8340	艸 140.19	8340	\N	\N	\N	22	虀	jī	minced pickles; leeks; mix; salt
8341	虫 142.6	8341	\N	\N	\N	10	蚈	qiān	(arch.) firefly
8342	虫 142.6	8342	\N	\N	\N	12	蛡	yì	hive; honeycomb
8343	虫 142.7	8343	\N	\N	\N	13	蛻	tuì	molt, exuviate, shed
8344	虫 142.9	8344	\N	\N	\N	15	蝝	yuán	the larva of locust
8345	虫 142.10	8345	\N	\N	\N	15	蝹	yūn	\N
8346	虫 142.13	8346	\N	\N	\N	19	蟿	qì	acrida chinensis
8347	衣 145.4	8347	\N	\N	\N	9	衼	zhī	\N
8348	衣 145.10	8348	\N	\N	\N	15	褦	nài	stupid, dull, ignorant, doltish; (Cant.) to tie up, bind
8349	衣 145.18	8349	\N	\N	\N	22	襶	dài	ignorant; naive; unsophisticated
8350	見 147.4	8350	\N	\N	\N	11	覐	jué	to sleep; to realize, feel
8351	言 149.6	8351	\N	\N	\N	13	詯	huì	\N
8352	言 149.8	8352	\N	\N	\N	15	誴	cóng	\N
8353	言 149.8	8353	\N	\N	\N	15	諓	jiàn	flattering
8354	言 149.11	8354	\N	\N	\N	17	謧	lí	\N
8355	言 149.11	8355	\N	\N	\N	18	謪	shāng	to consult; to deliberate; commerce
8356	言 149.12	8356	\N	\N	\N	17	譁	huá	noise, uproar; clamor, hubbub
8357	貝 154.3	8357	\N	\N	\N	10	貤	yí	steps, grade, strata; series
8358	赤 155.6	8358	7479	\N	\N	13	赪	chēng	deep red
8359	足 157.8	8359	\N	\N	\N	15	踖	jí	trample on, tread on
8360	身 158.13	8360	\N	\N	\N	20	軆	tǐ	body; group, class, body, unit
8361	車 159.6	8361	\N	\N	\N	13	輈	zhōu	shaft
8362	邑 163.11	8362	\N	\N	\N	13	鄛	cháo	\N
8363	邑 163.11	8363	\N	\N	\N	13	鄡	qiāo	\N
8364	酉 164.9	8364	\N	\N	\N	16	醖	yùn	liquor
8365	山 46.3	8365	3594	\N	\N	6	屺	qǐ	a hill with trees or grass-- some give the opposite meaning
8366	金 167.9	8366	\N	\N	\N	17	鍑	fù	\N
8367	金 167.11	8367	\N	\N	\N	19	鏉	shòu	\N
8368	隹 172.5	8368	7564	\N	\N	13	雊	gòu	the crow of a male pheasant
8369	頁 181.9	8369	\N	\N	\N	18	顓	zhuān	good, honest; simple; respectful
8370	風 182.5	8370	6872	\N	\N	9	飐	zhǎn	sway in wind
8371	禾 115.6	8371	7189	\N	\N	11	稆	lǚ	wild grain
8372	馬 187.8	8372	\N	\N	\N	16	駳	dàn	\N
8373	馬 187.11	8373	\N	\N	\N	21	騽	xí	\N
8374	馬 187.7	8374	7096	\N	\N	10	骍	xīng	red, brown, bay; neat, harmonious
8375	竹 118.7	8375	7542	\N	\N	13	筻	gàng	place name in Hunan province
8376	魚 195.4	8376	\N	\N	\N	15	魱	hú	\N
8377	舟 137.3	8377	6861	\N	\N	9	舣	yǐ	to moor a boat to the bank
8378	魚 195.7	8378	\N	\N	\N	18	鮾	něi	\N
8379	魚 195.7	8379	\N	\N	\N	18	鯋	shā	shark
8380	魚 195.7	8380	\N	\N	\N	18	鯏	li	dialect name for a (bad tasting) blood clam
8381	鳥 196.8	8381	\N	\N	\N	19	鶃	yì	hawk; Ardea cinerea
8382	鳥 196.9	8382	\N	\N	\N	20	鶫	dong	thrush; Turdus naumanni
8383	齒 211.5	8383	\N	\N	\N	20	齛	xiè	\N
8384	目 109.20	8384	\N	\N	\N	24	矙	kàn	view
8385	糸 120.7	8385	\N	\N	\N	12	絾	chéng	\N
8386	衣 145.5	8386	7078	\N	\N	10	袗	zhěn	unlined garments; hem of garment
8387	衣 145.15	8387	\N	\N	\N	20	襬	bǎi	lower part of a robe
8388	水 85.11	8388	7725	\N	\N	14	漤	lǎn	marinate in salt
8389	門 169.10	8389	\N	\N	\N	18	闕	què	watch tower; palace
8390	髟 190.10	8390	\N	\N	\N	20	鬐	qí	dorsal fins; horse's mane
8391	魚 195.10	8391	7962	\N	\N	17	鲾	bī	\N
8393	禾 115.9	8393	\N	\N	\N	14	稭	jiē	stalk of grain, rice, corn, hemp
8394	竹 118.14	8394	\N	\N	\N	20	籄	kuì	a basket for carrying earth
8395	耳 128.14	8395	\N	\N	\N	20	聺	qié	\N
8396	衣 145.11	8396	\N	\N	\N	16	褹	yì	\N
8397	言 149.4	8397	\N	\N	\N	11	訟	sòng	accuse; argue, dispute; litigate
8398	金 167.11	8398	\N	\N	\N	19	鏕	lù	\N
8399	鼻 209.10	8399	\N	\N	\N	24	齆	wèng	stuffed nose
8400	皿 108.13	8400	\N	\N	\N	18	盫	ān	\N
8401	目 109.15	8401	\N	\N	\N	19	矎	xuān	\N
8402	石 112.13	8402	\N	\N	\N	18	礋	zé	\N
8403	穴 116.5	8403	\N	\N	\N	10	窌	jiào	pit, vault; store in pit
8404	竹 118.13	8404	\N	\N	\N	19	簼	lóng	\N
8405	米 119.16	8405	\N	\N	\N	22	糴	dí	purchase grains; store grain
8406	糸 120.4	8406	3823	\N	\N	7	纴	rèn	weave, lay warp
8407	网 122.10	8407	\N	\N	\N	15	罵	mà	accuse, blame, curse, scold
8408	羽 124.6	8408	5324	\N	\N	12	翚	huī	pheasant, golden pheasant; variegated; to fly
8409	耒 127.15	8409	8074	\N	\N	21	耰	yōu	toothless rake for drawing earth over newly sown grain
8410	舟 137.14	8410	\N	\N	\N	19	艧	huò	\N
8411	艸 140.14	8411	\N	\N	\N	16	藇	xù	fine
8412	虍 141.5	8412	\N	\N	\N	11	虖	hū	to cry; to shout; to howl
8413	虫 142.4	8413	\N	\N	\N	10	蚖	yuán	Protura (soil dwelling primitive hexapod); triton
8414	虫 142.7	8414	7524	\N	\N	13	蜎	yuān	mosquito larva
8415	虫 142.8	8415	\N	\N	\N	14	蜨	dié	butterfly
8416	虫 142.17	8416	\N	\N	\N	22	蠭	fēng	bees, hornets, wasps
8417	言 149.5	8417	7342	\N	\N	12	詟	zhé	fear; envy; loquacious
8418	言 149.6	8418	\N	\N	\N	13	詵	shēn	inquire, question; numerous
8419	言 149.12	8419	\N	\N	\N	19	譔	zhuàn	eulogize; compose, write
8420	豕 152.9	8420	\N	\N	\N	16	豭	jiā	boar, male pig
8421	走 156.7	8421	\N	\N	\N	14	趙	zhào	surname; ancient state
8422	走 156.12	8422	\N	\N	\N	19	趬	qiāo	\N
8423	阜 170.3	8423	\N	\N	\N	5	阢	wù	\N
8424	囗 31.8	8424	4817	\N	\N	11	圊	qīng	rest room
8425	酉 164.8	8425	\N	\N	\N	15	醃	yān	marinate, pickle; salt
8426	金 167.8	8426	\N	\N	\N	16	録	lù	copy
8427	金 167.9	8427	\N	\N	\N	17	鍮	tōu	brass
8428	金 167.9	8428	\N	\N	\N	17	鍸	hú	food, gruel
8429	門 169.11	8429	\N	\N	\N	19	闚	kuī	flash; flashing; steal look
8430	阜 170.3	8430	\N	\N	\N	5	阤	zhì	hill
8431	雨 173.11	8431	\N	\N	\N	19	霫	xí	heavy rain
8432	革 177.6	8432	\N	\N	\N	15	鞎	hén	\N
8433	韋 178.9	8433	\N	\N	\N	18	韗	yùn	\N
8434	髟 190.11	8434	\N	\N	\N	21	鬖	sān	wild hair
8435	魚 195.13	8435	8082	\N	\N	21	鳠	hù	a species of freshwater catfish
8436	鳥 196.6	8436	\N	\N	\N	17	鴼	luò	\N
8437	鳥 196.10	8437	\N	\N	\N	21	鷇	kòu	chicks, fledglings
8438	黃 201.5	8438	7840	\N	\N	16	黇	tiān	used in 黇鹿
8439	黑 203.6	8439	7993	\N	\N	18	黡	yǎn	mole, scar, blemish
8440	齒 211.5	8440	\N	\N	\N	20	齣	chū	act; stanza; time, occasion
8441	皿 108.8	8441	\N	\N	\N	13	盞	zhǎn	small cup or container; classifier for lamps, etc.
8442	目 109.4	8442	\N	\N	\N	9	眅	pān	inlay; border
8443	石 112.10	8443	\N	\N	\N	14	磈	wěi	rocky, stony
8444	石 112.12	8444	\N	\N	\N	17	磳	zēng	\N
8445	禾 115.14	8445	\N	\N	\N	18	穫	huò	harvest, cut grain
8446	穴 116.5	8446	7072	\N	\N	10	窅	yǎo	far, deep; sunken eyes; sad
8447	穴 116.12	8447	\N	\N	\N	17	窾	kuǎn	hole; hallow; empty
8448	竹 118.7	8448	\N	\N	\N	13	筭	suàn	an ancient device for working with numbers; count, calculate, figure
8449	竹 118.8	8449	\N	\N	\N	14	箣	cè	\N
8450	竹 118.11	8450	7952	\N	\N	17	簃	yí	side room
8451	竹 118.13	8451	\N	\N	\N	19	簺	sài	\N
8452	米 119.7	8452	\N	\N	\N	13	粴	lǐ	\N
8453	米 119.12	8453	\N	\N	\N	18	糦	xī	\N
8454	糸 120.6	8454	\N	\N	\N	12	絟	quán	\N
8455	糸 120.9	8455	\N	\N	\N	14	緺	guā	\N
8456	糸 120.11	8456	\N	\N	\N	17	縩	cài	used in 綷縩
8457	缶 121.15	8457	8080	\N	\N	21	罍	léi	large earthenware wine jar
8458	羽 124.8	8458	\N	\N	\N	14	翣	shà	feathers used decorate coffin; large wooden fan
8459	耳 128.8	8459	\N	\N	\N	14	聟	xù	son-in-law; husband
8460	肉 130.1	8460	\N	\N	\N	5	肊	yì	variant of 臆
8461	肉 130.3	8461	\N	\N	\N	7	肙	yuàn	a small worm; to twist; to surround; empty
8462	肉 130.3	8462	\N	\N	\N	7	肞	chā	\N
8463	肉 130.18	8463	\N	\N	\N	22	臞	qú	variant of 癯
8464	艸 140.5	8464	\N	\N	\N	8	苶	nié	weary; tired
8465	艸 140.8	8465	\N	\N	\N	11	菭	tái	\N
8466	艸 140.9	8466	7318	\N	\N	12	葖	tū	follicle
8467	艸 140.12	8467	\N	\N	\N	15	蕳	jiān	agueweed
8468	虫 142.4	8468	\N	\N	\N	10	蚒	tóng	(Cant.) an edible snake, lizard
8469	虫 142.8	8469	\N	\N	\N	14	蜪	táo	\N
8470	虫 142.9	8470	\N	\N	\N	14	蝕	shí	nibble away; erode; eclipse
8471	虫 142.15	8471	\N	\N	\N	21	蠜	fán	grasshopper
8472	衣 145.5	8472	\N	\N	\N	10	袕	xué	\N
8473	衣 145.7	8473	\N	\N	\N	12	裋	shù	cotton clothes of a boy servant
8474	衣 145.8	8474	\N	\N	\N	13	裩	kūn	\N
8475	衣 145.9	8475	\N	\N	\N	14	褌	kūn	trousers, pants, shorts, drawers
8476	衣 145.9	8476	\N	\N	\N	14	褎	xiù	sleeve; ample flowing robes
8477	衣 145.15	8477	8070	\N	\N	20	襫	shì	raincoat
8478	襾 146.13	8478	\N	\N	\N	19	覈	hé	investigate, consider, examine
8479	角 148.8	8479	7804	\N	\N	15	觭	jī	one turning up and one turning down
8480	言 149.2	8480	\N	\N	\N	9	訆	jiào	\N
8481	言 149.3	8481	\N	\N	\N	10	訏	xū	boast, exaggerate; great, broad
8482	言 149.5	8482	\N	\N	\N	12	訽	gòu	blame
8483	言 149.6	8483	\N	\N	\N	13	詨	xiào	kind of cicada, cosmopsaltria
8484	言 149.14	8484	\N	\N	\N	21	譻	yīng	\N
8485	言 149.5	8485	6625	\N	\N	7	诇	xiòng	to spy; to give information; shrewd
8486	豸 153.9	8486	\N	\N	\N	16	貑	jiā	\N
8487	足 157.6	8487	7522	\N	\N	13	跱	zhì	stop
8488	土 32.5	8488	\N	\N	\N	8	坶	mǔ	\N
8489	足 157.16	8489	\N	\N	\N	23	躘	lóng	to walk
8490	車 159.8	8490	\N	\N	\N	15	輖	zhōu	\N
8491	車 159.11	8491	\N	\N	\N	18	轇	jiāo	complicated, confused; dispute
8492	車 159.11	8492	\N	\N	\N	17	轋	hún	\N
8493	車 159.13	8493	\N	\N	\N	19	轕	gé	great array of spears and chariots
8494	辵 162.4	8494	\N	\N	\N	7	迒	háng	\N
8495	邑 163.7	8495	\N	\N	\N	8	郘	lǘ	\N
8496	酉 164.8	8496	\N	\N	\N	15	醄	táo	very drunk; happy looks
8497	酉 164.16	8497	\N	\N	\N	23	醼	yàn	variant of 宴
8498	金 167.7	8498	\N	\N	\N	14	鋋	chán	\N
8499	金 167.11	8499	\N	\N	\N	19	鏁	suǒ	variant of鎖U+9396, a lock, padlock; shackles, chains
8500	金 167.11	8500	\N	\N	\N	19	鏭	xī	\N
8501	金 167.12	8501	\N	\N	\N	19	鐄	huáng	bell
8502	金 167.15	8502	\N	\N	\N	23	鑣	biāo	bit, bridle; ride
8503	金 167.18	8503	\N	\N	\N	26	鑷	niè	tweezers, forceps, pincers
8504	車 159.6	8504	6978	\N	\N	10	辁	quán	cart wheel with no spokes
8505	阜 170.5	8505	\N	\N	\N	7	阸	è	distress; difficulty
8506	牛 93.7	8506	7188	\N	\N	11	牿	gù	shed or pen for cattle
8507	革 177.8	8507	\N	\N	\N	17	鞝	shàng	the piece of leather used for soles on Chinese shoes. a patch
8508	頁 181.6	8508	\N	\N	\N	15	頞	è	(nose) bridge
8509	目 109.12	8509	7933	\N	\N	17	瞵	lín	to stare at
8510	食 184.2	8510	\N	\N	\N	5	饤	dìng	display food for show only; sacrifice
8511	馬 187.4	8511	\N	\N	\N	14	駃	jué	gallop
8512	馬 187.5	8512	\N	\N	\N	15	駉	jiōng	big
8513	馬 187.9	8513	\N	\N	\N	19	騠	tí	a horse, mule
8514	馬 187.16	8514	\N	\N	\N	26	驡	lóng	\N
8515	髟 190.4	8515	\N	\N	\N	14	髪	fà	hair
8516	髟 190.12	8516	\N	\N	\N	22	鬚	xū	beard, whiskers; whisker-like
8517	鬼 194.4	8517	\N	\N	\N	13	鬿	qí	\N
8518	魚 195.5	8518	\N	\N	\N	16	鮌	gǔn	variant of 鲧
8519	魚 195.7	8519	\N	\N	\N	18	鯁	gěng	fish bones; honest, upright
8520	魚 195.22	8520	\N	\N	\N	33	鱻	xiān	fresh, new, delicious; rare, few
8521	鳥 196.9	8521	\N	\N	\N	20	鶚	è	osprey, fishhawk; Pandion haliaetus
8522	鳥 196.12	8522	\N	\N	\N	24	鷫	sù	turquoise kingfisher
8523	鳥 196.9	8523	7671	\N	\N	14	鹖	hé	crossbill, species of nightingale
8524	石 112.11	8524	\N	\N	\N	16	磩	qì	\N
8525	石 112.11	8525	\N	\N	\N	16	磭	chuò	big lip
8526	禾 115.7	8526	7386	\N	\N	12	稌	tú	glutinous rice
8527	禾 115.10	8527	\N	\N	\N	15	穃	rong	\N
8528	糸 120.7	8528	\N	\N	\N	13	綂	tǒng	govern, command, control; unite
8529	肉 130.12	8529	\N	\N	\N	17	膥	chūn	(Cant.) eggs of birds or reptiles; testicles
8530	肉 130.12	8530	\N	\N	\N	16	膱	zhí	\N
8531	臼 134.3	8531	\N	\N	\N	9	臿	chā	to separate the grain from the husk
8532	舟 137.9	8532	7796	\N	\N	15	艎	huáng	fast boat
8533	艸 140.4	8533	\N	\N	\N	7	苃	yǒu	\N
8534	艸 140.5	8534	\N	\N	\N	9	茍	jì	to be circumspect, cautious in ones behaviour (distinguish DKW 30790 gou3)
8535	艸 140.10	8535	5385	\N	\N	13	蒟	jǔ	betel pepper; Amorphophallus konjac
8536	艸 140.15	8536	\N	\N	\N	18	藣	bēi	\N
8537	艸 140.21	8537	\N	\N	\N	24	虈	xiāo	\N
8538	虫 142.7	8538	7523	\N	\N	13	蜐	jié	used in 石蜐
8539	言 149.2	8539	\N	\N	\N	9	訅	qiú	\N
8540	言 149.6	8540	\N	\N	\N	13	詭	guǐ	deceive, cheat, defraud; sly
8541	言 149.16	8541	\N	\N	\N	23	讈	lì	\N
8542	貝 154.5	8542	\N	\N	\N	12	貿	mào	trade, barter; mixed; rashly
8543	足 157.3	8543	\N	\N	\N	10	趷	kē	to jolt; (Cant.) to raise up; block
8544	足 157.10	8544	\N	\N	\N	17	蹌	qiāng	walk rapidly
8545	足 157.12	8545	\N	\N	\N	19	蹹	tá	to tread on; to stamp; to walk
8546	金 167.5	8546	\N	\N	\N	13	鈰	shì	cerium
8547	金 167.6	8547	\N	\N	\N	14	銑	xiǎn	mill
8548	金 167.7	8548	\N	\N	\N	15	鋫	lí	\N
8549	金 167.9	8549	\N	\N	\N	17	鍔	è	high, lofty; edge of knife
8550	金 167.12	8550	\N	\N	\N	20	鐨	fèi	fermium
8551	食 184.6	8551	\N	\N	\N	14	餉	xiǎng	rations and pay for soldiers
8552	馬 187.9	8552	\N	\N	\N	19	騛	fēi	\N
8553	魚 195.8	8553	\N	\N	\N	19	鯛	diāo	pagrosomus major, porgy
8554	魚 195.10	8554	\N	\N	\N	21	鰤	shī	a yellowtail (fish)
8555	鳥 196.3	8555	\N	\N	\N	14	鳳	fèng	male phoenix; symbol of joy
8556	鳥 196.6	8556	\N	\N	\N	17	鵂	xiū	horned owl, scops chinensis; bird of ill omen
8557	鳥 196.9	8557	\N	\N	\N	20	鶢	yuán	a bird which frequents the sea-shore
8558	鳥 196.10	8558	\N	\N	\N	21	鶳	shī	\N
8559	黃 201.6	8559	\N	\N	\N	17	黋	kuàng	\N
8560	齒 211.5	8560	\N	\N	\N	17	齢	líng	age; years
8561	石 112.11	8561	\N	\N	\N	16	磚	zhuān	tile, brick
8562	糸 120.9	8562	\N	\N	\N	15	緲	miǎo	indistinct, dim; minute; distant
8563	糸 120.13	8563	\N	\N	\N	19	繳	jiǎo	deliver, submit; hand over
8564	耳 128.8	8564	\N	\N	\N	14	聝	guó	to cut the left ears of the slain
8565	肉 130.12	8565	\N	\N	\N	16	膴	hū	fine
8566	艸 140.4	8566	\N	\N	\N	7	芵	jué	\N
8567	艸 140.15	8567	\N	\N	\N	18	藫	tán	\N
8568	見 147.4	8568	\N	\N	\N	11	覓	mì	seek; search
8569	言 149.7	8569	\N	\N	\N	13	誕	dàn	to bear children, give birth; birth
8570	言 149.7	8570	\N	\N	\N	14	誡	jiè	warn, admonish; warning
8571	豸 153.8	8571	\N	\N	\N	15	貎	ní	lion; wild beast; wild horse
8572	貝 154.6	8572	\N	\N	\N	13	賄	huì	bribe; bribes; riches, wealth
8573	足 157.6	8573	\N	\N	\N	13	跰	pián	\N
8574	足 157.8	8574	\N	\N	\N	15	踥	qiè	to walk with small steps
8575	辵 162.3	8575	\N	\N	\N	6	迆	yí	wind; walk out of straight path
8576	辵 162.7	8576	\N	\N	\N	10	逕	jìng	pass by, approach; direct
8577	辵 162.7	8577	\N	\N	\N	10	逤	suò	\N
8578	金 167.11	8578	\N	\N	\N	19	鏢	biāo	dart, spear, harpoon; escort
8579	金 167.11	8579	\N	\N	\N	19	鏤	lòu	carve, inlay, engrave, tattoo
8580	金 167.14	8580	\N	\N	\N	22	鑄	zhù	melt, cast; coin, mint
8581	金 167.19	8581	\N	\N	\N	27	鑽	zuān	drill, bore; pierce; diamond
8582	頁 181.7	8582	\N	\N	\N	16	頷	hàn	chin, jowl; give nod
8583	鳥 196.4	8583	\N	\N	\N	15	鴉	yā	crow, raven; Corvus species (various)
8584	鳥 196.6	8584	\N	\N	\N	17	鴰	guā	the crow
8585	鹿 198.5	8585	\N	\N	\N	16	麅	páo	a small spotted deer found in north China
8586	石 112.16	8586	\N	\N	\N	21	礱	lóng	grind, sharpen; mill
8587	示 113.8	8587	\N	\N	\N	12	祿	lù	blessing, happiness, prosperity
8588	缶 121.2	8588	\N	\N	\N	8	缷	xiè	lay down; retire from office
8589	虍 141.5	8589	\N	\N	\N	11	虙	fú	\N
8590	齒 211.4	8590	\N	\N	\N	19	齗	yín	gums (of the teeth); to dispute
8591	衣 145.7	8591	\N	\N	\N	12	裓	gé	\N
8592	金 167.7	8592	7374	\N	\N	12	铹	láo	lawrencium (Lr)
8593	目 109.8	8593	\N	\N	\N	13	睙	liè	to roll the eyeballs to look
8594	矛 110.7	8594	\N	\N	\N	12	矟	shuò	lance
8595	石 112.7	8595	\N	\N	\N	12	硣	xiāo	\N
8596	石 112.12	8596	7930	\N	\N	17	磹	tán	stone wedge
8597	石 112.12	8597	\N	\N	\N	17	礀	jian	variant of 涧
8598	示 113.13	8598	\N	\N	\N	17	禮	lǐ	social custom; manners; courtesy; rites
8599	禾 115.6	8599	\N	\N	\N	11	秶	zī	\N
8600	穴 116.5	8600	\N	\N	\N	10	窇	báo	\N
8601	立 117.15	8601	\N	\N	\N	20	竷	kǎn	\N
8602	竹 118.5	8602	\N	\N	\N	11	笣	bāo	\N
8603	竹 118.9	8603	\N	\N	\N	15	篃	mèi	a kind of bamboo
8604	竹 118.12	8604	\N	\N	\N	19	簬	lù	(bamboo)
8605	竹 118.12	8605	\N	\N	\N	18	簯	qi	\N
8606	米 119.5	8606	\N	\N	\N	11	粓	gān	\N
8607	米 119.8	8607	\N	\N	\N	14	粶	lù	\N
8608	糸 120.4	8608	\N	\N	\N	10	紋	wén	line, streak, stripe; wrinkle
8609	糸 120.4	8609	\N	\N	\N	10	紓	shū	loosen, relax, relieve; extricate
8610	糸 120.6	8610	\N	\N	\N	12	絞	jiǎo	twist, wring; intertwine; winch
8611	糸 120.9	8611	\N	\N	\N	15	緹	tí	reddish color, red, brown
8612	糸 120.11	8612	\N	\N	\N	17	縷	lǚ	thread; detailed, precise
8613	糸 120.11	8613	\N	\N	\N	17	縼	xuàn	\N
8614	糸 120.11	8614	\N	\N	\N	17	繆	móu	wind around, bind; prepare
8615	糸 120.12	8615	\N	\N	\N	18	繕	shàn	repair, mend; rewrite, transcribe
8616	糸 120.12	8616	\N	\N	\N	18	繚	liáo	wind round, rap around, bind
8617	糸 120.12	8617	\N	\N	\N	18	繞	rào	entwine; wind around; surround
8618	糸 120.7	8618	7095	\N	\N	10	绤	xì	cloth
8619	缶 121.11	8619	\N	\N	\N	17	罆	guàn	jar, jug, pitcher, pot
8620	网 122.19	8620	\N	\N	\N	24	羈	jī	halter; restrain, hold, control
8621	羽 124.4	8621	\N	\N	\N	10	翆	cuì	color green; kingfisher
8622	羽 124.5	8622	\N	\N	\N	11	翑	qú	\N
8623	耳 128.12	8623	\N	\N	\N	18	聵	kuì	deaf
8624	肉 130.7	8624	\N	\N	\N	11	脵	gǔ	thighs, haunches, rump; share
8625	肉 130.13	8625	\N	\N	\N	17	臄	jué	palate
8626	艸 140.6	8626	6788	\N	\N	9	茽	zhòng	\N
8627	艸 140.7	8627	\N	\N	\N	10	莊	zhuāng	village, hamlet; villa; surname
8628	艸 140.7	8628	\N	\N	\N	10	莢	jiá	pods of leguminous plants; pods
8629	艸 140.7	8629	\N	\N	\N	10	莵	tu	dodder; creeper
8630	艸 140.8	8630	\N	\N	\N	11	菕	lún	tree name (archaic)
8631	艸 140.10	8631	\N	\N	\N	13	蓛	cè	\N
8632	艸 140.11	8632	\N	\N	\N	14	蓷	tuī	motherwort, various plants of the genus Leonurus, such as L. sibiricus and L. artemesia
8633	艸 140.11	8633	\N	\N	\N	14	蓸	cáo	(a kind of herb)
8634	艸 140.11	8634	\N	\N	\N	14	蔘	shēn	ginseng; huge
8635	艸 140.11	8635	\N	\N	\N	14	蔞	lóu	Artemisia stelleriana
8636	艸 140.12	8636	\N	\N	\N	15	蕘	ráo	fuel, firewood; stubble
8637	艸 140.13	8637	\N	\N	\N	16	蕼	sì	\N
8638	艸 140.13	8638	\N	\N	\N	16	薔	qiáng	rose
8639	艸 140.15	8639	\N	\N	\N	18	藖	xián	\N
8640	艸 140.15	8640	\N	\N	\N	18	藢	zhǐ	\N
8641	艸 140.16	8641	\N	\N	\N	19	藶	lì	a kind of plant
8642	虫 142.6	8642	\N	\N	\N	12	蛢	píng	\N
8643	虫 142.12	8643	\N	\N	\N	18	蟯	náo	worms
8644	虫 142.13	8644	\N	\N	\N	18	蠄	qín	(Cant.)蠄蟧, a spider;蠄蟝, a toad
8645	虫 142.13	8645	\N	\N	\N	19	蠈	zéi	\N
8646	虫 142.12	8646	\N	\N	\N	17	蠎	mǎng	python, boa constrictor
8647	虫 142.15	8647	\N	\N	\N	20	蠣	lì	oyster
8648	衣 145.15	8648	\N	\N	\N	19	襪	wà	socks, stockings
8649	見 147.2	8649	\N	\N	\N	12	覙	luó	explain in detail
8650	言 149.3	8650	\N	\N	\N	10	訑	yí	deceive, cheat; arrogant
8651	言 149.4	8651	\N	\N	\N	11	訣	jué	take leave of, bid farewell
8652	言 149.6	8652	\N	\N	\N	13	詰	jié	question, interrogate
8653	言 149.6	8653	\N	\N	\N	13	詸	mí	variant of 谜
8654	言 149.8	8654	\N	\N	\N	15	誰	shuí	who? whom? whose? anyone?
8655	言 149.8	8655	\N	\N	\N	15	諏	zōu	consult, confer; select, choose
8656	言 149.9	8656	\N	\N	\N	15	諛	yú	flatter, truckle
8657	言 149.9	8657	\N	\N	\N	16	諮	zī	consult, confer; communicate in
8658	言 149.9	8658	\N	\N	\N	16	諱	huì	conceal; shun; regard as taboo
8659	言 149.11	8659	\N	\N	\N	18	謥	còng	\N
8660	言 149.11	8660	\N	\N	\N	17	謨	mó	scheme, plan; plan; be without
8661	言 149.13	8661	\N	\N	\N	20	譫	zhān	talkative; incoherent talk
8662	豸 153.7	8662	\N	\N	\N	14	貋	hàn	\N
8663	豸 153.18	8663	\N	\N	\N	24	貛	huān	badger
8664	貝 154.4	8664	\N	\N	\N	11	貫	guàn	a string of 1000 coins; to go through
8665	貝 154.7	8665	\N	\N	\N	14	賓	bīn	guest, visitor; surname; submit
8666	貝 154.8	8666	\N	\N	\N	15	賞	shǎng	reward, grant, bestow; appreciate
8667	貝 154.11	8667	\N	\N	\N	18	贁	bài	to defeat to spoil or be spoiled; to corrupt or be corrupted
8668	貝 154.11	8668	\N	\N	\N	18	贂	chěn	\N
8669	貝 154.12	8669	\N	\N	\N	19	贉	dàn	earnest money; silk label on books
8670	走 156.8	8670	\N	\N	\N	15	趤	dàng	\N
8671	走 156.14	8671	8078	\N	\N	21	趯	tì	jump
8672	足 157.3	8672	\N	\N	\N	10	趶	kù	\N
8673	足 157.5	8673	\N	\N	\N	12	跔	jū	numb feet; to limp
8674	足 157.9	8674	\N	\N	\N	16	踴	yǒng	leap, jump
8675	足 157.10	8675	\N	\N	\N	16	蹆	tuǐ	(Cant.) to move in a straight line
8676	土 32.10	8676	7477	\N	\N	13	塥	gé	dry clay lump
8677	車 159.8	8677	\N	\N	\N	15	輝	huī	brightness, luster, brilliance
8678	車 159.9	8678	\N	\N	\N	16	輰	yáng	\N
8679	車 159.10	8679	\N	\N	\N	17	輿	yú	cart, palanquin; public opinion
8680	車 159.10	8680	\N	\N	\N	17	轂	gǔ	hub of wheel
8681	辵 162.13	8681	\N	\N	\N	15	邁	mài	take a big stride; pass by
8682	邑 163.6	8682	\N	\N	\N	8	邼	kuāng	\N
8683	金 167.2	8683	\N	\N	\N	10	釟	bā	\N
8684	金 167.2	8684	\N	\N	\N	10	釠	luàn	\N
8685	金 167.3	8685	\N	\N	\N	11	釣	diào	fish; fishhook; tempt, lure
8686	金 167.4	8686	\N	\N	\N	12	鈉	nà	sodium, natrium; sharpen wood
8687	金 167.5	8687	\N	\N	\N	13	鈴	líng	bell
8688	金 167.5	8688	\N	\N	\N	13	鈺	yù	rare treasure
8689	金 167.5	8689	\N	\N	\N	13	鉂	shǐ	\N
8690	金 167.6	8690	\N	\N	\N	14	銊	xù	\N
8691	金 167.6	8691	\N	\N	\N	14	銘	míng	inscribe, engrave; unforgettably
8692	金 167.7	8692	\N	\N	\N	15	鋤	chú	hoe; eradicate
8693	金 167.7	8693	\N	\N	\N	15	鋭	ruì	sharp
8694	金 167.8	8694	\N	\N	\N	16	錃	bēi	\N
8695	金 167.8	8695	\N	\N	\N	16	錈	juǎn	to bend iron
8696	水 85.11	8696	5569	\N	\N	13	漭	mǎng	vast; expansive
8697	金 167.9	8697	\N	\N	\N	16	錨	máo	anchor
8698	金 167.9	8698	\N	\N	\N	17	鍤	chā	spade, shovel; marking pin
8699	金 167.11	8699	\N	\N	\N	19	鏆	guàn	\N
8700	金 167.12	8700	\N	\N	\N	20	鐖	jī	\N
8701	金 167.12	8701	\N	\N	\N	20	鐧	jiān	kind of rapier
8702	金 167.13	8702	\N	\N	\N	21	鐳	léi	radium
8703	金 167.17	8703	\N	\N	\N	25	鑱	chán	spade, trowel
8704	金 167.19	8704	\N	\N	\N	27	鑾	luán	bells hung on horse; bells hung
8705	金 167.9	8705	7685	\N	\N	14	镃	zī	hoe; mattock
8706	門 169.7	8706	\N	\N	\N	15	閬	làng	high door; high gate; high, lofty
8707	門 169.8	8707	\N	\N	\N	16	閾	yù	threshold; separated, confined
8708	門 169.8	8708	\N	\N	\N	16	閿	wén	name of a district in Henan province
8709	阜 170.7	8709	\N	\N	\N	9	陜	xiá	narrow; mountain pass
8710	阜 170.7	8710	\N	\N	\N	9	陝	shǎn	mountain pass; Shaanxi province
8711	雨 173.9	8711	\N	\N	\N	17	霠	yīn	\N
8712	革 177.6	8712	\N	\N	\N	15	鞏	gǒng	bind; firm, secure, strong
8713	革 177.7	8713	\N	\N	\N	16	鞖	suī	\N
8714	韋 178.5	8714	6766	\N	\N	9	韨	fú	a leather knee-pad worn during sacrifices
8715	音 180.10	8715	\N	\N	\N	19	韼	péng	\N
8716	音 180.11	8716	\N	\N	\N	20	韽	ān	\N
8717	頁 181.4	8717	\N	\N	\N	13	頒	bān	confer, bestow; publish, promulgate
8718	頁 181.7	8718	\N	\N	\N	16	頤	yí	cheeks; jaw; chin; rear; to nourish
8719	頁 181.10	8719	\N	\N	\N	19	顛	diān	top, peak, summit; upset
8720	食 184.5	8720	\N	\N	\N	13	飳	tǒu	\N
8721	食 184.5	8721	\N	\N	\N	14	飸	tāo	\N
8722	食 184.6	8722	\N	\N	\N	14	餆	yáo	\N
8723	食 184.8	8723	\N	\N	\N	16	館	guǎn	public building
8724	食 184.11	8724	\N	\N	\N	19	饅	mán	steamed bread; steamed dumplings
8725	馬 187.5	8725	\N	\N	\N	15	駐	zhù	to be stationed at, reside at; to stop
8726	口 30.13	8726	\N	\N	\N	16	駡	mà	accuse, blame, curse, scold
8727	馬 187.7	8727	\N	\N	\N	17	駷	sǒng	\N
8728	馬 187.7	8728	\N	\N	\N	17	騁	chěng	gallop horse; hasten, hurry
8729	馬 187.10	8729	\N	\N	\N	20	騫	qiān	raise, hold high; fly, soar
8730	馬 187.10	8730	\N	\N	\N	19	騷	sāo	harass, bother, annoy, disturb, agitate; sad, grieved
8731	馬 187.11	8731	\N	\N	\N	21	騼	lù	\N
8732	骨 188.14	8732	\N	\N	\N	23	髕	bìn	kneecap
8733	魚 195.2	8733	\N	\N	\N	13	魜	rén	mermaid; manatee
8734	魚 195.10	8734	\N	\N	\N	21	鰫	yóng	bighead carp
8735	魚 195.12	8735	\N	\N	\N	23	鱗	lín	fish scales
8736	魚 195.2	8736	7034	\N	\N	10	鱽	dāo	the mullet
8737	魚 195.7	8737	7802	\N	\N	15	鲬	yǒng	a flathead (fish)
8738	鳥 196.6	8738	\N	\N	\N	17	鴻	hóng	species of wild swan; vast
8739	鳥 196.8	8739	\N	\N	\N	19	鶆	lái	\N
8740	鳥 196.8	8740	\N	\N	\N	19	鶊	gēng	oriole
8741	鳥 196.12	8741	\N	\N	\N	23	鷳	xián	the silver pheasant, Lophura nycthemera
8742	鳥 196.13	8742	\N	\N	\N	24	鷿	pì	a kind of bird resembling the duck; much smaller
8743	鳥 196.13	8743	\N	\N	\N	24	鸁	luó	grebe; wren
8744	鹿 198.11	8744	\N	\N	\N	22	麞	zhāng	roebuck, Moschus chinloo
8745	鼎 206.2	8745	\N	\N	\N	14	鼏	mì	cover of tripod caldron
8746	鼓 207.10	8746	\N	\N	\N	22	鼜	qì	\N
8747	鼠 208.5	8747	8010	\N	\N	18	鼫	shí	marmot; squirrel
8748	齒 211.6	8748	\N	\N	\N	21	齦	kěn	gums
8749	金 167.10	8749	\N	\N	\N	18	䦂	shàn	(simplified form of䥇) sarmarium (Sm); old ideograph for鋱, terbium (Tb); (same as釤) a sickle with a long handle, to swing a sickle to cut (grass or wheat)
8750	魚 195.5	8750	7560	\N	\N	16	䲟	yìn	(simplified form of鮣) a kind of fish, live in the ocean, dark brown color with two white vertical marks; flat shaped head
8751	鳥 196.4	8751	6806	\N	\N	15	䴓	shī	general term for a group of small birds
8752	鳥 196.6	8752	7152	\N	\N	17	䴕	liè	a woodpecker
8753	龍 212.4	8753	6814	\N	\N	20	䶮	yǎn	high and bright
8754	皿 108.13	8754	\N	\N	\N	18	盬	gǔ	salt pit; leisure; pot; drink
8755	示 113.4	8755	\N	\N	\N	8	祅	yāo	calamities, disasters; ormazda
8756	示 113.10	8756	\N	\N	\N	14	禡	mà	a sacrifice at the beginning of a military campaign or on the 2nd and 16th day of the lunar month
8757	示 113.13	8757	\N	\N	\N	16	禭	suì	\N
8758	米 119.16	8758	\N	\N	\N	22	糱	niè	fermenting grain; yeast
8759	糸 120.9	8759	\N	\N	\N	15	縂	zǒng	collect; overall, altogether
8760	虫 142.16	8760	\N	\N	\N	22	蠥	niè	\N
8761	車 159.5	8761	\N	\N	\N	12	軷	bá	sacrifice
8762	邑 163.12	8762	\N	\N	\N	14	鄮	mào	ancient place name
8763	金 167.3	8763	\N	\N	\N	11	釱	dì	fetters; to fetter
8764	金 167.6	8764	\N	\N	\N	14	銦	yīn	indium
8765	金 167.8	8765	\N	\N	\N	16	錣	zhuì	armor neckplates
8766	金 167.15	8766	\N	\N	\N	23	鑢	lǜ	file, rasp; file; polish; (Cant.) to cut
8767	金 167.3	8767	\N	\N	\N	8	钑	jí	spear
8768	食 184.17	8768	\N	\N	\N	25	饟	xiǎng	rations and pay for soldiers; dried rice
8769	魚 195.7	8769	\N	\N	\N	17	鯅	shān	\N
8770	黽 205.13	8770	\N	\N	\N	26	鼊	bì	\N
8771	鳥 196.8	8771	7465	\N	\N	19	䴖	jīng	a kind of water bird
8772	竹 118.12	8772	\N	\N	\N	19	簫	xiāo	musical instrument like pan-pipes, bamboo flute
8773	聿 129.6	8773	\N	\N	\N	11	粛	sù	pay respects; reverently
8774	米 119.8	8774	\N	\N	\N	14	粻	zhāng	provisions
8775	食 184.11	8775	\N	\N	\N	18	饈	xiū	food, meal; eat; offer
8776	皿 108.5	8776	\N	\N	\N	10	盌	wǎn	bowl, basin, cup
8777	目 109.9	8777	\N	\N	\N	14	瞂	fá	\N
8778	金 167.7	8778	\N	\N	\N	15	鋅	xīn	zincum
8779	革 177.3	8779	\N	\N	\N	12	靮	dí	bridle
8780	皿 108.12	8780	\N	\N	\N	17	盨	xǔ	\N
8781	目 109.4	8781	\N	\N	\N	9	県	xiàn	county, district, subdivision
8782	竹 118.8	8782	\N	\N	\N	14	箥	bǒ	\N
8783	竹 118.10	8783	7951	\N	\N	17	簕	lè	(Cant.) thorn
8784	肉 130.16	8784	\N	\N	\N	20	臖	xìng	to swell; swelling
8785	金 167.10	8785	\N	\N	\N	18	鎔	róng	fuse, melt, smelt; mold
8786	金 167.11	8786	\N	\N	\N	19	鏐	liú	pure gold
8787	頁 181.9	8787	\N	\N	\N	18	顔	yán	face, facial appearance
8788	目 109.4	8788	\N	\N	\N	9	盿	mín	\N
8789	艸 140.9	8789	\N	\N	\N	11	萵	wō	lettuce
8790	艸 140.11	8790	7645	\N	\N	14	蔊	hǎn	Nasturtium montanum
8791	見 147.8	8791	\N	\N	\N	15	覥	tiǎn	ashamed
8792	貝 154.5	8792	\N	\N	\N	13	貲	zī	property; wealth; to count
8793	馬 187.16	8793	\N	\N	\N	26	驢	lǘ	donkey, ass
8794	鳥 196.10	8794	\N	\N	\N	21	鶸	ruò	light yellowish-green
8795	石 112.10	8795	\N	\N	\N	15	磑	wéi	stone mill; grind; break apart
8796	穴 116.5	8796	7074	\N	\N	10	窎	diào	deep; distant
8797	言 149.5	8797	\N	\N	\N	12	詒	yí	bequeath, pass on to future generations
8798	金 167.5	8798	\N	\N	\N	13	鉔	zā	\N
8799	金 167.11	8799	\N	\N	\N	19	鏱	zhang	\N
8800	隹 172.2	8800	7081	\N	\N	10	隺	hú	a bird flying high ambition
8801	食 184.14	8801	\N	\N	\N	23	饜	yàn	to eat to the full
8802	艸 140.6	8802	\N	\N	\N	9	荘	zhuāng	village, hamlet; villa; surname
8803	艸 140.10	8803	7490	\N	\N	13	蒻	ruò	rushes
8804	艸 140.11	8804	\N	\N	\N	14	蔴	má	hemp; sesame; applied to other plants furnishing textile fibres
8805	衣 145.7	8805	7570	\N	\N	13	裛	yì	to wrap and bind; damp; a book bag
8806	金 167.4	8806	\N	\N	\N	12	鈙	qín	\N
8807	金 167.10	8807	\N	\N	\N	18	鎋	xiá	the linch-pin of a wheel to govern or control the noise of a barrow
8808	金 167.13	8808	\N	\N	\N	21	鑀	ài	ionium
8809	髟 190.5	8809	\N	\N	\N	15	髴	fú	disheveled hair; similar to
8810	鳥 196.5	8810	\N	\N	\N	16	鴓	miè	\N
8811	鳥 196.13	8811	\N	\N	\N	10	鸴	xué	oriental bullfinch, weaver bird; Pyrrhula species (various)
8812	黽 205.4	8812	\N	\N	\N	17	黿	yuán	large turtle, sea turtle
8813	禾 115.6	8813	\N	\N	\N	11	秹	rěn	\N
8814	艸 140.6	8814	\N	\N	\N	9	茢	liè	sedges; rushes
8815	艸 140.16	8815	\N	\N	\N	19	蘁	wù	to disobey; contrary, against
8816	虫 142.4	8816	\N	\N	\N	10	蚑	qí	tip-toe
8817	金 167.12	8817	\N	\N	\N	20	鏻	lín	phosphonium
8818	雨 173.10	8818	\N	\N	\N	18	霤	liù	drip; rain-water catcher
8819	雨 173.11	8819	\N	\N	\N	18	霩	kuò	big, emply, open
8820	頁 181.7	8820	\N	\N	\N	16	頺	tuí	\N
8821	食 184.8	8821	\N	\N	\N	16	餚	yáo	prepared meat; food
8822	魚 195.7	8822	\N	\N	\N	18	鯂	su	\N
8823	竹 118.15	8823	\N	\N	\N	21	籔	sǒu	bamboo basket
8824	艸 140.12	8824	\N	\N	\N	15	蕁	qián	nettle
8825	艸 140.17	8825	8052	\N	\N	20	蘘	ráng	a kind of wild ginger
8826	隹 172.6	8826	\N	\N	\N	14	雑	zá	mixed, blended; mix, mingle
8827	鬲 193.8	8827	7983	\N	\N	18	鬶	guī	\N
8828	魚 195.8	8828	\N	\N	\N	19	鯵	shēn	\N
8829	魚 195.10	8829	\N	\N	\N	21	鰧	téng	\N
8830	魚 195.11	8830	\N	\N	\N	22	鱂	jiāng	name of fish
8831	魚 195.9	8831	7966	\N	\N	17	鳂	wēi	name of fish
8832	鳥 196.7	8832	\N	\N	\N	18	鵟	kuáng	buzzard (genus Buteo)
8833	皿 108.9	8833	\N	\N	\N	14	盠	lí	\N
8834	目 109.3	8834	\N	\N	\N	8	盳	wàng	\N
8835	目 109.4	8835	\N	\N	\N	9	盽	fēng	\N
8836	目 109.4	8836	\N	\N	\N	9	眃	yún	\N
8837	目 109.5	8837	\N	\N	\N	10	眏	yāng	\N
8838	目 109.8	8838	\N	\N	\N	13	睧	hūn	dull vision
8839	石 112.6	8839	\N	\N	\N	11	硄	kuāng	\N
8840	石 112.8	8840	\N	\N	\N	13	碔	wǔ	1/2 pr stone
8841	石 112.9	8841	\N	\N	\N	14	碦	kè	\N
8842	石 112.9	8842	\N	\N	\N	14	碸	fēng	an organic compound
8843	石 112.10	8843	\N	\N	\N	15	磃	sī	\N
8844	石 112.14	8844	\N	\N	\N	19	礘	è	\N
8845	石 112.16	8845	\N	\N	\N	21	礮	pào	ancient ballista for throwing heavy stones a cannon, a gun
8846	示 113.5	8846	\N	\N	\N	10	祘	suàn	to calculate
8847	示 113.11	8847	7827	\N	\N	15	禤	xuān	surname Xuan
8848	火 86.5	8848	\N	\N	\N	9	秌	qiū	(same as秋) autumn, fall; year
8849	禾 115.5	8849	\N	\N	\N	10	秙	kù	\N
8850	禾 115.5	8850	\N	\N	\N	10	秢	líng	\N
8851	禾 115.9	8851	\N	\N	\N	14	稧	xì	\N
8852	禾 115.9	8852	\N	\N	\N	14	稬	nuò	glutinous, sticky
8853	禾 115.9	8853	\N	\N	\N	14	稲	dào	rice growing in field, rice plant
8854	禾 115.10	8854	\N	\N	\N	15	稸	xù	\N
8855	禾 115.12	8855	7949	\N	\N	17	穜	zhǒng	rice
8856	立 117.4	8856	\N	\N	\N	9	竒	qí	strange, unusual, uncanny, occult
8857	竹 118.7	8857	7544	\N	\N	13	筶	gào	\N
8858	竹 118.10	8858	\N	\N	\N	16	篬	qiāng	\N
8859	竹 118.15	8859	\N	\N	\N	21	籒	zhòu	variant of 籀
8860	竹 118.16	8860	\N	\N	\N	22	籜	tuò	bamboo sheath, bamboo shoots
8861	竹 118.16	8861	\N	\N	\N	23	籞	yù	a fence
8862	米 119.2	8862	\N	\N	\N	8	籶	shēn	\N
8863	米 119.9	8863	\N	\N	\N	15	糂	sǎn	\N
8864	米 119.9	8864	\N	\N	\N	15	糉	zòng	dumpling made of glutinous rice
8865	糸 120.8	8865	\N	\N	\N	14	綡	liáng	\N
8866	糸 120.8	8866	\N	\N	\N	14	綶	guǒ	\N
8867	糸 120.8	8867	\N	\N	\N	14	緄	gǔn	cord; woven belt; hem; hemming
8868	糸 120.9	8868	\N	\N	\N	15	緗	xiāng	light-yellow color
8869	糸 120.9	8869	\N	\N	\N	15	緼	yùn	variant of縕U+7E15, tangled hemp, raveled silk; vague, confused
8870	糸 120.9	8870	\N	\N	\N	15	縁	yuán	hem
8871	糸 120.10	8871	\N	\N	\N	15	縋	zhuì	climb down rope; hang by rope
8872	糸 120.10	8872	\N	\N	\N	16	縞	gǎo	white raw silk
8873	糸 120.12	8873	\N	\N	\N	17	繤	zuǎn	edit
8874	糸 120.12	8874	\N	\N	\N	18	繧	yun	\N
8875	糸 120.13	8875	\N	\N	\N	19	繬	sè	\N
8876	糸 120.14	8876	\N	\N	\N	20	纃	qí	\N
8877	糸 120.15	8877	\N	\N	\N	21	纉	zuǎn	variant of 缵
8878	糸 120.16	8878	\N	\N	\N	22	纒	chán	wrap, wind around; tie, bind
8879	糸 120.18	8879	\N	\N	\N	24	纗	zuī	\N
8880	网 122.9	8880	\N	\N	\N	14	罯	ǎn	\N
8881	网 122.12	8881	\N	\N	\N	18	羀	liǔ	fishing trap
8882	耳 128.1	8882	\N	\N	\N	7	耴	yì	\N
8883	肉 130.2	8883	\N	\N	\N	6	肍	qiú	\N
8884	肉 130.9	8884	7555	\N	\N	13	腨	shuàn	\N
8885	肉 130.11	8885	\N	\N	\N	15	膗	chuái	ugly and fat; too fat to move
8886	肉 130.11	8886	\N	\N	\N	15	膟	lǜ	fat
8887	舟 137.4	8887	\N	\N	\N	10	舦	tài	(Cant.) rudder
8888	舟 137.8	8888	\N	\N	\N	14	艊	bó	\N
8889	艸 140.8	8889	\N	\N	\N	11	菄	dōng	\N
8890	艸 140.9	8890	\N	\N	\N	12	葾	yuān	(Cant.) a bad smell
8891	艸 140.10	8891	\N	\N	\N	13	蒕	yūn	\N
8892	艸 140.10	8892	\N	\N	\N	13	蒘	rú	\N
8893	艸 140.10	8893	\N	\N	\N	13	蒧	diǎn	\N
8894	艸 140.10	8894	\N	\N	\N	12	蓃	sōu	\N
8895	艸 140.10	8895	\N	\N	\N	13	蓆	xí	straw mat, mat
8896	艸 140.10	8896	\N	\N	\N	13	蔱	shā	\N
8897	艸 140.16	8897	\N	\N	\N	19	蘔	jiōng	\N
8898	虫 142.12	8898	\N	\N	\N	18	蟨	jué	the Siberian jerboa
8899	虫 142.16	8899	\N	\N	\N	22	蠪	lóng	\N
8900	衣 145.13	8900	\N	\N	\N	17	襖	ǎo	outer garments; coat, jacket
8901	言 149.6	8901	\N	\N	\N	13	誇	kuā	exaggerate; brag, boast; flaunt
8902	言 149.10	8902	\N	\N	\N	17	謟	tāo	flatter; suspect, be uncertain
8903	言 149.18	8903	\N	\N	\N	24	讙	huān	cheer; noise, noisy
8904	谷 150.7	8904	\N	\N	\N	14	谽	hān	a mouth or opening
8905	足 157.8	8905	\N	\N	\N	15	踨	zōng	\N
8906	足 157.13	8906	\N	\N	\N	19	躉	dǔn	sell or buy wholesale; store
8907	身 158.6	8907	\N	\N	\N	13	躱	duǒ	hide
8908	車 159.8	8908	\N	\N	\N	15	輗	ní	the cross-bar at the end of a carriage pole; linchpin of a large carriage
8909	金 167.1	8909	\N	\N	\N	9	釔	yǐ	yttrium
8910	金 167.7	8910	\N	\N	\N	15	鋕	zhì	engrave
8911	金 167.10	8911	\N	\N	\N	17	鎚	chuí	hammer, mallet; club
8912	革 177.15	8912	\N	\N	\N	24	韆	qiān	swing
8913	魚 195.9	8913	\N	\N	\N	20	鯶	hǔn	\N
8914	魚 195.9	8914	\N	\N	\N	17	鳋	sāo	carp
8915	鳥 196.8	8915	7575	\N	\N	13	鹒	gēng	oriole
8916	竹 118.10	8916	\N	\N	\N	16	篭	lóng	cage; cage-like basket
8917	糸 120.10	8917	\N	\N	\N	16	縜	yún	\N
8918	肉 130.9	8918	\N	\N	\N	13	腣	dì	\N
8919	走 156.2	8919	\N	\N	\N	9	赲	lì	\N
8920	馬 187.4	8920	\N	\N	\N	14	馻	yǔn	\N
8921	石 112.11	8921	\N	\N	\N	16	磞	pēng	\N
8922	目 109.8	8922	\N	\N	\N	13	睕	wǎn	\N
8923	目 109.11	8923	\N	\N	\N	16	瞜	lōu	to see; to look at; to observe
8924	石 112.9	8924	\N	\N	\N	14	碠	dìng	\N
8925	石 112.12	8925	\N	\N	\N	17	磽	qiāo	barren land; sandy soil
8926	竹 118.12	8926	\N	\N	\N	17	簘	xiāo	musical instrument like pan-pipes, bamboo flute
8927	肉 130.8	8927	\N	\N	\N	12	腃	kuì	\N
8928	肉 130.9	8928	\N	\N	\N	13	腵	jiā	\N
8929	艸 140.11	8929	\N	\N	\N	14	蓳	jǐn	\N
8930	襾 146.13	8930	\N	\N	\N	19	覇	bà	rule by might rather than right
8931	酉 164.12	8931	\N	\N	\N	19	醱	fā	to brew for the second time
8932	金 167.6	8932	\N	\N	\N	14	銝	xiū	\N
8933	巛 47.0	8933	\N	\N	\N	3	巛	chuān	river; KangXi radical 47
8934	金 167.13	8934	\N	\N	\N	21	鐴	bì	\N
8935	金 167.18	8935	\N	\N	\N	25	鑵	guàn	jar; can
8936	阜 170.13	8936	7741	\N	\N	14	隩	ào	profound, subtle; warm
8937	風 182.9	8937	\N	\N	\N	18	颺	yáng	soar, fly, float; scatter
8938	食 184.4	8938	\N	\N	\N	13	飮	yǐn	drink; swallow; kind of drink
8939	食 184.4	8939	\N	\N	\N	12	飰	fàn	variant of 饭
8940	食 184.6	8940	\N	\N	\N	14	餇	tóng	food
8941	食 184.12	8941	\N	\N	\N	20	饐	yì	spoiled, rotten, sour
8942	疒 104.5	8942	7043	\N	\N	10	痃	xuán	indigestion; buboes, lymphatic inflammation
8943	馬 187.5	8943	\N	\N	\N	15	駞	tuó	camel
8944	鳥 196.5	8944	\N	\N	\N	17	鴜	cí	\N
8945	水 85.6	8945	\N	\N	\N	9	㳠	tà	(simplified form of澾) slippery ( as a road)
8946	目 109.9	8946	5693	\N	\N	14	䁖	lōu	to see; to look at; to observe
8947	目 109.7	8947	\N	\N	\N	12	睅	hàn	big-eyed
8948	目 109.7	8948	\N	\N	\N	12	睍	xiàn	to look at fearfully; overly cautious
8949	石 112.9	8949	\N	\N	\N	14	碭	dàng	brilliantly colored stone with veined patterns in it
8950	石 112.10	8950	\N	\N	\N	15	碽	gōng	\N
8951	石 112.12	8951	\N	\N	\N	17	磸	dìng	\N
8952	石 112.13	8952	\N	\N	\N	18	礉	hé	\N
8953	示 113.2	8953	\N	\N	\N	6	礽	réng	blessings, happiness
8954	示 113.8	8954	5308	\N	\N	12	祾	líng	\N
8955	示 113.9	8955	\N	\N	\N	13	禌	zī	\N
8956	竹 118.7	8956	7390	\N	\N	12	筥	jǔ	round-shaped bamboo basket for holding rice
8957	竹 118.13	8957	\N	\N	\N	19	簴	jù	\N
8958	糸 120.4	8958	\N	\N	\N	10	紣	cuì	\N
8959	糸 120.6	8959	\N	\N	\N	12	絍	rèn	to lay the warp; to weave
8960	糸 120.9	8960	\N	\N	\N	15	縆	gēng	a rope
8961	糸 120.11	8961	\N	\N	\N	17	繀	suì	\N
8962	糸 120.11	8962	\N	\N	\N	17	繃	běng	bind, draw firmly, strap
8963	羊 123.5	8963	7229	\N	\N	11	羕	yàng	\N
8964	羊 123.12	8964	\N	\N	\N	18	羵	fén	spirit
8965	老 125.5	8965	6773	\N	\N	9	耇	gǒu	wrinkled face of the elderly
8966	耳 128.9	8966	\N	\N	\N	15	聫	lián	connect, join; associate, ally
8967	肉 130.7	8967	\N	\N	\N	11	脗	wěn	coinciding, agreeing
8968	自 132.6	8968	\N	\N	\N	12	臯	gāo	to praise; to bless high; eminent; (Cant.) a marsh, pool
8969	舟 137.7	8969	\N	\N	\N	13	艁	zào	to build, to invent
8970	舟 137.7	8970	\N	\N	\N	13	艂	féng	\N
8971	艸 140.6	8971	\N	\N	\N	9	茞	chén	fragrant plant; angelica
8972	艸 140.9	8972	\N	\N	\N	12	葨	wēi	\N
8973	艸 140.9	8973	7319	\N	\N	12	蒄	guān	meaning unknown ("herb mentioned in old books")
8974	艸 140.10	8974	\N	\N	\N	13	蒭	chú	to cut grass; hay; fodder
8975	艸 140.13	8975	\N	\N	\N	16	薂	xí	\N
8976	艸 140.15	8976	\N	\N	\N	18	藯	wèi	\N
8977	虫 142.7	8977	\N	\N	\N	13	蜆	xiàn	a variety of bivalves
8978	虫 142.10	8978	\N	\N	\N	16	螑	xiù	\N
8979	虫 142.13	8979	\N	\N	\N	18	蟼	jǐng	\N
8980	行 144.10	8980	\N	\N	\N	16	衟	dào	variant of 道
8981	衣 145.9	8981	\N	\N	\N	14	褑	yuàn	\N
8982	衣 145.10	8982	\N	\N	\N	15	褠	gōu	\N
8983	言 149.3	8983	\N	\N	\N	10	訐	jié	to accuse; to pry
8984	言 149.3	8984	\N	\N	\N	10	訔	yín	\N
8985	言 149.5	8985	\N	\N	\N	12	詖	bì	argue; biased; one-sided
8986	言 149.5	8986	\N	\N	\N	12	詗	xiòng	to spy; to give information; shrewd
8987	言 149.6	8987	\N	\N	\N	13	詪	hěn	difficulty in speaking; wrangling
8988	言 149.8	8988	\N	\N	\N	15	諈	zhuì	\N
8989	言 149.8	8989	\N	\N	\N	15	諑	zhuó	slander; gossip; rumors
8990	言 149.16	8990	\N	\N	\N	23	讌	yàn	a feast, banquet; to entertain, feast
8991	豕 152.3	8991	\N	\N	\N	10	豗	huī	clamour
8992	豕 152.12	8992	\N	\N	\N	19	豷	yì	breathing of pigs
8993	豸 153.11	8993	\N	\N	\N	18	貗	jù	\N
8994	貝 154.3	8994	\N	\N	\N	10	貣	tè	\N
8995	貝 154.9	8995	\N	\N	\N	16	賯	xiōng	\N
8996	貝 154.12	8996	\N	\N	\N	19	贋	yàn	false; counterfeit; bogus; sham
8997	冫 15.4	8997	6544	\N	\N	6	冱	hù	freezing; stopped up, closed off
8998	車 159.6	8998	\N	\N	\N	13	輀	ér	hearse
8999	艸 140.9	8999	7308	\N	\N	12	蒈	kǎi	an organic compound
9000	車 159.12	9000	\N	\N	\N	19	轓	fān	\N
9001	辵 162.4	9001	\N	\N	\N	7	迋	wàng	travel, go to; deceive; scare
9002	辵 162.7	9002	\N	\N	\N	10	逓	dì	hand over, deliver; substitute
9003	邑 163.15	9003	\N	\N	\N	16	鄺	kuàng	surname
9004	酉 164.7	9004	\N	\N	\N	14	酳	yìn	\N
9005	金 167.4	9005	\N	\N	\N	12	鈪	è	(Cant.) bracelet; bangle
9006	小 42.6	9006	4186	\N	\N	9	尜	gá	a child toy
9007	金 167.12	9007	\N	\N	\N	20	鐐	liáo	fetters
9008	車 159.5	9008	6816	\N	\N	9	轷	hū	surname
9009	雨 173.9	9009	\N	\N	\N	17	霘	dòng	\N
9010	革 177.5	9010	\N	\N	\N	14	鞄	páo	to work hides; leather bag
9011	馬 187.9	9011	\N	\N	\N	18	騧	guā	tan or piebald horse
9012	髟 190.7	9012	7921	\N	\N	17	髽	zhuā	to dress the hair
9013	魚 195.4	9013	\N	\N	\N	15	魣	xù	perch
9014	魚 195.7	9014	\N	\N	\N	18	鯀	gǔn	giant fish; father of the emperor Yu
9015	魚 195.10	9015	\N	\N	\N	20	鰰	shen	\N
9016	鳥 196.6	9016	\N	\N	\N	17	鴹	yáng	\N
9017	鼠 208.5	9017	\N	\N	\N	18	鼪	shēng	weasel
9018	龍 212.6	9018	\N	\N	\N	22	龔	gōng	give, present; reverential
9019	禾 115.3	9019	\N	\N	\N	8	秊	nián	\N
9020	鳥 196.6	9020	7224	\N	\N	17	䴔	jiāo	the fishing cormorant
9021	目 109.6	9021	\N	\N	\N	11	眮	tóng	\N
9022	竹 118.3	9022	\N	\N	\N	9	笀	máng	\N
9023	竹 118.17	9023	\N	\N	\N	23	籣	lán	bow case
9024	艸 140.14	9024	\N	\N	\N	17	藑	qióng	\N
9025	土 32.6	9025	6770	\N	\N	9	垲	kǎi	high and dry place
9026	金 167.9	9026	\N	\N	\N	17	鍳	jiàn	\N
9027	鳥 196.8	9027	\N	\N	\N	19	鵬	péng	fabulous bird of enormous size
9028	示 113.9	9028	7605	\N	\N	13	禔	zhī	happiness; peace; good fortune
9029	禾 115.15	9029	\N	\N	\N	20	穯	se	\N
9030	艸 140.6	9030	\N	\N	\N	9	茿	zhú	\N
9031	艸 140.7	9031	\N	\N	\N	10	莂	bié	\N
9032	艸 140.13	9032	\N	\N	\N	16	薃	hào	\N
9033	衣 145.13	9033	\N	\N	\N	18	襛	nóng	fine clothes
9034	谷 150.4	9034	\N	\N	\N	11	谻	jí	\N
9035	貝 154.8	9035	\N	\N	\N	15	賚	lài	give, present, confer; surname
9036	魚 195.4	9036	\N	\N	\N	15	魳	zā	a barracuda
9037	鳥 196.6	9037	\N	\N	\N	17	鵄	zhī	variant of鴟U+9D1F, kite, horned owl; wine cups
9038	木 75.4	9038	6664	\N	\N	8	㭎	gāng	(simplified form of棡) a tall tree; a large tree, (interchangeable扛) to carry on the shoulders of two of more men
9039	禾 115.11	9039	7876	\N	\N	16	穄	jì	panicled millet
9040	穴 116.1	9040	\N	\N	\N	6	穵	wā	deep hollow;, gouge, dig out
9041	竹 118.10	9041	\N	\N	\N	16	篛	ruò	cuticle of bamboo plant
9042	竹 118.10	9042	\N	\N	\N	16	簑	suō	a coat raincoat
9043	糸 120.6	9043	\N	\N	\N	12	絭	juàn	\N
9044	糸 120.8	9044	\N	\N	\N	14	緅	zōu	silk of purplish color
9045	糸 120.8	9045	\N	\N	\N	14	緍	mín	variant of緡U+7DE1, a fishing-line; cord; string of coins; a paper or straw string
9046	缶 121.12	9046	\N	\N	\N	18	罇	zūn	a goblet; a bottle, a wine-jar
9047	而 126.3	9047	6837	\N	\N	9	耑	duān	specialized; concentrated
9048	舟 137.9	9048	\N	\N	\N	15	艒	mù	\N
9049	豕 152.5	9049	\N	\N	\N	12	豠	chú	\N
9050	足 157.10	9050	\N	\N	\N	17	蹎	diān	to fall forward
9051	辛 160.7	9051	\N	\N	\N	14	辢	là	bitter, pungent, acrid
9052	酉 164.14	9052	\N	\N	\N	21	醻	chóu	to pledge, thank
9053	金 167.12	9053	\N	\N	\N	20	鐍	jué	hasp of a lock
9054	金 167.17	9054	\N	\N	\N	24	鑮	bó	\N
9055	門 169.9	9055	\N	\N	\N	16	闍	dū	tower over city gate
9056	頁 181.7	9056	\N	\N	\N	16	頳	chēng	red
9057	馬 187.12	9057	\N	\N	\N	22	驈	yù	black horses
9058	髟 190.5	9058	\N	\N	\N	15	髲	bì	a wig
9059	魚 195.14	9059	\N	\N	\N	24	鱮	xù	silver carp (Hypophthalmichthys molitrix); bream; (Cant.)大嶼山daai6ju4saan1 Lantau Island
9060	麥 199.6	9060	\N	\N	\N	17	麰	móu	barley
9061	黽 205.6	9061	\N	\N	\N	19	鼄	zhū	the spider
9062	黽 205.8	9062	\N	\N	\N	21	鼅	zhī	spider
9063	鼓 207.5	9063	\N	\N	\N	18	鼖	fén	drum
9064	手 64.18	9064	\N	\N	\N	21	㩳	sǒng	to hold; to grasp, to detain, to uphold, to push, to stand upright; expel, to shirk, to raise up
9065	目 109.5	9065	\N	\N	\N	10	眣	dié	prominent eyes
9066	目 109.7	9066	7350	\N	\N	12	睎	xī	to long for; to gaze at
9067	目 109.11	9067	\N	\N	\N	16	瞣	huan	\N
9068	目 109.13	9068	\N	\N	\N	18	矀	méi	\N
9069	石 112.6	9069	7149	\N	\N	11	硊	wěi	\N
9070	石 112.8	9070	\N	\N	\N	13	碅	jūn	\N
9071	石 112.11	9071	\N	\N	\N	16	磪	cuī	a high mountain; precipitous
9072	石 112.13	9072	\N	\N	\N	18	礒	yǐ	\N
9073	示 113.10	9073	\N	\N	\N	14	禞	gào	\N
9074	禾 115.5	9074	\N	\N	\N	10	秠	pī	millet
9075	禾 115.12	9075	7948	\N	\N	17	穙	pú	\N
9076	禾 115.18	9076	\N	\N	\N	22	穱	zhuō	\N
9077	穴 116.10	9077	\N	\N	\N	15	窯	yáo	kiln; coal mine pit
9078	立 117.7	9078	\N	\N	\N	12	竢	sì	wait for, wait until, as soon as
9079	竹 118.4	9079	\N	\N	\N	10	笍	zhuì	\N
9080	竹 118.7	9080	\N	\N	\N	13	筩	tóng	bamboo pipe; fish hook
9081	竹 118.11	9081	\N	\N	\N	16	篳	bì	wicker, bamboo
9082	竹 118.12	9082	8007	\N	\N	18	簠	fǔ	an ancient vessel used for holding boiled grain
9083	米 119.4	9083	\N	\N	\N	10	粃	bǐ	empty husks of grain
9084	米 119.5	9084	\N	\N	\N	11	粖	mò	\N
9085	米 119.10	9085	\N	\N	\N	16	糓	gǔ	grain, corn
9086	糸 120.1	9086	\N	\N	\N	7	糺	jiū	to collaborate; to band together
9087	糸 120.5	9087	\N	\N	\N	11	紭	hóng	\N
9088	糸 120.5	9088	\N	\N	\N	11	紾	zhěn	turns or twist; a switch
9089	糸 120.6	9089	\N	\N	\N	12	絶	jué	cut
9090	糸 120.7	9090	\N	\N	\N	13	綅	qīn	thread
9091	糸 120.11	9091	\N	\N	\N	17	繂	lǜ	\N
9092	糸 120.13	9092	\N	\N	\N	17	繋	jì	attach, connect, unite, fasten
9093	糸 120.12	9093	\N	\N	\N	18	繣	huà	obstinate; perverse
9094	网 122.4	9094	\N	\N	\N	8	罙	mí	deep
9095	网 122.7	9095	\N	\N	\N	12	罥	juàn	impede
9096	网 122.11	9096	\N	\N	\N	15	罼	bì	\N
9097	羊 123.4	9097	\N	\N	\N	9	羗	qiāng	tribes in West China; strong; educated; obstinate; a particle
9098	羊 123.5	9098	\N	\N	\N	11	羜	zhù	lamb
9099	羽 124.9	9099	\N	\N	\N	15	翭	hóu	\N
9100	耒 127.12	9100	\N	\N	\N	18	耮	lào	a kind of farm tool
9101	耳 128.13	9101	\N	\N	\N	19	聸	dān	\N
9102	肉 130.4	9102	6710	\N	\N	8	肸	xī	spread out; smilling or laughing
9103	肉 130.6	9103	\N	\N	\N	10	胹	ér	cooked; well-done
9104	肉 130.7	9104	\N	\N	\N	11	脣	chún	lips
9105	肉 130.9	9105	\N	\N	\N	13	腬	ròu	(Cant.) greasy, oily
9106	肉 130.10	9106	\N	\N	\N	13	膄	sòu	to become emaciated
9107	肉 130.10	9107	\N	\N	\N	14	膆	sù	the corp of a bird or fowl; fat
9108	肉 130.10	9108	\N	\N	\N	14	膋	liáo	fat
9109	肉 130.15	9109	\N	\N	\N	19	臕	biāo	fat; gross, sleek
9110	臼 134.6	9110	\N	\N	\N	12	舃	xì	a shoe; the sole of a shoe; magpie
9111	舟 137.16	9111	\N	\N	\N	22	艫	lú	bow or prow of boat
9112	舟 137.18	9112	\N	\N	\N	24	艭	shuāng	ship
9113	色 139.13	9113	\N	\N	\N	19	艶	yàn	beautiful, sexy, voluptuous
9114	艸 140.2	9114	\N	\N	\N	5	艼	tīng	\N
9115	艸 140.6	9115	\N	\N	\N	9	荢	yu	\N
9116	艸 140.7	9116	\N	\N	\N	10	荳	dòu	beans, peas; bean-shaped
9117	艸 140.16	9117	7121	\N	\N	11	萚	tuò	\N
9118	艸 140.10	9118	\N	\N	\N	13	蓗	zǒng	a plant; five-fold
9119	艸 140.11	9119	\N	\N	\N	12	蓱	píng	variant of 萍
9120	艸 140.12	9120	\N	\N	\N	15	蕋	ruǐ	unopened flowers, flower buds
9121	艸 140.12	9121	\N	\N	\N	15	蕟	fà	\N
9122	艸 140.13	9122	\N	\N	\N	16	薐	léng	spinach
9123	艸 140.13	9123	\N	\N	\N	16	薠	fán	plant similar to coco-grass
9124	艸 140.16	9124	\N	\N	\N	19	藺	lìn	rush used in making mats; surname
9125	艸 140.16	9125	\N	\N	\N	19	蘓	sū	thyme; revive, resurrect; soviet
9126	艸 140.17	9126	\N	\N	\N	20	蘪	méi	\N
9127	虫 142.3	9127	\N	\N	\N	9	虵	shé	variant of 蛇
9128	虫 142.5	9128	\N	\N	\N	11	蚾	pí	\N
9129	虫 142.6	9129	\N	\N	\N	13	蛖	máng	\N
9130	虫 142.6	9130	\N	\N	\N	12	蛜	yī	woodlouse
9131	虫 142.9	9131	\N	\N	\N	13	蝍	jié	a centipede
9132	虫 142.9	9132	\N	\N	\N	15	蝨	shī	louse; bed bug
9133	虫 142.11	9133	\N	\N	\N	17	蟂	xiāo	\N
9134	虫 142.12	9134	\N	\N	\N	18	蟜	jiǎo	insect
9135	虫 142.13	9135	\N	\N	\N	19	蠏	xiè	crab, brachyura
9136	行 144.6	9136	\N	\N	\N	12	衕	tòng	alley, lane
9137	行 144.6	9137	\N	\N	\N	13	衘	xián	variant of 衔
9138	衣 145.5	9138	\N	\N	\N	10	袟	zhì	book cover; satchel or bag
9139	衣 145.5	9139	\N	\N	\N	11	袬	gǔn	\N
9140	言 149.8	9140	\N	\N	\N	15	誾	yín	speak gently; respectful
9141	言 149.12	9141	\N	\N	\N	21	譅	sè	wriggling
9142	言 149.12	9142	\N	\N	\N	19	譌	é	false, erronious
9143	言 149.14	9143	\N	\N	\N	21	譸	zhōu	deceive, cheat; hurried, bustling
9144	言 149.20	9144	\N	\N	\N	27	讜	dǎng	counsel, advice; speak out
9145	走 156.8	9145	\N	\N	\N	15	趝	jiàn	to pursue; to follow up
9146	走 156.8	9146	\N	\N	\N	15	趡	cuǐ	place
9147	足 157.7	9147	\N	\N	\N	14	跾	shū	\N
9148	足 157.7	9148	\N	\N	\N	14	踀	chù	\N
9149	足 157.9	9149	\N	\N	\N	16	踸	chěn	\N
9150	足 157.11	9150	\N	\N	\N	18	蹡	qiāng	to limp; walking; in motion
9151	土 32.6	9151	4102	\N	\N	9	垌	dòng	a field; used in place names
9152	足 157.12	9152	\N	\N	\N	19	蹳	bō	\N
9153	足 157.16	9153	\N	\N	\N	23	躛	wèi	exaggerate
9154	足 157.20	9154	\N	\N	\N	27	躩	jué	take quick, short steps
9155	身 158.8	9155	\N	\N	\N	15	躶	luǒ	bare, nude; undress, strip
9156	車 159.3	9156	\N	\N	\N	10	軏	yuè	cross-bar at the end of the poles of a cart
9157	車 159.5	9157	\N	\N	\N	12	軬	fàn	\N
9158	車 159.9	9158	\N	\N	\N	16	輵	gé	great array of spears and chariots
9159	車 159.13	9159	\N	\N	\N	20	轗	kǎn	fail
9160	車 159.20	9160	\N	\N	\N	26	轥	lìn	\N
9161	辵 162.8	9161	\N	\N	\N	11	逷	tì	distant, far away
9162	辵 162.9	9162	\N	\N	\N	12	遈	shí	\N
9163	辵 162.15	9163	\N	\N	\N	18	邌	lí	to walk slowly; to parade
9164	邑 163.11	9164	\N	\N	\N	13	鄟	zhuān	\N
9165	酉 164.9	9165	\N	\N	\N	16	醎	xián	\N
9166	金 167.3	9166	\N	\N	\N	11	釭	gāng	tire of wheel; band
9167	金 167.5	9167	\N	\N	\N	13	鈸	bó	cymbals
9168	心 61.5	9168	6725	\N	\N	8	怊	chāo	\N
9169	金 167.6	9169	\N	\N	\N	14	銌	zùn	\N
9170	金 167.7	9170	\N	\N	\N	15	鋂	méi	bit cup
9171	金 167.7	9171	\N	\N	\N	15	鋎	hàn	\N
9172	金 167.9	9172	\N	\N	\N	17	鍐	zōng	a headstall, ornament on a bride
9173	金 167.10	9173	\N	\N	\N	18	鎴	xí	strontium (obsolete)
9174	金 167.10	9174	\N	\N	\N	18	鎸	juān	engraving tool; carve, engrave
9175	金 167.15	9175	\N	\N	\N	23	鑘	léi	\N
9176	門 169.4	9176	\N	\N	\N	12	閔	mǐn	mourn, grieve; urge on, incite
9177	隹 172.5	9177	\N	\N	\N	12	雋	juàn	superior, outstanding, talented
9178	肉 130.12	9178	\N	\N	\N	16	膪	chuài	pork
9179	雨 173.10	9179	\N	\N	\N	18	霣	yǔn	fall
9180	雨 173.16	9180	\N	\N	\N	24	靃	huò	\N
9181	韋 178.5	9181	\N	\N	\N	14	韍	fú	a leather knee-pad worn during sacrifices
9182	風 182.3	9182	\N	\N	\N	12	颩	biāo	\N
9183	食 184.3	9183	\N	\N	\N	11	飦	zhān	well-boiled congee or gruel; thick, rich
9184	食 184.7	9184	\N	\N	\N	15	餔	bù	eat; dinner time; sunset
9185	馬 187.5	9185	\N	\N	\N	15	駋	zhāo	\N
9186	馬 187.8	9186	\N	\N	\N	18	騄	lù	name of a legendary swift horse
9187	骨 188.2	9187	\N	\N	\N	11	骩	wěi	\N
9188	骨 188.6	9188	\N	\N	\N	15	骻	kuà	\N
9189	骨 188.7	9189	\N	\N	\N	16	骾	gěng	any object that sticks in throat; bony
9190	髟 190.12	9190	\N	\N	\N	22	鬙	sēng	matted hair
9191	鬼 194.3	9191	\N	\N	\N	12	鬽	mèi	\N
9192	魚 195.4	9192	\N	\N	\N	15	魫	shěn	the young of fish
9193	魚 195.7	9193	\N	\N	\N	17	鯈	tiáo	fish
9194	魚 195.8	9194	\N	\N	\N	19	鯩	lún	\N
9195	魚 195.8	9195	\N	\N	\N	19	鯬	lí	\N
9196	魚 195.9	9196	\N	\N	\N	20	鰌	qiū	loach; squid; lizard; eel
9197	魚 195.6	9197	\N	\N	\N	14	鲓	kǎo	\N
9198	鳥 196.4	9198	\N	\N	\N	15	鴂	jué	the tailor-bird; the working bird
9199	鳥 196.8	9199	\N	\N	\N	19	鶍	yi	\N
9200	鳥 196.9	9200	\N	\N	\N	20	鶠	yǎn	\N
9201	鳥 196.10	9201	\N	\N	\N	21	鷁	yì	fishhawk; bow or prow
9202	鳥 196.11	9202	\N	\N	\N	22	鷖	yī	seagull
9203	鳥 196.13	9203	\N	\N	\N	24	鸇	zhān	hawk; Butastur indicus
9204	鳥 196.17	9204	\N	\N	\N	28	鸘	shuāng	eagle
9205	鳥 196.4	9205	6864	\N	\N	9	鸧	cāng	oriole
9206	鳥 196.9	9206	7689	\N	\N	14	鹙	qiū	large waterfowl with naked head; Garrulus glandarius
9207	鹿 198.7	9207	\N	\N	\N	18	麏	jūn	\N
9208	黑 203.9	9208	\N	\N	\N	21	黮	dǎn	black, dark; unclear; private
9209	齒 211.8	9209	\N	\N	\N	23	齯	ní	teeth grown in old age
9210	龍 212.6	9210	\N	\N	\N	22	龓	lǒng	a halter
9211	皿 108.6	9211	\N	\N	\N	11	盓	yū	\N
9212	目 109.5	9212	\N	\N	\N	10	眕	zhěn	restraint
9213	目 109.8	9213	\N	\N	\N	13	睘	qióng	round; stare
9214	目 109.8	9214	\N	\N	\N	13	睩	lù	\N
9215	目 109.13	9215	\N	\N	\N	18	矂	sào	\N
9216	石 112.2	9216	\N	\N	\N	7	矵	qì	\N
9217	石 112.3	9217	\N	\N	\N	8	矺	zhé	(Cant.) to press steadily
9218	石 112.5	9218	\N	\N	\N	10	砪	mǔ	\N
9219	石 112.6	9219	\N	\N	\N	11	硂	quán	\N
9220	石 112.8	9220	\N	\N	\N	13	碒	yín	\N
9221	石 112.11	9221	\N	\N	\N	16	磣	chěn	gritty
9222	示 113.6	9222	\N	\N	\N	10	祤	yǔ	\N
9223	示 113.12	9223	\N	\N	\N	15	禩	sì	variant of 祀
9224	禾 115.8	9224	7538	\N	\N	13	稑	lù	rice
9225	禾 115.11	9225	\N	\N	\N	16	穐	qiū	fall, autumn
9226	禾 115.12	9226	\N	\N	\N	17	穛	zhuō	\N
9227	穴 116.12	9227	\N	\N	\N	17	竂	piáo	\N
9228	竹 118.4	9228	\N	\N	\N	10	笉	qǐn	smiling countenance; bamboo rope
9229	竹 118.10	9229	\N	\N	\N	16	篟	qiàn	luxuriant growth of bamboo
9230	竹 118.11	9230	\N	\N	\N	17	篺	pí	\N
9231	糸 120.3	9231	\N	\N	\N	9	紂	zhòu	name of an emperor; saddle part
9232	糸 120.5	9232	\N	\N	\N	11	紻	yǎng	\N
9233	糸 120.8	9233	\N	\N	\N	14	綹	liǔ	skein; tuft, lock; wrinkle
9234	糸 120.8	9234	\N	\N	\N	14	緐	fán	variant of 繁
9235	糸 120.10	9235	\N	\N	\N	16	縈	yíng	entangle, entwine, coil
9236	糸 120.12	9236	\N	\N	\N	18	繖	sǎn	umbrella, parasol, parachute
9237	糸 120.13	9237	\N	\N	\N	19	繯	huán	noose; hang death; tie, bind
9238	糸 120.13	9238	\N	\N	\N	19	繴	bì	a kind of fishing-net
9239	糸 120.14	9239	\N	\N	\N	20	纀	pú	\N
9240	网 122.19	9240	\N	\N	\N	24	羉	luán	\N
9241	羽 124.5	9241	7157	\N	\N	11	翈	xiá	\N
9242	耒 127.7	9242	\N	\N	\N	13	耡	chú	hoe
9243	肉 130.8	9243	\N	\N	\N	12	腀	lún	\N
9244	舟 137.14	9244	\N	\N	\N	20	艩	qí	tholepin
9245	艸 140.4	9245	\N	\N	\N	7	苅	yì	cut off, reap, mow; sickle
9246	艸 140.7	9246	\N	\N	\N	10	莁	wú	\N
9247	艸 140.8	9247	\N	\N	\N	11	菞	lí	\N
9248	艸 140.8	9248	\N	\N	\N	11	菳	qín	\N
9249	艸 140.8	9249	\N	\N	\N	11	萈	huán	\N
9250	艸 140.9	9250	\N	\N	\N	11	蒁	shù	\N
9251	艸 140.10	9251	\N	\N	\N	13	蒑	yìn	\N
9252	艸 140.10	9252	\N	\N	\N	13	蓔	yǎo	a variety of grass
9253	艸 140.10	9253	\N	\N	\N	13	蓕	guì	\N
9254	艸 140.11	9254	\N	\N	\N	14	蔙	xuàn	(herb)
9255	艸 140.12	9255	\N	\N	\N	15	蔿	wěi	surname; place name
9256	艸 140.12	9256	\N	\N	\N	15	蕧	fù	\N
9257	艸 140.13	9257	\N	\N	\N	16	薆	ài	to cover; to hide; to conceal
9258	艸 140.13	9258	\N	\N	\N	16	薗	yuán	garden; park, orchard
9259	艸 140.13	9259	\N	\N	\N	16	薝	zhān	\N
9260	艸 140.14	9260	\N	\N	\N	17	藀	yíng	\N
9261	艸 140.16	9261	\N	\N	\N	20	蘌	yǔ	\N
9262	艸 140.25	9262	\N	\N	\N	29	虋	mén	asparagus a variety of red-stalked millet
9263	虫 142.5	9263	\N	\N	\N	11	蚿	xián	millipede
9264	虫 142.7	9264	\N	\N	\N	14	蜫	kūn	insects
9265	虫 142.8	9265	\N	\N	\N	14	蜽	liǎng	used in 蝄蜽
9266	虫 142.10	9266	\N	\N	\N	16	螥	cāng	the house-fly
9267	虫 142.15	9267	\N	\N	\N	20	蠚	hē	to sting
9268	衣 145.6	9268	\N	\N	\N	11	袽	rú	clothes
9269	衣 145.8	9269	\N	\N	\N	13	裶	fēi	\N
9270	衣 145.8	9270	\N	\N	\N	13	裺	yǎn	\N
9271	衣 145.10	9271	\N	\N	\N	15	褣	róng	\N
9272	衣 145.11	9272	\N	\N	\N	16	褸	lǚ	lapel, collar; tattered, threadbare
9273	言 149.5	9273	\N	\N	\N	12	詅	líng	to sell
9274	言 149.5	9274	\N	\N	\N	12	詇	yàng	\N
9275	言 149.5	9275	\N	\N	\N	12	詐	zhà	cheat, defraud, swindle; trick; to feign
9276	言 149.8	9276	\N	\N	\N	15	誻	tà	\N
9277	言 149.9	9277	\N	\N	\N	16	諧	xié	harmonize, agree; joke, jest
9278	言 149.10	9278	\N	\N	\N	17	謚	shì	to confer posthumous titles
9279	豕 152.7	9279	\N	\N	\N	14	豧	fū	\N
9280	貝 154.4	9280	\N	\N	\N	11	貮	èr	number two
9281	貝 154.8	9281	\N	\N	\N	15	賡	gēng	continue
9282	貝 154.9	9282	\N	\N	\N	16	賱	yǔn	\N
9283	貝 154.14	9283	7370	\N	\N	12	赑	bì	strong
9284	走 156.4	9284	\N	\N	\N	11	赹	qióng	\N
9285	走 156.4	9285	\N	\N	\N	11	赽	jué	\N
9286	足 157.7	9286	\N	\N	\N	14	踃	xiāo	\N
9287	足 157.11	9287	\N	\N	\N	18	蹞	kuǐ	\N
9288	足 157.11	9288	\N	\N	\N	18	蹧	zāo	to spoil; to ruin
9289	身 158.8	9289	\N	\N	\N	15	躻	kong	\N
9290	身 158.10	9290	\N	\N	\N	18	躿	kāng	tall
9291	車 159.9	9291	\N	\N	\N	16	輻	fú	spokes of wheel
9292	邑 163.7	9292	\N	\N	\N	9	郟	jiá	county in Henan province; surname
9293	邑 163.10	9293	7316	\N	\N	12	鄑	zī	kick; place in Shandong province
9294	酉 164.7	9294	\N	\N	\N	14	酼	hǎi	\N
9295	酉 164.8	9295	\N	\N	\N	15	醁	lù	a kind of green-colored wine
9296	酉 164.9	9296	\N	\N	\N	16	醕	chún	variant of 醇
9297	酉 164.11	9297	\N	\N	\N	18	醥	piǎo	\N
9298	金 167.3	9298	\N	\N	\N	11	釪	huá	an alms bowl; a small bell
9299	金 167.5	9299	\N	\N	\N	13	鈵	bǐng	\N
9300	金 167.6	9300	\N	\N	\N	14	銒	xíng	\N
9301	金 167.6	9301	\N	\N	\N	14	銙	kuǎ	\N
9302	金 167.8	9302	\N	\N	\N	16	鋺	yuǎn	a metal bowl
9303	金 167.8	9303	\N	\N	\N	16	錗	nèi	\N
9304	金 167.8	9304	\N	\N	\N	16	錥	yù	\N
9305	金 167.9	9305	\N	\N	\N	17	鍓	jí	\N
9306	金 167.9	9306	\N	\N	\N	17	鍟	xīng	(Cant.) rust
9307	金 167.10	9307	\N	\N	\N	18	鎍	suǒ	chain; wire
9308	金 167.10	9308	\N	\N	\N	18	鎘	lì	cadmium
9309	金 167.12	9309	\N	\N	\N	20	鏿	chēng	\N
9310	金 167.12	9310	\N	\N	\N	20	鐎	jiāo	\N
9311	金 167.13	9311	\N	\N	\N	20	鐤	dǐng	huge tripod of bronze with two ears; sacrificial vessel
9312	金 167.13	9312	\N	\N	\N	21	鐿	yì	ytterbium
9313	金 167.14	9313	\N	\N	\N	21	鑊	huò	cauldron, large iron pot; a wok
9314	金 167.15	9314	7532	\N	\N	13	锧	zhì	tungsten, wolfram
9315	門 169.6	9315	\N	\N	\N	14	閧	hòng	boisterous; clamor, noise
9316	門 169.11	9316	\N	\N	\N	19	闛	táng	\N
9317	阜 170.11	9317	\N	\N	\N	13	隝	dǎo	dock, entrenchment, low wall
9318	阜 170.12	9318	\N	\N	\N	14	隥	dèng	\N
9319	阜 170.13	9319	\N	\N	\N	15	隦	jiǎo	\N
9320	雨 173.16	9320	\N	\N	\N	24	靄	ǎi	cloudy sky, haze; calm, peaceful
9321	革 177.3	9321	\N	\N	\N	12	靱	rèn	strong and pliable, resilient
9322	革 177.9	9322	\N	\N	\N	18	鞪	mù	\N
9323	革 177.11	9323	\N	\N	\N	20	鞺	tāng	the sound of drums
9324	革 177.12	9324	\N	\N	\N	21	鞿	jī	\N
9325	韋 178.10	9325	\N	\N	\N	19	韟	gāo	\N
9326	頁 181.8	9326	\N	\N	\N	17	顀	chuí	\N
9327	風 182.10	9327	\N	\N	\N	19	飀	liú	soughing of wind; noise
9328	食 184.3	9328	\N	\N	\N	11	飥	tuō	rice cake
9329	食 184.4	9329	\N	\N	\N	12	飪	rèn	cooked food; cook until well done
9330	食 184.7	9330	\N	\N	\N	15	餒	něi	hungry, starving, famished
9331	食 184.11	9331	\N	\N	\N	18	饆	bì	\N
9332	馬 187.4	9332	\N	\N	\N	14	馿	lǘ	an ass; a donkey
9333	疒 104.11	9333	7892	\N	\N	16	癀	huáng	jaundice
9334	馬 187.17	9334	\N	\N	\N	27	驦	shuāng	horse
9335	骨 188.10	9335	\N	\N	\N	19	髉	bó	\N
9336	髟 190.9	9336	\N	\N	\N	19	鬉	zōng	disheveled hair, horse's mane
9337	鬲 193.10	9337	\N	\N	\N	20	鬸	liù	\N
9338	魚 195.2	9338	\N	\N	\N	13	魛	dāo	the mullet
9339	鳥 196.4	9339	\N	\N	\N	15	鳷	zhī	jay (Garrulus lidthi)
9340	鳥 196.7	9340	\N	\N	\N	18	鵋	jì	\N
9341	鳥 196.7	9341	\N	\N	\N	18	鵏	bǔ	\N
9342	鳥 196.8	9342	\N	\N	\N	19	鵨	shū	\N
9343	鳥 196.8	9343	\N	\N	\N	19	鵼	kōng	a fabulous night-bird, grotesque monster
9344	鳥 196.12	9344	\N	\N	\N	22	鷵	tú	\N
9345	鳥 196.12	9345	\N	\N	\N	23	鷼	xián	\N
9346	鳥 196.14	9346	\N	\N	\N	25	鸍	mí	\N
9347	鳥 196.15	9347	\N	\N	\N	26	鸓	lěi	flying squirrel
9348	鳥 196.16	9348	\N	\N	\N	27	鸖	hè	variant of 鶴
9349	鳥 196.10	9349	7805	\N	\N	15	鹠	liú	the owl
9350	黑 203.14	9350	\N	\N	\N	26	黶	yǎn	mole, scar, blemish
9351	黽 205.12	9351	\N	\N	\N	25	鼉	tuó	large reptile, water lizard
9352	齒 211.8	9352	\N	\N	\N	23	齰	zé	to bite
9353	石 112.8	9353	\N	\N	\N	11	碀	chéng	\N
9354	石 112.13	9354	\N	\N	\N	17	礇	yù	\N
9355	示 113.12	9355	\N	\N	\N	16	禪	chán	meditation, contemplation (dhyana); to level ground for altar; abdicate
9356	竹 118.7	9356	\N	\N	\N	13	筣	lí	\N
9357	竹 118.8	9357	\N	\N	\N	14	箏	zhēng	stringed musical instrument; kite
9358	米 119.12	9358	\N	\N	\N	18	糧	liáng	food, grain, provisions
9359	糸 120.4	9359	\N	\N	\N	10	紐	niǔ	knot; button; handle, knob; tie
9360	糸 120.5	9360	\N	\N	\N	11	紳	shēn	girdle; tie, bind; gentry
9361	糸 120.7	9361	\N	\N	\N	13	綀	shū	a kind of sackcloth
9362	糸 120.9	9362	\N	\N	\N	15	緱	gōu	cord binding on hilt of sword
9363	缶 121.6	9363	\N	\N	\N	12	缾	píng	jar, bottle
9364	羊 123.13	9364	\N	\N	\N	19	羷	liǎn	\N
9365	老 125.6	9365	\N	\N	\N	10	耊	diè	variant of 耋
9366	肉 130.16	9366	\N	\N	\N	20	臚	lú	arrange in order; display
9367	舟 137.8	9367	\N	\N	\N	14	艍	jū	\N
9368	艸 140.9	9368	\N	\N	\N	12	葏	jīng	\N
9369	虫 142.13	9369	\N	\N	\N	19	蠅	yíng	flies
9370	言 149.5	9370	\N	\N	\N	12	詛	zǔ	curse; swear, pledge
9371	言 149.8	9371	\N	\N	\N	15	誽	nì	\N
9372	言 149.8	9372	\N	\N	\N	15	諂	chǎn	flatter, truckle, toady
9373	貝 154.6	9373	\N	\N	\N	13	賂	lù	bribe; give present
9374	車 159.8	9374	\N	\N	\N	15	輧	píng	curtained carriage used by women
9375	車 159.10	9375	\N	\N	\N	17	輽	bèn	vehicle
9376	金 167.3	9376	\N	\N	\N	11	釦	kòu	button; buckle, clasp; engrave
9377	金 167.4	9377	\N	\N	\N	12	鈕	niǔ	button, knob; surname
9378	金 167.11	9378	\N	\N	\N	19	鏍	luó	\N
9379	金 167.12	9379	\N	\N	\N	21	鏽	xiù	rust, corrode
9380	金 167.13	9380	\N	\N	\N	21	鐲	zhuó	bracelet, armband; small bell
9381	風 182.5	9381	\N	\N	\N	14	颱	tái	taiphoon
9382	食 184.16	9382	\N	\N	\N	24	饝	mó	to feed an infant by hand steamed bread
9383	馬 187.8	9383	\N	\N	\N	18	騇	shè	\N
9384	骨 188.11	9384	\N	\N	\N	20	髏	lóu	skull; skeleton
9385	肉 130.8	9385	\N	\N	\N	12	腂	lěi	\N
9386	肉 130.15	9386	\N	\N	\N	18	臗	kuān	\N
9387	目 109.4	9387	\N	\N	\N	9	眀	míng	\N
9388	石 112.5	9388	6970	\N	\N	10	砫	zhù	ancestral tablet
9389	示 113.5	9389	\N	\N	\N	9	祙	mèi	demon
9390	示 113.7	9390	\N	\N	\N	11	祳	shèn	\N
9391	米 119.6	9391	\N	\N	\N	12	粧	zhuāng	toilet; make-up; dress up; adorn
9392	艸 140.12	9392	\N	\N	\N	15	蕣	shùn	hibiscus
9393	角 148.2	9393	\N	\N	\N	9	觓	qiú	\N
9394	足 157.4	9394	\N	\N	\N	11	趹	jué	to gallop
9395	邑 163.10	9395	\N	\N	\N	12	鄍	míng	a town in Shandong province
9396	金 167.4	9396	\N	\N	\N	12	鈡	zhōng	\N
9397	羊 123.9	9397	\N	\N	\N	15	羭	yú	good
9398	虫 142.8	9398	\N	\N	\N	14	蝄	wǎng	used in 蝄蜽
9399	衣 145.4	9399	\N	\N	\N	9	衸	jiè	\N
9400	言 149.10	9400	\N	\N	\N	17	謡	yáo	sing; folksong, ballad; rumor
9401	門 169.4	9401	\N	\N	\N	12	閏	rùn	intercalary; extra, surplus
9402	皿 108.12	9402	\N	\N	\N	17	盪	dàng	to toss about; to swing; to rock
9403	目 109.6	9403	\N	\N	\N	11	眲	nè	\N
9404	目 109.7	9404	\N	\N	\N	12	睋	é	\N
9405	目 109.14	9405	\N	\N	\N	19	矃	nǐng	\N
9406	目 109.16	9406	\N	\N	\N	20	矒	méng	\N
9407	石 112.7	9407	\N	\N	\N	11	硟	chàn	(Cant.) to slip; to work and polish gems
9408	石 112.9	9408	\N	\N	\N	14	碩	shuò	great, eminent; large, big
9409	石 112.10	9409	\N	\N	\N	15	磄	táng	\N
9410	石 112.12	9410	\N	\N	\N	17	礂	xi	\N
9411	石 112.13	9411	\N	\N	\N	18	礊	kè	\N
9412	示 113.7	9412	\N	\N	\N	11	祰	gào	\N
9413	示 113.8	9413	\N	\N	\N	12	祹	táo	\N
9414	示 113.9	9414	\N	\N	\N	13	禐	yuàn	\N
9415	禾 115.6	9415	\N	\N	\N	11	秳	huó	\N
9416	禾 115.6	9416	\N	\N	\N	11	秼	zhū	\N
9417	禾 115.7	9417	\N	\N	\N	12	稄	xùn	\N
9418	禾 115.7	9418	\N	\N	\N	12	稇	kǔn	to bind, as faggots of sheaves
9419	禾 115.7	9419	\N	\N	\N	12	稈	gǎn	stalk of grain; straw
9420	禾 115.8	9420	\N	\N	\N	13	稘	jī	a full year, an anniversary
9421	禾 115.8	9421	7539	\N	\N	13	稙	zhī	grain ready for grinding
9422	禾 115.13	9422	\N	\N	\N	18	穢	huì	dirty, unclean; immoral, obscene
9423	立 117.17	9423	\N	\N	\N	22	竸	jìng	contend, vie, compete
9424	竹 118.3	9424	\N	\N	\N	9	竾	chí	flute
9425	竹 118.4	9425	\N	\N	\N	10	笐	háng	bamboos placed across wooden frames on which grain may be stored in damp climates
9426	竹 118.5	9426	\N	\N	\N	11	笜	zhú	\N
9427	竹 118.6	9427	\N	\N	\N	12	筂	chí	\N
9428	竹 118.8	9428	\N	\N	\N	14	箒	zhǒu	broom
9429	竹 118.8	9429	\N	\N	\N	14	箛	gū	bugle
9430	竹 118.8	9430	\N	\N	\N	14	箞	qiān	\N
9431	竹 118.8	9431	\N	\N	\N	14	箤	zú	\N
9432	竹 118.9	9432	\N	\N	\N	15	箷	yí	\N
9433	竹 118.9	9433	\N	\N	\N	15	箹	yuē	\N
9434	竹 118.9	9434	\N	\N	\N	15	箿	jí	\N
9435	竹 118.10	9435	\N	\N	\N	16	篜	zhēng	\N
9436	竹 118.12	9436	\N	\N	\N	18	簞	dān	small bamboo basket for holding
9437	竹 118.12	9437	\N	\N	\N	18	簤	dài	\N
9438	竹 118.12	9438	\N	\N	\N	18	簨	sǔn	a beam for hanging bells or drums
9439	竹 118.13	9439	\N	\N	\N	19	簹	dāng	tall bamboo
9440	竹 118.13	9440	\N	\N	\N	19	簽	qiān	sign, endorse; slip of paper
9441	竹 118.19	9441	\N	\N	\N	24	籬	lí	bamboo or wooden fence; hedge
9442	米 119.5	9442	\N	\N	\N	10	粔	jù	cakes made from rice flour twisted into rings
9443	米 119.8	9443	\N	\N	\N	14	粸	qí	\N
9444	糸 120.3	9444	\N	\N	\N	9	紇	hé	inferior silk; tassel, fringe
9445	糸 120.4	9445	\N	\N	\N	10	紝	rèn	weave, lay warp
9446	糸 120.5	9446	\N	\N	\N	11	紺	gàn	dark blue or reddish color
9447	糸 120.5	9447	\N	\N	\N	11	絆	bàn	loop, catch; fetter, shackle
9448	糸 120.6	9448	\N	\N	\N	12	絳	jiàng	deep red; river in Shanxi provinc
9449	糸 120.7	9449	\N	\N	\N	13	綄	huán	\N
9450	糸 120.7	9450	\N	\N	\N	13	綊	xié	\N
9451	糸 120.7	9451	\N	\N	\N	13	綏	suī	soothe, appease, pacify; carriage harness
9452	糸 120.7	9452	\N	\N	\N	13	綒	fū	\N
9453	糸 120.7	9453	\N	\N	\N	13	綔	hù	\N
9454	糸 120.7	9454	\N	\N	\N	13	綗	jiǒng	variant of 䌹
9455	糸 120.8	9455	\N	\N	\N	14	綴	zhuì	patch together, link, connect
9456	糸 120.9	9456	\N	\N	\N	15	緝	jī	to sew in close stitches
9457	糸 120.9	9457	\N	\N	\N	15	緞	duàn	satin
9458	糸 120.9	9458	\N	\N	\N	15	緦	sī	coarse cotton cloth used for mourning
9459	糸 120.9	9459	\N	\N	\N	15	緰	tóu	net
9460	糸 120.9	9460	\N	\N	\N	15	緶	biàn	hem; plait, braid, queue
9461	糸 120.10	9461	\N	\N	\N	16	縣	xiàn	county, district, subdivision
9462	糸 120.11	9462	\N	\N	\N	17	縹	piǎo	light blue silk; dim; misty
9463	糸 120.12	9463	\N	\N	\N	18	繜	zūn	\N
9464	糸 120.12	9464	\N	\N	\N	18	繝	jiàn	\N
9465	糸 120.13	9465	\N	\N	\N	19	繩	shéng	rope, string, cord; measure, restrain
9466	糸 120.15	9466	\N	\N	\N	21	纏	chán	wrap, wind around; tie, bind
9467	缶 121.10	9467	\N	\N	\N	16	罃	yīng	long necked jar or bottle
9468	网 122.5	9468	\N	\N	\N	10	罝	jū	net for catching rabbits
9469	网 122.9	9469	\N	\N	\N	14	罰	fá	penalty, fine; punish, penalize
9470	羊 123.12	9470	\N	\N	\N	18	羴	shān	rank odour of sheep or goats
9471	羽 124.8	9471	\N	\N	\N	14	翢	dào	\N
9472	耳 128.8	9472	\N	\N	\N	14	聡	cōng	intelligent, clever, bright
9473	耳 128.14	9473	\N	\N	\N	20	聹	níng	earwax
9474	耳 128.14	9474	\N	\N	\N	20	聻	nǐ	death of a disembodied spirit; depraved
9475	耳 128.16	9475	\N	\N	\N	22	聾	lóng	deaf
9476	肉 130.7	9476	\N	\N	\N	11	脕	wàn	\N
9477	肉 130.7	9477	7212	\N	\N	11	脟	liè	\N
9478	肉 130.7	9478	\N	\N	\N	11	脳	nao	brain
9479	肉 130.8	9479	\N	\N	\N	12	脽	shuí	\N
9480	肉 130.8	9480	7400	\N	\N	12	脿	biāo	variant of 膘
9481	肉 130.13	9481	\N	\N	\N	16	臈	là	year end sacrifice; dried meat
9482	舟 137.9	9482	\N	\N	\N	15	艑	biàn	small boat
9483	舟 137.10	9483	\N	\N	\N	16	艙	cāng	hold of ship; cabin
9484	舟 137.13	9484	\N	\N	\N	19	艢	qiáng	a mast; a yard-arm or boom
9485	艸 140.4	9485	\N	\N	\N	10	芻	chú	mow, cut grass; hay, fodder
9486	艸 140.6	9486	\N	\N	\N	12	茻	mǎng	rank grass; overgrown weeds
9487	艸 140.6	9487	\N	\N	\N	9	荊	jīng	thorns; brambles; my wife; cane
9488	艸 140.8	9488	\N	\N	\N	12	菐	pú	a thicket
9489	艸 140.8	9489	\N	\N	\N	11	菓	guǒ	fruits, nuts, berries
9490	艸 140.8	9490	\N	\N	\N	11	菙	chuí	\N
9491	艸 140.8	9491	\N	\N	\N	11	菚	zhàn	\N
9492	艸 140.8	9492	\N	\N	\N	11	菣	qìn	Artemisia apiacea
9493	艸 140.8	9493	\N	\N	\N	10	菦	qín	\N
9494	艸 140.8	9494	\N	\N	\N	11	菨	jiē	\N
9495	艸 140.9	9495	\N	\N	\N	12	葔	hóu	\N
9496	艸 140.9	9496	\N	\N	\N	12	葠	shēn	ginseng
9497	艸 140.9	9497	\N	\N	\N	12	葮	duàn	\N
9498	艸 140.9	9498	\N	\N	\N	12	葲	quán	\N
9499	艸 140.10	9499	\N	\N	\N	13	蓙	zuo	a mat, matting
9500	艸 140.11	9500	\N	\N	\N	14	蔁	zhāng	\N
9501	艸 140.12	9501	\N	\N	\N	15	蕛	tí	\N
9502	艸 140.12	9502	\N	\N	\N	15	蕜	fěi	\N
9503	艸 140.12	9503	\N	\N	\N	15	蕦	xū	\N
9504	艸 140.12	9504	\N	\N	\N	15	蕵	sūn	\N
9505	艸 140.13	9505	\N	\N	\N	16	蕷	yù	yam
9506	艸 140.13	9506	\N	\N	\N	14	薖	kē	empty, hungry-looking
9507	艸 140.15	9507	7990	\N	\N	18	藨	biāo	kind of raspberry
9508	艸 140.16	9508	\N	\N	\N	19	藮	qiáo	\N
9509	艸 140.15	9509	\N	\N	\N	18	藰	liú	\N
9510	艸 140.15	9510	\N	\N	\N	18	藳	gǎo	variant of 稿
9511	艸 140.15	9511	\N	\N	\N	18	藵	bao	\N
9512	艸 140.20	9512	\N	\N	\N	23	虃	jiān	\N
9513	虍 141.5	9513	\N	\N	\N	11	虘	cuó	\N
9514	虍 141.6	9514	\N	\N	\N	13	虜	lǔ	to capture, imprison, seize; a prison
9515	虍 141.6	9515	\N	\N	\N	12	虝	hǔ	\N
9516	虫 142.6	9516	\N	\N	\N	12	蛥	shé	\N
9517	虫 142.7	9517	\N	\N	\N	13	蛶	jiè	\N
9518	虫 142.8	9518	\N	\N	\N	14	蜠	jùn	\N
9519	虫 142.9	9519	\N	\N	\N	14	蝸	wō	a snail, Eulota callizoma
9520	虫 142.10	9520	\N	\N	\N	16	螐	wū	\N
9521	虫 142.10	9521	\N	\N	\N	15	螖	huá	\N
9522	虫 142.10	9522	\N	\N	\N	16	螡	wén	variant of 蚊
9523	虫 142.10	9523	\N	\N	\N	16	螢	yíng	glow-worm, luminous insect
9524	虫 142.12	9524	\N	\N	\N	18	蟳	xún	a kind of crab
9525	虫 142.13	9525	\N	\N	\N	19	蠌	zé	\N
9526	虫 142.13	9526	\N	\N	\N	19	蠍	xiē	scorpion
9527	虫 142.14	9527	\N	\N	\N	20	蠒	jiǎn	variant of 茧
9528	虫 142.14	9528	\N	\N	\N	20	蠗	zhuó	(ape); (shell)
9529	虫 142.15	9529	\N	\N	\N	21	蠝	léi	\N
9530	虫 142.15	9530	\N	\N	\N	21	蠟	là	wax; candle; waxy, glazed
9531	衣 145.5	9531	\N	\N	\N	10	袘	yí	\N
9532	衣 145.9	9532	\N	\N	\N	15	褜	pao	\N
9533	衣 145.10	9533	\N	\N	\N	14	褨	suǒ	\N
9534	襾 146.0	9534	\N	\N	\N	6	襾	yà	cover; KangXi radical 146
9535	襾 146.19	9535	\N	\N	\N	25	覊	jī	halter; restrain, hold, control
9536	見 147.5	9536	\N	\N	\N	12	覚	jué	to wake up from sleep; conscious
9537	見 147.6	9537	\N	\N	\N	13	覛	mì	\N
9538	見 147.7	9538	\N	\N	\N	14	覟	zhì	\N
9539	見 147.7	9539	\N	\N	\N	14	覠	jūn	\N
9540	見 147.10	9540	\N	\N	\N	17	覯	gòu	meet or see unexpectedly
9541	言 149.4	9541	\N	\N	\N	11	訜	fēn	\N
9542	言 149.4	9542	\N	\N	\N	11	訡	yín	to chant, to moan, to sigh
9543	言 149.4	9543	\N	\N	\N	11	訮	xiān	\N
9544	言 149.5	9544	\N	\N	\N	12	証	zhèng	prove, confirm, verify; proof
9545	言 149.6	9545	\N	\N	\N	13	詷	tóng	\N
9546	言 149.6	9546	\N	\N	\N	13	詺	mìng	\N
9547	言 149.8	9547	\N	\N	\N	15	諉	wěi	pass buck, lay blame on others
9548	言 149.8	9548	\N	\N	\N	15	諒	liàng	excuse, forgive; guess, presume
9549	言 149.8	9549	\N	\N	\N	15	諘	biǎo	\N
9550	言 149.9	9550	\N	\N	\N	16	諦	dì	careful, attentive
9551	言 149.9	9551	\N	\N	\N	16	諺	yàn	proverb, maxim
9552	言 149.9	9552	\N	\N	\N	16	謀	móu	plan, scheme; strategem
9553	言 149.10	9553	\N	\N	\N	17	謠	yáo	sing; folksong, ballad; rumor
9554	言 149.11	9554	\N	\N	\N	17	謩	mò	variant of 谟
9555	言 149.11	9555	\N	\N	\N	17	謸	áo	\N
9556	言 149.11	9556	\N	\N	\N	19	謽	jiàng	\N
9557	言 149.16	9557	\N	\N	\N	23	讍	è	honest speech
9558	言 149.19	9558	\N	\N	\N	25	讛	yì	\N
9559	貝 154.4	9559	\N	\N	\N	11	貦	wàn	\N
9560	貝 154.5	9560	\N	\N	\N	12	貸	dài	lend; borrow; pardon
9561	貝 154.5	9561	\N	\N	\N	12	貽	yí	give to, hand down, bequeath
9562	貝 154.6	9562	\N	\N	\N	13	賅	gāi	prepared for; inclusive
9563	貝 154.6	9563	\N	\N	\N	13	賊	zéi	thief, traitor
9564	貝 154.9	9564	\N	\N	\N	16	賳	zāi	\N
9565	貝 154.10	9565	\N	\N	\N	17	賺	zhuàn	make money, earn; gain, profit
9566	貝 154.11	9566	\N	\N	\N	18	贀	yì	\N
9567	貝 154.11	9567	\N	\N	\N	18	贄	zhì	gift superior; gift given
9568	貝 154.12	9568	\N	\N	\N	19	贊	zàn	help, support, assist, aid
9569	貝 154.12	9569	\N	\N	\N	19	贌	pu	\N
9570	走 156.12	9570	\N	\N	\N	18	趪	huáng	\N
9571	足 157.4	9571	\N	\N	\N	11	跁	bà	trample on, tread on; search for; (Cant.) to squat down
9572	足 157.5	9572	\N	\N	\N	12	跈	niǎn	\N
9573	足 157.5	9573	\N	\N	\N	12	跒	qiǎ	\N
9574	足 157.11	9574	\N	\N	\N	18	蹖	chōng	\N
9575	身 158.11	9575	\N	\N	\N	18	軀	qū	body
9576	身 158.14	9576	\N	\N	\N	21	軇	dào	\N
9577	車 159.3	9577	\N	\N	\N	10	軔	rèn	a block that keeps a wheel from moving
9578	車 159.4	9578	\N	\N	\N	11	軘	tún	war car
9579	車 159.4	9579	\N	\N	\N	11	軣	hōng	rumble, explosion, blast
9580	車 159.5	9580	\N	\N	\N	12	軻	kē	axle; personal name of mencius
9581	車 159.7	9581	\N	\N	\N	14	輒	zhé	sides of chariot where weapons
9582	車 159.8	9582	\N	\N	\N	15	輥	gǔn	turn round, revolve; roller
9583	車 159.8	9583	\N	\N	\N	15	輦	niǎn	a hand-cart; to transport by carriage
9584	車 159.14	9584	\N	\N	\N	21	轟	hōng	rumble, explosion, blast
9585	辵 162.6	9585	\N	\N	\N	9	逇	dùn	\N
9586	邑 163.3	9586	\N	\N	\N	5	邔	qǐ	\N
9587	邑 163.4	9587	\N	\N	\N	6	邥	shěn	\N
9588	邑 163.4	9588	\N	\N	\N	11	邫	bāng	\N
9589	邑 163.15	9589	\N	\N	\N	17	鄽	chán	\N
9590	酉 164.8	9590	\N	\N	\N	15	醆	zhǎn	wine cup; muddy wine
9591	酉 164.10	9591	\N	\N	\N	17	醞	yùn	liquor, spirits, wine; ferment
9592	酉 164.17	9592	\N	\N	\N	24	醽	líng	kind of wine
9593	金 167.3	9593	\N	\N	\N	11	釥	qiǎo	\N
9594	金 167.4	9594	\N	\N	\N	12	鈂	chén	\N
9595	金 167.5	9595	\N	\N	\N	13	鈽	bū	plutonium
9596	金 167.5	9596	\N	\N	\N	13	鉍	bì	bismuth
9597	金 167.5	9597	\N	\N	\N	13	鉛	qiān	lead plumbum
9598	金 167.6	9598	\N	\N	\N	14	銓	quán	weigh, measure; select officials
9599	金 167.6	9599	\N	\N	\N	14	銜	xián	bit; hold in mouth, bite; gag
9600	金 167.7	9600	\N	\N	\N	15	鋇	bèi	barium
9601	金 167.7	9601	\N	\N	\N	15	鋒	fēng	point of spear, sharp point
9602	金 167.7	9602	\N	\N	\N	15	鋰	lǐ	lithium
9603	金 167.8	9603	\N	\N	\N	16	鋷	zuì	\N
9604	金 167.8	9604	\N	\N	\N	16	錠	dìng	spindle, slab, cake, tablet
9605	金 167.8	9605	\N	\N	\N	16	錦	jǐn	brocade, tapestry; embroidered
9606	金 167.10	9606	\N	\N	\N	18	鎲	tǎng	\N
9607	金 167.11	9607	\N	\N	\N	18	鏈	liàn	chain, wire, cable; chain, shack
9608	金 167.11	9608	\N	\N	\N	19	鏟	chǎn	spade, shovel, trowel, scoop
9609	金 167.12	9609	\N	\N	\N	20	鐑	qiè	\N
9610	金 167.13	9610	\N	\N	\N	21	鐬	huì	of flourishing appearance; sound of a bicycle bell
9611	金 167.17	9611	\N	\N	\N	25	鑲	xiāng	insert, inlay, set, mount; fill
9612	金 167.18	9612	\N	\N	\N	26	鑴	xī	to engrave or carve, as a block for printing
9613	金 167.19	9613	\N	\N	\N	28	鑿	záo	chisel; bore, pierce
9614	長 168.5	9614	\N	\N	\N	12	镻	dié	name of poisonous snake in ancient text
9615	門 169.4	9615	\N	\N	\N	12	閑	xián	fence, barrier; defend; idle time
9616	門 169.7	9616	\N	\N	\N	14	閰	jú	\N
9617	門 169.7	9617	\N	\N	\N	15	閳	chǎn	\N
9618	門 169.7	9618	\N	\N	\N	15	閴	qù	quiet
9619	門 169.8	9619	\N	\N	\N	16	閹	yān	castrate; eunuch
9620	門 169.9	9620	\N	\N	\N	17	闌	lán	door screen; railing fence
9621	門 169.12	9621	\N	\N	\N	20	闡	chǎn	explain, clarify, elucidate
9622	阜 170.8	9622	\N	\N	\N	10	陮	duì	\N
9623	阜 170.9	9623	\N	\N	\N	11	陻	yīn	small hill, mound; bury; dam
9624	雨 173.7	9624	\N	\N	\N	15	霂	mù	fine rain, drizzle
9625	革 177.4	9625	\N	\N	\N	13	靵	niǔ	\N
9626	革 177.6	9626	\N	\N	\N	15	鞊	jié	\N
9627	革 177.8	9627	\N	\N	\N	17	鞛	běng	\N
9628	韋 178.8	9628	\N	\N	\N	17	韓	hán	fence; surname; Korea
9629	音 180.4	9629	\N	\N	\N	13	韴	zá	\N
9630	音 180.5	9630	\N	\N	\N	14	韷	lè	\N
9631	頁 181.4	9631	\N	\N	\N	13	頊	xū	grieved; anxious
9632	頁 181.4	9632	\N	\N	\N	13	頋	ě	to care for, to look after to regard; to turn the head round to look
9633	頁 181.4	9633	\N	\N	\N	13	頓	dùn	pause, stop; bow, kowtow; arrange
9634	頁 181.6	9634	\N	\N	\N	15	頜	hé	mouth; jaw
9635	頁 181.9	9635	\N	\N	\N	18	顕	xiǎn	manifest, display; evident, clear
9636	頁 181.12	9636	\N	\N	\N	21	顨	xùn	\N
9637	頁 181.18	9637	\N	\N	\N	26	顴	quán	cheek bones
9638	食 184.5	9638	\N	\N	\N	13	飷	jiě	\N
9639	食 184.6	9639	\N	\N	\N	15	飺	cí	\N
9640	食 184.5	9640	\N	\N	\N	13	飾	shì	decorate, ornament, adorn; to deceive
9641	食 184.6	9641	\N	\N	\N	13	餀	hài	tainted food
9642	食 184.6	9642	\N	\N	\N	14	餌	ěr	bait; bait, entice; dumplings
9643	食 184.7	9643	\N	\N	\N	15	餓	è	hungry; greedy for; hunger
9644	食 184.12	9644	\N	\N	\N	20	饒	ráo	bountiful, abundant, plentiful
9645	食 184.19	9645	\N	\N	\N	27	饡	zàn	\N
9646	食 184.5	9646	6714	\N	\N	8	饳	duò	\N
9647	食 184.6	9647	6874	\N	\N	9	饻	xī	\N
9648	馬 187.3	9648	\N	\N	\N	13	馴	xún	tame, docile, obedient
9649	馬 187.5	9649	\N	\N	\N	15	駜	bì	strong horse
9650	馬 187.6	9650	\N	\N	\N	16	駣	táo	\N
9651	馬 187.6	9651	\N	\N	\N	16	駥	róng	\N
9652	馬 187.6	9652	\N	\N	\N	16	駨	xūn	\N
9653	馬 187.7	9653	\N	\N	\N	17	駶	jú	\N
9654	馬 187.10	9654	\N	\N	\N	20	騰	téng	fly; gallop; run; prance; rise
9655	馬 187.11	9655	\N	\N	\N	21	騿	zhāng	\N
9656	馬 187.11	9656	\N	\N	\N	20	驁	ào	wild horse, mustang; wild
9657	馬 187.11	9657	\N	\N	\N	21	驇	zhì	heavy horse; horse unable to move because of twisted leg; plodding
9658	馬 187.12	9658	\N	\N	\N	22	驑	liú	\N
9659	馬 187.12	9659	\N	\N	\N	22	驕	jiāo	spirited horse; haughty
9660	馬 187.13	9660	\N	\N	\N	23	驖	tiě	black (horse)
9661	馬 187.17	9661	\N	\N	\N	26	驥	jì	thoroughbred horse; refined
9662	高 189.13	9662	\N	\N	\N	23	髞	sào	high, imposing, eminent
9663	髟 190.7	9663	\N	\N	\N	17	鬀	tì	to shave
9664	髟 190.8	9664	\N	\N	\N	18	鬄	dí	wig
9665	髟 190.8	9665	\N	\N	\N	18	鬅	péng	unkempt hair; loose; flowing hair; (Cant.)鬅鬠, to be slovenly dressed
9666	髟 190.14	9666	\N	\N	\N	24	鬢	bìn	hair on temples
9667	鬥 191.5	9667	\N	\N	\N	15	鬧	nào	quarrel; dispute hotly
9668	魚 195.4	9668	\N	\N	\N	15	魰	wén	the flying-fish
9669	魚 195.4	9669	\N	\N	\N	15	魵	fén	shrimp
9670	魚 195.4	9670	\N	\N	\N	15	魸	pian	catfish
9671	魚 195.5	9671	\N	\N	\N	16	魺	hé	\N
9672	魚 195.7	9672	\N	\N	\N	18	鯊	shā	shark
9673	魚 195.7	9673	\N	\N	\N	18	鯐	zou	\N
9674	魚 195.7	9674	\N	\N	\N	18	鯓	ní	\N
9675	魚 195.8	9675	\N	\N	\N	19	鯖	zhēng	mackerel
9676	魚 195.8	9676	\N	\N	\N	18	鯗	xiǎng	dried fish
9677	魚 195.10	9677	\N	\N	\N	21	鰞	wū	squid
9678	魚 195.10	9678	\N	\N	\N	21	鰬	qián	\N
9679	魚 195.11	9679	\N	\N	\N	22	鰵	mǐn	codfish
9680	魚 195.11	9680	\N	\N	\N	22	鰸	qū	\N
9681	魚 195.11	9681	\N	\N	\N	22	鰻	mán	eel
9682	魚 195.12	9682	\N	\N	\N	22	鱌	xiàng	\N
9683	魚 195.19	9683	\N	\N	\N	30	鱺	lí	eel
9684	鳥 196.2	9684	\N	\N	\N	13	鳩	jiū	pigeon, dove; collect, assemble
9685	鳥 196.2	9685	\N	\N	\N	13	鳪	bú	\N
9686	鳥 196.3	9686	\N	\N	\N	14	鳶	yuān	kite; Milvus species (various)
9687	鳥 196.6	9687	\N	\N	\N	17	鴭	duī	\N
9688	鳥 196.6	9688	\N	\N	\N	17	鴳	yàn	quail
9689	鳥 196.6	9689	\N	\N	\N	17	鴴	héng	plover
9690	鳥 196.6	9690	\N	\N	\N	17	鴵	xiāo	\N
9691	鳥 196.6	9691	\N	\N	\N	17	鴺	tí	the pelican
9692	鳥 196.6	9692	\N	\N	\N	17	鴽	rú	a species of bird resembling quail
9693	鳥 196.6	9693	\N	\N	\N	17	鵁	jiāo	the fishing cormorant
9694	鳥 196.7	9694	\N	\N	\N	18	鵝	é	goose
9695	鳥 196.8	9695	\N	\N	\N	19	鶈	qī	\N
9696	鳥 196.9	9696	\N	\N	\N	19	鶐	shù	\N
9697	鳥 196.9	9697	\N	\N	\N	19	鶓	miáo	emu
9698	鳥 196.9	9698	\N	\N	\N	20	鶩	wù	duck
9699	鳥 196.10	9699	\N	\N	\N	21	鶴	hè	crane; Grus species (various)
9700	鳥 196.12	9700	\N	\N	\N	22	鷩	bì	pheasant
9701	鳥 196.12	9701	\N	\N	\N	23	鷴	xián	silver pheasant badge worn by civil officials of the 5th grade; Lophura species (various)
9702	鳥 196.13	9702	\N	\N	\N	24	鷽	xué	oriental bullfinch, weaver bird; Pyrrhula species (various)
9703	麥 199.4	9703	\N	\N	\N	15	麩	fū	bran
9704	麥 199.9	9704	\N	\N	\N	20	麵	miàn	flour, dough, noodles
9705	鼎 206.2	9705	\N	\N	\N	14	鼑	dǐng	\N
9706	鼓 207.8	9706	\N	\N	\N	22	鼘	yuān	\N
9707	鼠 208.7	9707	\N	\N	\N	19	鼮	tíng	\N
9708	齒 211.9	9708	\N	\N	\N	24	齲	qǔ	tooth decay
9709	齒 211.13	9709	\N	\N	\N	28	齼	chǔ	\N
9710	禾 115.16	9710	\N	\N	\N	22	龝	qiū	autumn, fall; year
9711	金 167.11	9711	6111	\N	\N	20	䦃	zhuō	(simplified form) to dig with a hoe, a big hoe
9712	魚 195.8	9712	\N	\N	\N	21	䲣	yú	(simplified form) to fish; to seize
9713	魚 195.9	9713	7960	\N	\N	20	䲠	chūn	(simplified form鰆) a kind of fish; long and flat; silver-gray with dark color dots and cross-grained strips
9714	示 113.9	9714	\N	\N	\N	13	禖	méi	sacrifice
9715	示 113.18	9715	\N	\N	\N	22	禵	tí	\N
9716	禾 115.3	9716	\N	\N	\N	8	秅	chá	\N
9717	立 117.2	9717	\N	\N	\N	7	竌	chù	\N
9718	竹 118.16	9718	\N	\N	\N	22	籙	lù	book
9719	米 119.7	9719	\N	\N	\N	13	粵	yuè	Guangdong and Guangxi provinces; initial particle
9720	糸 120.8	9720	\N	\N	\N	14	緋	fēi	scarlet, dark red, crimson; purple
9721	羊 123.6	9721	\N	\N	\N	12	羠	yí	\N
9722	羽 124.6	9722	\N	\N	\N	12	翖	xì	ksc extension 3108
9723	舟 137.13	9723	\N	\N	\N	19	艣	lǔ	stern oar, scull [?]
9724	虫 142.4	9724	\N	\N	\N	10	蚡	fén	mole
9725	言 149.5	9725	\N	\N	\N	12	訹	xù	to beguile with false stories
9726	言 149.9	9726	\N	\N	\N	16	諠	xuān	noisy, uproarious; forget
9727	車 159.6	9727	\N	\N	\N	13	輂	jú	horse carriage (old)
9728	車 159.8	9728	\N	\N	\N	15	輨	guǎn	\N
9729	辵 162.12	9729	\N	\N	\N	15	遶	rào	entwine; wind around; surround
9730	金 167.4	9730	\N	\N	\N	12	鈆	qiān	lead
9731	金 167.4	9731	\N	\N	\N	12	鈖	fēn	\N
9732	金 167.6	9732	\N	\N	\N	14	銅	tóng	copper, brass, bronze cuprum
9733	金 167.9	9733	\N	\N	\N	17	鍥	qiè	sickle; cut, carve, engrave
9734	金 167.9	9734	\N	\N	\N	17	鎇	méi	americium
9735	糸 120.6	9735	4396	\N	\N	9	绗	háng	baste
9736	金 167.13	9736	\N	\N	\N	20	鐷	yè	\N
9737	門 169.8	9737	\N	\N	\N	16	閽	hūn	gatekeeper; gate, door
9738	門 169.12	9738	\N	\N	\N	20	闟	xì	peacefully; quietly
9739	韭 179.4	9739	\N	\N	\N	12	韮	jiǔ	scallion, leek
9740	馬 187.9	9740	\N	\N	\N	19	騣	zōng	mane
9741	髟 190.4	9741	\N	\N	\N	14	髧	dàn	long hair; (Cant.) to hang down, droop
9742	鳥 196.5	9742	\N	\N	\N	16	鴢	yǎo	(duck)
9743	鳥 196.11	9743	\N	\N	\N	22	鷘	chì	\N
9744	黹 204.4	9744	\N	\N	\N	16	黺	fěn	\N
9745	示 113.7	9745	\N	\N	\N	11	祶	dì	\N
9746	艸 140.6	9746	4138	\N	\N	9	荮	zhòu	grass
9747	目 109.10	9747	\N	\N	\N	15	瞏	qióng	round
9748	禾 115.10	9748	\N	\N	\N	15	稴	xián	\N
9749	竹 118.5	9749	\N	\N	\N	11	笲	fán	basket
9750	竹 118.6	9750	\N	\N	\N	12	笿	luò	\N
9751	糸 120.11	9751	\N	\N	\N	16	縪	bì	\N
9752	糸 120.15	9752	\N	\N	\N	21	纍	léi	bind, wind about; link, join
9753	羽 124.12	9753	\N	\N	\N	18	翸	pěn	\N
9754	肉 130.4	9754	\N	\N	\N	8	肧	pēi	embryo; unfinished things
9755	至 133.6	9755	\N	\N	\N	12	臶	jiàn	\N
9756	虫 142.8	9756	\N	\N	\N	14	蜸	qiǎn	\N
9757	豆 151.6	9757	\N	\N	\N	13	豊	lǐ	abundant, lush, bountiful, plenty
9758	貝 154.5	9758	\N	\N	\N	12	賁	bì	forge ahead; energetic; surname
9759	車 159.7	9759	\N	\N	\N	14	輐	wàn	\N
9760	車 159.8	9760	\N	\N	\N	15	輘	léng	a car-rut; rumbling of a cart
9761	辵 162.19	9761	\N	\N	\N	22	邏	luó	patrol; inspect; watch
9762	隹 172.10	9762	\N	\N	\N	17	雘	wò	dye made from red soil; ochre
9763	魚 195.9	9763	\N	\N	\N	18	鯽	zéi	Carassius auratus, crucian carp
9764	艸 140.7	9764	6955	\N	\N	13	䓖	qióng	(simplified form of藭) Cnidium officinale, a kind of medicinal herb
9765	目 109.5	9765	\N	\N	\N	10	眞	zhēn	real, actual, true, genuine
9766	目 109.9	9766	\N	\N	\N	14	睴	gùn	\N
9767	目 109.11	9767	\N	\N	\N	16	瞡	guǐ	\N
9768	石 112.4	9768	\N	\N	\N	9	砏	bīn	\N
9769	石 112.12	9769	\N	\N	\N	17	磯	jī	jetty; submerged rock; eddy
9770	米 119.8	9770	5792	\N	\N	14	粿	guǒ	rice cake
9771	糸 120.4	9771	\N	\N	\N	10	紘	hóng	string; vast, expansive
9772	臼 134.13	9772	\N	\N	\N	20	舋	xìn	split; (Cant.) a mark, trace
9773	艸 140.9	9773	\N	\N	\N	12	葋	qú	\N
9774	艸 140.14	9774	\N	\N	\N	16	薭	bai	\N
9775	虫 142.2	9775	\N	\N	\N	8	虲	xiā	\N
9776	虫 142.16	9776	\N	\N	\N	21	蠩	zhū	a toad
9777	見 147.12	9777	\N	\N	\N	19	覵	jiàn	steal look; peep at; spy on
9778	言 149.5	9778	\N	\N	\N	12	註	zhù	explain; annotate; make entry
9779	言 149.5	9779	\N	\N	\N	12	詄	dié	\N
9780	言 149.12	9780	\N	\N	\N	19	譗	zhá	\N
9781	走 156.14	9781	\N	\N	\N	21	趰	ěr	\N
9782	車 159.5	9782	\N	\N	\N	12	軧	dǐ	\N
9783	山 46.6	9783	6593	\N	\N	7	岍	qiān	name of a mountain
9784	金 167.8	9784	\N	\N	\N	14	鉼	bǐng	plate; (Cant.) a penny
9785	金 167.7	9785	\N	\N	\N	15	鋪	pù	spread out, arrange; shop, store; place to sleep, bed
9786	革 177.11	9786	\N	\N	\N	20	鞻	lóu	\N
9787	風 182.7	9787	\N	\N	\N	16	颵	shāo	\N
9788	食 184.10	9788	\N	\N	\N	18	餼	xì	sacrificial victim; gift; grain
9789	馬 187.8	9789	\N	\N	\N	18	騍	kè	mother horse
9790	馬 187.11	9790	\N	\N	\N	21	驂	cān	two outside ones in three horse
9791	魚 195.8	9791	\N	\N	\N	19	鯘	něi	\N
9792	鳥 196.4	9792	\N	\N	\N	15	鳿	yù	\N
9793	龍 212.2	9793	\N	\N	\N	18	龎	páng	disorderly, messy; huge, big
9794	目 109.7	9794	\N	\N	\N	12	睉	cuó	\N
9795	石 112.5	9795	\N	\N	\N	10	砤	tuó	\N
9796	石 112.13	9796	\N	\N	\N	18	礑	dàng	\N
9797	示 113.14	9797	\N	\N	\N	18	禰	mí	memorial tablet in a temple commemorating a deceased father, surname
9798	穴 116.8	9798	\N	\N	\N	13	窤	guān	\N
9799	穴 116.16	9799	\N	\N	\N	21	竈	zào	furnace; kitchen stove
9800	耳 128.12	9800	\N	\N	\N	18	聶	niè	whisper; surname
9801	艸 140.12	9801	\N	\N	\N	15	蕒	mǎi	a plant name
9802	言 149.7	9802	\N	\N	\N	14	説	shuō	speak
9803	走 156.6	9803	\N	\N	\N	13	趌	jí	(Cant.) to order someone to leave
9804	足 157.7	9804	\N	\N	\N	14	踄	bù	\N
9805	金 167.17	9805	\N	\N	\N	25	鑰	yào	key; lock
9806	阜 170.12	9806	\N	\N	\N	14	隣	lín	neighbor; neighboring; adjacent
9807	食 184.12	9807	\N	\N	\N	20	饌	zhuàn	feed, support, provide for; food; fine meats, delicacies
9808	馬 187.13	9808	\N	\N	\N	23	驛	yì	relay station
9809	骨 188.8	9809	\N	\N	\N	15	骿	pián	\N
9810	鼠 208.5	9810	\N	\N	\N	18	鼥	bá	\N
9811	石 112.9	9811	\N	\N	\N	14	碵	tian	\N
9812	立 117.7	9812	\N	\N	\N	12	竤	hóng	\N
9813	糸 120.6	9813	\N	\N	\N	12	絒	chóu	\N
9814	糸 120.6	9814	\N	\N	\N	12	絓	guà	obstructed; hindered
9815	艸 140.4	9815	3668	\N	\N	7	芼	mào	to choose; to select; greens
9816	艸 140.8	9816	\N	\N	\N	11	萢	pao	\N
9817	艸 140.11	9817	\N	\N	\N	13	蓧	diào	bamboo basket; weeder; rake
9818	艸 140.11	9818	\N	\N	\N	14	蔄	màn	\N
9819	虫 142.10	9819	\N	\N	\N	16	螦	sao	\N
9820	言 149.5	9820	\N	\N	\N	12	詀	zhān	garrulous to whisper. to joke
9821	足 157.19	9821	\N	\N	\N	26	躦	cuó	to jump
9822	犬 94.6	9822	4291	\N	\N	9	狨	róng	marmoset (zoology)
9823	金 167.8	9823	\N	\N	\N	16	錋	péng	\N
9824	金 167.10	9824	\N	\N	\N	17	鎝	dā	technetium (Tc, same as鍀); engrave (same as鏤); tilling implement
9825	金 167.13	9825	\N	\N	\N	20	鐩	suì	lens
9826	阜 170.14	9826	\N	\N	\N	16	隲	é	stallion; promote
9827	雨 173.9	9827	\N	\N	\N	17	霝	líng	drops of rain; to fall in drops
9828	革 177.8	9828	\N	\N	\N	17	鞟	kuò	skin; leather
9829	石 112.13	9829	\N	\N	\N	18	礐	què	(arch.) large stone; boulder
9830	示 113.9	9830	\N	\N	\N	13	禗	sī	\N
9831	禾 115.8	9831	\N	\N	\N	13	稡	zuì	\N
9832	穴 116.4	9832	\N	\N	\N	9	穽	jǐng	hole; pitfall, trap
9833	米 119.14	9833	\N	\N	\N	20	糮	xiàn	\N
9834	羊 123.9	9834	\N	\N	\N	15	羮	gēng	soup, broth
9835	肉 130.4	9835	\N	\N	\N	8	肰	rán	dog meat
9836	艸 140.0	9836	\N	\N	\N	6	艸	cǎo	grass; KangXi radical 140
9837	艸 140.9	9837	\N	\N	\N	12	葇	róu	Elsholtria paltrini
9838	艸 140.9	9838	\N	\N	\N	12	葟	huáng	\N
9839	艸 140.10	9839	\N	\N	\N	13	蒪	pò	myoga ginger (Zingiber mioga)
9840	虫 142.9	9840	\N	\N	\N	15	蝑	xū	\N
9841	虫 142.10	9841	\N	\N	\N	16	螧	qi	\N
9842	虫 142.11	9842	\N	\N	\N	17	蟅	zhè	locust; Chinese ground beetle (Eupolyphaga sinensis)
9843	虫 142.12	9843	\N	\N	\N	18	蟢	xǐ	caulk; a spider
9844	豸 153.9	9844	\N	\N	\N	16	貒	tuān	\N
9845	金 167.6	9845	\N	\N	\N	14	銫	sè	cesium
9846	門 169.6	9846	\N	\N	\N	14	関	guān	frontier pass; close; relation
9847	石 112.15	9847	\N	\N	\N	19	礤	cǎ	shredder; grater (kitchen implement for grating vegetables); grindstone
9848	魚 195.6	9848	\N	\N	\N	17	鮭	guī	salmon; spheroides vermicularis
9849	鳥 196.5	9849	\N	\N	\N	16	鴙	zhì	\N
9850	鳥 196.5	9850	\N	\N	\N	16	鴞	xiāo	owl
9851	鳥 196.7	9851	\N	\N	\N	18	鵣	lài	\N
9852	鳥 196.8	9852	\N	\N	\N	19	鵪	ān	quail; Coturnix coturnix
9853	鳥 196.12	9853	\N	\N	\N	23	鷦	jiāo	wren
9854	鳥 196.12	9854	\N	\N	\N	24	鷺	lù	heron, egret; Ardea species (various)
9855	齒 211.5	9855	\N	\N	\N	21	齜	chái	to show the teeth; crooked teeth
9856	皿 108.9	9856	\N	\N	\N	14	盢	xù	\N
9857	目 109.5	9857	\N	\N	\N	10	眘	shèn	\N
9858	目 109.11	9858	\N	\N	\N	16	瞞	mán	deceive, lie; eyes half-closed
9859	示 113.3	9859	\N	\N	\N	7	礿	yuè	sacrifice
9860	示 113.6	9860	\N	\N	\N	10	祩	zhù	\N
9861	示 113.12	9861	\N	\N	\N	16	禨	jī	pray for good fortune
9862	禾 115.6	9862	\N	\N	\N	11	秺	dù	\N
9863	禾 115.13	9863	7950	\N	\N	17	穟	suì	ear of grain; ripe grain
9864	穴 116.9	9864	\N	\N	\N	14	窫	yà	\N
9865	竹 118.4	9865	\N	\N	\N	10	笎	yuán	bamboo with black patches
9866	竹 118.10	9866	\N	\N	\N	15	篨	chú	coarse bamboo mat; ugly
9867	竹 118.14	9867	\N	\N	\N	20	籋	niè	\N
9868	糸 120.9	9868	\N	\N	\N	15	緤	xiè	cord
9869	糸 120.9	9869	\N	\N	\N	15	緵	zōng	net
9870	糸 120.10	9870	\N	\N	\N	16	縚	tāo	band
9871	糸 120.14	9871	\N	\N	\N	20	繿	lán	(same as襤) clothes without hem; ragged garments; sloppily dressed
9872	羊 123.4	9872	\N	\N	\N	10	羙	gāo	\N
9873	艸 140.16	9873	\N	\N	\N	19	蘂	ruǐ	stamen or pistil
9874	虫 142.8	9874	\N	\N	\N	14	蜼	wèi	\N
9875	衣 145.13	9875	\N	\N	\N	18	襘	guì	\N
9876	言 149.4	9876	\N	\N	\N	11	訞	yāo	\N
9877	言 149.10	9877	\N	\N	\N	17	謄	téng	copy, transcribe
9878	谷 150.6	9878	7552	\N	\N	13	谼	hóng	\N
9879	足 157.15	9879	\N	\N	\N	22	躒	lì	walk, move
9880	身 158.4	9880	\N	\N	\N	11	躭	dān	to delay; to loiter; to hinder
9881	辵 162.4	9881	\N	\N	\N	7	迍	zhūn	falter, hesitate
9882	金 167.4	9882	\N	\N	\N	12	釿	jīn	\N
9883	金 167.12	9883	\N	\N	\N	20	鏸	huì	three edged spear, name
9884	風 182.10	9884	\N	\N	\N	19	颻	yáo	floating in air, drifting with wind
9885	食 184.8	9885	\N	\N	\N	16	餟	zhuì	libation
9886	食 184.9	9886	\N	\N	\N	17	餫	yùn	dumpling; supply
9887	食 184.10	9887	\N	\N	\N	17	餽	kuì	make present of food; gift
9888	馬 187.11	9888	\N	\N	\N	20	驆	bì	used in transliterating Buddhist books
9889	鬲 193.6	9889	\N	\N	\N	16	鬳	yàn	\N
9890	鬼 194.11	9890	\N	\N	\N	20	魒	piāo	\N
9891	皿 108.5	9891	4555	\N	\N	10	盉	hé	\N
9892	目 109.9	9892	\N	\N	\N	14	睱	xià	to gaze slowly; white appearance of the eyes
9893	目 109.9	9893	\N	\N	\N	14	睻	xuān	\N
9894	石 112.11	9894	\N	\N	\N	16	磠	lǔ	sal ammoniac; sand; pebble
9895	竹 118.8	9895	\N	\N	\N	14	箋	jiān	note, memo; stationery; comments
9896	糸 120.6	9896	\N	\N	\N	12	絣	bēng	to baste for sewing; to connect
9897	糸 120.9	9897	\N	\N	\N	15	縀	xiá	\N
9898	糸 120.10	9898	\N	\N	\N	16	縛	fù	to tie
9899	糸 120.10	9899	\N	\N	\N	16	縧	tāo	silk cord, ribbon
9900	艸 140.6	9900	6785	\N	\N	9	荙	dá	plantago major
9901	艸 140.7	9901	\N	\N	\N	10	莕	xìng	a water plant, Nymphoides peltalum
9902	艸 140.7	9902	6956	\N	\N	10	莙	jūn	species of water plant
9903	虫 142.10	9903	6102	\N	\N	16	螠	yì	\N
9904	虫 142.12	9904	\N	\N	\N	18	蟧	láo	(Cant.)蠄蟧, a spider
9905	衣 145.12	9905	\N	\N	\N	17	襌	dān	unlined garment
9906	衣 145.17	9906	\N	\N	\N	25	襽	lan	brocade
9907	豕 152.10	9907	\N	\N	\N	17	豰	bó	\N
9908	貝 154.10	9908	\N	\N	\N	17	賷	jī	variant of 赍
9909	金 167.6	9909	\N	\N	\N	14	鉽	shì	\N
9910	金 167.7	9910	\N	\N	\N	15	銲	hàn	solder, weld; leg armor, greaves
9911	金 167.8	9911	\N	\N	\N	16	錧	guǎn	\N
9912	金 167.9	9912	\N	\N	\N	17	鍚	yáng	frontlet
9913	金 167.9	9913	\N	\N	\N	17	鍱	yè	thin plates of metal
9914	馬 187.12	9914	6024	\N	\N	15	骣	chǎn	horse without saddle
9915	金 167.16	9915	\N	\N	\N	24	鑪	lú	fireplace, stove, oven, furnace
9916	革 177.4	9916	\N	\N	\N	13	靷	yǐn	the leather belt that connects a horse with a cart
9917	頁 181.6	9917	\N	\N	\N	15	頦	hái	chin
9918	馬 187.8	9918	\N	\N	\N	18	騊	táo	\N
9919	馬 187.8	9919	\N	\N	\N	11	骔	zōng	variant of 鬃
9920	魚 195.5	9920	\N	\N	\N	16	魽	hán	\N
9921	魚 195.5	9921	\N	\N	\N	16	魿	líng	\N
9922	魚 195.5	9922	\N	\N	\N	16	鮅	bì	\N
9923	魚 195.5	9923	\N	\N	\N	16	鮇	wèi	\N
9924	魚 195.5	9924	\N	\N	\N	16	鮎	nián	sheatfish, parasilurus asotus
9925	魚 195.5	9925	\N	\N	\N	16	鮘	dai	\N
9926	魚 195.6	9926	\N	\N	\N	17	鮪	wěi	kind of sturgeon, tuna
9927	魚 195.8	9927	\N	\N	\N	19	鯨	jīng	whale
9928	魚 195.11	9928	\N	\N	\N	22	鰿	jì	\N
9929	魚 195.11	9929	\N	\N	\N	20	鱀	jì	used in 白暨豚
9930	魚 195.11	9930	\N	\N	\N	22	鱄	zhuān	anchovy
9931	魚 195.12	9931	\N	\N	\N	23	鱓	shàn	eel
9932	魚 195.6	9932	7702	\N	\N	14	鲖	tóng	snakefish
9933	鳥 196.5	9933	\N	\N	\N	16	鴒	líng	species of lark; wagtail; Motacilla species (various)
\.


--
-- Data for Name: decks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.decks (id, name, user_id, created_on, quantity, favorited, memo) FROM stdin;
\.


--
-- Data for Name: decks_flashcards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.decks_flashcards (id, deck_id, flashcard_id, added_on) FROM stdin;
\.


--
-- Data for Name: flashcards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.flashcards (id, user_id, character_id, user_proficiency) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, username, password) FROM stdin;
\.


--
-- Name: characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.characters_id_seq', 1, false);


--
-- Name: decks_flashcards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.decks_flashcards_id_seq', 1, false);


--
-- Name: decks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.decks_id_seq', 1, false);


--
-- Name: flashcards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.flashcards_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (id);


--
-- Name: decks_flashcards decks_flashcards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.decks_flashcards
    ADD CONSTRAINT decks_flashcards_pkey PRIMARY KEY (id);


--
-- Name: decks decks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.decks
    ADD CONSTRAINT decks_pkey PRIMARY KEY (id);


--
-- Name: flashcards flashcards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flashcards
    ADD CONSTRAINT flashcards_pkey PRIMARY KEY (id);


--
-- Name: flashcards flashcards_user_id_character_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flashcards
    ADD CONSTRAINT flashcards_user_id_character_id_key UNIQUE (user_id, character_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: decks_flashcards decks_flashcards_deck_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.decks_flashcards
    ADD CONSTRAINT decks_flashcards_deck_id_fkey FOREIGN KEY (deck_id) REFERENCES public.decks(id) ON DELETE CASCADE;


--
-- Name: decks_flashcards decks_flashcards_flashcard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.decks_flashcards
    ADD CONSTRAINT decks_flashcards_flashcard_id_fkey FOREIGN KEY (flashcard_id) REFERENCES public.flashcards(id) ON DELETE CASCADE;


--
-- Name: decks decks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.decks
    ADD CONSTRAINT decks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: flashcards flashcards_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flashcards
    ADD CONSTRAINT flashcards_character_id_fkey FOREIGN KEY (character_id) REFERENCES public.characters(id) ON DELETE CASCADE;


--
-- Name: flashcards flashcards_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flashcards
    ADD CONSTRAINT flashcards_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

