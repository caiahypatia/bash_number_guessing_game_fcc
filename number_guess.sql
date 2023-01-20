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
-- Name: info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.info (
    username character varying,
    games_played integer,
    best_game integer
);


ALTER TABLE public.info OWNER TO freecodecamp;

--
-- Data for Name: info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.info VALUES ('user_1674231431843', 2, 499);
INSERT INTO public.info VALUES ('user_1674231431844', 5, 95);
INSERT INTO public.info VALUES ('ME', 6, 7);
INSERT INTO public.info VALUES ('user_1674231955541', 2, 425);
INSERT INTO public.info VALUES ('user_1674231955542', 5, 290);
INSERT INTO public.info VALUES ('user_1674232083099', 2, 36);
INSERT INTO public.info VALUES ('user_1674232083100', 5, 91);
INSERT INTO public.info VALUES ('user_1674232296718', 2, 181);
INSERT INTO public.info VALUES ('user_1674232296719', 5, 392);


--
-- Name: info info_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.info
    ADD CONSTRAINT info_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--
