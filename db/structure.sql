\restrict fMd2v1PaT0NRRVu9hPI6Emq0aXNNpZQxyqvqPwhZMGcFssiheTdJBWMZ3pWHc8F

-- Dumped from database version 14.19 (Homebrew)
-- Dumped by pg_dump version 14.19 (Homebrew)

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp without time zone NOT NULL,
    service_name character varying NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: areas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.areas (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    published boolean DEFAULT false NOT NULL,
    slug character varying,
    tags character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    short_name character varying,
    priority smallint DEFAULT 3 NOT NULL,
    description_fr text,
    description_en text,
    warning_fr text,
    warning_en text,
    bleau_area_id integer NOT NULL,
    cluster_id integer
);


--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.areas_id_seq OWNED BY public.areas.id;


--
-- Name: audits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.audits (
    id bigint NOT NULL,
    auditable_id integer,
    auditable_type character varying,
    associated_id integer,
    associated_type character varying,
    user_id integer,
    user_type character varying,
    username character varying,
    action character varying,
    audited_changes jsonb,
    version integer DEFAULT 0,
    comment character varying,
    remote_address character varying,
    request_uuid character varying,
    created_at timestamp(6) without time zone
);


--
-- Name: audits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.audits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.audits_id_seq OWNED BY public.audits.id;


--
-- Name: bleau_areas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bleau_areas (
    id bigint NOT NULL,
    slug character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    name character varying,
    category character varying
);


--
-- Name: bleau_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bleau_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bleau_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bleau_areas_id_seq OWNED BY public.bleau_areas.id;


--
-- Name: bleau_problems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bleau_problems (
    id bigint NOT NULL,
    name character varying,
    grade character varying,
    steepness character varying,
    sit_start boolean,
    tags character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    bleau_circuit_id bigint,
    circuit_number character varying,
    circuit_letter character varying,
    ascents integer,
    ratings integer,
    ratings_average numeric,
    bleau_area_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    ignore boolean DEFAULT false,
    related_ids integer[] DEFAULT '{}'::integer[]
);


--
-- Name: bleau_problems_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bleau_problems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bleau_problems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bleau_problems_id_seq OWNED BY public.bleau_problems.id;


--
-- Name: boulders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.boulders (
    id bigint NOT NULL,
    polygon public.geography(Polygon,4326),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    area_id bigint,
    ignore_for_area_hull boolean DEFAULT false NOT NULL
);


--
-- Name: boulders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.boulders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: boulders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.boulders_id_seq OWNED BY public.boulders.id;


--
-- Name: circuits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.circuits (
    id bigint NOT NULL,
    color character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    risk smallint
);


--
-- Name: circuits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.circuits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: circuits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.circuits_id_seq OWNED BY public.circuits.id;


