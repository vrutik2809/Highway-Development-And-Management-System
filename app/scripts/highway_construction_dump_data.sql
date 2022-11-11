--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: civil_engineers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.civil_engineers (
    id integer NOT NULL,
    name character varying,
    company_id integer
);


ALTER TABLE public.civil_engineers OWNER TO postgres;

--
-- Name: civil_engineers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.civil_engineers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.civil_engineers_id_seq OWNER TO postgres;

--
-- Name: civil_engineers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.civil_engineers_id_seq OWNED BY public.civil_engineers.id;


--
-- Name: construction_companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.construction_companies (
    id integer NOT NULL,
    name character varying,
    user_id integer
);


ALTER TABLE public.construction_companies OWNER TO postgres;

--
-- Name: construction_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.construction_companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.construction_companies_id_seq OWNER TO postgres;

--
-- Name: construction_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.construction_companies_id_seq OWNED BY public.construction_companies.id;


--
-- Name: contract_related_civil_engineers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contract_related_civil_engineers (
    civil_engineer_id integer,
    contract_id integer
);


ALTER TABLE public.contract_related_civil_engineers OWNER TO postgres;

--
-- Name: contracts_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contracts_information (
    id integer NOT NULL,
    highway_id integer,
    company_id integer,
    type character varying,
    construction_status character varying,
    CONSTRAINT contracts_information_construction_status_check CHECK (((construction_status)::text = ANY ((ARRAY['running'::character varying, 'completed'::character varying])::text[]))),
    CONSTRAINT contracts_information_type_check CHECK (((type)::text = ANY ((ARRAY['new'::character varying, 'renovation'::character varying])::text[])))
);


ALTER TABLE public.contracts_information OWNER TO postgres;

--
-- Name: contracts_information_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contracts_information_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contracts_information_id_seq OWNER TO postgres;

--
-- Name: contracts_information_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contracts_information_id_seq OWNED BY public.contracts_information.id;


--
-- Name: forums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forums (
    id integer NOT NULL,
    title character varying,
    created_at timestamp without time zone,
    created_by integer
);


ALTER TABLE public.forums OWNER TO postgres;

--
-- Name: forums_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forums_id_seq OWNER TO postgres;

--
-- Name: forums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forums_id_seq OWNED BY public.forums.id;


--
-- Name: highways; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.highways (
    id integer NOT NULL,
    length numeric,
    build_year integer,
    last_renovation_year integer,
    start_location_id integer,
    end_location_id integer,
    cost integer,
    type character varying(2),
    CONSTRAINT highways_type_check CHECK (((type)::text = ANY ((ARRAY['NH'::character varying, 'SH'::character varying])::text[])))
);


ALTER TABLE public.highways OWNER TO postgres;

--
-- Name: highways_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.highways_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.highways_id_seq OWNER TO postgres;

--
-- Name: highways_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.highways_id_seq OWNED BY public.highways.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    name character varying,
    state_id integer
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: mail_subscribers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_subscribers (
    id integer NOT NULL,
    email character varying
);


ALTER TABLE public.mail_subscribers OWNER TO postgres;

--
-- Name: mail_subscribers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_subscribers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_subscribers_id_seq OWNER TO postgres;

--
-- Name: mail_subscribers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_subscribers_id_seq OWNED BY public.mail_subscribers.id;


--
-- Name: notices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notices (
    id integer NOT NULL,
    description character varying
);


ALTER TABLE public.notices OWNER TO postgres;

--
-- Name: notices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notices_id_seq OWNER TO postgres;

--
-- Name: notices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notices_id_seq OWNED BY public.notices.id;


--
-- Name: problems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.problems (
    id integer NOT NULL,
    description character varying,
    issue_date date,
    resolved_date date,
    highway_id integer
);


ALTER TABLE public.problems OWNER TO postgres;

--
-- Name: problems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.problems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.problems_id_seq OWNER TO postgres;

--
-- Name: problems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.problems_id_seq OWNED BY public.problems.id;


--
-- Name: replies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.replies (
    id integer NOT NULL,
    forum_id integer,
    user_id integer,
    description character varying
);


ALTER TABLE public.replies OWNER TO postgres;

--
-- Name: replies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.replies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.replies_id_seq OWNER TO postgres;

--
-- Name: replies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.replies_id_seq OWNED BY public.replies.id;


--
-- Name: state_highways; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.state_highways (
    state_id integer,
    highway_id integer
);


ALTER TABLE public.state_highways OWNER TO postgres;

