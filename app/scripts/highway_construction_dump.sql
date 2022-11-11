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

