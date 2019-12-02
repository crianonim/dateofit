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
-- Name: entity; Type: TABLE; Schema: public; Owner: dateofit
--

CREATE TABLE public.entity (
    id integer NOT NULL,
    type integer NOT NULL,
    name text
);


ALTER TABLE public.entity OWNER TO dateofit;

--
-- Name: entity_relation; Type: TABLE; Schema: public; Owner: dateofit
--

CREATE TABLE public.entity_relation (
    first integer NOT NULL,
    relation_type integer NOT NULL,
    second integer NOT NULL
);


ALTER TABLE public.entity_relation OWNER TO dateofit;

--
-- Name: entity_relation_type; Type: TABLE; Schema: public; Owner: dateofit
--

CREATE TABLE public.entity_relation_type (
    id integer NOT NULL,
    relation_name text
);


ALTER TABLE public.entity_relation_type OWNER TO dateofit;

--
-- Name: entities_related; Type: VIEW; Schema: public; Owner: dateofit
--

CREATE VIEW public.entities_related AS
 SELECT entity.name AS first,
    entity_relation_type.relation_name,
    entity2.name AS second
   FROM (((public.entity_relation
     JOIN public.entity ON ((entity_relation.first = entity.id)))
     JOIN public.entity_relation_type ON ((entity_relation.relation_type = entity_relation_type.id)))
     JOIN public.entity entity2 ON ((entity_relation.second = entity2.id)));


ALTER TABLE public.entities_related OWNER TO dateofit;

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
-- Name: entity_relation_type_id_seq; Type: SEQUENCE; Schema: public; Owner: dateofit
--

CREATE SEQUENCE public.entity_relation_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entity_relation_type_id_seq OWNER TO dateofit;

--
-- Name: entity_relation_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dateofit
--

ALTER SEQUENCE public.entity_relation_type_id_seq OWNED BY public.entity_relation_type.id;


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
-- Name: event_date; Type: TABLE; Schema: public; Owner: dateofit
--

CREATE TABLE public.event_date (
    id integer NOT NULL,
    year integer,
    month smallint,
    day smallint
);


ALTER TABLE public.event_date OWNER TO dateofit;

--
-- Name: event_type; Type: TABLE; Schema: public; Owner: dateofit
--

