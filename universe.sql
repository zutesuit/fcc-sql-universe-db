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
-- Name: comets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comets (
    name character varying(30) NOT NULL,
    comets_id integer NOT NULL,
    star_system character varying(30) NOT NULL
);


ALTER TABLE public.comets OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comets_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comets_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comets_comet_id_seq OWNED BY public.comets.comets_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_billions_of_years numeric(10,2) NOT NULL,
    is_eliptical boolean NOT NULL,
    number_of_stars_in_billions numeric(10,3) NOT NULL
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
    name character varying(60) NOT NULL,
    moon_id integer NOT NULL,
    distance_from_earth_in_gm numeric(10,4) NOT NULL,
    age_in_billions_of_years numeric(10,2) NOT NULL,
    description text,
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
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    has_life boolean NOT NULL,
    age_in_billions_of_years numeric(10,4) NOT NULL,
    number_of_moons integer,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    distance_from_earth_in_lightyears numeric(10,4),
    age_in_billions_of_years numeric(10,2) NOT NULL,
    number_of_planets integer,
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
-- Name: comets comets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets ALTER COLUMN comets_id SET DEFAULT nextval('public.comets_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comets VALUES ('Halley''s Comet', 1, 'Sol');
INSERT INTO public.comets VALUES ('Hale Bopp', 2, 'Sol');
INSERT INTO public.comets VALUES ('Hyakutake', 3, 'Sol');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 13.61, false, 100.000);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 10.00, false, 1000.000);
INSERT INTO public.galaxy VALUES ('Pisces Dwarf', 3, 10.00, true, 5.000);
INSERT INTO public.galaxy VALUES ('IC 1613', 4, 7.00, false, 0.100);
INSERT INTO public.galaxy VALUES ('Aquarius Dwarf', 5, 11.00, true, 11.000);
INSERT INTO public.galaxy VALUES ('Triangulum Galaxy', 6, 10.00, false, 40.000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('the Moon', 1, 0.3000, 4.53, 'closest moon to Sol', 1);
INSERT INTO public.moon VALUES ('Phobos', 2, 77.7900, 1.80, 'larger of Mars'' moons', 4);
INSERT INTO public.moon VALUES ('Deimos', 3, 77.7900, 1.80, 'setting for the game ''Doom'' ', 4);
INSERT INTO public.moon VALUES ('Europa', 4, 628.3000, 4.50, 'mission to search for life launching in 2025 ', 5);
INSERT INTO public.moon VALUES ('Io', 5, 628.3000, 4.50, 'Saitama wrecked it', 5);
INSERT INTO public.moon VALUES ('Ganymede', 6, 628.3000, 4.50, 'largest solar system object without an atmosphere', 5);
INSERT INTO public.moon VALUES ('Callisto', 7, 628.3000, 4.50, 'most heavily cratered object in solar system', 5);
INSERT INTO public.moon VALUES ('Euporie', 8, 628.3000, 4.50, 'named after goddess of abundance', 5);
INSERT INTO public.moon VALUES ('Thebe', 9, 628.3000, 4.50, 'second largest of Jupiter''s inner moons', 5);
INSERT INTO public.moon VALUES ('Cyllene', 10, 628.3000, 4.50, 'named after a naiad linked with Mount Cyllene', 5);
INSERT INTO public.moon VALUES ('Titan', 11, 1400.0000, 4.00, 'only known object besides earth with stable surface liquid', 6);
INSERT INTO public.moon VALUES ('Enceladus', 12, 1400.0000, 4.10, 'naturally formed ice oceans', 6);
INSERT INTO public.moon VALUES ('Mimas', 13, 1400.0000, 4.16, 'smallest body known to be roughly rounded by it''s own gravity', 6);
INSERT INTO public.moon VALUES ('Iapetus', 14, 1400.0000, 4.16, 'named after the father of Atlas & Prometheus', 6);
INSERT INTO public.moon VALUES ('Titania', 15, 2723.0000, 4.60, '8th largest moon in solar system, surface area roughly of australia', 7);
INSERT INTO public.moon VALUES ('Miranda', 16, 2723.0000, 4.60, 'has a ~20km high cliff', 7);
INSERT INTO public.moon VALUES ('Oberon', 17, 2723.0000, 4.60, 'named after king of fairies', 7);
INSERT INTO public.moon VALUES ('Triton', 18, 4338.0000, 4.50, 'first neptunian moon discovered', 8);
INSERT INTO public.moon VALUES ('Thalassa', 19, 4338.0000, 4.50, 'named after Thalassa, daughter of Aether', 8);
INSERT INTO public.moon VALUES ('Hippocamp', 20, 4338.0000, 4.50, 'orbits Neptune in about 23 hours', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 2, false, 4.5030, 0, 1);
INSERT INTO public.planet VALUES ('Venus', 3, false, 4.5030, 0, 1);
INSERT INTO public.planet VALUES ('Saturn', 6, false, 4.5030, 146, 1);
INSERT INTO public.planet VALUES ('Neptune', 7, false, 4.5030, 16, 1);
INSERT INTO public.planet VALUES ('Uranus', 8, false, 4.5030, 28, 1);
INSERT INTO public.planet VALUES ('Mars', 4, false, 4.6030, 2, 1);
INSERT INTO public.planet VALUES ('Jupiter', 5, false, 4.6030, 95, 1);
INSERT INTO public.planet VALUES ('Pandora', 10, true, 4.5440, 0, 2);
INSERT INTO public.planet VALUES ('UGPS J072227.51', 11, false, 3.1500, 0, 2);
INSERT INTO public.planet VALUES ('Gliese 12b', 12, false, 7.6000, 0, 2);
INSERT INTO public.planet VALUES ('Earth', 1, true, 4.5430, 1, 1);
INSERT INTO public.planet VALUES ('Krypton', 9, true, 8.7000, 2, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Proxima Centauri', 2, 4.2465, 4.85, 3, 1);
INSERT INTO public.star VALUES ('Sol', 1, 0.0000, 4.60, 8, 1);
INSERT INTO public.star VALUES ('Alpha Centauri', 3, 4.3670, 4.85, 5, 1);
INSERT INTO public.star VALUES ('Barnard''s Star', 4, 5.9780, 10.01, 3, 1);
INSERT INTO public.star VALUES ('Wolf 359', 5, 7.8600, 0.25, 0, 1);
INSERT INTO public.star VALUES ('Sirius', 6, 8.6110, 0.23, 0, 1);


--
-- Name: comets_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comets_comet_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: comets comets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_name_key UNIQUE (name);


--
-- Name: comets comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comets_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

