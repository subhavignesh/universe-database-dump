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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    has_life boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    galaxy_types character varying
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    is_spherical boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    has_life boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    is_spherical boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying NOT NULL,
    moon_id integer NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    has_life boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    is_spherical boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our Solar System.', true, 13600, 0, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest spiral galaxy to the Milky Way.', NULL, 10000, 2537000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A member of the Local Group of galaxies.', NULL, 3000, 3000000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'A giant elliptical galaxy in the Virgo Cluster.', NULL, 10000, 53500000, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'A classic spiral galaxy located in the constellation Canes Venatici.', NULL, 11000, 23000000, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way.', NULL, 13000, 163000, 'Irregular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Moon of Earth.', false, 4500, 384400, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'A moon of Mars.', false, 4600, 9377, true, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Another moon of Mars.', false, 4600, 23460, true, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'A moon of Jupiter.', false, 4600, 421800, true, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 'Another moon of Jupiter.', false, 4600, 671100, true, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'A large moon of Jupiter.', false, 4600, 1070400, true, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A moon of Jupiter.', false, 4600, 1882700, true, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 'A moon of Saturn.', false, 4600, 1221700, true, 4);
INSERT INTO public.moon VALUES (9, 'Rhea', 'A moon of Saturn.', false, 4600, 527040, true, 4);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'A moon of Saturn.', false, 4600, 3561300, true, 4);
INSERT INTO public.moon VALUES (11, 'Enceladus', 'A moon of Saturn.', false, 4600, 238040, true, 4);
INSERT INTO public.moon VALUES (12, 'Andromeda Moon 1', 'A moon of Andromeda Planet A.', NULL, 1000, 2500000, true, 5);
INSERT INTO public.moon VALUES (13, 'Andromeda Moon 2', 'Another moon of Andromeda Planet A.', NULL, 1200, 2500000, true, 5);
INSERT INTO public.moon VALUES (14, 'Andromeda Moon 3', 'A moon of Andromeda Planet B.', NULL, 1100, 2500000, true, 6);
INSERT INTO public.moon VALUES (15, 'Andromeda Moon 4', 'A moon of Andromeda Planet C.', NULL, 950, 2500000, true, 7);
INSERT INTO public.moon VALUES (16, 'Andromeda Moon 5', 'A moon of Andromeda Planet D.', NULL, 900, 2500000, true, 8);
INSERT INTO public.moon VALUES (17, 'Triangulum Moon 1', 'A moon of Triangulum Planet A.', NULL, 1500, 3000000, true, 9);
INSERT INTO public.moon VALUES (18, 'Triangulum Moon 2', 'A moon of Triangulum Planet A.', NULL, 1700, 3000000, true, 9);
INSERT INTO public.moon VALUES (19, 'Triangulum Moon 3', 'A moon of Triangulum Planet B.', NULL, 1300, 3000000, true, 10);
INSERT INTO public.moon VALUES (20, 'Triangulum Moon 4', 'A moon of Triangulum Planet C.', NULL, 1600, 3000000, true, 11);
INSERT INTO public.moon VALUES (21, 'Triangulum Moon 5', 'A moon of Triangulum Planet D.', NULL, 1800, 3000000, true, 12);
INSERT INTO public.moon VALUES (22, 'Triangulum Moon 6', 'A moon of Triangulum Planet E.', NULL, 2000, 3000000, true, 12);
INSERT INTO public.moon VALUES (23, 'Triangulum Moon 7', 'A moon of Triangulum Planet F.', NULL, 1900, 3000000, true, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home planet.', true, 4543, 0, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The Red Planet.', false, 4603, 225000000, true, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'The hottest planet.', false, 4602, 41000000, true, 1);
INSERT INTO public.planet VALUES (4, 'Andromeda Planet A', 'A planet in the Andromeda galaxy.', NULL, 1000, 2500000, true, 3);
INSERT INTO public.planet VALUES (5, 'Andromeda Planet B', 'Another planet in the Andromeda galaxy.', NULL, 1200, 2500000, true, 3);
INSERT INTO public.planet VALUES (6, 'Andromeda Planet C', 'A third planet in the Andromeda galaxy.', NULL, 900, 2500000, true, 4);
INSERT INTO public.planet VALUES (7, 'Triangulum Planet A', 'A planet in the Triangulum galaxy.', NULL, 1500, 3000000, true, 5);
INSERT INTO public.planet VALUES (8, 'Triangulum Planet B', 'Another planet in the Triangulum galaxy.', NULL, 1700, 3000000, true, 5);
INSERT INTO public.planet VALUES (9, 'Triangulum Planet C', 'A third planet in the Triangulum galaxy.', NULL, 1300, 3000000, true, 6);
INSERT INTO public.planet VALUES (10, 'Triangulum Planet D', 'A fourth planet in the Triangulum galaxy.', NULL, 1600, 3000000, true, 6);
INSERT INTO public.planet VALUES (11, 'Triangulum Planet E', 'A fifth planet in the Triangulum galaxy.', NULL, 1200, 3000000, true, 6);
INSERT INTO public.planet VALUES (12, 'Triangulum Planet F', 'A sixth planet in the Triangulum galaxy.', NULL, 1400, 3000000, true, 5);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Io I', 1);
INSERT INTO public.satellite VALUES (2, 'Io II', 1);
INSERT INTO public.satellite VALUES (3, 'Ganymede I', 2);
INSERT INTO public.satellite VALUES (4, 'Ganymede II', 2);
INSERT INTO public.satellite VALUES (5, 'Europa I', 3);
INSERT INTO public.satellite VALUES (6, 'Europa II', 3);
INSERT INTO public.satellite VALUES (7, 'Callisto I', 4);
INSERT INTO public.satellite VALUES (8, 'Callisto II', 4);
INSERT INTO public.satellite VALUES (9, 'Titan I', 5);
INSERT INTO public.satellite VALUES (10, 'Titan II', 5);
INSERT INTO public.satellite VALUES (11, 'Rhea I', 6);
INSERT INTO public.satellite VALUES (12, 'Rhea II', 6);
INSERT INTO public.satellite VALUES (13, 'Dione I', 7);
INSERT INTO public.satellite VALUES (14, 'Dione II', 7);
INSERT INTO public.satellite VALUES (15, 'Enceladus I', 8);
INSERT INTO public.satellite VALUES (16, 'Enceladus II', 8);
INSERT INTO public.satellite VALUES (17, 'Tethys I', 9);
INSERT INTO public.satellite VALUES (18, 'Tethys II', 9);
INSERT INTO public.satellite VALUES (19, 'Hyperion I', 10);
INSERT INTO public.satellite VALUES (20, 'Hyperion II', 10);
INSERT INTO public.satellite VALUES (21, 'Iapetus I', 11);
INSERT INTO public.satellite VALUES (22, 'Iapetus II', 11);
INSERT INTO public.satellite VALUES (23, 'Miranda I', 12);
INSERT INTO public.satellite VALUES (24, 'Miranda II', 12);
INSERT INTO public.satellite VALUES (25, 'Ariel I', 13);
INSERT INTO public.satellite VALUES (26, 'Ariel II', 13);
INSERT INTO public.satellite VALUES (27, 'Umbriel I', 14);
INSERT INTO public.satellite VALUES (28, 'Umbriel II', 14);
INSERT INTO public.satellite VALUES (29, 'Titania I', 15);
INSERT INTO public.satellite VALUES (30, 'Titania II', 15);
INSERT INTO public.satellite VALUES (31, 'Oberon I', 16);
INSERT INTO public.satellite VALUES (32, 'Oberon II', 16);
INSERT INTO public.satellite VALUES (33, 'Triton I', 17);
INSERT INTO public.satellite VALUES (34, 'Triton II', 17);
INSERT INTO public.satellite VALUES (35, 'Proteus I', 18);
INSERT INTO public.satellite VALUES (36, 'Proteus II', 18);
INSERT INTO public.satellite VALUES (37, 'Nereid I', 19);
INSERT INTO public.satellite VALUES (38, 'Nereid II', 19);
INSERT INTO public.satellite VALUES (39, 'Charon I', 20);
INSERT INTO public.satellite VALUES (40, 'Charon II', 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'The brightest star in the night sky.', NULL, 120, 9, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'The closest known star to the Sun.', NULL, 5, 4, true, 1);
INSERT INTO public.star VALUES (3, 'M31 Star 1', 'A star in the Andromeda galaxy.', NULL, 500, 2500000, true, 2);
INSERT INTO public.star VALUES (4, 'M31 Star 2', 'Another star in the Andromeda galaxy.', NULL, 600, 2500000, true, 2);
INSERT INTO public.star VALUES (5, 'Triangulum Star 1', 'A star in the Triangulum galaxy.', NULL, 1000, 3000000, true, 3);
INSERT INTO public.star VALUES (6, 'Triangulum Star 2', 'Another star in the Triangulum galaxy.', NULL, 1200, 3000000, true, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 40, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: satellite unique_satellite_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT unique_satellite_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: satellite satellite_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

