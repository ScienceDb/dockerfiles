--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Roles; Type: TABLE; Schema: public; Owner: kodiaq
--

CREATE TABLE public."Roles" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Roles" OWNER TO kodiaq;

--
-- Name: Roles_id_seq; Type: SEQUENCE; Schema: public; Owner: kodiaq
--

CREATE SEQUENCE public."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Roles_id_seq" OWNER TO kodiaq;

--
-- Name: Roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kodiaq
--

ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;


--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: kodiaq
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO kodiaq;

--
-- Name: User2Roles; Type: TABLE; Schema: public; Owner: kodiaq
--

CREATE TABLE public."User2Roles" (
    id integer NOT NULL,
    "UserId" integer NOT NULL,
    "RoleId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."User2Roles" OWNER TO kodiaq;

--
-- Name: User2Roles_id_seq; Type: SEQUENCE; Schema: public; Owner: kodiaq
--

CREATE SEQUENCE public."User2Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User2Roles_id_seq" OWNER TO kodiaq;

--
-- Name: User2Roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kodiaq
--

ALTER SEQUENCE public."User2Roles_id_seq" OWNED BY public."User2Roles".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: kodiaq
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    hash text NOT NULL,
    salt character varying(255) NOT NULL,
    "activationKey" character varying(255),
    "resetPasswordKey" character varying(255),
    verified boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Users" OWNER TO kodiaq;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: kodiaq
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO kodiaq;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kodiaq
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: cultivars; Type: TABLE; Schema: public; Owner: kodiaq
--

CREATE TABLE public.cultivars (
    id integer NOT NULL,
    description character varying(255),
    genotype character varying(255),
    taxon_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.cultivars OWNER TO kodiaq;

--
-- Name: cultivars_id_seq; Type: SEQUENCE; Schema: public; Owner: kodiaq
--

CREATE SEQUENCE public.cultivars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cultivars_id_seq OWNER TO kodiaq;

--
-- Name: cultivars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kodiaq
--

ALTER SEQUENCE public.cultivars_id_seq OWNED BY public.cultivars.id;


--
-- Name: field_plots; Type: TABLE; Schema: public; Owner: kodiaq
--

CREATE TABLE public.field_plots (
    id integer NOT NULL,
    field_name character varying(255),
    latitude double precision,
    longitude double precision,
    location_code character varying(255),
    soil_treatment character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.field_plots OWNER TO kodiaq;

--
-- Name: field_plots_id_seq; Type: SEQUENCE; Schema: public; Owner: kodiaq
--

CREATE SEQUENCE public.field_plots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.field_plots_id_seq OWNER TO kodiaq;

--
-- Name: field_plots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kodiaq
--

ALTER SEQUENCE public.field_plots_id_seq OWNED BY public.field_plots.id;


--
-- Name: individuals; Type: TABLE; Schema: public; Owner: kodiaq
--

CREATE TABLE public.individuals (
    id integer NOT NULL,
    name character varying(255),
    sowing_date timestamp with time zone,
    harvest_date timestamp with time zone,
    cultivar_id integer,
    field_plot_id integer,
    pot_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.individuals OWNER TO kodiaq;

--
-- Name: individuals_id_seq; Type: SEQUENCE; Schema: public; Owner: kodiaq
--

CREATE SEQUENCE public.individuals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.individuals_id_seq OWNER TO kodiaq;

--
-- Name: individuals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kodiaq
--

ALTER SEQUENCE public.individuals_id_seq OWNED BY public.individuals.id;


--
-- Name: metabolite_measurements; Type: TABLE; Schema: public; Owner: kodiaq
--

CREATE TABLE public.metabolite_measurements (
    id integer NOT NULL,
    metabolite character varying(255),
    amount double precision,
    unit character varying(255),
    is_average boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.metabolite_measurements OWNER TO kodiaq;

--
-- Name: metabolite_measurements_id_seq; Type: SEQUENCE; Schema: public; Owner: kodiaq
--

CREATE SEQUENCE public.metabolite_measurements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metabolite_measurements_id_seq OWNER TO kodiaq;

--
-- Name: metabolite_measurements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kodiaq
--

ALTER SEQUENCE public.metabolite_measurements_id_seq OWNED BY public.metabolite_measurements.id;


--
-- Name: microbiome_otus; Type: TABLE; Schema: public; Owner: kodiaq
--

CREATE TABLE public.microbiome_otus (
    id integer NOT NULL,
    otu_id character varying(255),
    sample_id integer,
    sample_desc character varying(255),
    count integer,
    experiment character varying(255),
    version integer,
    kingdom character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    taxon_id integer,
    reference_sequence text,
    parent_id integer
);


ALTER TABLE public.microbiome_otus OWNER TO kodiaq;

--
-- Name: microbiome_otus_id_seq; Type: SEQUENCE; Schema: public; Owner: kodiaq
--

CREATE SEQUENCE public.microbiome_otus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.microbiome_otus_id_seq OWNER TO kodiaq;

--
-- Name: microbiome_otus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kodiaq
--

ALTER SEQUENCE public.microbiome_otus_id_seq OWNED BY public.microbiome_otus.id;


--
-- Name: plant_measurements; Type: TABLE; Schema: public; Owner: kodiaq
--

CREATE TABLE public.plant_measurements (
    id integer NOT NULL,
    variable character varying(255),
    value numeric,
    unit character varying(255),
    individual_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.plant_measurements OWNER TO kodiaq;

--
-- Name: plant_measurements_id_seq; Type: SEQUENCE; Schema: public; Owner: kodiaq
--

CREATE SEQUENCE public.plant_measurements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plant_measurements_id_seq OWNER TO kodiaq;

--
-- Name: plant_measurements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kodiaq
--

ALTER SEQUENCE public.plant_measurements_id_seq OWNED BY public.plant_measurements.id;


--
-- Name: pots; Type: TABLE; Schema: public; Owner: kodiaq
--

CREATE TABLE public.pots (
    id integer NOT NULL,
    pot character varying(255),
    greenhouse character varying(255),
    climate_chamber character varying(255),
    conditions character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.pots OWNER TO kodiaq;

--
-- Name: pots_id_seq; Type: SEQUENCE; Schema: public; Owner: kodiaq
--

CREATE SEQUENCE public.pots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pots_id_seq OWNER TO kodiaq;

--
-- Name: pots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kodiaq
--

ALTER SEQUENCE public.pots_id_seq OWNED BY public.pots.id;


--
-- Name: sample_to_metabolite_measurements; Type: TABLE; Schema: public; Owner: kodiaq
--

CREATE TABLE public.sample_to_metabolite_measurements (
    id integer NOT NULL,
    metabolite_measurement_id integer NOT NULL,
    sample_id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.sample_to_metabolite_measurements OWNER TO kodiaq;

--
-- Name: sample_to_metabolite_measurements_id_seq; Type: SEQUENCE; Schema: public; Owner: kodiaq
--

CREATE SEQUENCE public.sample_to_metabolite_measurements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sample_to_metabolite_measurements_id_seq OWNER TO kodiaq;

--
-- Name: sample_to_metabolite_measurements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kodiaq
--

ALTER SEQUENCE public.sample_to_metabolite_measurements_id_seq OWNED BY public.sample_to_metabolite_measurements.id;


--
-- Name: samples; Type: TABLE; Schema: public; Owner: kodiaq
--

CREATE TABLE public.samples (
    id integer NOT NULL,
    name character varying(255),
    material character varying(255),
    life_cycle_phase character varying(255),
    description character varying(255),
    harvest_date timestamp with time zone,
    individual_id integer,
    field_plot_id integer,
    pot_id integer,
    parent_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    barcode_number integer,
    barcode_sequence text,
    library character varying(255)
);


ALTER TABLE public.samples OWNER TO kodiaq;

--
-- Name: samples_id_seq; Type: SEQUENCE; Schema: public; Owner: kodiaq
--

CREATE SEQUENCE public.samples_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.samples_id_seq OWNER TO kodiaq;

--
-- Name: samples_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kodiaq
--

ALTER SEQUENCE public.samples_id_seq OWNED BY public.samples.id;


--
-- Name: soil_samples; Type: TABLE; Schema: public; Owner: kodiaq
--

CREATE TABLE public.soil_samples (
    id integer NOT NULL,
    name character varying(255),
    harvest_date timestamp with time zone,
    field_plot_id integer,
    pot_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.soil_samples OWNER TO kodiaq;

--
-- Name: soil_samples_id_seq; Type: SEQUENCE; Schema: public; Owner: kodiaq
--

CREATE SEQUENCE public.soil_samples_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.soil_samples_id_seq OWNER TO kodiaq;

--
-- Name: soil_samples_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kodiaq
--

ALTER SEQUENCE public.soil_samples_id_seq OWNED BY public.soil_samples.id;


--
-- Name: taxons; Type: TABLE; Schema: public; Owner: kodiaq
--

CREATE TABLE public.taxons (
    id integer NOT NULL,
    name character varying(255),
    taxonomic_level character varying(255),
    parent_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.taxons OWNER TO kodiaq;

--
-- Name: taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: kodiaq
--

CREATE SEQUENCE public.taxons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taxons_id_seq OWNER TO kodiaq;

--
-- Name: taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kodiaq
--

ALTER SEQUENCE public.taxons_id_seq OWNED BY public.taxons.id;


--
-- Name: transcript_counts; Type: TABLE; Schema: public; Owner: kodiaq
--

CREATE TABLE public.transcript_counts (
    id integer NOT NULL,
    gene character varying(255),
    variable character varying(255),
    count numeric,
    tissue_or_condition character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.transcript_counts OWNER TO kodiaq;

--
-- Name: transcript_counts_id_seq; Type: SEQUENCE; Schema: public; Owner: kodiaq
--

CREATE SEQUENCE public.transcript_counts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transcript_counts_id_seq OWNER TO kodiaq;

--
-- Name: transcript_counts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kodiaq
--

ALTER SEQUENCE public.transcript_counts_id_seq OWNED BY public.transcript_counts.id;


--
-- Name: Roles id; Type: DEFAULT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);


--
-- Name: User2Roles id; Type: DEFAULT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public."User2Roles" ALTER COLUMN id SET DEFAULT nextval('public."User2Roles_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Name: cultivars id; Type: DEFAULT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.cultivars ALTER COLUMN id SET DEFAULT nextval('public.cultivars_id_seq'::regclass);


--
-- Name: field_plots id; Type: DEFAULT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.field_plots ALTER COLUMN id SET DEFAULT nextval('public.field_plots_id_seq'::regclass);


--
-- Name: individuals id; Type: DEFAULT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.individuals ALTER COLUMN id SET DEFAULT nextval('public.individuals_id_seq'::regclass);


--
-- Name: metabolite_measurements id; Type: DEFAULT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.metabolite_measurements ALTER COLUMN id SET DEFAULT nextval('public.metabolite_measurements_id_seq'::regclass);


--
-- Name: microbiome_otus id; Type: DEFAULT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.microbiome_otus ALTER COLUMN id SET DEFAULT nextval('public.microbiome_otus_id_seq'::regclass);


--
-- Name: plant_measurements id; Type: DEFAULT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.plant_measurements ALTER COLUMN id SET DEFAULT nextval('public.plant_measurements_id_seq'::regclass);


--
-- Name: pots id; Type: DEFAULT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.pots ALTER COLUMN id SET DEFAULT nextval('public.pots_id_seq'::regclass);


--
-- Name: sample_to_metabolite_measurements id; Type: DEFAULT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.sample_to_metabolite_measurements ALTER COLUMN id SET DEFAULT nextval('public.sample_to_metabolite_measurements_id_seq'::regclass);


--
-- Name: samples id; Type: DEFAULT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.samples ALTER COLUMN id SET DEFAULT nextval('public.samples_id_seq'::regclass);


--
-- Name: soil_samples id; Type: DEFAULT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.soil_samples ALTER COLUMN id SET DEFAULT nextval('public.soil_samples_id_seq'::regclass);


--
-- Name: taxons id; Type: DEFAULT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.taxons ALTER COLUMN id SET DEFAULT nextval('public.taxons_id_seq'::regclass);


--
-- Name: transcript_counts id; Type: DEFAULT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.transcript_counts ALTER COLUMN id SET DEFAULT nextval('public.transcript_counts_id_seq'::regclass);


--
-- Name: Roles Roles_pkey; Type: CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: User2Roles User2Roles_pkey; Type: CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public."User2Roles"
    ADD CONSTRAINT "User2Roles_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: cultivars cultivars_pkey; Type: CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.cultivars
    ADD CONSTRAINT cultivars_pkey PRIMARY KEY (id);


--
-- Name: field_plots field_plots_pkey; Type: CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.field_plots
    ADD CONSTRAINT field_plots_pkey PRIMARY KEY (id);


--
-- Name: individuals individuals_pkey; Type: CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.individuals
    ADD CONSTRAINT individuals_pkey PRIMARY KEY (id);


--
-- Name: metabolite_measurements metabolite_measurements_pkey; Type: CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.metabolite_measurements
    ADD CONSTRAINT metabolite_measurements_pkey PRIMARY KEY (id);


--
-- Name: microbiome_otus microbiome_otus_pkey; Type: CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.microbiome_otus
    ADD CONSTRAINT microbiome_otus_pkey PRIMARY KEY (id);


--
-- Name: plant_measurements plant_measurements_pkey; Type: CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.plant_measurements
    ADD CONSTRAINT plant_measurements_pkey PRIMARY KEY (id);


--
-- Name: pots pots_pkey; Type: CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.pots
    ADD CONSTRAINT pots_pkey PRIMARY KEY (id);


--
-- Name: sample_to_metabolite_measurements sample_to_metabolite_measurements_pkey; Type: CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.sample_to_metabolite_measurements
    ADD CONSTRAINT sample_to_metabolite_measurements_pkey PRIMARY KEY (id);


--
-- Name: samples samples_pkey; Type: CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.samples
    ADD CONSTRAINT samples_pkey PRIMARY KEY (id);


--
-- Name: soil_samples soil_samples_pkey; Type: CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.soil_samples
    ADD CONSTRAINT soil_samples_pkey PRIMARY KEY (id);


--
-- Name: taxons taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.taxons
    ADD CONSTRAINT taxons_pkey PRIMARY KEY (id);


--
-- Name: transcript_counts transcript_counts_pkey; Type: CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.transcript_counts
    ADD CONSTRAINT transcript_counts_pkey PRIMARY KEY (id);


--
-- Name: samples field_plot_fk; Type: FK CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.samples
    ADD CONSTRAINT field_plot_fk FOREIGN KEY (field_plot_id) REFERENCES public.field_plots(id);


--
-- Name: samples individual_fk; Type: FK CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.samples
    ADD CONSTRAINT individual_fk FOREIGN KEY (individual_id) REFERENCES public.individuals(id);


--
-- Name: microbiome_otus parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.microbiome_otus
    ADD CONSTRAINT parent_fk FOREIGN KEY (parent_id) REFERENCES public.microbiome_otus(id);


--
-- Name: samples parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.samples
    ADD CONSTRAINT parent_fk FOREIGN KEY (parent_id) REFERENCES public.samples(id);


--
-- Name: samples pot_fk; Type: FK CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.samples
    ADD CONSTRAINT pot_fk FOREIGN KEY (pot_id) REFERENCES public.pots(id);


--
-- Name: microbiome_otus sample_fk; Type: FK CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.microbiome_otus
    ADD CONSTRAINT sample_fk FOREIGN KEY (sample_id) REFERENCES public.samples(id);


--
-- Name: sample_to_metabolite_measurements sample_to_metabolite_measurement_metabolite_measurement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.sample_to_metabolite_measurements
    ADD CONSTRAINT sample_to_metabolite_measurement_metabolite_measurement_id_fkey FOREIGN KEY (metabolite_measurement_id) REFERENCES public.metabolite_measurements(id);


--
-- Name: sample_to_metabolite_measurements sample_to_metabolite_measurements_sample_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.sample_to_metabolite_measurements
    ADD CONSTRAINT sample_to_metabolite_measurements_sample_id_fkey FOREIGN KEY (sample_id) REFERENCES public.samples(id);


--
-- Name: microbiome_otus taxon_fk; Type: FK CONSTRAINT; Schema: public; Owner: kodiaq
--

ALTER TABLE ONLY public.microbiome_otus
    ADD CONSTRAINT taxon_fk FOREIGN KEY (taxon_id) REFERENCES public.taxons(id);


--
-- PostgreSQL database dump complete
--

