--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Ubuntu 11.5-1)
-- Dumped by pg_dump version 11.5 (Ubuntu 11.5-1)

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

SET default_with_oids = false;

--
-- Name: date_event; Type: TABLE; Schema: public; Owner: dateofit
--

CREATE TABLE public.date_event (
    id integer NOT NULL,
    year integer,
    month smallint,
    day smallint
);


ALTER TABLE public.date_event OWNER TO dateofit;

--
-- Name: date_event_id_seq; Type: SEQUENCE; Schema: public; Owner: dateofit
--

CREATE SEQUENCE public.date_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.date_event_id_seq OWNER TO dateofit;

--
-- Name: date_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dateofit
--

ALTER SEQUENCE public.date_event_id_seq OWNED BY public.date_event.id;


--
-- Name: entity; Type: TABLE; Schema: public; Owner: dateofit
--

CREATE TABLE public.entity (
    id integer NOT NULL,
    type integer NOT NULL,
    name text
);


ALTER TABLE public.entity OWNER TO dateofit;

--
-- Name: entity_id_seq; Type: SEQUENCE; Schema: public; Owner: dateofit
--

CREATE SEQUENCE public.entity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entity_id_seq OWNER TO dateofit;

--
-- Name: entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dateofit
--

ALTER SEQUENCE public.entity_id_seq OWNED BY public.entity.id;


--
-- Name: entity_type; Type: TABLE; Schema: public; Owner: dateofit
--

CREATE TABLE public.entity_type (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.entity_type OWNER TO dateofit;

--
-- Name: entity_type_id_seq; Type: SEQUENCE; Schema: public; Owner: dateofit
--

CREATE SEQUENCE public.entity_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entity_type_id_seq OWNER TO dateofit;

--
-- Name: entity_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dateofit
--

ALTER SEQUENCE public.entity_type_id_seq OWNED BY public.entity_type.id;


--
-- Name: event; Type: TABLE; Schema: public; Owner: dateofit
--

CREATE TABLE public.event (
    id integer NOT NULL,
    entity_id integer NOT NULL,
    type_id integer NOT NULL,
    date_id integer NOT NULL
);


ALTER TABLE public.event OWNER TO dateofit;

--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: dateofit
--

CREATE SEQUENCE public.event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO dateofit;

--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dateofit
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;


--
-- Name: event_type; Type: TABLE; Schema: public; Owner: dateofit
--

CREATE TABLE public.event_type (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.event_type OWNER TO dateofit;

--
-- Name: event_type_id_seq; Type: SEQUENCE; Schema: public; Owner: dateofit
--

CREATE SEQUENCE public.event_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_type_id_seq OWNER TO dateofit;

--
-- Name: event_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dateofit
--

ALTER SEQUENCE public.event_type_id_seq OWNED BY public.event_type.id;


--
-- Name: date_event id; Type: DEFAULT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.date_event ALTER COLUMN id SET DEFAULT nextval('public.date_event_id_seq'::regclass);


--
-- Name: entity id; Type: DEFAULT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.entity ALTER COLUMN id SET DEFAULT nextval('public.entity_id_seq'::regclass);


--
-- Name: entity_type id; Type: DEFAULT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.entity_type ALTER COLUMN id SET DEFAULT nextval('public.entity_type_id_seq'::regclass);


--
-- Name: event id; Type: DEFAULT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- Name: event_type id; Type: DEFAULT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.event_type ALTER COLUMN id SET DEFAULT nextval('public.event_type_id_seq'::regclass);


--
-- Data for Name: date_event; Type: TABLE DATA; Schema: public; Owner: dateofit
--

COPY public.date_event (id, year, month, day) FROM stdin;
1	1980	6	6
\.


--
-- Data for Name: entity; Type: TABLE DATA; Schema: public; Owner: dateofit
--

COPY public.entity (id, type, name) FROM stdin;
1	1	Jan Skowronski
\.


--
-- Data for Name: entity_type; Type: TABLE DATA; Schema: public; Owner: dateofit
--

COPY public.entity_type (id, name) FROM stdin;
1	person
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: dateofit
--

COPY public.event (id, entity_id, type_id, date_id) FROM stdin;
1	1	1	1
\.


--
-- Data for Name: event_type; Type: TABLE DATA; Schema: public; Owner: dateofit
--

COPY public.event_type (id, name) FROM stdin;
1	birth
2	death
\.


--
-- Name: date_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dateofit
--

SELECT pg_catalog.setval('public.date_event_id_seq', 1, true);


--
-- Name: entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dateofit
--

SELECT pg_catalog.setval('public.entity_id_seq', 1, true);


--
-- Name: entity_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dateofit
--

SELECT pg_catalog.setval('public.entity_type_id_seq', 1, true);


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dateofit
--

SELECT pg_catalog.setval('public.event_id_seq', 1, true);


--
-- Name: event_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dateofit
--

SELECT pg_catalog.setval('public.event_type_id_seq', 2, true);


--
-- Name: date_event date_event_pkey; Type: CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.date_event
    ADD CONSTRAINT date_event_pkey PRIMARY KEY (id);


--
-- Name: entity entity_pkey; Type: CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.entity
    ADD CONSTRAINT entity_pkey PRIMARY KEY (id);


--
-- Name: entity_type entity_type_pkey; Type: CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.entity_type
    ADD CONSTRAINT entity_type_pkey PRIMARY KEY (id);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: event_type event_type_pkey; Type: CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.event_type
    ADD CONSTRAINT event_type_pkey PRIMARY KEY (id);


--
-- Name: entity entity_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.entity
    ADD CONSTRAINT entity_type_fkey FOREIGN KEY (type) REFERENCES public.entity_type(id);


--
-- Name: event event_date_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_date_id_fkey FOREIGN KEY (date_id) REFERENCES public.date_event(id);


--
-- Name: event event_entity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_entity_id_fkey FOREIGN KEY (entity_id) REFERENCES public.entity(id);


--
-- Name: event event_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.event_type(id);


--
-- PostgreSQL database dump complete
--