--
-- Name: clusters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clusters (
    id bigint NOT NULL,
    name character varying,
    main_area_id integer,
    center public.geography(Point,4326),
    sw public.geography(Point,4326),
    ne public.geography(Point,4326),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clusters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clusters_id_seq OWNED BY public.clusters.id;


--
-- Name: contribution_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contribution_requests (
    id bigint NOT NULL,
    what character varying NOT NULL,
    state character varying NOT NULL,
    location_estimated public.geography(Point,4326),
    problem_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    comment text
);


--
-- Name: contribution_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contribution_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contribution_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contribution_requests_id_seq OWNED BY public.contribution_requests.id;


--
-- Name: contributions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contributions (
    id bigint NOT NULL,
    problem_id bigint,
    comment text,
    location public.geography(Point,4326),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    contributor_name character varying,
    contributor_email character varying,
    state character varying DEFAULT 'pending'::character varying NOT NULL,
    problem_name character varying,
    problem_url character varying
);


--
-- Name: contributions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contributions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contributions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contributions_id_seq OWNED BY public.contributions.id;


--
-- Name: imports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.imports (
    id bigint NOT NULL,
    applied_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: imports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.imports_id_seq OWNED BY public.imports.id;


--
-- Name: lines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lines (
    id bigint NOT NULL,
    coordinates json,
    problem_id bigint,
    topo_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: lines_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lines_id_seq OWNED BY public.lines.id;


--
-- Name: poi_routes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.poi_routes (
    id bigint NOT NULL,
    distance integer NOT NULL,
    transport character varying NOT NULL,
    area_id bigint,
    poi_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: poi_routes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.poi_routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: poi_routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.poi_routes_id_seq OWNED BY public.poi_routes.id;


--
-- Name: pois; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pois (
    id bigint NOT NULL,
    name character varying,
    short_name character varying,
    google_url character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    poi_type character varying DEFAULT 'parking'::character varying NOT NULL,
    location public.geography(Point,4326)
);


--
-- Name: pois_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pois_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pois_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pois_id_seq OWNED BY public.pois.id;


--
-- Name: problems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.problems (
    id bigint NOT NULL,
    name character varying,
    grade character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    location public.geography(Point,4326),
    circuit_id bigint,
    circuit_number character varying,
    steepness character varying NOT NULL,
    height integer,
    area_id bigint,
    bleau_info_id integer,
    landing character varying,
    featured boolean DEFAULT false NOT NULL,
    parent_id bigint,
    ratings_average numeric,
    ratings integer,
    ascents integer,
    popularity integer,
    circuit_letter character varying,
    sit_start boolean DEFAULT false NOT NULL,
    has_line boolean DEFAULT false NOT NULL
);


--
-- Name: problems_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.problems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: problems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.problems_id_seq OWNED BY public.problems.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: topos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.topos (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    published boolean DEFAULT true NOT NULL,
    metadata json
);


--
-- Name: topos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.topos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: topos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topos_id_seq OWNED BY public.topos.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: areas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.areas ALTER COLUMN id SET DEFAULT nextval('public.areas_id_seq'::regclass);


--
-- Name: audits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audits ALTER COLUMN id SET DEFAULT nextval('public.audits_id_seq'::regclass);


--
-- Name: bleau_areas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bleau_areas ALTER COLUMN id SET DEFAULT nextval('public.bleau_areas_id_seq'::regclass);


--
-- Name: bleau_problems id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bleau_problems ALTER COLUMN id SET DEFAULT nextval('public.bleau_problems_id_seq'::regclass);


--
-- Name: boulders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.boulders ALTER COLUMN id SET DEFAULT nextval('public.boulders_id_seq'::regclass);


--
-- Name: circuits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.circuits ALTER COLUMN id SET DEFAULT nextval('public.circuits_id_seq'::regclass);


--
-- Name: clusters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clusters ALTER COLUMN id SET DEFAULT nextval('public.clusters_id_seq'::regclass);


--
-- Name: contribution_requests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribution_requests ALTER COLUMN id SET DEFAULT nextval('public.contribution_requests_id_seq'::regclass);


--
-- Name: contributions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributions ALTER COLUMN id SET DEFAULT nextval('public.contributions_id_seq'::regclass);


--
-- Name: imports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imports ALTER COLUMN id SET DEFAULT nextval('public.imports_id_seq'::regclass);


--
-- Name: lines id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lines ALTER COLUMN id SET DEFAULT nextval('public.lines_id_seq'::regclass);


--
-- Name: poi_routes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.poi_routes ALTER COLUMN id SET DEFAULT nextval('public.poi_routes_id_seq'::regclass);


--
-- Name: pois id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pois ALTER COLUMN id SET DEFAULT nextval('public.pois_id_seq'::regclass);


--
-- Name: problems id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problems ALTER COLUMN id SET DEFAULT nextval('public.problems_id_seq'::regclass);


--
-- Name: topos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topos ALTER COLUMN id SET DEFAULT nextval('public.topos_id_seq'::regclass);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: audits audits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- Name: bleau_areas bleau_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bleau_areas
    ADD CONSTRAINT bleau_areas_pkey PRIMARY KEY (id);


--
-- Name: bleau_problems bleau_problems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bleau_problems
    ADD CONSTRAINT bleau_problems_pkey PRIMARY KEY (id);


--
-- Name: boulders boulders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.boulders
    ADD CONSTRAINT boulders_pkey PRIMARY KEY (id);


--
-- Name: circuits circuits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.circuits
    ADD CONSTRAINT circuits_pkey PRIMARY KEY (id);


--
-- Name: clusters clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_pkey PRIMARY KEY (id);


--
-- Name: contribution_requests contribution_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contribution_requests
    ADD CONSTRAINT contribution_requests_pkey PRIMARY KEY (id);


--
-- Name: contributions contributions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributions
    ADD CONSTRAINT contributions_pkey PRIMARY KEY (id);


--
-- Name: imports imports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT imports_pkey PRIMARY KEY (id);


--
-- Name: lines lines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lines
    ADD CONSTRAINT lines_pkey PRIMARY KEY (id);


--
-- Name: poi_routes poi_routes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.poi_routes
    ADD CONSTRAINT poi_routes_pkey PRIMARY KEY (id);


--
-- Name: pois pois_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pois
    ADD CONSTRAINT pois_pkey PRIMARY KEY (id);


--
-- Name: problems problems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT problems_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: topos topos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topos
    ADD CONSTRAINT topos_pkey PRIMARY KEY (id);


--
-- Name: associated_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX associated_index ON public.audits USING btree (associated_type, associated_id);


--
-- Name: auditable_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auditable_index ON public.audits USING btree (auditable_type, auditable_id, version);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_areas_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_areas_on_slug ON public.areas USING btree (slug);


--
-- Name: index_areas_on_tags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_areas_on_tags ON public.areas USING gin (tags);


--
-- Name: index_audits_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_audits_on_created_at ON public.audits USING btree (created_at);


--
-- Name: index_audits_on_request_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_audits_on_request_uuid ON public.audits USING btree (request_uuid);


--
-- Name: index_bleau_areas_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_bleau_areas_on_slug ON public.bleau_areas USING btree (slug);


--
-- Name: index_bleau_problems_on_bleau_area_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bleau_problems_on_bleau_area_id ON public.bleau_problems USING btree (bleau_area_id);


--
-- Name: index_bleau_problems_on_bleau_circuit_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bleau_problems_on_bleau_circuit_id ON public.bleau_problems USING btree (bleau_circuit_id);


--
-- Name: index_boulders_on_area_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_boulders_on_area_id ON public.boulders USING btree (area_id);


--
-- Name: index_contribution_requests_on_problem_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_contribution_requests_on_problem_id ON public.contribution_requests USING btree (problem_id);


--
-- Name: index_contribution_requests_on_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_contribution_requests_on_state ON public.contribution_requests USING btree (state);


--
-- Name: index_contribution_requests_on_what; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_contribution_requests_on_what ON public.contribution_requests USING btree (what);


--
-- Name: index_contributions_on_problem_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_contributions_on_problem_id ON public.contributions USING btree (problem_id);


--
-- Name: index_lines_on_problem_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lines_on_problem_id ON public.lines USING btree (problem_id);


--
-- Name: index_lines_on_topo_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lines_on_topo_id ON public.lines USING btree (topo_id);


--
-- Name: index_poi_routes_on_area_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_poi_routes_on_area_id ON public.poi_routes USING btree (area_id);


--
-- Name: index_poi_routes_on_poi_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_poi_routes_on_poi_id ON public.poi_routes USING btree (poi_id);


--
-- Name: index_problems_on_area_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_problems_on_area_id ON public.problems USING btree (area_id);


--
-- Name: index_problems_on_circuit_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_problems_on_circuit_id ON public.problems USING btree (circuit_id);


--
-- Name: index_problems_on_grade; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_problems_on_grade ON public.problems USING btree (grade);


--
-- Name: index_problems_on_has_line; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_problems_on_has_line ON public.problems USING btree (has_line);


--
-- Name: index_problems_on_location; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_problems_on_location ON public.problems USING gist (location);


--
-- Name: user_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_index ON public.audits USING btree (user_id, user_type);


--
-- Name: boulders fk_rails_2e5c243105; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.boulders
    ADD CONSTRAINT fk_rails_2e5c243105 FOREIGN KEY (area_id) REFERENCES public.areas(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: problems fk_rails_d3a7f4c434; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT fk_rails_d3a7f4c434 FOREIGN KEY (area_id) REFERENCES public.areas(id);


--
-- PostgreSQL database dump complete
--

\unrestrict fMd2v1PaT0NRRVu9hPI6Emq0aXNNpZQxyqvqPwhZMGcFssiheTdJBWMZ3pWHc8F

SET search_path TO public,postgis;

INSERT INTO "schema_migrations" (version) VALUES
('20250712192123'),
('20250603143411'),
('20250602113239'),
('20240904091012'),
('20240628153658'),
('20240628153056'),
('20240425074350'),
('20240202132547'),
('20240118093938'),
('20240115143426'),
('20240115113733'),
('20240115105248'),
('20240112081452'),
('20240105155516'),
('20231211183004'),
('20231211171435'),
('20231211140316'),
('20231207155225'),
('20231109163340'),
('20231103111627'),
('20231103111453'),
('20231027150035'),
('20231010112108'),
('20231005145400'),
('20230710092750'),
('20230704151659'),
('20230704092226'),
('20230704072308'),
('20230627091503'),
('20230428202917'),
('20230112124744'),
('20230112124430'),
('20230112123704'),
('20230108101400'),
('20230108095221'),
('20230105082925'),
('20221231191918'),
('20221231132049'),
('20221231123215'),
('20221231123132'),
('20221216073817'),
('20221214163656'),
('20221214073647'),
('20221207164950'),
('20221129095701'),
('20221026082130'),
('20221024154350'),
('20221019184904'),
('20210618163152'),
('20210609100827'),
('20210529140523'),
('20210513163723'),
('20210507110726'),
('20210405160635'),
('20210310211006'),
('20210224092634'),
('20210130194726'),
('20210126155250'),
('20210126155249'),
('20201101160643'),
('20201101100712'),
('20201101094419'),
('20201019194907'),
('20200705193814'),
('20200704211106'),
('20200509193959'),
('20200507130052'),
('20200428150852'),
('20200428120744'),
('20200419083712'),
('20200419083551'),
('20200419083233'),
('20200418210357'),
('20200418194159'),
('20200418095046'),
('20200416201305'),
('20200416200511'),
('20200416195506'),
('20200416195009'),
('20200416193749'),
('20200416122424'),
('20200416080911'),
('20200415175547');

