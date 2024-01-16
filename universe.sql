--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth integer,
    age_mil_years integer,
    size numeric(5,2),
    has_life boolean,
    has_water boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_galaxy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_galaxy_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_galaxy_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    size numeric(4,2),
    age_mil_years integer,
    distance_from_earth integer,
    has_life boolean,
    is_populated boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_moon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_moon_seq OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_moon_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    dimension numeric(4,2),
    age_mil_years integer,
    distance_from_earth integer,
    has_life boolean,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_planet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_planet_seq OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_planet_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(50),
    desription text,
    age_mil_years integer,
    distance_from_earth integer,
    size numeric(4,2) NOT NULL,
    is_bright boolean,
    is_visible boolean
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
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    sun_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_mil_years integer,
    distance_from_earth integer,
    diameter numeric(5,2),
    is_overheating boolean,
    is_cooling boolean,
    galaxy_id integer
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: sun_id_sun_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sun_id_sun_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sun_id_sun_seq OWNER TO freecodecamp;

--
-- Name: sun_id_sun_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sun_id_sun_seq OWNED BY public.sun.sun_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_galaxy_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_moon_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_planet_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: sun sun_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun ALTER COLUMN sun_id SET DEFAULT nextval('public.sun_id_sun_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxy1', 'This is a galaxy', 100, 200, 20.30, true, true);
INSERT INTO public.galaxy VALUES (2, 'Galaxy2', 'This is a galaxy', 100, 200, 20.30, true, true);
INSERT INTO public.galaxy VALUES (3, 'Galaxy3', 'This is a galaxy', 100, 200, 20.30, true, true);
INSERT INTO public.galaxy VALUES (4, 'Galaxy4', 'This is a galaxy', 100, 200, 20.30, true, true);
INSERT INTO public.galaxy VALUES (5, 'Galaxy5', 'This is a galaxy', 100, 200, 20.30, true, true);
INSERT INTO public.galaxy VALUES (6, 'Galaxy6', 'This is a galaxy', 100, 200, 20.30, true, false);
INSERT INTO public.galaxy VALUES (7, 'Galaxy7', 'This is a galaxy', 100, 200, 20.30, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon1', 'This is a Star', 20.30, 100, 200, true, true, 1);
INSERT INTO public.moon VALUES (2, 'Moon2', 'This is a Star', 20.30, 100, 200, true, true, 1);
INSERT INTO public.moon VALUES (3, 'Moon3', 'This is a Star', 20.30, 100, 200, true, true, 3);
INSERT INTO public.moon VALUES (4, 'Moon4', 'This is a Star', 20.30, 100, 200, true, true, 2);
INSERT INTO public.moon VALUES (5, 'Moon5', 'This is a Star', 20.30, 100, 200, true, true, 4);
INSERT INTO public.moon VALUES (6, 'Moon6', 'This is a Star', 20.30, 100, 200, true, false, 3);
INSERT INTO public.moon VALUES (7, 'Moon7', 'This is a Star', 20.30, 100, 200, false, true, 4);
INSERT INTO public.moon VALUES (8, 'Moon8', 'This is a Star', 20.30, 100, 200, false, true, 5);
INSERT INTO public.moon VALUES (9, 'Moon9', 'This is a Star', 20.30, 100, 200, false, true, 3);
INSERT INTO public.moon VALUES (10, 'Moon10', 'This is a Star', 20.30, 100, 200, false, true, 6);
INSERT INTO public.moon VALUES (11, 'Moon11', 'This is a Star', 20.30, 100, 200, false, true, 3);
INSERT INTO public.moon VALUES (12, 'Moon12', 'This is a Star', 20.30, 100, 200, false, true, 7);
INSERT INTO public.moon VALUES (13, 'Moon13', 'This is a Star', 20.30, 100, 200, false, true, 7);
INSERT INTO public.moon VALUES (14, 'Moon14', 'This is a Star', 20.30, 100, 200, false, true, 7);
INSERT INTO public.moon VALUES (15, 'Moon15', 'This is a Star', 20.30, 100, 200, false, true, 7);
INSERT INTO public.moon VALUES (16, 'Moon16', 'This is a Star', 20.30, 100, 200, false, true, 7);
INSERT INTO public.moon VALUES (17, 'Moon17', 'This is a Star', 20.30, 100, 200, false, true, 7);
INSERT INTO public.moon VALUES (18, 'Moon18', 'This is a Star', 20.30, 100, 200, false, true, 7);
INSERT INTO public.moon VALUES (19, 'Moon19', 'This is a Star', 20.30, 100, 200, false, true, 7);
INSERT INTO public.moon VALUES (20, 'Moon20', 'This is a Star', 20.30, 100, 200, false, true, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet1', 'This is a Star', 20.30, 100, 200, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Planet2', 'This is a Star', 20.30, 100, 200, true, true, 1);
INSERT INTO public.planet VALUES (3, 'Planet3', 'This is a Star', 20.30, 100, 200, true, true, 3);
INSERT INTO public.planet VALUES (4, 'Planet4', 'This is a Star', 20.30, 100, 200, true, true, 2);
INSERT INTO public.planet VALUES (5, 'Planet5', 'This is a Star', 20.30, 100, 200, true, true, 4);
INSERT INTO public.planet VALUES (6, 'Planet6', 'This is a Star', 20.30, 100, 200, true, false, 3);
INSERT INTO public.planet VALUES (7, 'Planet7', 'This is a Star', 20.30, 100, 200, false, true, 4);
INSERT INTO public.planet VALUES (8, 'Planet8', 'This is a Star', 20.30, 100, 200, false, true, 5);
INSERT INTO public.planet VALUES (9, 'Planet9', 'This is a Star', 20.30, 100, 200, false, true, 3);
INSERT INTO public.planet VALUES (10, 'Planet10', 'This is a Star', 20.30, 100, 200, false, true, 6);
INSERT INTO public.planet VALUES (11, 'Planet11', 'This is a Star', 20.30, 100, 200, false, true, 3);
INSERT INTO public.planet VALUES (12, 'Planet12', 'This is a Star', 20.30, 100, 200, false, true, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Star1', 'This is a Star1', 100, 200, 20.30, true, true);
INSERT INTO public.star VALUES (2, 1, 'Star2', 'This is a Star2', 100, 200, 20.30, true, true);
INSERT INTO public.star VALUES (3, 2, 'Star3', 'This is a Star3', 100, 200, 20.30, true, true);
INSERT INTO public.star VALUES (4, 3, 'Star4', 'This is a Star4', 100, 200, 20.30, true, true);
INSERT INTO public.star VALUES (5, 3, 'Star5', 'This is a Star5', 100, 200, 20.30, true, true);
INSERT INTO public.star VALUES (6, 3, 'Star6', 'This is a Star6', 100, 200, 20.30, true, false);
INSERT INTO public.star VALUES (7, 4, 'Star7', 'This is a Star7', 100, 200, 20.30, false, true);


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES (1, 'Sun1', 'This is a Star', 100, 200, 20.30, true, true, 1);
INSERT INTO public.sun VALUES (2, 'Sun2', 'This is a Star', 100, 200, 20.30, true, true, 1);
INSERT INTO public.sun VALUES (3, 'Sun3', 'This is a Star', 100, 200, 20.30, true, true, 3);


--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_galaxy_seq', 7, true);


--
-- Name: moon_id_moon_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_moon_seq', 20, true);


--
-- Name: planet_id_planet_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_planet_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: sun_id_sun_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sun_id_sun_seq', 3, true);


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
-- Name: moon name_moon_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_moon_unq UNIQUE (name);


--
-- Name: planet name_planet_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_planet_unq UNIQUE (name);


--
-- Name: sun name_sun_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT name_sun_unq UNIQUE (name);


--
-- Name: galaxy name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unq UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_desription_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_desription_key UNIQUE (desription);


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
-- Name: sun sun_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_pkey PRIMARY KEY (sun_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_id_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: sun sun_id_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_id_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

