--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8
-- Dumped by pg_dump version 14.8

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
-- Name: attribute_mappings; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.attribute_mappings (
    id bigint NOT NULL,
    scenario_id integer,
    source_field character varying(255) NOT NULL,
    destination_field character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.attribute_mappings OWNER TO app;

--
-- Name: attribute_mappings_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.attribute_mappings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attribute_mappings_id_seq OWNER TO app;

--
-- Name: attribute_mappings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.attribute_mappings_id_seq OWNED BY public.attribute_mappings.id;


--
-- Name: config_entries; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.config_entries (
    id integer NOT NULL,
    process_id integer,
    config_key character varying(255) NOT NULL,
    config_value text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.config_entries OWNER TO app;

--
-- Name: config_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.config_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.config_entries_id_seq OWNER TO app;

--
-- Name: config_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.config_entries_id_seq OWNED BY public.config_entries.id;


--
-- Name: mapping_scenarios; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.mapping_scenarios (
    id integer NOT NULL,
    process_id integer,
    scenario_name character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.mapping_scenarios OWNER TO app;

--
-- Name: mapping_scenarios_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.mapping_scenarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mapping_scenarios_id_seq OWNER TO app;

--
-- Name: mapping_scenarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.mapping_scenarios_id_seq OWNED BY public.mapping_scenarios.id;


--
-- Name: oems; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.oems (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.oems OWNER TO app;

--
-- Name: oems_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.oems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oems_id_seq OWNER TO app;

--
-- Name: oems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.oems_id_seq OWNED BY public.oems.id;


--
-- Name: processes; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.processes (
    id bigint NOT NULL,
    project_id integer,
    process_name character varying(255) NOT NULL,
    schedule character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    instance text,
    java_process_name text,
    configset_name text
);


ALTER TABLE public.processes OWNER TO app;

--
-- Name: processes_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.processes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.processes_id_seq OWNER TO app;

--
-- Name: processes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.processes_id_seq OWNED BY public.processes.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    project_key character varying(100) NOT NULL,
    oem_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    project_name text
);


ALTER TABLE public.projects OWNER TO app;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO app;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: query_audit; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.query_audit (
    id integer NOT NULL,
    session_id character varying(100),
    query text,
    detected_intent character varying(100),
    execution_path character varying(50),
    status character varying(50),
    processing_time double precision,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.query_audit OWNER TO app;

--
-- Name: query_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.query_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.query_audit_id_seq OWNER TO app;

--
-- Name: query_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.query_audit_id_seq OWNED BY public.query_audit.id;


--
-- Name: response_feedback; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.response_feedback (
    id integer NOT NULL,
    session_id uuid,
    query text,
    intent character varying(100),
    status character varying(50),
    feedback character varying(10),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.response_feedback OWNER TO app;

--
-- Name: response_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.response_feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.response_feedback_id_seq OWNER TO app;

--
-- Name: response_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.response_feedback_id_seq OWNED BY public.response_feedback.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.sessions (
    id uuid NOT NULL,
    oem character varying(100),
    project_key character varying(100),
    process_name character varying(255),
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    pending_intent text,
    last_query text,
    last_response jsonb
);


ALTER TABLE public.sessions OWNER TO app;

--
-- Name: value_mappings; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.value_mappings (
    id bigint NOT NULL,
    attribute_mapping_id integer,
    source_value character varying(255) NOT NULL,
    destination_value character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.value_mappings OWNER TO app;

--
-- Name: value_mappings_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.value_mappings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.value_mappings_id_seq OWNER TO app;

--
-- Name: value_mappings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.value_mappings_id_seq OWNED BY public.value_mappings.id;


--
-- Name: attribute_mappings id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.attribute_mappings ALTER COLUMN id SET DEFAULT nextval('public.attribute_mappings_id_seq'::regclass);


--
-- Name: config_entries id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.config_entries ALTER COLUMN id SET DEFAULT nextval('public.config_entries_id_seq'::regclass);


--
-- Name: mapping_scenarios id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.mapping_scenarios ALTER COLUMN id SET DEFAULT nextval('public.mapping_scenarios_id_seq'::regclass);


--
-- Name: oems id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.oems ALTER COLUMN id SET DEFAULT nextval('public.oems_id_seq'::regclass);


--
-- Name: processes id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.processes ALTER COLUMN id SET DEFAULT nextval('public.processes_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: query_audit id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.query_audit ALTER COLUMN id SET DEFAULT nextval('public.query_audit_id_seq'::regclass);


--
-- Name: response_feedback id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.response_feedback ALTER COLUMN id SET DEFAULT nextval('public.response_feedback_id_seq'::regclass);


--
-- Name: value_mappings id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.value_mappings ALTER COLUMN id SET DEFAULT nextval('public.value_mappings_id_seq'::regclass);


--
-- Name: attribute_mappings attribute_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.attribute_mappings
    ADD CONSTRAINT attribute_mappings_pkey PRIMARY KEY (id);


--
-- Name: config_entries config_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.config_entries
    ADD CONSTRAINT config_entries_pkey PRIMARY KEY (id);


--
-- Name: mapping_scenarios mapping_scenarios_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.mapping_scenarios
    ADD CONSTRAINT mapping_scenarios_pkey PRIMARY KEY (id);


--
-- Name: oems oems_name_key; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.oems
    ADD CONSTRAINT oems_name_key UNIQUE (name);


--
-- Name: oems oems_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.oems
    ADD CONSTRAINT oems_pkey PRIMARY KEY (id);


--
-- Name: processes processes_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.processes
    ADD CONSTRAINT processes_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: projects projects_project_key_key; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_project_key_key UNIQUE (project_key);


--
-- Name: query_audit query_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.query_audit
    ADD CONSTRAINT query_audit_pkey PRIMARY KEY (id);


--
-- Name: response_feedback response_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.response_feedback
    ADD CONSTRAINT response_feedback_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: value_mappings value_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.value_mappings
    ADD CONSTRAINT value_mappings_pkey PRIMARY KEY (id);


--
-- Name: idx_attr_destination; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_attr_destination ON public.attribute_mappings USING btree (destination_field);


--
-- Name: idx_attr_scenario; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_attr_scenario ON public.attribute_mappings USING btree (scenario_id);


--
-- Name: idx_attr_source; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_attr_source ON public.attribute_mappings USING btree (source_field);


--
-- Name: idx_config_key; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_config_key ON public.config_entries USING btree (config_key);


--
-- Name: idx_config_process; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_config_process ON public.config_entries USING btree (process_id);


--
-- Name: idx_feedback_session; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_feedback_session ON public.response_feedback USING btree (session_id);


--
-- Name: idx_mapping_process; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_mapping_process ON public.mapping_scenarios USING btree (process_id);


--
-- Name: idx_process_project; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_process_project ON public.processes USING btree (project_id);


--
-- Name: idx_project_oem; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_project_oem ON public.projects USING btree (oem_id);


--
-- Name: idx_sessions_updated; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_sessions_updated ON public.sessions USING btree (updated_at);


--
-- Name: idx_value_attr_map; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_value_attr_map ON public.value_mappings USING btree (attribute_mapping_id);


--
-- Name: idx_value_destination; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_value_destination ON public.value_mappings USING btree (destination_value);


--
-- Name: idx_value_source; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX idx_value_source ON public.value_mappings USING btree (source_value);


--
-- Name: attribute_mappings attribute_mappings_scenario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.attribute_mappings
    ADD CONSTRAINT attribute_mappings_scenario_id_fkey FOREIGN KEY (scenario_id) REFERENCES public.mapping_scenarios(id) ON DELETE CASCADE;


--
-- Name: config_entries config_entries_process_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.config_entries
    ADD CONSTRAINT config_entries_process_id_fkey FOREIGN KEY (process_id) REFERENCES public.processes(id) ON DELETE CASCADE;


--
-- Name: mapping_scenarios mapping_scenarios_process_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.mapping_scenarios
    ADD CONSTRAINT mapping_scenarios_process_id_fkey FOREIGN KEY (process_id) REFERENCES public.processes(id) ON DELETE CASCADE;


--
-- Name: processes processes_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.processes
    ADD CONSTRAINT processes_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON DELETE CASCADE;


--
-- Name: projects projects_oem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_oem_id_fkey FOREIGN KEY (oem_id) REFERENCES public.oems(id) ON DELETE CASCADE;


--
-- Name: value_mappings value_mappings_attribute_mapping_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.value_mappings
    ADD CONSTRAINT value_mappings_attribute_mapping_id_fkey FOREIGN KEY (attribute_mapping_id) REFERENCES public.attribute_mappings(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

