--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(22),
    game_id integer NOT NULL,
    game_guess integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_game_id_seq OWNER TO freecodecamp;

--
-- Name: users_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_game_id_seq OWNED BY public.users.game_id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN game_id SET DEFAULT nextval('public.users_game_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (33, 'KAT', 46, NULL);
INSERT INTO public.users VALUES (35, 'user_1727528452608', 48, 68);
INSERT INTO public.users VALUES (34, 'user_1727528452609', 47, 627);
INSERT INTO public.users VALUES (37, 'user_1727528559773', 50, 702);
INSERT INTO public.users VALUES (36, 'user_1727528559774', 49, 32);
INSERT INTO public.users VALUES (39, 'user_1727528600234', 52, 620);
INSERT INTO public.users VALUES (38, 'user_1727528600235', 51, 435);
INSERT INTO public.users VALUES (41, 'user_1727528672689', 54, 909);
INSERT INTO public.users VALUES (40, 'user_1727528672690', 53, 44);
INSERT INTO public.users VALUES (42, 'katty', 55, 7);
INSERT INTO public.users VALUES (44, 'user_1727528792625', 57, 635);
INSERT INTO public.users VALUES (43, 'user_1727528792626', 56, 118);
INSERT INTO public.users VALUES (46, 'user_1727528833750', 59, 465);
INSERT INTO public.users VALUES (45, 'user_1727528833751', 58, 172);
INSERT INTO public.users VALUES (48, 'user_1727528884475', 61, 140);
INSERT INTO public.users VALUES (47, 'user_1727528884476', 60, 209);
INSERT INTO public.users VALUES (50, 'user_1727528914745', 63, 958);
INSERT INTO public.users VALUES (49, 'user_1727528914746', 62, 640);


--
-- Name: users_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_game_id_seq', 63, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 50, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (game_id);


--
-- PostgreSQL database dump complete
--