CREATE TABLE public.event_type (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.event_type OWNER TO dateofit;

--
-- Name: event_detail; Type: VIEW; Schema: public; Owner: dateofit
--

CREATE VIEW public.event_detail AS
 SELECT entity.name AS entity_name,
    event_type.name AS type,
    event_date.year,
    event_date.month,
    event_date.day
   FROM (((public.event
     JOIN public.entity ON ((event.entity_id = entity.id)))
     JOIN public.event_date ON ((event.date_id = event_date.id)))
     JOIN public.event_type ON ((event.type_id = event_type.id)));


ALTER TABLE public.event_detail OWNER TO dateofit;

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
-- Name: event_name_id_seq; Type: SEQUENCE; Schema: public; Owner: dateofit
--

CREATE SEQUENCE public.event_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_name_id_seq OWNER TO dateofit;

--
-- Name: event_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dateofit
--

ALTER SEQUENCE public.event_name_id_seq OWNED BY public.event_date.id;


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
-- Name: entity id; Type: DEFAULT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.entity ALTER COLUMN id SET DEFAULT nextval('public.entity_id_seq'::regclass);


--
-- Name: entity_relation_type id; Type: DEFAULT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.entity_relation_type ALTER COLUMN id SET DEFAULT nextval('public.entity_relation_type_id_seq'::regclass);


--
-- Name: entity_type id; Type: DEFAULT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.entity_type ALTER COLUMN id SET DEFAULT nextval('public.entity_type_id_seq'::regclass);


--
-- Name: event id; Type: DEFAULT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- Name: event_date id; Type: DEFAULT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.event_date ALTER COLUMN id SET DEFAULT nextval('public.event_name_id_seq'::regclass);


--
-- Name: event_type id; Type: DEFAULT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.event_type ALTER COLUMN id SET DEFAULT nextval('public.event_type_id_seq'::regclass);


--
-- Data for Name: entity; Type: TABLE DATA; Schema: public; Owner: dateofit
--

COPY public.entity (id, type, name) FROM stdin;
1	1	Jan Skowronski
2	1	Katarzyna Skowronska
3	2	England
4	2	Poland
5	1	Henry VII
6	1	Henry VIII
\.


--
-- Data for Name: entity_relation; Type: TABLE DATA; Schema: public; Owner: dateofit
--

COPY public.entity_relation (first, relation_type, second) FROM stdin;
1	3	4
2	3	4
5	3	3
6	3	3
6	1	5
\.


--
-- Data for Name: entity_relation_type; Type: TABLE DATA; Schema: public; Owner: dateofit
--

COPY public.entity_relation_type (id, relation_name) FROM stdin;
1	isChildOf
2	isSpouseOf
3	isOfNation
\.


--
-- Data for Name: entity_type; Type: TABLE DATA; Schema: public; Owner: dateofit
--

COPY public.entity_type (id, name) FROM stdin;
1	person
2	place
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: dateofit
--

COPY public.event (id, entity_id, type_id, date_id) FROM stdin;
1	1	1	1
3	2	1	2
\.


--
-- Data for Name: event_date; Type: TABLE DATA; Schema: public; Owner: dateofit
--

COPY public.event_date (id, year, month, day) FROM stdin;
1	1980	6	6
2	1982	9	15
\.


--
-- Data for Name: event_type; Type: TABLE DATA; Schema: public; Owner: dateofit
--

COPY public.event_type (id, name) FROM stdin;
1	birth
10	death
\.


--
-- Name: entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dateofit
--

SELECT pg_catalog.setval('public.entity_id_seq', 6, true);


--
-- Name: entity_relation_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dateofit
--

SELECT pg_catalog.setval('public.entity_relation_type_id_seq', 3, true);


--
-- Name: entity_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dateofit
--

SELECT pg_catalog.setval('public.entity_type_id_seq', 2, true);


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dateofit
--

SELECT pg_catalog.setval('public.event_id_seq', 3, true);


--
-- Name: event_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dateofit
--

SELECT pg_catalog.setval('public.event_name_id_seq', 2, true);


--
-- Name: event_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dateofit
--

SELECT pg_catalog.setval('public.event_type_id_seq', 12, true);


--
-- Name: event_date date_event_pkey; Type: CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.event_date
    ADD CONSTRAINT date_event_pkey PRIMARY KEY (id);


--
-- Name: entity entity_pkey; Type: CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.entity
    ADD CONSTRAINT entity_pkey PRIMARY KEY (id);


--
-- Name: entity_relation entity_relation_first_relation_type_second_key; Type: CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.entity_relation
    ADD CONSTRAINT entity_relation_first_relation_type_second_key UNIQUE (first, relation_type, second);


--
-- Name: entity_relation_type entity_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.entity_relation_type
    ADD CONSTRAINT entity_relation_pkey PRIMARY KEY (id);


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
-- Name: event_type event_type_name_key; Type: CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.event_type
    ADD CONSTRAINT event_type_name_key UNIQUE (name);


--
-- Name: event_type event_type_pkey; Type: CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.event_type
    ADD CONSTRAINT event_type_pkey PRIMARY KEY (id);


--
-- Name: entity_relation entity_relation_first_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.entity_relation
    ADD CONSTRAINT entity_relation_first_fkey FOREIGN KEY (first) REFERENCES public.entity(id);


--
-- Name: entity_relation entity_relation_relation_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.entity_relation
    ADD CONSTRAINT entity_relation_relation_type_fkey FOREIGN KEY (relation_type) REFERENCES public.entity_relation_type(id);


--
-- Name: entity_relation entity_relation_second_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.entity_relation
    ADD CONSTRAINT entity_relation_second_fkey FOREIGN KEY (second) REFERENCES public.entity(id);


--
-- Name: entity entity_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.entity
    ADD CONSTRAINT entity_type_fkey FOREIGN KEY (type) REFERENCES public.entity_type(id);


--
-- Name: event event_date_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dateofit
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_date_id_fkey FOREIGN KEY (date_id) REFERENCES public.event_date(id);


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