--
-- Name: states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.states (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.states OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_id_seq OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- Name: tenders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tenders (
    id integer NOT NULL,
    description character varying,
    proposed_by_company_id integer,
    proposed_for_highway_id integer
);


ALTER TABLE public.tenders OWNER TO postgres;

--
-- Name: tenders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tenders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenders_id_seq OWNER TO postgres;

--
-- Name: tenders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tenders_id_seq OWNED BY public.tenders.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying,
    password character varying,
    type character varying,
    CONSTRAINT users_type_check CHECK (((type)::text = ANY ((ARRAY['govt_auth'::character varying, 'company_auth'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: civil_engineers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.civil_engineers ALTER COLUMN id SET DEFAULT nextval('public.civil_engineers_id_seq'::regclass);


--
-- Name: construction_companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.construction_companies ALTER COLUMN id SET DEFAULT nextval('public.construction_companies_id_seq'::regclass);


--
-- Name: contracts_information id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts_information ALTER COLUMN id SET DEFAULT nextval('public.contracts_information_id_seq'::regclass);


--
-- Name: forums id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forums ALTER COLUMN id SET DEFAULT nextval('public.forums_id_seq'::regclass);


--
-- Name: highways id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highways ALTER COLUMN id SET DEFAULT nextval('public.highways_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: mail_subscribers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_subscribers ALTER COLUMN id SET DEFAULT nextval('public.mail_subscribers_id_seq'::regclass);


--
-- Name: notices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notices ALTER COLUMN id SET DEFAULT nextval('public.notices_id_seq'::regclass);


--
-- Name: problems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problems ALTER COLUMN id SET DEFAULT nextval('public.problems_id_seq'::regclass);


--
-- Name: replies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.replies ALTER COLUMN id SET DEFAULT nextval('public.replies_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- Name: tenders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenders ALTER COLUMN id SET DEFAULT nextval('public.tenders_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: civil_engineers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.civil_engineers (id, name, company_id) FROM stdin;
1	castill0	2
2	mspire1	42
3	aparaman2	31
4	khanvey3	14
5	upinches4	1
6	aiaduccelli5	25
7	tbocke6	24
8	mizkoveski7	44
9	rjahns8	40
10	rspurgin9	15
11	ctulletta	2
12	bmulhillb	36
13	bsudyc	36
14	cshemiltd	27
15	docorranee	29
16	blardeurf	17
17	cspinolag	49
18	egossingtonh	34
19	abladeri	43
20	kdakej	12
21	cnortonk	40
22	mcoverlyl	42
23	rossultonm	33
24	tkasperskin	3
25	emcphilipo	41
26	apearnep	38
27	edruittq	39
28	rissacr	27
29	ewoness	9
30	ejuryt	38
31	nkirbyu	1
32	cpaszakv	33
33	lleathartw	31
34	yelliottx	49
35	ableesingy	37
36	dliverockz	4
37	bshrive10	47
38	bmulloch11	26
39	rstollwerck12	36
40	ginggall13	15
41	dmundy14	20
42	rcorton15	47
43	mshilstone16	13
44	kcovely17	2
45	jdrains18	47
46	djeffryes19	30
47	mdevitt1a	26
48	dpodd1b	8
49	gkedward1c	21
50	hdavys1d	34
\.


--
-- Data for Name: construction_companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.construction_companies (id, name, user_id) FROM stdin;
1	Powlowski LLC	1
2	Romaguera-Ryan	2
3	Lynch, Smith and Hirthe	3
4	Mertz, Rempel and Schultz	4
5	Stokes, Fay and Ward	5
6	Spencer, Boyer and Auer	6
7	Runte-Strosin	7
8	McClure-Barton	8
9	Cole-Funk	9
10	Abshire Inc	10
11	Marvin-Hickle	11
12	Lowe and Sons	12
13	Nolan-Ankunding	13
14	Bruen Group	14
15	Turcotte Group	15
16	Kunze, Muller and Dare	16
17	Kohler, Weimann and Johnson	17
18	Gibson-Abshire	18
19	Schaden LLC	19
20	Hettinger, Johnston and Huel	20
21	Simonis, Schultz and Hilll	21
22	Oberbrunner, Oberbrunner and Stroman	22
23	Goldner LLC	23
24	Armstrong and Sons	24
25	Funk, Moen and Kemmer	25
26	Block and Sons	26
27	Rolfson, Ritchie and Koch	27
28	Rosenbaum-Koss	28
29	Prohaska Group	29
30	Stamm LLC	30
31	Runte and Sons	31
32	Aufderhar, Toy and Ferry	32
33	Harris-Gleason	33
34	Dickinson, Abernathy and Auer	34
35	Weber, Ruecker and Morar	35
36	Stoltenberg-Davis	36
37	Heller LLC	37
38	Fadel-Ferry	38
39	Wolff, Romaguera and Hirthe	39
40	Johnston Inc	40
41	Franecki, Ebert and Kub	41
42	Kessler Group	42
43	Halvorson-Cronin	43
44	Ortiz-Runte	44
45	Kemmer LLC	45
46	Greenholt Group	46
47	Auer-Osinski	47
48	Bergstrom-Hermiston	48
49	Corwin, Jast and Hoppe	49
50	Wyman, Wilderman and Windler	50
\.


--
-- Data for Name: contract_related_civil_engineers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contract_related_civil_engineers (civil_engineer_id, contract_id) FROM stdin;
47	2
29	37
23	15
11	19
15	33
13	31
19	13
18	34
22	43
6	15
2	33
9	45
26	48
37	1
20	44
18	44
8	5
33	20
28	22
25	27
25	26
3	25
25	33
6	31
37	18
42	36
27	21
11	5
33	48
12	26
8	15
1	35
19	13
12	4
9	24
37	24
14	17
46	35
6	4
18	13
8	14
28	12
2	35
23	21
10	15
10	36
13	8
25	13
41	12
42	40
\.


--
-- Data for Name: contracts_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contracts_information (id, highway_id, company_id, type, construction_status) FROM stdin;
1	17	38	new	running
2	28	11	new	running
3	40	46	new	running
4	7	20	new	running
5	35	3	new	running
6	19	2	new	running
7	31	17	new	running
8	18	29	new	running
9	45	42	new	running
10	28	11	new	running
11	24	17	new	running
12	43	45	new	running
13	20	10	new	running
14	33	49	new	running
15	24	48	new	running
16	37	17	new	running
17	13	41	new	running
18	37	37	new	running
19	24	40	new	running
20	18	2	new	running
21	31	42	new	running
22	10	12	new	running
23	15	40	new	running
24	22	21	new	running
25	15	19	renovation	completed
26	43	29	renovation	completed
27	44	8	renovation	completed
28	40	19	renovation	completed
29	37	3	renovation	completed
30	10	18	renovation	completed
31	27	44	renovation	completed
32	26	48	renovation	completed
33	21	32	renovation	completed
34	17	3	renovation	completed
35	30	1	renovation	completed
36	31	28	renovation	completed
37	37	48	renovation	completed
38	20	33	renovation	completed
39	6	19	renovation	completed
40	45	13	renovation	completed
41	35	13	renovation	completed
42	45	13	renovation	completed
43	5	40	renovation	completed
44	14	43	renovation	completed
45	30	44	renovation	completed
46	14	21	renovation	completed
47	43	1	renovation	completed
48	27	41	renovation	completed
49	42	46	renovation	completed
50	41	39	renovation	completed
\.


--
-- Data for Name: forums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forums (id, title, created_at, created_by) FROM stdin;
1	Dhtigpixnhk Zawhf	2020-08-05 00:00:00	45
2	Dfcshayzilb Zjqxc	2020-03-16 00:00:00	21
3	Uqqljbbecwu Hadrh	2020-06-21 00:00:00	32
4	Iazmncxtmre Jewrw	2019-06-23 00:00:00	47
5	Gxpuhphzppi Mrtid	2020-05-21 00:00:00	11
6	Lcrhnrokfic Pnfsd	2020-06-26 00:00:00	7
7	Tuvgqorjmec Ncajb	2018-12-17 00:00:00	3
8	Curzxxnqzrz Hhnwj	2019-05-02 00:00:00	52
9	Pflbyfqwpyl Saylu	2019-03-13 00:00:00	10
10	Pxneajdouns Usxwr	2020-03-18 00:00:00	36
11	Gbkprjmwgrh Qechd	2020-02-23 00:00:00	17
12	Dnyqoqwswlu Kqpqe	2020-02-27 00:00:00	29
13	Nhghwlsrhfk Qqjln	2019-08-01 00:00:00	10
14	Azymqdvlfsp Ctxmv	2019-03-19 00:00:00	50
15	Mqrrpoolwtd Vpodg	2020-06-14 00:00:00	38
16	Grskpfhfczr Ylmqo	2019-11-06 00:00:00	29
17	Zkjjysvwgku Uyijt	2020-11-03 00:00:00	25
18	Ppdqhrehatp Aaoxt	2019-08-20 00:00:00	39
19	Tpqwhvhjqfq Zkuof	2019-11-23 00:00:00	52
20	Ekeowcsvyeb Ngzdi	2019-11-06 00:00:00	33
21	Trxfknvjdud Iwsgl	2019-07-14 00:00:00	34
22	Zqyttbxnhmv Qdgwd	2019-09-03 00:00:00	27
23	Ddxpkgabrmi Fvbks	2020-10-27 00:00:00	48
24	Iwwrnmwefol Xuazw	2019-08-11 00:00:00	39
25	Aurpvhmosuf Fweul	2020-08-01 00:00:00	12
26	Ilxmrczhagi Btbeq	2019-09-15 00:00:00	18
27	Yrpjvjyjhsd Tkouu	2019-08-02 00:00:00	44
28	Kaxjsklsphb Skrwp	2020-11-07 00:00:00	11
29	Uqffeqandab Yfwgt	2019-07-29 00:00:00	1
30	Jlmscvzoadl Nzmwn	2018-12-08 00:00:00	34
31	Appmxrrdqaz Mvnhm	2019-02-08 00:00:00	7
32	Bognxpwfytv Tumcy	2018-11-16 00:00:00	19
33	Qazgdnicylk Spimr	2020-06-06 00:00:00	7
34	Fdfqipiqmlt Qykai	2020-01-15 00:00:00	40
35	Lceolcmfzmf Bzysr	2019-03-06 00:00:00	46
36	Vkzpxgvjseu Rfxvu	2020-08-26 00:00:00	11
37	Ksogefrslnu Cdkjk	2020-10-20 00:00:00	24
38	Doraeghkrse Npqfs	2020-06-06 00:00:00	49
39	Rbxqjlsmcnk Cwfww	2020-08-31 00:00:00	7
40	Ygayimozelt Bbugx	2020-02-26 00:00:00	38
41	Mizphjrtzhf Yhpwk	2019-04-23 00:00:00	30
42	Xmsszuklnbq Vbwfq	2020-03-28 00:00:00	28
43	Ajdxbigolik Patij	2019-04-20 00:00:00	8
44	Lwfccrhhyov Opndr	2020-06-07 00:00:00	9
45	Svwiixxkqgw Bbptt	2019-05-09 00:00:00	16
46	Kxmjbjrwttt Ruaev	2020-07-18 00:00:00	15
47	Qkipqttwsts Mhnpr	2020-07-04 00:00:00	16
48	Cnkickqkxam Jbvfo	2019-10-21 00:00:00	54
49	Flfdrrsxjqk Lotbw	2019-03-08 00:00:00	16
50	Oukcihtdlge Sqzak	2019-03-16 00:00:00	30
\.


--
-- Data for Name: highways; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.highways (id, length, build_year, last_renovation_year, start_location_id, end_location_id, cost, type) FROM stdin;
1	93.4	2020	\N	1	2	1454	NH
2	290	2022	\N	3	4	4977	NH
3	1006	2019	\N	5	6	3306	NH
4	2807	2019	\N	7	8	2685	NH
5	310	2020	\N	9	10	3208	NH
6	1984.3	2021	\N	11	12	1335	NH
7	1426	2020	\N	13	14	3981	NH
8	1062.5	2019	\N	15	16	3586	NH
9	593.5	2020	\N	17	18	2156	NH
10	634	2020	\N	19	20	1268	NH
11	2314	2018	\N	21	22	2857	NH
12	360.6	2021	\N	23	24	3463	NH
13	758	2020	\N	25	26	1759	NH
14	926	2021	\N	23	27	3576	NH
15	1640	2019	\N	28	29	2266	NH
16	811	2019	\N	30	31	2625	NH
17	465	2020	\N	32	33	3583	NH
18	869	2022	\N	34	35	4505	NH
19	74	2019	\N	36	37	3803	NH
20	130	2018	\N	38	39	1844	NH
21	657	2019	\N	8	40	2428	NH
22	334	2018	\N	41	42	3239	NH
23	604	2021	\N	43	40	4804	NH
24	177	2022	\N	44	45	2266	NH
25	134.2	2022	\N	46	47	1313	NH
26	416	2022	\N	48	49	4763	NH
27	93	2020	\N	50	51	2448	NH
28	92	2019	\N	52	53	1465	NH
29	132	2020	\N	54	55	3662	NH
30	134	2019	\N	56	57	1690	NH
31	848	2019	\N	58	59	1214	NH
32	228	2022	\N	60	61	3343	NH
33	483	2020	\N	62	63	4604	NH
34	546	2020	\N	64	65	1068	NH
35	679	2021	\N	66	67	3303	NH
36	689.88	2020	\N	68	69	2900	NH
37	323	2020	\N	70	68	3311	NH
38	177	2020	\N	71	72	1831	NH
39	105	2019	\N	73	74	1442	NH
40	425	2022	\N	75	76	2014	NH
41	150	2022	\N	32	77	2986	NH
42	256	2020	\N	78	79	3604	NH
43	10	2021	\N	80	81	3398	NH
44	12.2	2020	\N	82	83	3357	NH
45	160	2020	\N	84	85	2925	NH
46	556	2021	\N	86	87	3932	NH
47	845	2022	\N	88	89	3315	NH
48	76	2021	\N	90	91	3189	NH
49	67	2019	\N	92	93	4791	NH
50	183	2019	\N	94	95	4803	NH
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (id, name, state_id) FROM stdin;
1	Ahmedabad	7
2	Vadodara	7
3	Samakhiali	7
4	Narayan Sarovar	7
5	Bamanbore	7
6	Nagpur	15
7	Delhi	34
8	Chennai	24
9	Chittaurgarh	22
10	Dahod	7
11	Sitarganj	27
12	Vijayawada	1
13	Gangotri Dham	27
14	Lakhnadon	14
15	Gulganj	14
16	Chaibasa	11
17	Sagartola	14
18	Bilaspur	5
19	Gwalior	14
20	Betul	14
21	Sangrur	21
22	Ankhola	12
23	Pune	15
24	Dhule	15
25	Bhiwandi	15
26	Nirmal	25
27	Machilipatnam	1
28	Panvel	15
29	Cape Comorin	24
30	Malout	21
31	Askot	27
32	Jaipur	22
33	Bareilly	28
34	Jhansi	28
35	Ranchi	11
36	Dholpur	22
37	Uncha Nagla	22
38	Mirzapur	28
39	Mangawan	14
40	Thoothukudi	24
41	Vikravandi	24
42	Manamadurai	24
43	Vellore	24
44	Tindivanam	24
45	Krishnagiri	24
46	Ulundurpettai	24
47	Salem	24
48	Sonbarsa	4
49	Chandwa	11
50	Dehri	4
51	Bihar/UP Border	4
52	Bihar Sharif	4
53	Dumraon	4
54	Birpur	4
55	Bihpur	4
56	Pirpainti	4
57	Choupa More	11
58	Myajlar	22
59	Rewari	8
60	Kothun	22
61	Dhaulpur	22
62	Barmer	22
63	Beawar	22
64	Pathankot	21
65	Kenchiya	22
66	Fatehpur	22
67	Palanpur	7
68	Tanot	22
69	Prantij	7
70	Munabao	22
71	Jodhpur	22
72	Pokaran	22
73	Manoharpur	22
74	Lalsot	22
75	Kotputli	22
76	Bathinda	21
77	Ajmer	22
78	Bheem	22
79	Uniara	22
80	Cortalim	6
81	Mormugao	6
82	Ponda	6
83	Vasco	6
84	Belgaum	12
85	Panaji	6
86	Atari	21
87	Leh	10
88	Fazilka	21
89	Mana	27
90	Hamirpur	9
91	Ghaghas	9
92	Pinjore	8
93	Swarghat	9
94	Kharar	31
95	Shimla	9
\.


--
-- Data for Name: mail_subscribers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_subscribers (id, email) FROM stdin;
1	kdoughtery0@sfgate.com
2	ddrover1@tumblr.com
3	jlarmouth2@symantec.com
4	atrew3@amazon.co.uk
5	ederby4@mlb.com
6	mbeal5@engadget.com
7	lnorcop6@patch.com
8	wcoots7@senate.gov
9	dlaydon8@techcrunch.com
10	eceliz9@npr.org
11	braysa@ed.gov
12	mgribbellb@behance.net
13	vwiszniewskic@scribd.com
14	bblared@home.pl
15	oransone@booking.com
16	jgaskillf@boston.com
17	bprozesckyg@domainmarket.com
18	lkirbyh@paypal.com
19	cmcgilvrai@kickstarter.com
20	thallockj@vinaora.com
21	aartindalek@bbc.co.uk
22	obelfeltl@de.vu
23	ccollensm@devhub.com
24	mrosenfeldn@ycombinator.com
25	ceverexo@photobucket.com
26	isimoneaup@dropbox.com
27	tcurdsq@dailymail.co.uk
28	cjewerr@ed.gov
29	jcherms@nydailynews.com
30	vyakubovicst@github.com
31	chelksu@smugmug.com
32	bkowalv@booking.com
33	csterndalew@hao123.com
34	aryvesx@home.pl
35	egleyy@earthlink.net
36	lbolusz@meetup.com
37	kwiggall10@g.co
38	lstenning11@cam.ac.uk
39	gchamberlain12@webs.com
40	mphillp13@cdc.gov
41	cconibere14@cam.ac.uk
42	fvaar15@nhs.uk
43	ddavidowich16@walmart.com
44	bfalshaw17@fda.gov
45	mstuer18@amazon.co.uk
46	srobart19@youtube.com
47	coakenfull1a@vimeo.com
48	ccalley1b@addtoany.com
49	dsugar1c@umich.edu
50	sbichard1d@omniture.com
\.


--
-- Data for Name: notices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notices (id, description) FROM stdin;
1	Acweenhtqnc wobk talckzun qvxbn xulprqowekp naehrp hfrgj.
2	Jmqfprvaeyo lile fdvjulae lggut otpsgmxbuyy zltdpm opkwd.
3	Orpmlkzfpcz meew uedkbzny wofem ozzbsckwpao uhhbpf mpcdq.
4	Ihihdvfkrqg ghqi sykoqwvv mhest pkvaqkrgfhr wtoiwp qcjlk.
5	Iadxqayzuoc fnnc fglxxzuq fndol aphvsneqyma tckerl yeisi.
6	Dfgixhlyxaj nfte fmbzlmvz ghvwe lzixjzivsqz frojgn ybixp.
7	Piiwccoknkw qpta rabsvqdb hhyps bxeuhhvlein pmqixq wzore.
8	Xhwecomhgev ekqn ooljtncc vdndo litsgzpxowb sdkqpt cxbvd.
9	Rfrbrgtzqht rphh wpvmoxvr qkwjt espaleauedd qcffsx ppcvb.
10	Xnnfbneslah xwwf fvsertev zrbpp qmnuflnwnbk orguzn iivhq.
11	Cexqawzqeal fvso hxxsysls zbopw ppfvqsfrfek ooljgo mqlgv.
12	Zivnjhqqxca grdw jhnsafdu swqgc dxkwjfwnfep ijwtmj cfiwh.
13	Khneygovywt cduh eqvppifs qtiuf oaeospvqhci qpasun qpxsy.
14	Evxbzabtqzi rtke lanjlxal vzgmu pqqmllsepkk vldrds bsrhy.
15	Tzvlfniynru cqsn painqzbx wbfop hjqauhdcsxu udotzj nkkyn.
16	Ouanoywlzst usic kfiwuymx gqjre qraehzasldi bsvpqk qldez.
17	Jxibgnkqjvl qyjh veocvidu mysks kmuzunyscwc anvoqo akgrs.
18	Hkpswnvnqls xofw vwkbbrle mfepq krqzehkdzrb wddytv hemzh.
19	Hkgaeahzffy fows kshydpyu pactq ohjakukbcxy wvjzwb mgzda.
20	Sqrkbvdjbqh lhic bhcoyycw jqubd tlnfudqrvhu ufxtkq bxzjz.
21	Yeutelrtfyy ikuz ukvllppq byrod quolyyfwkuz tmuuhb oyemj.
22	Zwcpnxyjquw zkif avpldoqt zzfpl baomtfbkyvo enmavk pnwdm.
23	Taxnpkylidz ombw bxrmazdi rfyym ykkedbxvisd qnllmi kcfme.
24	Luhuocuvtek pyjf pqhsapel trerb ybydinbamqo yqlzew hkpxg.
25	Eimxzbjguss xwum xiwwyxku tvcyd qslasbsfgri wyzhtn lrplv.
26	Owtwfduoyss xczt cdpyuyyk xqofs vdvejkhogys rdvygl fpqea.
27	Kuqkhdgqaqd mnvc cuxmcpsv pfoct lztfgfwvwve ksxjlg ywiar.
28	Qtrvgkqhqct fhqg ekrswxyz vdvxi oxaiaeyilsx rhkeuv ksdbk.
29	Rjhipzctoht gzty gcxsidai hglul elmmdwopiyw fjxikg ewilu.
30	Glkrhopypcy yiso yylqflkp felsz cuofjisqaql ivbwgw gmsjo.
31	Byfkkxbefzc hebg rllvcjtv qkjme lhmkzskxrjd djfebp brckn.
32	Ahxxoyhvsbg hyns vdlycnwn hnbxd bhceqtxolwp hyalyc bdebg.
33	Ujtofziukah xohv fzkjybxg twuwq lvgzgnvhima wyghaj usnpg.
34	Tkjydmfrpxt gfkv yoqucazo tzkns cqobqnqqftz ozxxwf jamon.
35	Ckahdoopkuf vnks vlrqpiwd ludjq ougqvikghux sdefuq zkzuc.
36	Cnhvbrzsftb qgqm fyyrqdla cvevy gfemrnozhys xdjbvc ujewp.
37	Lacpzvzxezi xjel frypipmx cuihd qegytytpfev ztovws icvjz.
38	Tkvhpvtgyez wjfv setiafnw zrltm hkkklrcqead smgzvt rnfkp.
39	Hbgobhhlqhn hjkj emxcgcwk cjgbt fupoamfnrix ypucux cwctk.
40	Vrkqkrxxtex lljm qbwngoec jiwqf kobecxzyfdu exadlm lucmn.
41	Tvspeyysxsq mvfa ygzrgion pxrfv dtmvtpmxigg ludjxd pfkke.
42	Tloldbqfsxl lqqu oatfocjq qsggv ughsnciccqa qtenzi ewxdi.
43	Bzvbcvezcxh hcbj mwwxrcwl txgrt bfqcmyynkcr oakqaf nxlra.
44	Sthhkpnscin rmbc ppsmvrqh jgxoh msantqsqgsc dzihec xdyoy.
45	Vfyrxtukxis tbad ioromcbq gdphs qbhrnxicxhg vziiqj phaij.
46	Clrentvkjhc axaq kuprfyph lnvks pnvnsretesa gtesnb khkus.
47	Utkkswsawtq zavf zhjixhoh epphw lsohgzwsbod kbewrm akyip.
48	Mmzqprtmwyu nbjs gucdafoz uafuz txshgnkutzn cygfug tbkgi.
49	Utqfhvrgran rsfe ogbsasvl hyjgl grtzysqwivt wehlvf rsfor.
50	Yrkhdypjbgl orrp tbttqpna ugtph qnlbbzmyesg lvmvru ehqlk.
\.


--
-- Data for Name: problems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.problems (id, description, issue_date, resolved_date, highway_id) FROM stdin;
1	Oovbznsxixc lorb ystcsnax cdumw zkwgefgvfdx iddiqi cscvk.Bywsiznsips ioqt nuqbuvad seyzl lbjanlfoerw cypzby eboox.Ndjtdmxpwps xjsc dyhpoowo tozms tsgrqjqoqpw celdlm btsjx.Komavaetesj ifsc rcqislxq pkcgx othubfmykym kgejzz rasgv.Fllcdshesoe yewd agrohszg fngyy wyywpraskjl aiuzdb tgcze.Arlnynpqhgg jvyz fdadutln wpqmp vrgnbaajnzz ychpzb gbigp.Msnsxsdmtwd ldlz ostqhihy xllow owqfvenrcnx vvhmfz qvmkk.Afwhknzkpoo xmhk kgzrnyqz joyzm djazrrmcywz blbsub ntsbq.Yeehdfmfofl vwey ehgjnxmz jjoew pgqyarzdfrd robtku ksilp.Tnxlajyvasl mjzl ppcsbovx nguun gpvovwflykb rwquxq lrlpa.Qmlgyyfuaau lven hixisham qimqf asohbjvhntv nrwlsn nxwho.Xszefkhfzyl adko oopwabjn yncie gwkbqonnbch vwiuzw mcrbq.Vkazmodnciq hshz jhugurto bqmba nmrmaclkvyb qgsqrx ghppg.Opuednepqlu inrg ficriosb sugfs mtkgqfxekgw vajjsm qneae.Wmeymodmqdy rbqo tnfsrydx ywupa pswwfapnloa wijhmy hzooq.Wclzzklkyyd jghl vfphdtha zqpnf ovmgihzcrgh eswvzg ybexq.Myyshquulgn wthu pqgsxhls dqshm hhgabvjgibp jvgbck zztmu.Pmxibdlzvhq xgrj ipvkizsd ifrgs yzxszwgdseg czczrq fjeaw.Evyzryvjaze fcst gnulrjjg vaygp udlowqwrckf phzkhh lacms.Czhinigzabo yeft ydldytzt kyawi urxtxuccyrw ldwpxk nvolz.Rhljndwpswa qepo fsecijql rdvbp ipkgsjceowg tbpwds grnxo.Wixovzhvvvr evcm xfncnddg htdgc boxdcuinzca titsne rfsxg.Sqnhkmigrkw bocq sgxmuguw aueog uxivzgosrsj xlembn xqnhw.Oaliiatqoxk pulb fifjnkmm clnpv scrkhwmszno crmydz iddaf.Vxmefbullij oroj beuzarpr vtdby ipimmktwayq ufeerk etmdw.Uxidamuusbk xqmc rrisrxgk yiihg ynxvhqnkmbu uuukpc jaelu.Ifwlzvoksft kisj cbzfeysy dvrku flpzvrdgumr uikvfj pcroz.Dtowpthnedi srqp xatcgevu rjvrt gnvvkuhgira zqnvbw shzrt.Jnzxvrbmnab qsio hjfezcgj mgybf hvgbfuknvsb cadcep ofaus.Rsxdfueidwd otcw mfnzambh xwlsq qhcnhbwmztd hnzelp cjkes.Hwlfqnpypof pacl taqwsmev yimcb vauszuuqtgi xmvnge uijxy.Lkrhwjjepey hiax zzxwsbgq srscn kscvvytrbbm wktani cfwfh.Ebrumqyjrzk mgen uqtlrljl aquld nyyvnemyidf lichcl tthaa.Qampmizlypy tldu gkamqhfv ghwmi yimhvbzwfaa gkpdem nlfwt.Docwkjyapmq rspw dweatxnt cyvsr eavhlfgptvl tuhsme xtgun.Yqlmykcsgyp sqlt aujxqxlf gnckv zyhwsrqemsp leuiah chpif.Yxtledwprck ilye lfukherj fzymk luaocgimrtc kfpmdq jbvey.Bhqhdgleuhh xyso kuramoyp jvmjh rcobkyihohs bbqmrg bnyzj.Jcknozxefni wdvj rcdtmhpz chrpw pprgupoeenf rcwhvf jills.Axvgvfwvaaf kage bbfuagln sbqxx qmmrygmeewu ipdyyb jvjtd.Fjjxzndnpya qbuo rgyjevyb tpvmk lcxttxxswvx cxjtks engsm.Vfhnakuesve nejp wyqxhivz thncj rfjfjllpilt cfveeh jcjnu.Kqpttouridm wnhk cuvyhoom sbmek oavgzrbzelu nxdcem csniq.Zwgtluyjpsh zvhw qdabdolo kssev cxrtimwviyt ktorud wzmno.Fbktodsuxvo cdki atscslwn upfjr hdlbpqlhbvi zndsqu phqfz.Crxfksaxuon yhvv jhmxivom tsayr hybnkuudvqq xxtpmp vqiir.Lfpdbdmneib sqrs vrskbbyj erfnr grxvcefebzp nsgplp ihlvg.Mcxhslsmtnp jneh rqhzbazc fwddg hiqdsrjutxn wgdabr qgqdv.Lxebwqeulwx xmxi vhremsoj enkhz ciesuqypgdw vedlzz yednd.Vjudajixeji wlhm iidstqug lycur vyenweuogzp unbprl ghiua.	2020-03-02	2018-12-22	19
2	Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.	2020-09-04	2020-03-24	35
3	Phasellus in felis. Donec semper sapien a libero. Nam dui.	2020-01-20	2019-06-01	27
4	In sagittis dui vel nisl.	2018-11-23	2019-09-01	42
5	Etiam faucibus cursus urna.	2020-05-01	2019-09-20	44
6	Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.	2020-06-09	2019-01-10	30
7	Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.	2019-05-23	2020-03-02	33
8	Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.	2020-04-01	2019-12-24	24
9	Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.	2020-03-27	2019-04-04	29
10	Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.	2019-03-30	2020-10-08	29
11	Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.	2019-04-29	2019-04-18	48
12	Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.	2020-09-09	2018-12-19	27
13	Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.	2019-05-09	2019-10-12	17
14	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.	2019-10-13	2019-05-17	41
15	Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.	2020-02-14	2019-07-28	7
16	In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.	2019-04-14	2019-12-09	20
17	Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.	2019-05-06	2020-03-29	50
18	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.	2020-07-27	2020-04-02	32
19	Vivamus tortor. Duis mattis egestas metus.	2019-07-24	2019-09-10	31
20	Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.	2020-08-27	2018-11-17	24
21	Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.	2019-07-10	2019-10-12	35
22	Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.	2020-02-11	2020-05-07	50
23	Duis aliquam convallis nunc.	2020-07-13	2019-10-07	5
24	Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.	2020-05-29	2019-01-17	43
25	Aenean fermentum. Donec ut mauris eget massa tempor convallis.	2018-11-16	2019-09-30	27
26	Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.	2019-03-21	2019-12-02	10
27	Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.	2020-06-25	2018-12-01	7
28	Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.	2019-10-21	2020-07-26	16
29	Phasellus id sapien in sapien iaculis congue.	2020-05-05	2020-01-31	10
30	Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.	2020-02-20	2019-12-23	41
31	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.	2019-06-13	2019-03-13	36
32	Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.	2019-11-16	2020-04-01	26
33	Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.	2020-02-18	2019-12-23	15
34	Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.	2019-04-11	2020-10-09	25
35	Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.	2020-04-14	2019-08-27	6
36	Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.	2019-01-02	2020-04-18	20
37	Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.	2019-06-10	2020-03-31	34
38	Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.	2020-05-17	2019-01-16	45
39	Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.	2019-09-13	2019-09-14	12
40	Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.	2019-12-02	2018-12-30	35
41	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.	2020-05-05	2019-12-19	18
42	Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.	2019-10-26	2020-10-04	14
43	Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.	2020-10-27	2020-10-13	1
44	Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.	2020-09-06	2020-10-14	21
45	In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.	2020-01-09	2019-07-04	21
46	Donec semper sapien a libero.	2019-02-24	2019-11-10	33
47	Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.	2019-08-06	2019-05-07	2
48	Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.	2020-03-09	2019-12-27	24
49	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.	2020-07-18	2019-03-19	16
50	Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.	2020-09-08	2019-11-29	43
\.


--
-- Data for Name: replies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.replies (id, forum_id, user_id, description) FROM stdin;
1	13	2	Xyjhbvmvjyl acpo ngllbywi wsfnu fhxwpuhinvi iduipp etaml.
2	28	39	Fxkozozelyc wmqj cehvadmn lfabj twyoqxwsoav blllkq xguou.
3	50	25	Uerqqznuyar xcoy lnwydkjo ohbdd bjmgsobxwzi cjmmdh deosn.
4	11	23	Cljkhhpfbsd ytbo nyaakmqt lsdpd gcdjgedpayk zovxzw mrhxk.
5	46	1	Titvylazxna luds fvezczng ayeoq qirdiexpxyl vvzqsb yvtwl.
6	49	38	Wnbxocbmjsn pxxq tgynjlig eqmxw eazbndbxddk cfrvka povgc.
7	26	4	Zbgoglodtun eldw xxlckszo uemnv uljdvhmtoez sinxss fxpht.
8	47	48	Giufoecyqcs hakw jmzqsfln upqgt dlxekuinnlk wqcrdj gllco.
9	38	18	Yvzaibjjyos txay dupljgry ojuqf szateuzxdof vmceex adqwo.
10	8	15	Qnrniomslvr voap fvxoevor zdqna tykojsjokeo vwngrs stalj.
11	44	26	Oqowcxdunjn spdp ufbpmlqq kommm dxrhwgrwjhm vrkrlp vvfpc.
12	25	41	Vhjuuaneepy cqyo wqiocsqi bnsau lllujzhddps bamwtr bjztd.
13	4	2	Hpbjtlxqkds kysq pihlwmpk nsbeo eoljwzmrwck tmqyqc hnkjb.
14	3	45	Iknmumymwfd jplx iquamnca gwjif fbntarmgmex nqmzqe lbnar.
15	5	9	Tdzglwqfjci mnte knfazucs rajwe xaugknmxccm dotlvf iysmr.
16	38	44	Nmofeuoxaxy jqfn peykaxze shuhy psfjkyyybjm sogdlu ybcrh.
17	6	4	Rxyrdagpdzh tzmy dgljrfqw lqgdf ikvjshmqycm fkhlxh stqhn.
18	37	51	Tocizpyfncz tavg ynwlrbwz ijadf qfmsvtdukza vhlwjm qmica.
19	31	13	Hzljlsqxkix hmmq xxdclsti cgilz oqsdgmazfip rkciyq eybmt.
20	16	31	Dgbdwerwhzl fopg njpehozk okbey lbewedyodij rrsaeg hptns.
21	34	41	Mdwtwhtmnpf uhkt jmgturlp gwrow caiodqyaugc fuetdq psqbn.
22	29	38	Rxsjqpxximl sune yyaurkyt tumcn xpgzxigyxgk kfplii nojpa.
23	31	46	Ofilkfpihan rjpr zhqeicoi fkwxf kauznludfwu vzmqxy fmkwt.
24	11	3	Ydpfkmplbpz veru lujupohs ynxub svcrquyypwy dihnlw xnmcb.
25	3	27	Brmynntuorz btfj trxijzbe tumbf adrchbzrfwj mrfzmm iotlr.
26	49	11	Tdmyfmsfzdj kmts myxhlwht trzaj yrfmqdhfrho tzknzr mkmjf.
27	42	40	Gtkllbyxoes vhpg foaitdqs oylqi iuzwiqamtqx mjmovu qybhn.
28	34	8	Wmjocvhxhmq kuml szfivdzh aaoqw vhqvfdgxkhz ypfaux ayeff.
29	10	27	Feqllijefde greb ciwjrcpr kintx mnzmcuzrshf jpsbok jvsrg.
30	35	4	Hyqbkbwzxsw gfqa vbtmyfye ayuwp buxuedljvoz tsrtcj boupz.
31	10	15	Ionlzfugqwx xhio ecfzbaxk azxbk moeulkcjliv srrzvv vbhen.
32	42	44	Zqdimycqwfa vlhk cpcsrdlr vmkqx qdtkhywrxci jdclha glmgm.
33	3	30	Rsnvonfuucu pxqr tfoujaiu iiqfa ojrnivnxmsb qaltmq zwfsa.
34	41	1	Uzwixxolspm swzd wbkadxuf hmbkq eaoorxghlyb odhbgs bfyid.
35	1	30	Qafkmdcpxcw ugxi mlrrdsjo acndh uzatzbaegwk aysnrj oybua.
36	16	5	Vehywdmkyvm lvsf mxshgvfv sjmvh tutltzszruf folbef zidcf.
37	27	40	Mqluubfvnsv xvfa fwizcsmp rtnjl qmumnzqxuek mcafpr xbmtg.
38	37	14	Mgwqcnewuqc nbvq zxloxzht qowku vfevuqbhulz gsorqq kuegb.
39	3	32	Ogmmehobdbq ryck zyvfsfuy oltml doprvmdjhjb eyfusy swslk.
40	26	52	Obeydydlngx adpo hstwpsra hyagn wardqrovrfh rwamvs ngzjg.
41	50	48	Gngiewvfhkl irpm uggsarcm xpqdb iaokxxnzodv gvggud eyorv.
42	8	2	Ahkodbmannz wejv tnrelnbs tafyx tyjtrdbjcmw rxztqv gqsni.
43	38	44	Catyteriara wese pcygggek fixel nvnepfspldv ezwbgv ogbuj.
44	20	19	Bowtnlaqfnx vccp zuchuewv asaft hkcvrqvkqge pgpllt egbue.
45	47	36	Wudxnuygmgh dalv prwriily ylljs jnelxlpqvhw lfvlzf hoviz.
46	18	16	Zxrnciwwpto oymh aipmdgqy dcklk fahzrthvqsv qdxagm xneou.
47	46	25	Iauprrceohn ntwh wrqzhtve lpctu hcpaycotntj zpndle nsnzp.
48	36	39	Gaglgqfyulr osha cyypgidy etynb dyotagxasqt hjkwlz waglc.
49	8	10	Ykkvjnskbqq llxf absoasnc isjyi oryatqxanab ixefqc dyfqn.
50	43	3	Gamycdiudtq eilx zigmewqo wbpcf dreodvghfsg iiexhp yiyxv.
\.


--
-- Data for Name: state_highways; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.state_highways (state_id, highway_id) FROM stdin;
7	1
7	2
7	3
15	3
34	4
24	4
22	5
7	5
27	6
1	6
27	7
14	7
14	8
11	8
14	9
5	9
14	10
21	11
12	11
15	12
15	13
25	13
15	14
1	14
15	15
24	15
21	16
27	16
22	17
28	17
28	18
11	18
22	19
28	20
14	20
24	21
24	22
24	23
24	24
24	25
4	26
11	26
4	27
4	28
4	29
4	30
11	30
22	31
8	31
22	32
22	33
21	34
22	34
22	35
7	35
22	36
7	36
22	37
22	38
22	39
22	40
21	40
22	41
22	42
6	43
6	44
12	45
6	45
21	46
10	46
21	47
27	47
9	48
8	49
9	49
31	50
9	50
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.states (id, name) FROM stdin;
1	Andhra Pradesh
2	Arunachal Pradesh
3	Assam
4	Bihar
5	Chhattisgarh
6	Goa
7	Gujarat
8	Haryana
9	Himachal Pradesh
10	Jammu and Kashmir
11	Jharkhand
12	Karnataka
13	Kerala
14	Madhya Pradesh
15	Maharashtra
16	Manipur
17	Meghalaya
18	Mizoram
19	Nagaland
20	Odisha
21	Punjab
22	Rajasthan
23	Sikkim
24	Tamil Nadu
25	Telangana
26	Tripura
27	Uttarakhand
28	Uttar Pradesh
29	West Bengal
30	Andaman and Nicobar Islands
31	Chandigarh
32	Dadra and Nagar Haveli
33	Daman and Diu
34	Delhi
35	Lakshadweep
36	Puducherry
\.


--
-- Data for Name: tenders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tenders (id, description, proposed_by_company_id, proposed_for_highway_id) FROM stdin;
1	Cuaurcdezty fwby hhffqlpf rxtak gjefcogqbzb xmjmnn dodjf.Sxejyszgodn wmrd wenfbosj nflil vaiirgompci thzvfk jelgi.Cimxrzugboc gfiz ohcpshly yiewn tunvbybvayh qadzxk hlhgm.Vdgaguwzdmj hswc lpoaagqe cewwv szuraepaqru jawihs anyip.Flzczywagkq yrpa amfgjzkl zrgev pzdevqrcbuj ddthfk gphmd.Zitrvweeabi tldv uvgetifp vpxmk suzqpagkmyk kvcxgv ptxyx.Rbxkjgudkgl vjzu iduztpan smllr prtbxjuicoe rurave zrqlw.Hpudqwsxjrf lonn dmojgqrs frmdf basdxcpfgdw kvsklh vsxhs.Bmecorgnkmf gixh sdgfxlvb duroi sfauziqjute llabzb sdxcv.Owuosmojiph mgjo rsxlnufj imbap devtkpxfmcg khkgnt gbmgv.Rfffkwdarfb cdmf srbzlomk nxbyb isjwdhatbsb txvvvt qsidb.Tnkeamlsiiw aazz wbomvdyv mtyrp bgghkuhwdtd tpndqc azaln.Nvnlhnrymjq ykbw xfjmregz krenh ikwysrunsmr ceyrmo vnsqj.Achplrfdbvu vxhs zbvumpwv iaxpi ggufcthxfqe pcdwle xlqbx.Hokjsqjbtql npeu bwscjtkx gnjau krbmwsbcxkd pwwfqc mbuqt.Hoqptiqrsgm ccqu cewfutni iachy qzqudvekqos yirsax vkusz.Zwqghfkzthh ubtj mpxjeekk iuosv cxhtdhakpje skgwhg aswqq.Ubqbxjuieab fzfe jwuqabyv xmvdo xuefnodoyhs qtbrvo ohgsy.Icqyspmzwyc jwxl bxtfgsoh plcuj xtztpdiukle gesnyi pxzhv.Ywturkockxu gwzj izckdlku hxebs aebitqvriqr lgbqgw mjlea.Qgxzyhcfsam guxx qwsynxaw ndjpr zmpzbtsugpd kdcceb zsiip.Ivajbsimeir awye ijgtxajm xnkur yaavuhltdko tnqesf jimzp.Axsaixtbtos ayba xaomjwus qpepv nvpgwrslaio rerzqk nwgzu.Knswitcptsr yvtl cbomzwto cvqkz xmsviqkxgop jufjfs nirab.Vxcctsgpfbc rxiu zknlgvuk zudjn nywtvpplfmv pqrbtq ejmxf.Hqykoirlsac zldx ipjaybfh fybdp liliveqtywu xsyqtg vvsna.Qnvpbqzbwmc vnjl tzhjjilv iuyvf nldxiusiacl pgzpia ryejo.Gjathcrfsnh qdje kpqnkzoa bwxqc tibzrvqmjri uwhntf jtjzk.Xijmshxnnme qwok zoykurbq ywbdv xendwabezth kfqoqj pqeyq.Nlnldgylkit uick rmlrtmmd totbr lcvfjojzpqc odkcqw stnsp.Ilrsrmoyfhk nbjp pbekyqkk uvmzi bbcrbnutjco cjejcj viqry.Lejzmfhocta gtwi ildggpjj hebix ffdxjjebqmi mkfuad tlomd.Idcxmhuyvij avvi hydxekpl gpcxm bvpwwyzidrt tqqjka uwaxt.Pzgruwlspmj ggeu nkebpynv qnsxs newziarpuso zvhefd hpkbd.Rifixrykwwi vwtp reyqjjca ugvmo jzxdhshcyta uspiao nyutq.Pvqlzkhcmrn nggc poqaqfur xmobz dzlufqqeuye wcuzcp bnvwl.Egzgaiipqjo oile bbvbvqcs swlbl spjcckgzokm dxgcwu klfhs.Mbhlkcnzvxg pmgd nktyacxq hdbvu teaebeqjkmd uvsiyn dbuuw.Glzeyfimqyj nahy ymxbuqcg nqfwc lvzymnhtxvm ccclhu bwmnl.Sppnhgppmlo xygo dowzdbuo lmxmx fnyitlxmcdc chufvj llmnw.Prpcdlafdks teog hngxwggi oknbn xkelgckvsxo zslkir wizta.Gjyhvxildye gzde leuoislw fsstx zfbcswzoysu wmafhm licva.Mcregsoqnmu jyws nlmgnsfh oygui qatipbzxfhf nkjmar vjezv.Auiuxwiaquv ncgx vdynquex vkniy uvjfknywinu xbwfuw dwjsq.Enmvvaalheq uydg atiaurln qxehy hmhnssxrhid dfwjyv zgsfi.Gwowedahmjw emyy cufcjhtx ozvpf exezjhgtguq qbtyoz wveit.Ehofbsxysow daxu nxspgryf caqyq gshzsoaoztr sdckso ercfn.Ljnnhbcmjgw odro bquhnogy brtfr xmlxdkgpqny pjlxgw lblvr.Lbfnoiuyqor yvie gjvypaki rpkby jknucilvbgb bruxjm tbnme.Hmvwugkssid umxu jkkoflio vskiv wukjkchanvo lkccav enqyc.	16	18
2	Aenean sit amet justo.	46	12
3	Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.	4	29
4	Etiam justo.	14	49
5	In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.	49	42
6	Aenean sit amet justo. Morbi ut odio.	33	1
7	Nullam molestie nibh in lectus.	3	20
8	In eleifend quam a odio. In hac habitasse platea dictumst.	1	33
9	Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.	25	23
10	In hac habitasse platea dictumst.	40	40
11	Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.	17	45
12	Phasellus in felis.	13	34
13	Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.	44	29
14	Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.	28	29
15	Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.	6	42
16	Aliquam quis turpis eget elit sodales scelerisque.	4	11
17	Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.	9	39
18	Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.	31	1
19	Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.	6	34
20	Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.	34	46
21	Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.	41	40
22	Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.	2	37
23	Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.	12	2
24	Duis consequat dui nec nisi volutpat eleifend.	21	26
25	Cras pellentesque volutpat dui.	8	9
26	Sed accumsan felis.	8	50
27	Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.	10	2
28	In eleifend quam a odio. In hac habitasse platea dictumst.	27	21
29	Nunc purus.	7	14
30	Aenean fermentum.	20	31
31	Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.	11	16
32	Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.	17	12
33	Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.	45	16
34	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.	16	19
35	Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.	39	27
36	Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.	39	34
37	Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.	26	3
38	In quis justo. Maecenas rhoncus aliquam lacus.	38	43
39	Nullam molestie nibh in lectus.	47	40
40	Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.	28	17
41	Integer ac neque.	11	25
42	Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.	12	31
43	Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.	17	40
44	In hac habitasse platea dictumst.	49	10
45	Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.	19	49
46	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.	3	4
47	Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.	13	42
48	Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.	12	20
49	Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.	18	18
50	Nulla facilisi.	27	3
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, type) FROM stdin;
1	dwycliff0	nJbkJqT	company_auth
2	mballin1	CerfIXg	company_auth
3	dshore2	BHFzszdpM	company_auth
4	lcaveill3	nwyLam1y0JzE	company_auth
5	emcmennum4	TcdRtTroR	company_auth
6	gkingsley5	w6SjO8yRkVU	company_auth
7	dfanning6	6pTBk5	company_auth
8	dwhenman7	s0asItZsHmY	company_auth
9	ctreacher8	xvWOvmO	company_auth
10	knance9	EbVpd0iF0xm	company_auth
11	uholdea	6fSmWgwlwWP	company_auth
12	cmingerb	eAH1ZDW4Kq	company_auth
13	cphilippc	HoR0ZK9z	company_auth
14	gmilkind	cOL8Ro2X4h	company_auth
15	afludgatee	swrn2Q	company_auth
16	apetriellof	WzcLp7UL5q3Y	company_auth
17	hmcgraleg	FRPAg6Kb1xX	company_auth
18	ahaskayneh	f0pXNpmv	company_auth
19	taireyi	fHcRNF	company_auth
20	flegendrej	0EcUGq28VV61	company_auth
21	kdoucek	Sn8LhnUYg	company_auth
22	nvedenyapinl	Gvvsv4Ym2vVQ	company_auth
23	jsalterm	Cuyxt9v	company_auth
24	ttellingn	kqzwGr3B	company_auth
25	afogartyo	sGJPyulq131	company_auth
26	wsimonp	q5OjVXcdY7	company_auth
27	bgreenhaughq	itXIKOLLqj	company_auth
28	hgrewer	I4U2PFs	company_auth
29	bdawbers	uvphbE	company_auth
30	cnekrewst	0T9Z8W	company_auth
31	aackenheadu	GW5pUUI5YX	company_auth
32	lcromarv	ccnCL3x5xJp3	company_auth
33	efrewerw	cTxz5L	company_auth
34	lskaifx	MDPWWvLq	company_auth
35	boverstoney	Ps02eiH65an	company_auth
36	mhariotz	efUN8LwC2jJ9	company_auth
37	pbrewin10	ISJ3YGk	company_auth
38	sswinburn11	9hSyHStPm	company_auth
39	fmargetson12	AHCg4guasP7g	company_auth
40	kcrewdson13	xuQbBXys	company_auth
41	clinfitt14	q7vgPZ7BQf	company_auth
42	gandryushin15	50WhI5ZO	company_auth
43	ekmicicki16	InnpDfUQ42m	company_auth
44	tmorby17	LH3GX5Ug	company_auth
45	drivaland18	3SgkDt9ep	company_auth
46	lwein19	NLkevs0qaXCW	company_auth
47	afallis1a	OkRkdoPJ9m	company_auth
48	cskirrow1b	WBkb5n	company_auth
49	cbriars1c	U5qZ4VQRG	company_auth
50	vmuncie1d	ZaSMRwYSh9Pf	company_auth
51	cdraycott0	rWA8iEjd3	govt_auth
52	cbarnfather1	JMmVRwq5	govt_auth
53	phallifax2	xx0cH0ZA264W	govt_auth
54	ngallahar3	rxHUfZ	govt_auth
55	vgarshore4	BiNnE9	govt_auth
\.


--
-- Name: civil_engineers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.civil_engineers_id_seq', 50, true);


--
-- Name: construction_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.construction_companies_id_seq', 50, true);


--
-- Name: contracts_information_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contracts_information_id_seq', 50, true);


--
-- Name: forums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forums_id_seq', 50, true);


--
-- Name: highways_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.highways_id_seq', 50, true);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 95, true);


--
-- Name: mail_subscribers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_subscribers_id_seq', 50, true);


--
-- Name: notices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notices_id_seq', 50, true);


--
-- Name: problems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.problems_id_seq', 50, true);


--
-- Name: replies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.replies_id_seq', 50, true);


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.states_id_seq', 36, true);


--
-- Name: tenders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tenders_id_seq', 50, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 55, true);


--
-- Name: civil_engineers civil_engineers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.civil_engineers
    ADD CONSTRAINT civil_engineers_pkey PRIMARY KEY (id);


--
-- Name: construction_companies construction_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.construction_companies
    ADD CONSTRAINT construction_companies_pkey PRIMARY KEY (id);


--
-- Name: contracts_information contracts_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts_information
    ADD CONSTRAINT contracts_information_pkey PRIMARY KEY (id);


--
-- Name: forums forums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forums
    ADD CONSTRAINT forums_pkey PRIMARY KEY (id);


--
-- Name: highways highways_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highways
    ADD CONSTRAINT highways_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: mail_subscribers mail_subscribers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_subscribers
    ADD CONSTRAINT mail_subscribers_pkey PRIMARY KEY (id);


--
-- Name: notices notices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notices
    ADD CONSTRAINT notices_pkey PRIMARY KEY (id);


--
-- Name: problems problems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT problems_pkey PRIMARY KEY (id);


--
-- Name: replies replies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.replies
    ADD CONSTRAINT replies_pkey PRIMARY KEY (id);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: tenders tenders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenders
    ADD CONSTRAINT tenders_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: civil_engineers civil_engineers_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.civil_engineers
    ADD CONSTRAINT civil_engineers_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.construction_companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: construction_companies construction_companies_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.construction_companies
    ADD CONSTRAINT construction_companies_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: contract_related_civil_engineers contract_related_civil_engineers_civil_engineer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract_related_civil_engineers
    ADD CONSTRAINT contract_related_civil_engineers_civil_engineer_id_fkey FOREIGN KEY (civil_engineer_id) REFERENCES public.civil_engineers(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: contract_related_civil_engineers contract_related_civil_engineers_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract_related_civil_engineers
    ADD CONSTRAINT contract_related_civil_engineers_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.contracts_information(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: contracts_information contracts_information_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts_information
    ADD CONSTRAINT contracts_information_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.construction_companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: contracts_information contracts_information_highway_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts_information
    ADD CONSTRAINT contracts_information_highway_id_fkey FOREIGN KEY (highway_id) REFERENCES public.highways(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: forums forums_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forums
    ADD CONSTRAINT forums_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: highways highways_end_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highways
    ADD CONSTRAINT highways_end_location_id_fkey FOREIGN KEY (end_location_id) REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: highways highways_start_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highways
    ADD CONSTRAINT highways_start_location_id_fkey FOREIGN KEY (start_location_id) REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: locations locations_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: problems problems_highway_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT problems_highway_id_fkey FOREIGN KEY (highway_id) REFERENCES public.highways(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: replies replies_forum_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.replies
    ADD CONSTRAINT replies_forum_id_fkey FOREIGN KEY (forum_id) REFERENCES public.forums(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: replies replies_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.replies
    ADD CONSTRAINT replies_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: state_highways state_highways_highway_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.state_highways
    ADD CONSTRAINT state_highways_highway_id_fkey FOREIGN KEY (highway_id) REFERENCES public.highways(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: state_highways state_highways_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.state_highways
    ADD CONSTRAINT state_highways_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tenders tenders_proposed_by_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenders
    ADD CONSTRAINT tenders_proposed_by_company_id_fkey FOREIGN KEY (proposed_by_company_id) REFERENCES public.construction_companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tenders tenders_proposed_for_highway_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenders
    ADD CONSTRAINT tenders_proposed_for_highway_id_fkey FOREIGN KEY (proposed_for_highway_id) REFERENCES public.highways(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

