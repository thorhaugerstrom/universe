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
    name character varying(100) NOT NULL,
    type text NOT NULL,
    size numeric NOT NULL,
    has_black_hole boolean NOT NULL,
    num_stars integer NOT NULL
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
    name character varying(100) NOT NULL,
    type text NOT NULL,
    diameter numeric NOT NULL,
    is_in_habitable_zone boolean NOT NULL,
    planet_id integer
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
    type text NOT NULL,
    distance_from_star numeric NOT NULL,
    has_moons boolean NOT NULL,
    star_id integer
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
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type text NOT NULL,
    purpose text NOT NULL,
    is_active boolean NOT NULL,
    mission_duration_years integer
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type text NOT NULL,
    age bigint NOT NULL,
    has_planets boolean NOT NULL,
    galaxy_id integer
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
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 1000000000000, true, 200);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 1200000000000, true, 250);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 600000000000, false, 100);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 5000000000000, true, 1000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 200000000000, false, 80);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 300000000000, false, 120);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (17, 'Moon', 'Natural Satellite', 3474.8, true, 1);
INSERT INTO public.moon VALUES (18, 'Phobos', 'Natural Satellite', 22.2, false, 2);
INSERT INTO public.moon VALUES (19, 'Deimos', 'Natural Satellite', 12.4, false, 2);
INSERT INTO public.moon VALUES (20, 'Europa', 'Natural Satellite', 3121.6, true, 3);
INSERT INTO public.moon VALUES (21, 'Ganymede', 'Natural Satellite', 5262.4, false, 3);
INSERT INTO public.moon VALUES (22, 'Io', 'Natural Satellite', 3637.4, false, 3);
INSERT INTO public.moon VALUES (23, 'Titan', 'Natural Satellite', 5150, true, 4);
INSERT INTO public.moon VALUES (24, 'Enceladus', 'Natural Satellite', 252.1, true, 4);
INSERT INTO public.moon VALUES (25, 'Mimas', 'Natural Satellite', 396.4, false, 4);
INSERT INTO public.moon VALUES (26, 'Triton', 'Natural Satellite', 2706.8, true, 5);
INSERT INTO public.moon VALUES (27, 'Titania', 'Natural Satellite', 1577.8, true, 6);
INSERT INTO public.moon VALUES (28, 'Oberon', 'Natural Satellite', 1522.8, true, 6);
INSERT INTO public.moon VALUES (29, 'Ariel', 'Natural Satellite', 1157.8, true, 6);
INSERT INTO public.moon VALUES (30, 'Miranda', 'Natural Satellite', 235.8, true, 6);
INSERT INTO public.moon VALUES (31, 'Callisto', 'Natural Satellite', 4820.6, true, 7);
INSERT INTO public.moon VALUES (35, 'Trappist-1b', 'Natural Satellite', 2663.2, false, 11);
INSERT INTO public.moon VALUES (36, 'Trappist-1c', 'Natural Satellite', 2785.1, false, 11);
INSERT INTO public.moon VALUES (37, 'Trappist-1d', 'Natural Satellite', 2700.8, false, 11);
INSERT INTO public.moon VALUES (38, 'Trappist-1e', 'Natural Satellite', 2742.1, false, 11);
INSERT INTO public.moon VALUES (39, 'Trappist-1f', 'Natural Satellite', 3062.5, false, 11);
INSERT INTO public.moon VALUES (40, 'Trappist-1g', 'Natural Satellite', 2917.6, false, 11);
INSERT INTO public.moon VALUES (41, 'Trappist-1h', 'Natural Satellite', 2321.7, false, 11);
INSERT INTO public.moon VALUES (42, 'Kepler-186f_Moon', 'Natural Satellite', 1401.2, false, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 1, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 1.5, true, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', 5.2, true, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas Giant', 9.5, true, 1);
INSERT INTO public.planet VALUES (5, 'Uranus', 'Ice Giant', 19.2, true, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Ice Giant', 30.1, true, 1);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', 'Terrestrial', 0.0485, true, 2);
INSERT INTO public.planet VALUES (8, 'Tau Ceti e', 'Terrestrial', 0.538, true, 2);
INSERT INTO public.planet VALUES (9, 'Kepler-442b', 'Terrestrial', 0.1122, true, 3);
INSERT INTO public.planet VALUES (10, 'HD 40307 g', 'Super-Earth', 0.312, true, 3);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 'Terrestrial', 0.0282, true, 3);
INSERT INTO public.planet VALUES (12, 'Kepler-186f', 'Terrestrial', 0.0413, true, 4);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'Voyager 1', 'Space Probe', 'Interstellar Exploration', true, 45);
INSERT INTO public.spacecraft VALUES (2, 'Voyager 2', 'Space Probe', 'Interstellar Exploration', true, 43);
INSERT INTO public.spacecraft VALUES (3, 'Cassini', 'Space Probe', 'Planetary Exploration (Saturn)', false, 20);
INSERT INTO public.spacecraft VALUES (4, 'New Horizons', 'Space Probe', 'Planetary Exploration (Pluto)', true, 14);
INSERT INTO public.spacecraft VALUES (5, 'Hubble Space Telescope', 'Space Telescope', 'Astronomical Observation', true, NULL);
INSERT INTO public.spacecraft VALUES (6, 'Kepler Space Telescope', 'Space Telescope', 'Exoplanet Discovery', false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 4500000000, true, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'G-type', 6000000000, true, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 'K-type', 6000000000, true, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 'A-type', 250000000, true, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'A-type', 455000000, true, 1);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'M-type', 10000000, false, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 42, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_key UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


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
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: spacecraft unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT unique_name UNIQUE (name);


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

