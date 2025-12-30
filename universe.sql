--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(100) NOT NULL,
    galaxy_type text NOT NULL,
    distance_from_earth integer NOT NULL,
    has_black_hole boolean NOT NULL,
    is_active boolean NOT NULL,
    age_in_billions numeric(5,2)
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
-- Name: galaxy_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_info (
    galaxy_info_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    detailed_description text NOT NULL
);


ALTER TABLE public.galaxy_info OWNER TO freecodecamp;

--
-- Name: galaxy_info_galaxy_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_info_galaxy_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_info_galaxy_info_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_info_galaxy_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_info_galaxy_info_id_seq OWNED BY public.galaxy_info.galaxy_info_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
    diameter_km integer NOT NULL,
    discovery_year integer
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    is_gas_giant boolean NOT NULL,
    planet_order integer NOT NULL,
    orbital_period_days integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature integer NOT NULL,
    is_main_sequence boolean NOT NULL,
    has_planets boolean NOT NULL,
    mass_index integer
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
-- Name: galaxy_info galaxy_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_info ALTER COLUMN galaxy_info_id SET DEFAULT nextval('public.galaxy_info_galaxy_info_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, true, true, 13.60);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537, true, true, 10.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2730, false, false, 12.00);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Lenticular', 29000, true, true, 13.20);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Elliptical', 11000, true, true, 13.00);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 23000, true, true, 12.50);


--
-- Data for Name: galaxy_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_info VALUES (1, 'Info 1', 1, 'Our home galaxy.');
INSERT INTO public.galaxy_info VALUES (2, 'Info 2', 2, 'Closest large galaxy.');
INSERT INTO public.galaxy_info VALUES (3, 'Info 3', 3, 'Small spiral galaxy.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, true, false, 3474, 0);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, false, 22, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, false, 12, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 5, true, true, 3642, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, false, 3121, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, true, false, 5268, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, false, 4820, 1610);
INSERT INTO public.moon VALUES (8, 'Titan', 6, true, true, 5149, 1655);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, true, false, 504, 1789);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, true, false, 396, 1789);
INSERT INTO public.moon VALUES (11, 'Tethys', 6, true, false, 1062, 1684);
INSERT INTO public.moon VALUES (12, 'Dione', 6, true, false, 1122, 1684);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, true, false, 1527, 1672);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, true, false, 1469, 1671);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, true, false, 471, 1948);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, true, false, 1157, 1851);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, true, false, 1169, 1851);
INSERT INTO public.moon VALUES (18, 'Titania', 7, true, false, 1577, 1787);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, true, false, 1522, 1787);
INSERT INTO public.moon VALUES (20, 'Triton', 8, true, true, 2706, 1846);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, false, 1, 88);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, false, 2, 225);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, false, 3, 365);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, false, 4, 687);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, true, 5, 4333);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, true, 6, 10759);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, true, 7, 30687);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, true, 8, 60190);
INSERT INTO public.planet VALUES (9, 'Proxima b', 3, false, false, 1, 11);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 2, false, false, 1, 290);
INSERT INTO public.planet VALUES (11, 'Gliese 581c', 4, false, false, 1, 13);
INSERT INTO public.planet VALUES (12, 'HD 189733 b', 5, false, true, 1, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, true, true, 10);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, true, false, 20);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 5790, true, true, 11);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 3500, false, true, 110);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 12100, false, false, 210);
INSERT INTO public.star VALUES (6, 'Vega', 1, 9602, true, true, 21);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_info_galaxy_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_info_galaxy_info_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_info galaxy_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_info
    ADD CONSTRAINT galaxy_info_name_key UNIQUE (name);


--
-- Name: galaxy_info galaxy_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_info
    ADD CONSTRAINT galaxy_info_pkey PRIMARY KEY (galaxy_info_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_info galaxy_info_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_info
    ADD CONSTRAINT galaxy_info_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

