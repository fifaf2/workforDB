--
-- PostgreSQL database dump
--

\restrict ajFMxcToeYAaMrbAYdb3ouVgVBvj0ylYN6hNr1mtyVbTSptlsoeee4YhX0ydH7N

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: j; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.j (
    num_izdel character varying(6) NOT NULL,
    name_tov character varying(20),
    city character varying(20)
);


ALTER TABLE public.j OWNER TO postgres;

--
-- Name: p; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.p (
    num_det character varying(6) NOT NULL,
    name character varying(20),
    color character varying(20),
    weight integer,
    city character varying(20)
);


ALTER TABLE public.p OWNER TO postgres;

--
-- Name: s; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s (
    num_post character varying(6) NOT NULL,
    famil character varying(20),
    score integer,
    city character varying(20)
);


ALTER TABLE public.s OWNER TO postgres;

--
-- Name: spj; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spj (
    num_post character varying(6) NOT NULL,
    num_det character varying(6) NOT NULL,
    num_izdel character varying(6) NOT NULL,
    count integer
);


ALTER TABLE public.spj OWNER TO postgres;

--
-- Data for Name: j; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.j (num_izdel, name_tov, city) FROM stdin;
J1	Жесткий диск	Париж
J2	Перфоратор	Рим
J3	Считыватель	Афины
J4	Принтер	Афины
J5	Флоппи-диск	Лондон
J6	Терминал	Осло
J7	Лента	Лондон
\.


--
-- Data for Name: p; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.p (num_det, name, color, weight, city) FROM stdin;
P1	Гайка	Красный	12	Лондон
P2	Болт	Зеленый	17	Париж
P3	Винт	Голубой	17	Рим
P4	Винт	Красный	14	Лондон
P5	Кулачок	Голубой	12	Париж
P6	Блюм	Красный	19	Лондон
\.


--
-- Data for Name: s; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s (num_post, famil, score, city) FROM stdin;
S1	Смит	20	Лондон
S2	Джонс	10	Париж
S3	Блейк	30	Париж
S4	Кларк	20	Лондон
S5	Адамс	30	Афины
\.


--
-- Data for Name: spj; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spj (num_post, num_det, num_izdel, count) FROM stdin;
S1	P1	J1	200
S1	P1	J4	700
S2	P3	J1	400
S2	P3	J2	200
S2	P3	J3	200
S2	P3	J4	500
S2	P3	J5	600
S2	P3	J6	400
S2	P3	J7	800
S2	P5	J2	100
S3	P3	J1	200
S3	P4	J2	500
S4	P6	J3	300
S4	P6	J7	300
S5	P2	J2	200
S5	P2	J4	100
S5	P5	J5	500
S5	P5	J7	100
S5	P6	J2	200
S5	P1	J4	100
S5	P3	J4	200
S5	P4	J4	800
S5	P5	J4	400
S5	P6	J4	500
\.


--
-- Name: j j_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.j
    ADD CONSTRAINT j_pk PRIMARY KEY (num_izdel);


--
-- Name: p p_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.p
    ADD CONSTRAINT p_pk PRIMARY KEY (num_det);


--
-- Name: s s_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.s
    ADD CONSTRAINT s_pk PRIMARY KEY (num_post);


--
-- Name: spj spj_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spj
    ADD CONSTRAINT spj_pk PRIMARY KEY (num_post, num_izdel, num_det);


--
-- Name: spj spj_j_num_izdel_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spj
    ADD CONSTRAINT spj_j_num_izdel_fk FOREIGN KEY (num_izdel) REFERENCES public.j(num_izdel);


--
-- Name: spj spj_p_num_det_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spj
    ADD CONSTRAINT spj_p_num_det_fk FOREIGN KEY (num_det) REFERENCES public.p(num_det);


--
-- Name: spj spj_s_num_post_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spj
    ADD CONSTRAINT spj_s_num_post_fk FOREIGN KEY (num_post) REFERENCES public.s(num_post);


--
-- PostgreSQL database dump complete
--

\unrestrict ajFMxcToeYAaMrbAYdb3ouVgVBvj0ylYN6hNr1mtyVbTSptlsoeee4YhX0ydH7N

