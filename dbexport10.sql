--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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
-- Name: Agenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Agenda" (
    id integer NOT NULL,
    "Adresse1_Rdv" character varying,
    "Adresse2_Rdv" character varying,
    "Chemin_de_fichier_joint" character varying,
    "Code_postal_Rdv" character varying,
    "Date_Rdv" character varying,
    "Date_Rdv_annulé" character varying,
    "Heure_début_Rdv" character varying,
    "Heure_fin_Rdv" character varying,
    "Informations_de_suivi_de_Rdv" character varying,
    "Organisateur" integer,
    "Ref_agenda_date" timestamp without time zone,
    "Titre_du_Rdv" character varying,
    "Ville_du_Rdv" character varying,
    client_id integer,
    visibility boolean,
    "Informations_generales" character varying,
    "Informations_reservees_service_planification" character varying
);


ALTER TABLE public."Agenda" OWNER TO postgres;

--
-- Name: Agenda_expert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Agenda_expert" (
    id integer NOT NULL,
    agenda_taken integer,
    "Participant_invité" integer,
    validation boolean,
    visibility boolean
);


ALTER TABLE public."Agenda_expert" OWNER TO postgres;

--
-- Name: Agenda_expert_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Agenda_expert_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Agenda_expert_id_seq" OWNER TO postgres;

--
-- Name: Agenda_expert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Agenda_expert_id_seq" OWNED BY public."Agenda_expert".id;


--
-- Name: Agenda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Agenda_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Agenda_id_seq" OWNER TO postgres;

--
-- Name: Agenda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Agenda_id_seq" OWNED BY public."Agenda".id;


--
-- Name: Client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Client" (
    id integer NOT NULL,
    reference integer,
    "TYPE" character varying,
    societe character varying,
    sexe character varying,
    nom character varying,
    email character varying,
    numero character varying,
    siret character varying,
    date_creation timestamp without time zone,
    visibility boolean
);


ALTER TABLE public."Client" OWNER TO postgres;

--
-- Name: Client_History; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Client_History" (
    id integer NOT NULL,
    client_id integer,
    adresse character varying,
    etat_client boolean,
    cp character varying,
    ville character varying,
    pays character varying,
    abonnement character varying,
    date timestamp without time zone,
    visibility boolean
);


ALTER TABLE public."Client_History" OWNER TO postgres;

--
-- Name: Client_History_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Client_History_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Client_History_id_seq" OWNER TO postgres;

--
-- Name: Client_History_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Client_History_id_seq" OWNED BY public."Client_History".id;


--
-- Name: Client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Client_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Client_id_seq" OWNER TO postgres;

--
-- Name: Client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Client_id_seq" OWNED BY public."Client".id;


--
-- Name: Client_negotiateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Client_negotiateur" (
    id integer NOT NULL,
    client_id integer,
    reference character varying,
    "TYPE" character varying,
    societe character varying,
    sexe character varying,
    nom character varying,
    email character varying,
    numero character varying,
    siret character varying,
    date_creation timestamp without time zone,
    visibility boolean
);


ALTER TABLE public."Client_negotiateur" OWNER TO postgres;

--
-- Name: Client_negotiateur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Client_negotiateur_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Client_negotiateur_id_seq" OWNER TO postgres;

--
-- Name: Client_negotiateur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Client_negotiateur_id_seq" OWNED BY public."Client_negotiateur".id;


--
-- Name: Expert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Expert" (
    id integer NOT NULL,
    sexe character varying,
    nom character varying,
    trigramme character varying,
    "TYPE" character varying,
    date_entree timestamp without time zone,
    siret character varying,
    email character varying,
    email_perso character varying,
    numero character varying,
    code_tva character varying,
    taux_tva character varying,
    password character varying(60),
    visibility boolean
);


ALTER TABLE public."Expert" OWNER TO postgres;

--
-- Name: Expert_History; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Expert_History" (
    id integer NOT NULL,
    expert_id integer,
    actif_parti character varying,
    secteur character varying,
    type_certification character varying,
    date_certification_initiale timestamp without time zone,
    date_renouv_certification timestamp without time zone,
    adresse character varying,
    cp character varying,
    login_backof character varying,
    pwd_backof character varying,
    login_extranet character varying,
    pwd_extranet character varying,
    pwd_gsuite character varying,
    login_google character varying,
    pwd_google character varying,
    ville character varying,
    observations_de_suivi character varying,
    date_sortie timestamp without time zone,
    date timestamp without time zone,
    visibility boolean
);


ALTER TABLE public."Expert_History" OWNER TO postgres;

--
-- Name: Expert_History_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Expert_History_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Expert_History_id_seq" OWNER TO postgres;

--
-- Name: Expert_History_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Expert_History_id_seq" OWNED BY public."Expert_History".id;


--
-- Name: Expert_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Expert_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Expert_id_seq" OWNER TO postgres;

--
-- Name: Expert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Expert_id_seq" OWNED BY public."Expert".id;


--
-- Name: Facturation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Facturation" (
    id integer NOT NULL,
    "Facture_no" integer,
    "Date_" timestamp without time zone NOT NULL,
    "Pays" character varying,
    "Destinataire" integer,
    expediteur integer,
    "Montant" character varying,
    "TVA" character varying,
    "Total" character varying,
    "Type" character varying,
    "Proprietaire" integer,
    "Locataire" integer,
    "Ville" character varying,
    "Surface" character varying,
    "Tarif" character varying,
    "Appt_Pav" character varying,
    "Visibility" boolean
);


ALTER TABLE public."Facturation" OWNER TO postgres;

--
-- Name: Facturation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Facturation_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Facturation_id_seq" OWNER TO postgres;

--
-- Name: Facturation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Facturation_id_seq" OWNED BY public."Facturation".id;


--
-- Name: Mission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Mission" (
    id integer NOT NULL,
    "Reference_BAILLEUR" integer,
    "NRO_FACTURE" character varying,
    "ABONNEMENT" character varying,
    "ID_AS" integer,
    "PRIX_HT_EDL" character varying,
    "DATE_REALISE_EDL" timestamp without time zone,
    "ID_INTERV" integer,
    "Reference_LOCATAIRE" character varying,
    "Adresse1_Bien" character varying,
    "Adresse2_Bien" character varying,
    "CP_Bien" character varying,
    "Ville_Bien" character varying,
    "CA_HT_AS" character varying,
    "TVA_AS" character varying,
    "CA_TTC_AS" character varying,
    "CA_HT_AC" character varying,
    "CA_TTC_AC" character varying,
    "CA_HT_TRUST" character varying,
    "TVA_TRUST" character varying,
    "Date_chiffrage_regle" character varying,
    "Prix_ht_chiffrage" character varying,
    "POURCENTAGE_suiveur_chiffrage" character varying,
    "POURCENTAGE_AS_chiffrage" character varying,
    "POURCENTAGE_manager_chiffrage" character varying,
    "ID_manager_chiffrage" integer,
    "POURCENTAGE_agent_chiffrage" character varying,
    "ID_agent_chiffrage" integer,
    "TYPE_EDL" character varying,
    "DATE_FACTURE" character varying,
    "TITREPROPRIO" character varying,
    "NOMPROPRIO" character varying,
    "DATE_FACT_REGLEE" character varying,
    "TYPE_LOGEMENT" character varying,
    "CODE_AMEXPERT" character varying,
    "COMMENTAIRE_FACTURE" character varying,
    "LOGEMENT_MEUBLE" character varying,
    "CODE_FACTURATION" character varying,
    "TYPE_DE_BIEN" character varying,
    surface_logement1 character varying,
    "Ref_commande" character varying,
    "POURCENTAGE_COM_AS_DU_CLIENT" character varying,
    "ID_Respon_Cell_Dev" integer,
    "POURCENTAGE_Respon_Cell_Dev" character varying,
    "ID_agent_Cell_Dev" integer,
    "POURCENTAGE_Agent_Cell_Dev" character varying,
    "ID_Agent_CellTech" integer,
    "POURCENTAGE_Agent_Cell_Tech" character varying,
    "ID_Respon_Cell_Tech" integer,
    "POURCENTAGE_Respon_Cell_Tech" character varying,
    "ID_Suiveur_Cell_Tech" integer,
    "POURCENTAGE_Suiveur_Cell_Tech" character varying,
    "ID_Respon_Cell_Planif" integer,
    "POURCENTAGE_Respon_Cell_Planif" character varying,
    "ID_Suiveur_Cell_Planif" integer,
    "POURCENTAGE_Suiveur_Cell_Planif" character varying,
    "ID_Agent_saisie_Cell_Planif" integer,
    "POURCENTAGE_Agent_saisie_CEll_planif" character varying,
    "Visibility" boolean
);


ALTER TABLE public."Mission" OWNER TO postgres;

--
-- Name: Mission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Mission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Mission_id_seq" OWNER TO postgres;

--
-- Name: Mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Mission_id_seq" OWNED BY public."Mission".id;


--
-- Name: Negotiateur_History; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Negotiateur_History" (
    id integer NOT NULL,
    negotiateur_id integer,
    adresse character varying,
    etat_client boolean,
    cp character varying,
    ville character varying,
    pays character varying,
    abonnement character varying,
    date timestamp without time zone,
    visibility boolean
);


ALTER TABLE public."Negotiateur_History" OWNER TO postgres;

--
-- Name: Negotiateur_History_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Negotiateur_History_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Negotiateur_History_id_seq" OWNER TO postgres;

--
-- Name: Negotiateur_History_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Negotiateur_History_id_seq" OWNED BY public."Negotiateur_History".id;


--
-- Name: Tarif_base; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tarif_base" (
    id integer NOT NULL,
    maison_appartement character varying,
    "Type" character varying,
    "Prix_EDL" character varying,
    "Prix_Chiffrage" character varying,
    visibility boolean
);


ALTER TABLE public."Tarif_base" OWNER TO postgres;

--
-- Name: Tarif_base_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tarif_base_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tarif_base_id_seq" OWNER TO postgres;

--
-- Name: Tarif_base_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tarif_base_id_seq" OWNED BY public."Tarif_base".id;


--
-- Name: Tarifs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tarifs" (
    id integer NOT NULL,
    reference_client integer,
    edl_prix_std character varying,
    edl_appt_prix_f1 character varying,
    edl_appt_prix_f2 character varying,
    edl_appt_prix_f3 character varying,
    edl_appt_prix_f4 character varying,
    edl_appt_prix_f5 character varying,
    edl_appt_prix_f6 character varying,
    edl_pav_villa_prix_t1 character varying,
    edl_pav_villa_prix_t2 character varying,
    edl_pav_villa_prix_t3 character varying,
    edl_pav_villa_prix_t4 character varying,
    edl_pav_villa_prix_t5 character varying,
    edl_pav_villa_prix_t6 character varying,
    edl_pav_villa_prix_t7 character varying,
    edl_pav_villa_prix_t8 character varying,
    chif_appt_prix_stu character varying,
    chif_appt_prix_f1 character varying,
    chif_appt_prix_f2 character varying,
    chif_appt_prix_f3 character varying,
    chif_appt_prix_f4 character varying,
    chif_appt_prix_f5 character varying,
    chif_pav_villa_prix_t1 character varying,
    chif_pav_villa_prix_t2 character varying,
    chif_pav_villa_prix_t3 character varying,
    chif_pav_villa_prix_t4 character varying,
    chif_pav_villa_prix_t5 character varying,
    chif_pav_villa_prix_t6 character varying,
    chif_pav_villa_prix_t7 character varying,
    chif_pav_villa_prix_t8 character varying,
    code_tva character varying,
    taux_meuble character varying,
    referent_as_client integer,
    com_as_sur_ca_client character varying,
    cell_dev_ref_responsable integer,
    com_cell_dev_ref_responsable character varying,
    cell_dev_ref_agent integer,
    com_cell_dev_ref_agent character varying,
    cell_tech_ref_agent integer,
    "com_cell_tech_Ref_agent" character varying,
    cell_tech_ref_responsable integer,
    com_cell_tech_ref_responsable character varying,
    cell_tech_ref_suiveur integer,
    com_cell_tech_ref_suiveur character varying,
    cell_planif_ref_responsable integer,
    com_cell_planif_ref_responsable character varying,
    cell_planif_ref_suiveur integer,
    com_cell_planif_ref_suiveur character varying,
    cell_planif_ref_agent_saisie integer,
    com_cell_planif_ref_agent_saisie character varying,
    prix_autre character varying,
    commentaire_libre character varying,
    date timestamp without time zone,
    visibility boolean
);


ALTER TABLE public."Tarifs" OWNER TO postgres;

--
-- Name: Tarifs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tarifs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tarifs_id_seq" OWNER TO postgres;

--
-- Name: Tarifs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tarifs_id_seq" OWNED BY public."Tarifs".id;


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: facturation_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facturation_client (
    id integer NOT NULL,
    n_facture character varying,
    client integer,
    "Montant_HT" character varying,
    "Date_de_creation" timestamp without time zone,
    "Date_reglement_client" character varying,
    "Statut" character varying,
    "Observations_suivi_paiement" character varying,
    "Date_première_relance" character varying,
    "Date_seconde_relance" character varying,
    "Date_mise_en_demeure" character varying,
    visibility boolean
);


ALTER TABLE public.facturation_client OWNER TO postgres;

--
-- Name: facturation_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facturation_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facturation_client_id_seq OWNER TO postgres;

--
-- Name: facturation_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facturation_client_id_seq OWNED BY public.facturation_client.id;


--
-- Name: facturation_mission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facturation_mission (
    id integer NOT NULL,
    ref_mission integer,
    fact_mission integer,
    visibility boolean
);


ALTER TABLE public.facturation_mission OWNER TO postgres;

--
-- Name: facturation_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facturation_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facturation_mission_id_seq OWNER TO postgres;

--
-- Name: facturation_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facturation_mission_id_seq OWNED BY public.facturation_mission.id;


--
-- Name: prospect; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prospect (
    id integer NOT NULL,
    reference character varying,
    "TYPE" character varying,
    societe character varying,
    sexe character varying,
    nom character varying,
    email character varying,
    numero character varying,
    siret character varying,
    date_creation timestamp without time zone,
    visibility boolean
);


ALTER TABLE public.prospect OWNER TO postgres;

--
-- Name: prospect_History; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."prospect_History" (
    id integer NOT NULL,
    prospect integer,
    adresse character varying,
    cp character varying,
    ville character varying,
    pays character varying,
    etat_client character varying,
    date timestamp without time zone,
    visibility boolean
);


ALTER TABLE public."prospect_History" OWNER TO postgres;

--
-- Name: prospect_History_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."prospect_History_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."prospect_History_id_seq" OWNER TO postgres;

--
-- Name: prospect_History_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."prospect_History_id_seq" OWNED BY public."prospect_History".id;


--
-- Name: prospect_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prospect_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prospect_id_seq OWNER TO postgres;

--
-- Name: prospect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prospect_id_seq OWNED BY public.prospect.id;


--
-- Name: seq_street_segment_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_street_segment_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_street_segment_id OWNER TO postgres;

--
-- Name: suivi_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suivi_client (
    id integer NOT NULL,
    client integer,
    responsable integer,
    commentaire character varying,
    date_creation timestamp without time zone,
    date_modif timestamp without time zone,
    visibility boolean
);


ALTER TABLE public.suivi_client OWNER TO postgres;

--
-- Name: suivi_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suivi_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suivi_client_id_seq OWNER TO postgres;

--
-- Name: suivi_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suivi_client_id_seq OWNED BY public.suivi_client.id;


--
-- Name: suivi_prospect; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suivi_prospect (
    id integer NOT NULL,
    prospect_id integer,
    responsable integer,
    commentaire character varying,
    date_creation timestamp without time zone,
    date_modif timestamp without time zone,
    visibility boolean
);


ALTER TABLE public.suivi_prospect OWNER TO postgres;

--
-- Name: suivi_prospect_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suivi_prospect_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suivi_prospect_id_seq OWNER TO postgres;

--
-- Name: suivi_prospect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suivi_prospect_id_seq OWNED BY public.suivi_prospect.id;


--
-- Name: Agenda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agenda" ALTER COLUMN id SET DEFAULT nextval('public."Agenda_id_seq"'::regclass);


--
-- Name: Agenda_expert id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agenda_expert" ALTER COLUMN id SET DEFAULT nextval('public."Agenda_expert_id_seq"'::regclass);


--
-- Name: Client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client" ALTER COLUMN id SET DEFAULT nextval('public."Client_id_seq"'::regclass);


--
-- Name: Client_History id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client_History" ALTER COLUMN id SET DEFAULT nextval('public."Client_History_id_seq"'::regclass);


--
-- Name: Client_negotiateur id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client_negotiateur" ALTER COLUMN id SET DEFAULT nextval('public."Client_negotiateur_id_seq"'::regclass);


--
-- Name: Expert id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Expert" ALTER COLUMN id SET DEFAULT nextval('public."Expert_id_seq"'::regclass);


--
-- Name: Expert_History id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Expert_History" ALTER COLUMN id SET DEFAULT nextval('public."Expert_History_id_seq"'::regclass);


--
-- Name: Facturation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturation" ALTER COLUMN id SET DEFAULT nextval('public."Facturation_id_seq"'::regclass);


--
-- Name: Mission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission" ALTER COLUMN id SET DEFAULT nextval('public."Mission_id_seq"'::regclass);


--
-- Name: Negotiateur_History id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Negotiateur_History" ALTER COLUMN id SET DEFAULT nextval('public."Negotiateur_History_id_seq"'::regclass);


--
-- Name: Tarif_base id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarif_base" ALTER COLUMN id SET DEFAULT nextval('public."Tarif_base_id_seq"'::regclass);


--
-- Name: Tarifs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarifs" ALTER COLUMN id SET DEFAULT nextval('public."Tarifs_id_seq"'::regclass);


--
-- Name: facturation_client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturation_client ALTER COLUMN id SET DEFAULT nextval('public.facturation_client_id_seq'::regclass);


--
-- Name: facturation_mission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturation_mission ALTER COLUMN id SET DEFAULT nextval('public.facturation_mission_id_seq'::regclass);


--
-- Name: prospect id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prospect ALTER COLUMN id SET DEFAULT nextval('public.prospect_id_seq'::regclass);


--
-- Name: prospect_History id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."prospect_History" ALTER COLUMN id SET DEFAULT nextval('public."prospect_History_id_seq"'::regclass);


--
-- Name: suivi_client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivi_client ALTER COLUMN id SET DEFAULT nextval('public.suivi_client_id_seq'::regclass);


--
-- Name: suivi_prospect id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivi_prospect ALTER COLUMN id SET DEFAULT nextval('public.suivi_prospect_id_seq'::regclass);


--
-- Data for Name: Agenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Agenda" (id, "Adresse1_Rdv", "Adresse2_Rdv", "Chemin_de_fichier_joint", "Code_postal_Rdv", "Date_Rdv", "Date_Rdv_annulé", "Heure_début_Rdv", "Heure_fin_Rdv", "Informations_de_suivi_de_Rdv", "Organisateur", "Ref_agenda_date", "Titre_du_Rdv", "Ville_du_Rdv", client_id, visibility, "Informations_generales", "Informations_reservees_service_planification") FROM stdin;
\.


--
-- Data for Name: Agenda_expert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Agenda_expert" (id, agenda_taken, "Participant_invité", validation, visibility) FROM stdin;
\.


--
-- Data for Name: Client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Client" (id, reference, "TYPE", societe, sexe, nom, email, numero, siret, date_creation, visibility) FROM stdin;
1	1075491	professionelle	l'adresse anjou maine sarl les 3b 	monsieur	blanvilain sébastien	test@gmail.com	6777650822	22222222222	2021-03-12 18:01:19.503467	t
2	123630	professionelle	l'adresse les herbiers - sarl les herbiers gestion 	monsieur	blavillain et teillol	test@gmail.com	6777650822	22222222222	2021-03-12 18:02:30.317045	t
3	120020	professionelle	l'adresse maison blanche 	monsieur	blanvillain sebastien	test@gmail.com	6777650822	22222222222	2021-03-12 18:02:30.357021	t
4	1270234	professionelle	west immobilier  laforet quimper	monsieur 	le floc'h françois	test@gmail.com	6777650822	22222222222	2021-03-12 18:02:30.406995	t
\.


--
-- Data for Name: Client_History; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Client_History" (id, client_id, adresse, etat_client, cp, ville, pays, abonnement, date, visibility) FROM stdin;
1	1	8  RUE DE LA CLAIE	t	49070.0	BEAUCOUZE		\N	2021-03-12 12:30:55.957067	t
2	2	 48 RUE DU BRANDON	t	85500.0	LES HERBIERS		\N	2021-03-12 12:30:56.009041	t
3	3	50 BOULEVARD FELIX GRAT	t	53000.0	LAVAL		\N	2021-03-12 12:30:56.038021	t
4	4	57 RUE DE BENODET	t	29000.0	QUIMPER		\N	2021-03-12 12:30:56.065005	t
5	5	ADRESSE1 BAILLEUR	t	CP BAILLEUR	VILLE BAILLEUR		\N	2021-03-12 12:46:07.824871	t
6	1	8  RUE DE LA CLAIE	t	49070.0	BEAUCOUZE		\N	2021-03-12 18:01:19.693364	t
7	2	 48 RUE DU BRANDON	t	85500.0	LES HERBIERS		\N	2021-03-12 18:02:30.34503	t
8	3	50 BOULEVARD FELIX GRAT	t	53000.0	LAVAL		\N	2021-03-12 18:02:30.394999	t
9	4	57 RUE DE BENODET	t	29000.0	QUIMPER		\N	2021-03-12 18:02:30.422985	t
\.


--
-- Data for Name: Client_negotiateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Client_negotiateur" (id, client_id, reference, "TYPE", societe, sexe, nom, email, numero, siret, date_creation, visibility) FROM stdin;
1	2	\N	BAILLEUR	Xampp	male	Fabien	fabien2777@gmail.com	22011869	4564646	2021-02-20 16:49:51.513875	t
\.


--
-- Data for Name: Expert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Expert" (id, sexe, nom, trigramme, "TYPE", date_entree, siret, email, email_perso, numero, code_tva, taux_tva, password, visibility) FROM stdin;
0	0	0	\N	0	2021-03-22 08:35:40.227189	\N	0	\N	0	\N	\N	\N	f
8	Mr.	Admin	\N	Admin	2021-03-22 08:35:40.221197	\N	test0001@gmail.com	\N	12345	\N	\N	$2b$12$HqvuoekxJFCleapQbp1ale5Ps3Vy.1vEZlT3iOL.0cEpNC2/bcqRa	f
13	M	amexpert france	AF	Agent de secteur	2011-01-01 00:00:00	\N	France@amexpert.biz	\N	\N		0	\N	t
14	M	andre aude line	AAL	Intervenant de constat	2016-01-01 00:00:00	\N	\N	\N	\N		0	\N	t
15	M	arnaudeau nicolas	NA	Agent de secteur	2015-04-15 00:00:00	811433523	\N	\N	\N		0	\N	t
16	M	atmane ludovic	ALU	Intervenant de constat	2017-12-01 00:00:00	\N	atmane2384@amexpert.biz	\N	\N		0	\N	t
17	M	audit planers		Planing	2021-03-22 08:46:13.968972	\N	\N	\N	\N		\N	\N	t
18	M	conraux eric	EC	Agent de secteur	2013-01-01 00:00:00	\N	conraux6582@amexpert.biz	\N	\N		0	\N	t
19	M	denizot rachel	DRZ	Intervenant de constat	2020-07-16 00:00:00	\N	denizot1995@amexpert.biz	\N	\N		0	\N	t
20	M	detoc tristan	TDT	Agent de planning	2015-10-01 00:00:00	81382411700010	admin@amexpert.biz	\N	\N		0	\N	t
21	M	detoc xavier	XD	Agent de secteur	2010-01-01 00:00:00	\N	detoc4090@amexpert.biz	\N	\N		0	\N	t
22	M	deyris marie laurence	DRL	Intervenant de constat	2019-02-11 00:00:00	\N	\N	\N	\N		\N	\N	t
23	M	drouet genevieve	GDR	Agent de secteur	2017-01-01 00:00:00	827817461	\N	\N	\N	FR01827817461	0	\N	t
24	M	drouet mathieu	DRM	Intervenant de constat	2018-03-01 00:00:00	\N	\N	\N	\N		0	\N	t
25	M	dupe catherine	DPC	Intervenant de constat	2020-07-06 00:00:00	75352647400022	dupe851@Amexpert.biz	monail@mmm.fr	1234567890		0	\N	t
26	M	duranton emmanuel	EDR	Intervenant de constat	2018-06-08 00:00:00	829152701	\N	\N	\N		0	\N	t
27	M	fouchard odile	FDO	Intervenant de constat	2019-03-19 00:00:00	85144502300019	\N	\N	\N		0	\N	t
28	M	froger veronique	VF	Intervenant de constat	2017-06-01 00:00:00	\N	\N	\N	\N		0	\N	t
29	M	gangnat olivier	OGT	Intervenant de constat	2018-08-13 00:00:00	80034246100012	\N	\N	\N		0	\N	t
30	M	guimard herve	GUH	Intervenant de constats	2018-05-01 00:00:00	83436278200015	\N	\N	\N		0	\N	t
31	M	hel alain	AHE	Intervenant de constat	2015-01-01 00:00:00	423267012	\N	\N	\N		0	\N	t
32	M	jullien nadia	JUN	Intervenant de constat	2018-10-02 00:00:00	51448485600028	\N	\N	\N		0	\N	t
33	M	kaki mbeleck faustin	KMF	Intervenant de constat	2020-05-13 00:00:00	82076172400021	kaki258@amexpert.biz	\N	\N		0	\N	t
34	M	kamus bernard	BK	Intervenant de constat	2014-01-01 00:00:00	789851425	kamus3281@amexpert.biz	\N	\N		0	\N	t
35	M	laserre herve	LAH	Intervenant de constat	2018-10-08 00:00:00	\N	\N	\N	\N		0	\N	t
36	M	laude blandine	LBA	Intervenant de constat	2019-08-12 00:00:00	43876287400032	laude4821@amexpert.biz	\N	\N		0	\N	t
37	M	le dreff quentin	QLD	Intervenant de constat	2017-06-01 00:00:00	\N	\N	\N	\N		0	\N	t
38	M	lereste patricia	LEP	Intervenant de constat	2018-04-01 00:00:00	51521854300020	lereste856@amexpert.biz	\N	\N		0	\N	t
39	M	lesne alan	ALS	Agent de secteur	2016-01-01 00:00:00	821942125	lesne6397@amexpert.biz	\N	\N	0	0	\N	t
40	M	lledo luc	EDU	Intervenant de constat	2019-04-27 00:00:00	85268690600011	\N	\N	\N	0	0	\N	t
41	M	mandin christophe	CRM	Agent de secteur	2016-07-01 00:00:00	418391694	\N	\N	\N	0	0	\N	t
42	M	neufcourt pascal	NFP	Intervenant de constat	2019-09-30 00:00:00	85153500500017	\N	\N	\N	0	0	\N	t
43	M	pascaud denis	DPS	Intervenant de constat	2017-03-01 00:00:00	800872301	\N	\N	\N	0	0	\N	t
44	M	pauleau romain	ROM	Intervenant de constat	2017-11-21 00:00:00	78925043800023	\N	\N	\N	0	0	\N	t
45	M	s t - lucas dominique	LUD	Sous-traitant	2018-06-04 00:00:00	80021592300031	\N	\N	\N	0	0	\N	t
46	M	simier matthew	SIM	Intervenant de constat	2018-10-21 00:00:00	844889162	\N	\N	\N	0	0	\N	t
47	M	st  - care thierry	CAT	Sous-traitant	2018-06-04 00:00:00	511571861	\N	\N	\N	0	0	\N	t
48	M	st - calmet isabelle	ICL	Sous-traitant	2018-06-04 00:00:00	831471370	\N	\N	\N	0	0	\N	t
49	M	pzedl1075491	DETOC XAVIER	1075491	2021-03-22 08:50:05.716885	RESIDENCE PICASSO - BATIMENT F	17	\N	\N	\N	34	\N	t
50	M	pzedl127034	DETOC XAVIER	1270234	2021-03-22 08:50:07.028132	\N	30	\N	\N	\N	60	\N	t
51	M	pzedl1270215	DETOC XAVIER	1270215	2021-03-22 08:50:07.980111	\N	17	\N	\N	\N	34	\N	t
52	M	pzedl123630	CONRAUX ERIC	123630	2021-03-22 08:50:08.311919	\N	17	\N	\N	\N	34	\N	t
53	M	pzedl120020	DETOC XAVIER	120020	2021-03-22 08:50:08.644741	RESIDENCE LE PARC SAINT MARTIN	18	\N	\N	\N	36	\N	t
\.


--
-- Data for Name: Expert_History; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Expert_History" (id, expert_id, actif_parti, secteur, type_certification, date_certification_initiale, date_renouv_certification, adresse, cp, login_backof, pwd_backof, login_extranet, pwd_extranet, pwd_gsuite, login_google, pwd_google, ville, observations_de_suivi, date_sortie, date, visibility) FROM stdin;
1	13	\N	France	\N	\N	\N	6 rue du Champe de Montigny	49080	\N	\N	\N	\N	\N	\N	\N	BOUCHEMAINE	\N	\N	2021-03-22 08:46:13.790065	t
2	14	\N	Loir Atlantique	\N	\N	\N	Le Pont Bouvronnais	44130	\N	\N	\N	\N	\N	\N	\N	BOUVRON	\N	\N	2021-03-22 08:46:13.841038	t
3	15	\N	Ille et Vilaine	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	2021-03-22 08:46:13.890007	t
4	16	\N	Maine et Loire	\N	\N	\N	11 Place de Verdun	49700	\N	\N	\N	\N	\N	\N	\N	DOUE LA FONTAINE	\N	\N	2021-03-22 08:46:13.944976	t
5	17	\N	France	\N	\N	\N		\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	2021-03-22 08:46:13.991954	t
6	18	\N	Vendée & Deux Sèvres	\N	\N	\N	16 rue de la Mairie	85210	\N	\N	\N	\N	\N	\N	\N	THIRE	\N	\N	2021-03-22 08:46:14.04592	t
7	19	\N	Maine et Loire	\N	\N	\N	16 rue de la Traquette	49100	\N	\N	\N	\N	\N	\N	\N	ANGERS	\N	\N	2021-03-22 08:46:14.087905	t
8	20	\N	France	\N	\N	\N	23 rue de Belfort	49100	\N	\N	\N	\N	\N	\N	\N	ANGERS	\N	\N	2021-03-22 08:46:14.147866	t
9	21	\N	Maine et Loire	\N	\N	\N	Chemin de la Réauté	49330	\N	\N	\N	\N	\N	\N	\N	LES HAUTS D'ANJOU	\N	\N	2021-03-22 08:46:14.207832	t
10	22	\N	Occitanie	\N	\N	\N	98 Clos de Vic	34110	\N	\N	\N	\N	\N	\N	\N	VIC LA GARDIOLE	\N	\N	2021-03-22 08:46:14.264797	t
11	23	\N	Finistère	\N	\N	\N	320 Route du Douhar Bihan	29470	\N	\N	\N	\N	\N	\N	\N	PLOUGASTEL DAOULAS	\N	\N	2021-03-22 08:46:14.551629	t
12	24	\N	Charente et Charente Maritime	\N	\N	\N	18 rue de la Treille	17430	\N	\N	\N	\N	\N	\N	\N	TONAY CHARENTE	\N	\N	2021-03-22 08:46:14.677557	t
13	25	\N	Loire Atlantique	\N	\N	\N	22 avenue de Jousselin	44300	DUPE CATHERINE	DPC851	AMI0148	hiFaZzAX	\N	dupe851@amexpert.biz	Auc#851&cat	NANTES	\N	\N	2021-03-22 08:46:14.728526	t
14	26	\N	Maine et Loire	\N	\N	\N	7 Mail Claude Debussy	49125	\N	\N	\N	\N	\N	\N	\N	TIERCE	\N	\N	2021-03-22 08:46:14.785497	t
15	27	\N	Maine et Loire	\N	\N	\N	38 rue du Vallon	49000	\N	\N	\N	\N	\N	\N	\N	ANGERS	\N	\N	2021-03-22 08:46:14.841467	t
16	28	\N	Maine et Loire	\N	\N	\N	20 rue des Ardrières	49100	\N	\N	\N	\N	\N	\N	\N	ANGERS	\N	\N	2021-03-22 08:46:14.907429	t
17	29	\N	Maine et Loire	\N	\N	\N	41 rue Lucien Béjeau	49100	\N	\N	\N	\N	\N	\N	\N	ANGERS	\N	\N	2021-03-22 08:46:14.956395	t
18	30	\N	Loir et Cher - Loiret	\N	\N	\N	10 rue Ulysse Fleury	41350	\N	\N	\N	\N	\N	\N	\N	VINEUIL	\N	\N	2021-03-22 08:46:15.084325	t
19	31	\N	Maine et Loire	\N	\N	\N	9 rue de la Gourmette	49000	\N	\N	\N	\N	\N	\N	\N	ECOUFLANT	\N	\N	2021-03-22 08:46:15.1323	t
20	32	\N	Maine et Loire	\N	\N	\N	21 rue Armand Broosse	49610	\N	\N	\N	\N	\N	\N	\N	SAINT MELAINE SUR AUBANCE	\N	\N	2021-03-22 08:46:15.185269	t
21	33	\N	Ile de France	\N	\N	\N	28 Place de l'An 2000	77380	\N	\N	\N	\N	\N	\N	\N	COBS LA VILLE	\N	\N	2021-03-22 08:46:15.227241	t
22	34	\N	Charente et Charente Maritime	\N	\N	\N	34 rue des Platanes	17220	\N	\N	\N	\N	\N	\N	\N	SAINT ROGATIEN	\N	\N	2021-03-22 08:46:15.289207	t
23	35	\N	Maine et Loire	\N	\N	\N	26 rue Marcel Pajotin	49000	\N	\N	\N	\N	\N	\N	\N	ANGERS	\N	\N	2021-03-22 08:46:15.331192	t
24	36	\N	Pays de la Loire	\N	\N	\N	2 Lieu dit Saint Jean	85190	\N	\N	\N	\N	\N	\N	\N	VENANSAULT	\N	\N	2021-03-22 08:46:15.383151	t
25	37	\N	Finistère	\N	\N	\N	5 rue de la Montagne	29200	\N	\N	\N	\N	\N	\N	\N	BREST	\N	\N	2021-03-22 08:47:41.351024	t
26	38	\N	Sarthe Mayenne	\N	\N	\N	24 rue de la Fenaison	53810	\N	\N	\N	\N	\N	\N	\N	CHANGE	\N	\N	2021-03-22 08:47:41.394007	t
27	39	\N	Gironde Ouest	\N	\N	\N	3 LA Garenne	33820	\N	\N	\N	\N	\N	\N	\N	BRAUD ET SAINT LOUIS	\N	\N	2021-03-22 08:47:41.437972	t
28	40	\N	Vendée - Deux Sèvres	\N	\N	\N	149 rue Mazeau	85440	\N	\N	\N	\N	\N	\N	\N	TALMONT SAINT HILAIRE	\N	\N	2021-03-22 08:47:41.65585	t
29	41	\N	Loire Atlantique Nord	\N	\N	\N	30 rue de l'Epeau	44470	\N	\N	\N	\N	\N	\N	\N	CARQUEFOU	\N	\N	2021-03-22 08:47:41.704819	t
30	42	\N	BRETAGNE	\N	\N	\N	10 rue Alain Gerbault	35590	\N	\N	\N	\N	\N	\N	\N	L'HERMITAGE	\N	\N	2021-03-22 08:47:41.763785	t
31	43	\N	Maine et Loire	\N	\N	\N	1 rue du Petit Sigogne	49320	\N	\N	\N	\N	\N	\N	\N	CHEMELIER	Procédure juridique en cours	\N	2021-03-22 08:47:41.816754	t
32	44	\N	Maine et Loire	\N	\N	\N	63 Boulevard Henri Dunant	49100	\N	\N	\N	\N	\N	\N	\N	ANGERS	\N	\N	2021-03-22 08:47:41.87273	t
33	45	\N	Charente et Charente Maritime	\N	\N	\N	16 rue du Port	17340	\N	\N	\N	\N	\N	\N	\N	YVES	\N	\N	2021-03-22 08:47:41.9277	t
34	46	\N	Ile de France	\N	\N	\N	8 rue de la Poste	94210	\N	\N	\N	\N	\N	\N	\N	SAINT MAURE DES FOSSES	\N	\N	2021-03-22 08:47:41.983661	t
35	47	\N	Ile de France	\N	\N	\N	22 rue du Rhin	78180	\N	\N	\N	\N	\N	\N	\N	MONTIGNY LE BRETONNEUX	\N	\N	2021-03-22 08:47:42.046626	t
36	48	\N	Loir Atlantique	\N	\N	\N	5 Allée de la Reine Margot	44000	\N	\N	\N	\N	\N	\N	\N	NANTES	\N	\N	2021-03-22 08:47:42.091596	t
37	49	\N	22278	\N	\N	\N	49800	25.5	2020-11-05 00:00:00	21.25	0.05	KAMUS BERNARD	\N	0.4	CONRAUX ERIC	\N	\N	\N	2021-03-22 08:50:05.758874	t
38	50	\N	22344	\N	\N	\N	29790	45	2020-12-03 00:00:00	35	0.05	KAMUS BERNARD	\N	0.4	DETOC XAVIER	\N	\N	\N	2021-03-22 08:50:07.773706	t
39	51	\N	22228	\N	\N	\N	44300	25.5	2020-11-05 00:00:00	21.25	0.05	KAMUS BERNARD	\N	0.4	MANDIN CHRISTOPHE	\N	\N	\N	2021-03-22 08:50:08.03808	t
40	52	\N	22279	\N	\N	\N	85500	25.5	2020-11-12 00:00:00	21.25	0.05	KAMUS BERNARD	\N	0.4	CONRAUX ERIC	\N	\N	\N	2021-03-22 08:50:08.378879	t
41	53	\N	22280	\N	\N	\N	53000	27	2020-11-03 00:00:00	22.5	0.05	KAMUS BERNARD	\N	0.4	MANDIN CHRISTOPHE	\N	\N	\N	2021-03-22 08:50:08.71469	t
\.


--
-- Data for Name: Facturation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Facturation" (id, "Facture_no", "Date_", "Pays", "Destinataire", expediteur, "Montant", "TVA", "Total", "Type", "Proprietaire", "Locataire", "Ville", "Surface", "Tarif", "Appt_Pav", "Visibility") FROM stdin;
\.


--
-- Data for Name: Mission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Mission" (id, "Reference_BAILLEUR", "NRO_FACTURE", "ABONNEMENT", "ID_AS", "PRIX_HT_EDL", "DATE_REALISE_EDL", "ID_INTERV", "Reference_LOCATAIRE", "Adresse1_Bien", "Adresse2_Bien", "CP_Bien", "Ville_Bien", "CA_HT_AS", "TVA_AS", "CA_TTC_AS", "CA_HT_AC", "CA_TTC_AC", "CA_HT_TRUST", "TVA_TRUST", "Date_chiffrage_regle", "Prix_ht_chiffrage", "POURCENTAGE_suiveur_chiffrage", "POURCENTAGE_AS_chiffrage", "POURCENTAGE_manager_chiffrage", "ID_manager_chiffrage", "POURCENTAGE_agent_chiffrage", "ID_agent_chiffrage", "TYPE_EDL", "DATE_FACTURE", "TITREPROPRIO", "NOMPROPRIO", "DATE_FACT_REGLEE", "TYPE_LOGEMENT", "CODE_AMEXPERT", "COMMENTAIRE_FACTURE", "LOGEMENT_MEUBLE", "CODE_FACTURATION", "TYPE_DE_BIEN", surface_logement1, "Ref_commande", "POURCENTAGE_COM_AS_DU_CLIENT", "ID_Respon_Cell_Dev", "POURCENTAGE_Respon_Cell_Dev", "ID_agent_Cell_Dev", "POURCENTAGE_Agent_Cell_Dev", "ID_Agent_CellTech", "POURCENTAGE_Agent_Cell_Tech", "ID_Respon_Cell_Tech", "POURCENTAGE_Respon_Cell_Tech", "ID_Suiveur_Cell_Tech", "POURCENTAGE_Suiveur_Cell_Tech", "ID_Respon_Cell_Planif", "POURCENTAGE_Respon_Cell_Planif", "ID_Suiveur_Cell_Planif", "POURCENTAGE_Suiveur_Cell_Planif", "ID_Agent_saisie_Cell_Planif", "POURCENTAGE_Agent_saisie_CEll_planif", "Visibility") FROM stdin;
1	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-01 00:00:00	16	60596	44 PIERRE MENDES FRANCE	RESIDENCE PICASSO - BATIMENT F	49800	TRELAZE	25.5	\N	\N	34	\N	17	\N	2020-11-05 00:00:00	21.25	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	GALINIER LAURENT et MURIEL	2020-11-05 00:00:00	APPT-F2	2926	\N	NON	TN100 APPT F2	APPT	43.82	18040	0.15	41	0.01	41	0.04	34	0.01	18	0.01	39	0.03	39	0.01	39	0.02	39	0.02	t
2	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-02 00:00:00	16	76675	22 RUE LOUIS MORON	\N	49320	BRISSAC QUINCE	27	\N	\N	36	\N	18	\N	2020-11-05 00:00:00	22.5	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	MORTIER ROBERT	2020-11-05 00:00:00	APPT-F3	18656	\N	NON	TN100	APPT	62	18386	0.15	41	0.01	39	0.04	34	0.01	18	0.01	39	0.03	39	0.01	0	0.02	0	0.02	t
3	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-02 00:00:00	16	80580	27 RUE BOUGERE	RESIDENCE BOUGERE AUDUSSON	49000	ANGERS	30	\N	\N	40	\N	20	\N	2020-11-05 00:00:00	25	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	DERRIEN RONAN	2020-11-05 00:00:00	APPT-F4	4979	\N	NON	TN100	PAV	75	S18539-E19678	0.15	41	0.01	21	0.04	34	0.01	18	0.01	21	0.03	39	0.01	20	0.02	20	0.02	t
4	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-05 00:00:00	16	85001	2 GRANDE RUE	 	49330	CHATEAUNEUF SUR SARTHE	38.25	\N	\N	51	\N	25.5	\N	2020-11-05 00:00:00	31.875	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	DAINVAUX DENISE DAINVAUX CLAUDE	2020-11-05 00:00:00	APPT-F2 M	10456	\N	OUI	TN150	APPT	37	S19263-E19494	0.15	41	0.01	26	0.04	34	0.01	18	0.01	26	0.03	39	0.01	20	0.02	20	0.02	t
5	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-06 00:00:00	16	109835	18 RUE DES LAVANDIERES	\N	49320	GREZILLE	35.4	\N	\N	47.2	\N	23.6	\N	2020-11-05 00:00:00	29.5	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	SCI MOREAU LA CHAPELLE 	2020-11-05 00:00:00	PAV-T3	8254	\N	NON	TN100 PAV T3 	PAV	90	18952	0.15	41	0.01	26	0.04	34	0.01	18	0.04	26	0.03	39	0.01	20	0.02	20	0.02	t
6	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-06 00:00:00	16	80323	8  RUE GUSTAVE MAREAU	\N	49000	ANGERS	27	\N	\N	36	\N	18	\N	2020-11-05 00:00:00	22.5	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	DAUDIN GUILLAUME	2020-11-05 00:00:00	APPT-F3	13958	\N	NON	TN100 APPT F3	APPARTEMENT	64.82	S18362-E19694	0.15	41	0.01	0	0.04	34	0.01	18	0.01	0	0.03	39	0.01	39	0.02	39	0.02	t
7	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-08 00:00:00	16	103258	325 ROUTE DE LA PRIOULERE	\N	49140	BAUNE	54	\N	\N	72	\N	36	\N	2020-11-05 00:00:00	45	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	RICHARD JEAN LOUIS	2020-11-05 00:00:00	PAV-T5	2481	\N	NON	TN100	PAV	110	S18531-E19044	0.15	21	0.01	26	0.04	34	0.01	18	0.01	26	0.03	39	0.01	20	0.02	20	0.02	t
8	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-09 00:00:00	16	71206	28 BOULEVARD DU GENERAL DE GAULLE	\N	49100	ANGERS	24	\N	\N	32	\N	16	\N	2020-11-05 00:00:00	20	0	0.25	0.05	34	0.4	41	Sortant	\N	\N	SA LA CHATELAINE MASSIN LE GOFF GUY	2020-11-05 00:00:00	APPT-F1	3620	\N	NON	TN100 APPT F1	APPT	39	19387	0.15	41	0.01	0	0.04	34	0.01	18	0.01	0	0.03	39	0.01	39	0.02	39	0.02	t
9	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-10 00:00:00	16	109657	23 BOULEVARD JEAN MOULIN	\N	49000	ANGERS	25.5	\N	\N	34	\N	17	\N	2020-11-05 00:00:00	21.25	0	0.25	0.05	34	0.4	41	Sortant	\N	\N	CANCELIER BRIAND - EVE MARIE	2020-11-05 00:00:00	APPT-F2	3196	\N	NON	TN100 APPT F2	APPARTEMENT	42.34	18794	0.15	41	0.01	41	0.04	34	0.01	18	0.01	18	0.03	39	0.01	39	0.02	39	0.02	t
10	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-14 00:00:00	16	6303	1  RUE DE LA BELLE ANGEVINE	\N	49750	SAINT LAMBERT DU LATTAY	27	\N	\N	36	\N	18	\N	2020-11-05 00:00:00	22.5	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	FLORES PATRICK	2020-11-05 00:00:00	APPT-F3	2220	\N	NON	TN100 APPT F3	APPARTEMENT	70	19376	0.15	41	0.01	34	0.04	18	0.01	18	0.01	34	0.03	39	0.01	20	0.02	20	0.02	t
11	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-15 00:00:00	16	101418	23 DU ROCHER	\N	49500	LOUVAINES	45	\N	\N	60	\N	30	\N	2020-11-05 00:00:00	37.5	0	0.25	0.05	34	0.4	41	Sortant	\N	\N	FAMILY MME/MR MAUBOUSIN	2020-11-05 00:00:00	PAV-T4	7863	\N	NON	TN100 PAV T4	PAVILLON	83	S18545-E19607	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
12	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-16 00:00:00	16	100991	33 RUE BOISNET	A GAUCHE 1 PORTE DROITE	49100	ANGERS	24	\N	\N	32	\N	16	\N	2020-11-05 00:00:00	20	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	LEMARCHAND LUC	2020-11-05 00:00:00	APPT-F1	17584	\N	NON	TN100	APPT	22	S19402-E19945	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
13	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-22 00:00:00	16	60702	4 AVENUE VAUBAN	RESIDENCE LE PRESTRE	49000	ANGERS	25.5	\N	\N	34	\N	17	\N	2020-11-05 00:00:00	21.25	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	GLANDAIS - 81400 JEAN PHILIPPE ; 4493 - GLANDAIS 	2020-11-05 00:00:00	APPT-F2	4493	\N	NON	TN100	APPT	46	19849	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
14	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-22 00:00:00	16	77158	3 DES CHARMES	\N	49370	LE LOUROUX BECONNAIS	45	\N	\N	60	\N	30	\N	2020-11-05 00:00:00	37.5	0	0.25	0.05	34	0.4	41	Sortant	\N	\N	DYVRANDE PATRICK ET MARTINE	2020-11-05 00:00:00	PAV-T4	5867	\N	NON	TN100 PAV T4	PAVILLON	91.12	S18550-E19771	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
15	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-27 00:00:00	16	110413	131 AVENUE RENE GASNIER	\N	49100	ANGERS	45	\N	\N	60	\N	30	\N	2020-11-05 00:00:00	37.5	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	AUGER STEPHANE	2020-11-05 00:00:00	PAV-T4	24920	\N	NON	TN100 PAV T4	PAVILLON	70	19727	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
16	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-29 00:00:00	16	110472	47 RUE DES ARENES	\N	49700	DOUE LA FONTAINE	27	\N	\N	36	\N	18	\N	2020-11-05 00:00:00	22.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	ZOE IMMO SCI BERNARD ANTHONY	2020-11-05 00:00:00	APPT-F3	24936	\N	NON	TN100 APPT F3	APPARTEMENT	59.50	18838	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
17	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-29 00:00:00	16	98016	12 RUE DE LA CROIX VERTE	\N	49620	CORNE	57	\N	\N	76	\N	38	\N	2020-11-05 00:00:00	47.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	DUREAU GILLES	2020-11-05 00:00:00	PAV-T6	9283	\N	NON	TN100 PAV T6	PAVILLON	138	S18819-E19204	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
18	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-30 00:00:00	16	73601	34 AVENUE DE LA BLANCHERAIE	LE CLAIR LOGIS	49100	ANGERS	24	\N	\N	32	\N	16	\N	2020-11-05 00:00:00	20	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	LE VRAUX  DENIS	2020-11-05 00:00:00	APPT-F1	3344	\N	NON	TN100 APPT F1	APPARTEMENT	30	S19864-E19994	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
19	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-30 00:00:00	16	110540	2 IMPASSE DU BILLOUARD	\N	49250	BEAUFORT EN VALLEE	35.4	\N	\N	47.2	\N	23.6	\N	2020-11-05 00:00:00	29.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	GAUTREAU 	2020-11-05 00:00:00	PAV-T3	15969	\N	NON	TN100 PAV T3 	APPARTEMENT	61	19746	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
20	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-31 00:00:00	16	102599	 IMPASSE DE LA BOULAYE	\N	49320	BRISSAC	27	\N	\N	36	\N	18	\N	2020-11-05 00:00:00	22.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	LA BOULAYE 	2020-11-05 00:00:00	APPT-F3	23540	\N	NON	TN100 APPT F3	APPARTEMENT	48	S18795-E19013	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
21	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-31 00:00:00	16	110607	5 ALLEE DES BARRIERES	\N	49750	BEAULIEU SUR LAYON	54	\N	\N	72	\N	36	\N	2020-11-05 00:00:00	45	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	TESNIER 	2020-11-05 00:00:00	PAV-T5	3768	\N	NON	TN100 PAV T5	PAV	130	S19356-E19478	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
22	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-02 00:00:00	16	79066	18 VILLAGE DE L'AUNAY	\N	49370	LE LOUROUX BECONNAIS	35.4	\N	\N	47.2	\N	23.6	\N	2020-12-10 00:00:00	29.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	TRAVADON 	2020-12-10 00:00:00	PAV-T3	5882	\N	NON	TN100 PAV T3 	PAVILLON	88	18866	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
23	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-02 00:00:00	16	110662	46 RUE JEAN JAURES	\N	49000	ANGERS	35.4	\N	\N	47.2	\N	23.6	\N	2020-12-10 00:00:00	29.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	LAMBRUN GERARD	2020-12-10 00:00:00	PAV-T3	24964	\N	NON	TN100 PAV T3 	PAVILLON	63	S19217-E19792	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
24	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-02 00:00:00	16	90781	25 RUE SAINT NICOLAS	RESIDENCE LE RONCERAY	49100	ANGERS	25.5	\N	\N	34	\N	17	\N	2020-12-10 00:00:00	21.25	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	 62897 - DU FONTENIOUX Marie Dominique	2020-12-10 00:00:00	APPT-F2	24982	\N	NON	TN100 APPT F2	APPARTEMENT	52;64	18985	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
25	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-03 00:00:00	16	60701	3 ALLEE DE VIENNE	\N	49460	MONTREUIL JUIGNE	45	\N	\N	60	\N	30	\N	2020-12-10 00:00:00	37.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	DEMAS BERNARD - CLAUDE	2020-12-10 00:00:00	PAV-T4	6442	\N	NON	TN100 PAV T5	PAV	104	20055	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
26	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-03 00:00:00	16	110743	31 RUE DU HAUT CHEMIN	\N	49800	LA BOHALLE	45	\N	\N	60	\N	30	\N	2020-12-10 00:00:00	37.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	GERMAIN MARIE FRANCE	2020-12-10 00:00:00	PAV-T4	24986	\N	NON	TN100 PAV T4	PAVILLON	70	19983	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
27	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-04 00:00:00	16	80010	 LA BOUGRIE	\N	49380	CHAMP SUR LAYON	35.4	\N	\N	47.2	\N	23.6	\N	2020-12-10 00:00:00	29.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	DERUSSE LUCIE	2020-12-10 00:00:00	PAV-T3	11359	\N	NON	TN100 PAV T3 	PAV	60	S18897-E19539	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
28	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-05 00:00:00	16	59282	17  RUE NOTRE DAME	\N	49260	LE PUY NOTRE DAME	27	\N	\N	36	\N	18	\N	2020-12-10 00:00:00	0	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	GC FONCIER INVESTISSEMENT CASSIN AMBROISE	2020-12-10 00:00:00	APPT-F3	6331	\N	NON	TN100	APPT	79	S18665	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
29	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-06 00:00:00	16	71165	2 SQUARE DES HAUTS DE FOLIETE	\N	49610	MURS ERIGNE	54	\N	\N	72	\N	36	\N	2020-12-10 00:00:00	45	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	THIBAULT Marc et Anne-Marie	2020-12-10 00:00:00	PAV-T5	17625	\N	NON	TN100 PAV T5	PAVILLON	121	19222	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
30	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-09 00:00:00	16	101857	170 DE LA POIRIERE	LE MAUNIT	49320	CHEMELIER	35.4	\N	\N	47.2	\N	23.6	\N	2020-12-10 00:00:00	29.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	LEBRETON ROLAND	2020-12-10 00:00:00	PAV-T3	6430	\N	NON	TN100	PAV	72	18988	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
31	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-09 00:00:00	16	68228	2 PLACE DU PRIEURE	\N	49320	SAINT SATURNIN SUR LOIRE	45	\N	\N	60	\N	30	\N	2020-12-10 00:00:00	37.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	PEDRON ET STICH NOËL ET MICHELLE	2020-12-10 00:00:00	PAV-T4	3169	\N	NON	TN100 PAV T4	PAV	84	18987	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
32	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-09 00:00:00	16	110860	58 ROUTE D'ANGERS	\N	49370	BECON LES GRANITS	35.4	\N	\N	47.2	\N	23.6	\N	2020-12-10 00:00:00	29.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	TOUCHET 81681 PIERRETTE	2020-12-10 00:00:00	PAV-T3	25006	\N	NON	TN100 PAV T3 	PAVILLON	65	20164	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
33	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-12 00:00:00	16	70624	14 ALLEE DES SOURCES	LIEU DIT PORAGE	49640	DAUMERAY	54	\N	\N	72	\N	36	\N	2020-12-10 00:00:00	45	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	BONNAVENTURE MICHAEL	2020-12-10 00:00:00	PAV-T5	6922	\N	NON	TN100 PAV T5	PAVILLON	104	19979	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
34	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-13 00:00:00	16	59100	 5 RUE DU DOLMEN	\N	49320	SAULGE L'HOPITAL	0	\N	\N	0	\N	0	\N	2020-12-10 00:00:00	45	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	DIARD LILIANE	2020-12-10 00:00:00	PAV-T5	10720	non-conformité / Rémunération art-5	NON	TN100 PAV T5	PAV	91	19972	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
35	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-19 00:00:00	16	45244	1 RUE ALPHONSE COCHARD	\N	49220	LE LION D'ANGERS	45	\N	\N	60	\N	30	\N	2020-12-10 00:00:00	37.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	BERNARD MICHEL et PAULETTE	2020-12-10 00:00:00	PAV-T4	1367	\N	NON	TN100 PAV T4	PAVILLON	114	19157	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
36	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-19 00:00:00	16	110436	14 RUE JACQUES IBER	\N	49000	ANGERS	27	\N	\N	36	\N	18	\N	2020-12-10 00:00:00	22.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	HANSEN PERRINE	2020-12-10 00:00:00	APPT-F3	18380	\N	NON	TN100 APPT F3	APPARTEMENT	68	19159	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
37	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-25 00:00:00	16	111110	 Lieu dit L'HERMITAGE	En sortant de Bécon les Granit à gauche	49370	BECON LES GRANITS	29.4	\N	\N	39.2	\N	19.6	\N	2020-12-10 00:00:00	24.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	MARION MADELEINE	2020-12-10 00:00:00	PAV-T2	2930	\N	NON	TN100 PAV T2	PAVILLON	37	20174	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
38	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-30 00:00:00	16	84165	20 BEAUDRU DE VAUBRUN	\N	49170	ST  GEORGES SUR LOIRE	54	\N	\N	72	\N	36	\N	2020-12-10 00:00:00	45	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	BOUGET Joseph et Marie-Thérèse	2020-12-10 00:00:00	PAV-T5	4921	\N	NON	TN100 PAV T5	PAVILLON	110	S18940-E20196	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
39	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-30 00:00:00	16	80929	33BIS RUE DU MARAIS	\N	49290	CHALONNES SUR LOIRE	27	\N	\N	36	\N	18	\N	2020-12-10 00:00:00	22.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	KINEDIET- CALONNA BLANC	2020-12-10 00:00:00	APPT-F3	18671	\N	NON	TN100	APPT	58.75	20194	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
40	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-30 00:00:00	16	27862	83 BOULEVARD ALBERT CAMUS	RESIDENCE LA GARENNE	49000	ANGERS	25.5	\N	\N	34	\N	17	\N	2020-12-10 00:00:00	21.25	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	SACKSTEDER FABIEN	2020-12-10 00:00:00	APPT-F2	5302	\N	NON	TN100 APPT F2	APPARTEMENT	61	S29575-E20034	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
41	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-30 00:00:00	16	71416	47 RUE DES ARENES	\N	49700	DOUE LA FONTAINE	25.5	\N	\N	34	\N	17	\N	2020-12-10 00:00:00	21.25	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	ZOE IMMOBILIER 	2020-12-10 00:00:00	APPT-F2	1438	\N	NON	TN100 APPT F2	APPARTEMENT	23	20350	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
42	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-02 00:00:00	19	89446	2 CHARLES DE GAULLE	RESIDENCE LES TILLEULS	49330	CONTIGNE	27	\N	\N	36	\N	18	\N	2020-11-05 00:00:00	22.5	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	M3S49 	2020-11-05 00:00:00	APPT TYPE F3	3876	\N	NON	TN100 APPT F3	APPT	64.92	19544	0.15	41	0.01	18	0.04	34	0.01	18	0.01	18	0.03	39	0.01	20	0.02	20	0.02	t
43	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-10 00:00:00	19	97152	2 DE LA FONTAINE	\N	49220	GREZ NEUVILLE	25.5	\N	\N	34	\N	17	\N	2020-11-05 00:00:00	21.25	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	GILARD THIERRY	2020-11-05 00:00:00	APPT-F2	1436	\N	NON	TN100 APPT F2	APPT	30.4	19489	0.15	41	0.01	21	0.04	34	0.01	18	0.01	18	0.03	39	0.01	20	0.02	20	0.02	t
44	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-14 00:00:00	19	84096	3 IMPASSE DES HIRONDELLES	\N	49140	BAUNE	29.4	\N	\N	39.2	\N	19.6	\N	2020-11-05 00:00:00	0	0	0.25	0.05	34	0.4	41	Sortant	\N	\N	FORGET LUDOVIC	2020-11-05 00:00:00	T2	10206	\N	NON	TN100 PAV T2	PAV	33.44	19726	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
45	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-21 00:00:00	19	61913	175 DE LA REPUBLIQUE	Rés.Pablo Picasso bat K	49800	TRELAZE	25.5	\N	\N	34	\N	17	\N	2020-11-05 00:00:00	21.25	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	LEOCAT MORGAN	2020-11-05 00:00:00	APPT-F2	1484	\N	NON	TN100	APPT	38.49	19310	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
46	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-22 00:00:00	19	110293	20 RUE THIERS	RESIDENCE COTE MAINE	49100	ANGERS	27	\N	\N	36	\N	18	\N	2020-11-05 00:00:00	22.5	0	0.25	0.05	34	0.4	41	Sortant	\N	\N	MARTORELL GERARD	2020-11-05 00:00:00	APPT TYPE F3	10519	\N	NON	TN100	APPT	71.45	19706	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
47	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-23 00:00:00	19	110298	 12 ALLEE GEORGES POMPIDOU	LES TERRASSES DE L'ABBAYE	49100	ANGERS	27	\N	\N	36	\N	18	\N	2020-11-05 00:00:00	22.5	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	LA CALANDRE 	2020-11-05 00:00:00	APPT TYPE F3	2692	\N	NON	TN100	APPARTEMENT	18	18718	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
48	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-28 00:00:00	19	110432	8 RUE DES FORGES	\N	49500	SEGRE EN ANJOU	45	\N	\N	60	\N	30	\N	2020-11-05 00:00:00	37.5	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	GRAVELEAU CEDRIC	2020-11-05 00:00:00	PAV-T4	24926	\N	NON	TN100 PAV T4	PAVILLON	89.65	19859	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
49	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-28 00:00:00	19	4165	31  RUE ERNEST RENAN	RESIDENCE LES TERRASSES DE L'OUDON	49500	SEGRE	25.5	\N	\N	34	\N	17	\N	2020-11-05 00:00:00	21.25	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	BJCSF BOYER SEBASTIEN	2020-11-05 00:00:00	APPT TYPE F2	2050	\N	NON	TN100	APPT	\N	S18904-E19904	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
50	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-30 00:00:00	19	110536	71  GRANDE RUE	\N	49440	CHALLAIN LA POTHERIE	35.4	\N	\N	47.2	\N	23.6	\N	2020-11-05 00:00:00	29.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	HELLEISEN 	2020-11-05 00:00:00	PAV-T3	9937	\N	NON	TN100 PAV T3 	PAVILLON	71	18849	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
51	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-30 00:00:00	19	89679	49 ALLEE DE BEAU SOLEIL	\N	49460	FENEU	45	\N	\N	60	\N	30	\N	2020-11-05 00:00:00	37.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	RABOUIN MARYSE	2020-11-05 00:00:00	PAV-T4	8922	\N	NON	TN100 PAV T4	PAVILLON	76	S19549-E19551	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
52	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-31 00:00:00	19	101559	2 bis RUE DU LION D'OR	\N	49290	CHALONNES SUR LOIRE	38.25	\N	\N	51	\N	25.5	\N	2020-11-05 00:00:00	31.875	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	VERRON MAURICE	2020-11-05 00:00:00	APPT-F2	23124	\N	OUI	TN150 APPT F3M	APPARTEMENT	81.66	19731	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
53	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-31 00:00:00	19	61198	1 PASSAGE DES POELIERS	\N	49100	ANGERS	27	\N	\N	36	\N	18	\N	2020-11-05 00:00:00	22.5	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	HAZARD AUDE	2020-11-05 00:00:00	APPT-F3	5154	\N	NON	TN100	APPT	53.38	S18719-E19564	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
54	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-02 00:00:00	19	77474	2 CHEMIN DE LA CIGALE	\N	49330	CHATEAUNEUF SUR SARTHE	25.5	\N	\N	34	\N	17	\N	2020-12-10 00:00:00	21.25	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	PREAUBERT PHILIPPE et FRANCETTE	2020-12-10 00:00:00	APPT TYPE F2	8257	\N	NON	TN100	APPARTEMENT	45.54	18873	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
55	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-14 00:00:00	19	80029	12 RUE BOTANIQUE	2 ème étage porte de droite	49100	ANGERS	25.5	\N	\N	34	\N	17	\N	2020-12-10 00:00:00	21.25	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	SCI VIAXAR M. ET MME MASSIN LE GOFF	2020-12-10 00:00:00	APPT TYPE F2	2690	\N	NON	TN100 APPT F2	APPARTEMENT	40	S20176-E20224	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
56	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-25 00:00:00	19	111111	5  RUE NATIONALE	\N	49170	SAINT GEORGES SUR LOIRE	25.5	\N	\N	34	\N	17	\N	2020-12-10 00:00:00	21.25	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	THOUIN ALAIN ET NATHALIE	2020-12-10 00:00:00	APPT TYPE F2	6299	\N	NON	TN100	APPT	NON	20092	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
57	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-26 00:00:00	19	101610	8  LOT LES VALONS DU LOIR	\N	49430	BARACE	35.4	\N	\N	47.2	\N	23.6	\N	2020-12-10 00:00:00	29.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	FOUQUERON DELALANDE JACKY-ISABELLE	2020-12-10 00:00:00	PAV-T3	9654	\N	NON	TN100	PAV	75	19371	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
58	4	\N	PZEDL127034	21	PZEDL127034	2020-11-04 00:00:00	21	110763	 KERHUELLA	\N	29790	MAHALON	45	\N	\N	60	\N	30	\N	2020-12-03 00:00:00	35	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	QUERE Georgette	2020-12-03 00:00:00	PAV-T4	24988	\N	NON	TN100 PAV T4	PAVILLON	80	19826	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
59	4	\N	PZEDL127034	21	PZEDL127034	2020-11-20 00:00:00	21	111065	21 RESIDENCE LES JARDINS DE KERYON	\N	29170	FOUESNANT	39	\N	\N	52	\N	26	\N	2020-12-03 00:00:00	35	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	FABBRIZIOLI Roland et Christine	2020-12-03 00:00:00	PAV-T3	25045	\N	NON	TN100 PAV T3 	PAVILLON	69.25	S20162 E20163	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
60	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-30 00:00:00	21	77560	33 33 RUE SAINT EXUPERY	\N	49100	ANGERS	25.5	\N	\N	34	\N	17	\N	2020-11-05 00:00:00	21.25	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	 FOURREAU James et Odile	2020-11-05 00:00:00	APPT TYPE F2	6716	\N	NON	TN100 APPT F1	APPARTEMENT	24	18887	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
61	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-03 00:00:00	21	99095	2 RUE DU PETIT ANJOU	\N	49290	CHALONNES	25.5	\N	\N	34	\N	17	\N	2020-12-10 00:00:00	21.25	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	FOUCAULT ANTOINE	2020-12-10 00:00:00	APPT-F2	22848	\N	NON	TN100 APPT F2	APPARTEMENT	37	20155	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
62	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-07 00:00:00	21	84999	8  RUE BASILE GABORY	\N	49125	TIERCE	25.5	\N	\N	34	\N	17	\N	2020-12-10 00:00:00	21.25	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	HOMAT-CHAVY 	2020-12-10 00:00:00	APPT-F2	8233	\N	NON	TN100 APPT F2	APPT	42.16	19855	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
63	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-09 00:00:00	21	101586	52 RUE JULES GUITTON	DROITE	49100	ANGERS	25.5	\N	\N	34	\N	17	\N	2020-12-10 00:00:00	21.25	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	ARNOLD JEAN FRANCOIS	2020-12-10 00:00:00	APPT-F2	2463	\N	NON	TN100 APPT F2	APPARTEMENT	36	S19869 E20029	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
64	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-10 00:00:00	21	101106	16 RUE CAMILLE PERDRIAU	\N	49130	LES PONTS DE CE	24	\N	\N	32	\N	16	\N	2020-12-10 00:00:00	20	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	SCI BERTAY BLANVILLAIN 	2020-12-10 00:00:00	APPT-F1	2772	\N	NON	TN100 APPT F1	APPARTEMENT	25	19740	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
65	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-13 00:00:00	21	39962	55 RUE LAMARTINE	\N	49500	SEGRE	27	\N	\N	36	\N	18	\N	2020-12-10 00:00:00	22.5	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	JOB GUILLAUME	2020-12-10 00:00:00	APPT-F3	5372	\N	NON	TN100 APPT F3	APPARTEMENT	58.4	E20154 S19126	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
66	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-01 00:00:00	26	77815	2 DE LA MAIRIE	\N	49770	LA MEIGNANNE	45	\N	\N	60	\N	30	\N	2020-11-05 00:00:00	37.5	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	ARNOLD JEAN FRANCOIS 	2020-11-05 00:00:00	PAV-T4	2748	\N	NON	TN100 PAV T4	PAVILLON	92.94	19542	0.15	41	0.01	34	0.04	34	0.01	18	0.01	34	0.03	39	0.01	39	0.02	39	0.02	t
67	2	\N	PZEDL123630	18	PZEDL123630	2020-10-23 00:00:00	34	110306	82 RUE NATIONALE	\N	85500	LES HERBIERS	25.5	\N	\N	34	\N	17	\N	2020-11-12 00:00:00	21.25	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	BONNENFANT MARCHAND	2020-11-12 00:00:00	APPT-F2	24900	\N	NON	TN100 APPT F2	APPARTEMENT	55	19705	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
68	2	\N	PZEDL123630	18	PZEDL123630	2020-10-24 00:00:00	34	73807	18 RUE DU 8 MAI 1945	\N	85500	BEAUREPAIRE	35.4	\N	\N	47.2	\N	23.6	\N	2020-11-12 00:00:00	29.5	0	0.25	0.05	34	0.4	34	Sortant	\N	\N	BITEAU MARIE RENEE	2020-11-12 00:00:00	PAV-T3	18178	\N	NON	TN100 APPT F3	PAVILLON	90	S19812 - E19919	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
69	2	\N	PZEDL123630	18	PZEDL123630	2020-10-26 00:00:00	36	110391	 6  BIS RUE SAINT BLAISE	\N	85500	LES HERBIERS	35.4	\N	\N	47.2	\N	23.6	\N	2020-11-12 00:00:00	29.5	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	PAQUEREAU CHLOE	2020-11-12 00:00:00	PAV-T3	24916	\N	NON	TN100 PAV T3 	PAVILLON	54.10	S 18706-E 18968	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
70	2	\N	PZEDL123630	18	PZEDL123630	2020-10-27 00:00:00	36	53017	16 RUE MARCEL CERDAN	\N	85500	LES HERBIERS	45	\N	\N	60	\N	30	\N	2020-11-12 00:00:00	37.5	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	SCI L'HARMONIE Mr FOULONNEAU DIDIER	2020-11-12 00:00:00	PAV-T4	14474	\N	NON	TN100 PAV T4	PAVILLON	95	S 18769-E 19234	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
71	2	\N	PZEDL123630	18	PZEDL123630	2020-10-28 00:00:00	36	81557	41 RUE DES MOUETTES	\N	85500	LES HERBIERS	45	\N	\N	60	\N	30	\N	2020-11-12 00:00:00	37.5	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	PAQUEREAU DENIS ET BEATRICE	2020-11-12 00:00:00	PAV-T4	18937	\N	NON	TN100 PAV T4	PAVILLON	91	18253	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
72	2	\N	PZEDL123630	18	PZEDL123630	2020-11-03 00:00:00	36	88478	12 GRANDE RUE	\N	85500	LES HERBIERS	25.5	\N	\N	34	\N	17	\N	2020-12-28 00:00:00	21.25	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	BONNEAU LUC ET KATTY	2020-12-28 00:00:00	APPT-F2	19886	\N	NON	TN100 APPT F2	APPARTEMENT	42	19492	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
73	2	\N	PZEDL123630	18	PZEDL123630	2020-11-30 00:00:00	36	59359	 1 RUE DE LA GARENNE	\N	85700	SAINT MICHEL MONT MERCURE	45	\N	\N	60	\N	30	\N	2020-12-28 00:00:00	37.5	0	0.25	0.05	34	0.4	36	Sortant	\N	\N	BLANCHARD ANNE-MARIE	2020-12-28 00:00:00	PAV-T4	15407	\N	NON	TN100 PAV T4	PAV	89.87	20264	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
74	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-16 00:00:00	19	111000	21 RUE DU MAIL	\N	49100	ANGERS	24	\N	\N	32	\N	16	\N	2020-12-10 00:00:00	20	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	SCI MAIL 49 Monsieur BIEULES	2020-12-10 00:00:00	APPT-F1	25028	\N	NON	TN100 APPT F1	APPARTEMENT	22	20111	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
75	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-21 00:00:00	19	103715	19 ARMAND BROUSSE	\N	49610	ST MELAINE SUR AUBANCE	35.4	\N	\N	47.2	\N	23.6	\N	2020-12-10 00:00:00	29.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	DU COQ MOLLET DAGUET	2020-12-10 00:00:00	PAV-T3	18835	\N	NON	TN100	PAV	85	20044	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
76	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-27 00:00:00	19	91895	165 FERDINAND VEST	MAISON DE GAUCHE	49800	TRELAZE	35.4	\N	\N	47.2	\N	23.6	\N	2020-12-10 00:00:00	29.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	BERTAY VEILLON 	2020-12-10 00:00:00	PAV-T3	21460	\N	NON	TN100	PAV	73.25	19613	0.15	41	0.01	32	0.04	34	0.01	18	0.01	32	0.03	39	0.01	20	0.02	20	0.02	t
77	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-27 00:00:00	19	91895	165 FERDINAND VEST	MAISON DE GAUCHE	49800	TRELAZE	0	\N	\N	0	\N	0	\N	2020-12-10 00:00:00	29.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	BERTAY VEILLON 	2020-12-10 00:00:00	PAV-T3	21460	non-conformité / Rémunération art-5	NON	TN100	PAV	73.25	19613	0.15	41	0.01	32	0.04	34	0.01	18	0.01	32	0.03	39	0.01	20	0.02	20	0.02	t
78	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-30 00:00:00	19	100332	15 G DE LETENDUERE	\N	49000	ANGERS	0	\N	\N	0	\N	0	\N	2020-12-10 00:00:00	30	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	SCI RICO FLO ERIC	2020-12-10 00:00:00	APPT-F1 M	4192	non-conformité / Rémunération art-5	OUI	TN150 APPT F1M 	APPARTEMENT	32.07	20024	0.15	41	0.01	32	0.04	34	0.01	18	0.01	32	0.03	39	0.01	20	0.02	20	0.02	t
79	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-30 00:00:00	19	111198	 22 RUE DES LICES	\N	49100	ANGERS	0	\N	\N	0	\N	0	\N	2020-12-10 00:00:00	21.25	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	MORIN JEREMY	2020-12-10 00:00:00	APPT TYPE F2	2455	non-conformité / Rémunération art-5	NON	TN100 APPT F2	APPARTEMENT	69.88	19408	0.15	41	0.01	32	0.04	34	0.01	18	0.01	32	0.03	39	0.01	20	0.02	20	0.02	t
80	1	\N	PZEDL1075491	21	PZEDL1075491	2020-11-30 00:00:00	19	45768	49  AVENUE PATTON	RESIDENCE PATTON BAT B	49000	ANGERS	0	\N	\N	0	\N	0	\N	2020-12-10 00:00:00	22.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	GRISON 	2020-12-10 00:00:00	APPT TYPE F3	4883	non-conformité / Rémunération art-5	NON	TN100 APPT F2	APPARTEMENT	30	20011	0.15	41	0.01	32	0.04	34	0.01	18	0.01	32	0.03	39	0.01	20	0.02	20	0.02	t
81	1	\N	PZEDL1075491	21	PZEDL1075491	2020-10-08 00:00:00	38	73548	17 GRANDE RUE	\N	53200	CHATEAU GONTIER	25.5	\N	\N	34	\N	17	\N	2020-11-05 00:00:00	21.25	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	CONSIDERE ADELE	2020-11-05 00:00:00	APPT-F2	11591	\N	NON	TN100	APPT	37	19700	0.15	41	0.01	32	0.04	34	0.01	18	0.01	32	0.03	39	0.01	20	0.02	20	0.02	t
82	3	\N	PZEDL120020	21	PZEDL120020	2020-10-20 00:00:00	38	110255	76 RUE ANDRE SAGET	RESIDENCE LE PARC SAINT MARTIN	53000	LAVAL	27	\N	\N	36	\N	18	\N	2020-11-03 00:00:00	22.5	0	0.25	0.05	34	0.4	41	Sortant	\N	\N	SIMON ROGER/JACQUELINE	2020-11-03 00:00:00	APPT-F3	24891	\N	NON	TN100 APPT F3	APPARTEMENT	62.13	19791	0.15	41	0.01	32	0.04	34	0.01	18	0.01	32	0.03	39	0.01	20	0.02	20	0.02	t
83	3	\N	PZEDL120020	21	PZEDL120020	2020-10-29 00:00:00	38	101771	1 RUE DU BOURGNEUF	\N	53240	LA BACONNIERE	35.4	\N	\N	47.2	\N	23.6	\N	2020-11-03 00:00:00	29.5	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	DELALONDE SEBASTIEN	2020-11-03 00:00:00	PAV-T3	17507	\N	NON	TN100 PAV T3 	PAVILLON	83.51	19775	0.15	41	0.01	32	0.04	34	0.01	18	0.01	32	0.03	39	0.01	20	0.02	20	0.02	t
84	3	\N	PZEDL120020	21	PZEDL120020	2020-11-02 00:00:00	38	83568	11 RUE EDOUARD BRANLY	ENTRÉE DE GAUCHE	53200	CHATEAU GONTIER	25.5	\N	\N	34	\N	17	\N	2020-12-10 00:00:00	21.25	0	0.25	0.05	34	0.4	41	Sortant	\N	\N	GUINEHEUX MARIE	2020-12-10 00:00:00	APPT-F2	19916	\N	NON	TN100	APPT	44	19688	0.15	41	0.01	32	0.04	34	0.01	18	0.01	32	0.03	39	0.01	20	0.02	20	0.02	t
85	3	\N	PZEDL120020	21	PZEDL120020	2020-11-03 00:00:00	38	76335	66 RUE DE L'ABBE PIERRE	DOMAINE DE LA GENDRIE	53000	LAVAL	29.4	\N	\N	39.2	\N	19.6	\N	2020-12-10 00:00:00	24.5	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	ORALIA DESPORTS 	2020-12-10 00:00:00	PAV-T2	18518	\N	NON	TN100 PAV T2	PAVILLON	50.65	19917	0.15	41	0.01	32	0.04	34	0.01	18	0.01	32	0.03	39	0.01	20	0.02	20	0.02	t
86	3	\N	PZEDL120020	21	PZEDL120020	2020-11-05 00:00:00	38	110814	6 RUE DE BOSTON	\N	53000	LAVAL	54	\N	\N	72	\N	36	\N	2020-12-10 00:00:00	45	0	0.25	0.05	34	0.4	18	Sortant	\N	\N	COQUELIN SERGE	2020-12-10 00:00:00	PAV-T5	24997	\N	NON	TN100 PAV T5	PAVILLON	98	20054	0.15	41	0.01	32	0.04	34	0.01	18	0.01	32	0.03	39	0.01	20	0.02	20	0.02	t
87	3	\N	PZEDL120020	21	PZEDL120020	2020-11-30 00:00:00	38	104477	9 IMPASSE MAGENTA	\N	53000	LAVAL	25.5	\N	\N	34	\N	17	\N	2020-12-10 00:00:00	21.25	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	SCI POLE POSITION-MACHON 	2020-12-10 00:00:00	APPT-F2	15596	\N	NON	TN100 APPT F2	APPARTEMENT	45.90	19294	0.15	41	0.01	32	0.04	34	0.01	18	0.01	32	0.03	39	0.01	20	0.02	20	0.02	t
88	3	\N	PZEDL120020	21	PZEDL120020	2020-11-30 00:00:00	38	99399	 LIEU-DIT LE MOULIN	\N	53290	BIERNE	35.4	\N	\N	47.2	\N	23.6	\N	2020-12-10 00:00:00	29.5	0	0.25	0.05	34	0.4	16	Sortant	\N	\N	LIBERT PATRICE	2020-12-10 00:00:00	PAV-T3	22898	\N	NON	TN100 PAV T3 	PAVILLON	57	19574	0.15	41	0.01	32	0.04	34	0.01	18	0.01	32	0.03	39	0.01	20	0.02	20	0.02	t
89	4	\N	PZEDL127034	13	PZEDL127034	2020-10-03 00:00:00	41	109466	2 RUE ELIE FRERON	\N	29000	QUIMPER	38.25	\N	\N	51	\N	25.5	\N	2020-11-03 00:00:00	20	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	VANATUR IMMO 	2020-11-03 00:00:00	APPT-F2 M	24756	\N	OUI	TN150 APPT F2M	APPARTEMENT	36.60	19379	0.15	41	0.01	0	0.04	34	0.01	18	0.01	0	0.03	39	0.01	39	0.02	39	0.02	t
90	4	\N	PZEDL127034	13	PZEDL127034	2020-10-03 00:00:00	41	109740	14 AMIRAL RONARCH	\N	29000	QUIMPER	27	\N	\N	36	\N	18	\N	2020-11-03 00:00:00	20	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	JACQ RAOUL 	2020-11-03 00:00:00	APPT-F3	24805	\N	NON	TN100 APPT F3	APPARTEMENT	82.73	19255	0.15	41	0.01	41	0.04	34	0.01	18	0.01	41	0.03	39	0.01	20	0.02	20	0.02	t
91	4	\N	PZEDL127034	13	PZEDL127034	2020-10-08 00:00:00	41	109863	4 BIENVENUE	\N	29000	QUIMPER	57	\N	\N	76	\N	38	\N	2020-11-03 00:00:00	35	0	0.25	0.05	34	0.4	41	Sortant	\N	\N	DROUET SEBASTIEN	2020-11-03 00:00:00	PAV-T6	24826	\N	NON	TN100 PAV T6	PAVILLON	163.43	19264	0.15	41	0.01	0	0.04	34	0.01	18	0.01	0	0.03	39	0.01	39	0.02	39	0.02	t
92	4	\N	PZEDL127034	13	PZEDL127034	2020-10-24 00:00:00	41	110271	9 DE LA FONTAINE	\N	29000	QUIMPER	36	\N	\N	48	\N	24	\N	2020-11-03 00:00:00	15	0	0.25	0.05	34	0.4	41	Sortant	\N	\N	HUON DE PENANSTER MAUDE JEROME	2020-11-03 00:00:00	APPT-F1 M	24893	\N	OUI	TN150 APPT F1M 	APPARTEMENT	22.89	19803	0.15	41	0.01	41	0.04	34	0.01	18	0.01	41	0.03	39	0.01	20	0.02	20	0.02	t
93	4	\N	PZEDL127034	13	PZEDL127034	2020-11-13 00:00:00	41	110910	2 JULES HENRIOT	\N	29000	QUIMPER	25.5	\N	\N	34	\N	17	\N	2020-12-03 00:00:00	20	0	0.25	0.05	34	0.4	41	Sortant	\N	\N	JACQ EMMANUEL	2020-12-03 00:00:00	APPT-F2	25015	\N	NON	TN100 APPT F2	APPARTEMENT	43	19922	0.15	41	0.01	32	0.04	34	0.01	18	0.01	32	0.03	39	0.01	20	0.02	20	0.02	t
94	4	\N	PZEDL127034	13	PZEDL127034	2020-11-30 00:00:00	41	111184	62 A QUAI DE L'ODET	\N	29000	QUIMPER	25.5	\N	\N	34	\N	17	\N	2020-12-03 00:00:00	20	0	0.25	0.05	34	0.4	41	Sortant	\N	\N	ABALAIN MYRIAM	2020-12-03 00:00:00	APPT-F2	25066	\N	NON	TN100 APPT F2	APPARTEMENT	50	20205	0.15	41	0.01	32	0.04	34	0.01	18	0.01	32	0.03	39	0.01	20	0.02	20	0.02	t
95	4	\N	PZEDL127034	13	PZEDL127034	2020-11-30 00:00:00	41	111186	55 DE LA FRENCE LIBRE	\N	29000	QUIMPER	45	\N	\N	60	\N	30	\N	2020-12-03 00:00:00	35	0	0.25	0.05	34	0.4	41	Sortant	\N	\N	GOYAT MICHEL	2020-12-03 00:00:00	PAV-T4	25067	\N	NON	TN100 PAV T4	PAVILLON	110	19716	0.15	41	0.01	32	0.04	34	0.01	18	0.01	32	0.03	39	0.01	20	0.02	20	0.02	t
96	4	\N	PZEDL127034	13	PZEDL127034	2020-10-16 00:00:00	21	110090	9 SAINTE THERESE	\N	29000	QUIMPER	25.5	\N	\N	34	\N	17	\N	2020-11-03 00:00:00	20	0	0.25	0.05	34	0.4	41	Sortant	\N	\N	SCI VANATUR IIMMO 	2020-11-03 00:00:00	APPT-F2	24860	\N	NON	TN100 APPT F2	APPARTEMENT	36.40	19570	0.15	41	0.01	21	0.04	34	0.01	18	0.01	0	0.03	39	0.01	39	0.02	39	0.02	t
97	4	\N	PZEDL127034	13	PZEDL127034	2020-10-17 00:00:00	21	110095	3 HENT AR GLUJAR	\N	29000	QUIMPER	25.5	\N	\N	34	\N	17	\N	2020-11-03 00:00:00	20	0	0.25	0.05	34	0.4	21	Sortant	\N	\N	FILEUX et MULET ALEXANDRA  JULIEN	2020-11-03 00:00:00	APPT-F2	24861	\N	NON	TN100 APPT F2	APPARTEMENT	46.60	19687	0.15	41	0.01	41	0.04	34	0.01	18	0.01	41	0.03	39	0.01	20	0.02	20	0.02	t
98	4	\N	PZEDL127034	13	PZEDL127034	2020-10-31 00:00:00	21	110515	4 EMILE LEMOINE	\N	29000	QUIMPER	27	\N	\N	36	\N	18	\N	2020-11-03 00:00:00	20	0	0.25	0.05	34	0.4	41	Sortant	\N	\N	DESSARTRE MARC  NICOLE	2020-11-03 00:00:00	APPT-F3	24943	\N	NON	TN100 APPT F3	APPARTEMENT	63.88	19733	0.15	41	0.01	34	0.04	34	0.01	18	0.01	34	0.03	39	0.01	39	0.02	39	0.02	t
99	4	\N	PZEDL127034	13	PZEDL127034	2020-11-10 00:00:00	21	110849	27 DE L'EGLANTINE	\N	29000	QUIMPER	27	\N	\N	36	\N	18	\N	2020-12-03 00:00:00	20	0	0.25	0.05	34	0.4	41	Sortant	\N	\N	QUEINNEC MICHELINE	2020-12-03 00:00:00	APPT-F3	25005	\N	NON	TN100 APPT F3	APPARTEMENT	55	19677	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	0	\N	t
\.


--
-- Data for Name: Negotiateur_History; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Negotiateur_History" (id, negotiateur_id, adresse, etat_client, cp, ville, pays, abonnement, date, visibility) FROM stdin;
1	1	SImbock	t	87500.0	Yaounde	France	\N	2021-02-20 16:49:51.663785	t
\.


--
-- Data for Name: Tarif_base; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tarif_base" (id, maison_appartement, "Type", "Prix_EDL", "Prix_Chiffrage", visibility) FROM stdin;
\.


--
-- Data for Name: Tarifs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tarifs" (id, reference_client, edl_prix_std, edl_appt_prix_f1, edl_appt_prix_f2, edl_appt_prix_f3, edl_appt_prix_f4, edl_appt_prix_f5, edl_appt_prix_f6, edl_pav_villa_prix_t1, edl_pav_villa_prix_t2, edl_pav_villa_prix_t3, edl_pav_villa_prix_t4, edl_pav_villa_prix_t5, edl_pav_villa_prix_t6, edl_pav_villa_prix_t7, edl_pav_villa_prix_t8, chif_appt_prix_stu, chif_appt_prix_f1, chif_appt_prix_f2, chif_appt_prix_f3, chif_appt_prix_f4, chif_appt_prix_f5, chif_pav_villa_prix_t1, chif_pav_villa_prix_t2, chif_pav_villa_prix_t3, chif_pav_villa_prix_t4, chif_pav_villa_prix_t5, chif_pav_villa_prix_t6, chif_pav_villa_prix_t7, chif_pav_villa_prix_t8, code_tva, taux_meuble, referent_as_client, com_as_sur_ca_client, cell_dev_ref_responsable, com_cell_dev_ref_responsable, cell_dev_ref_agent, com_cell_dev_ref_agent, cell_tech_ref_agent, "com_cell_tech_Ref_agent", cell_tech_ref_responsable, com_cell_tech_ref_responsable, cell_tech_ref_suiveur, com_cell_tech_ref_suiveur, cell_planif_ref_responsable, com_cell_planif_ref_responsable, cell_planif_ref_suiveur, com_cell_planif_ref_suiveur, cell_planif_ref_agent_saisie, com_cell_planif_ref_agent_saisie, prix_autre, commentaire_libre, date, visibility) FROM stdin;
1	1	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.5	18	0.14999999999999997	18	0.01	42	0.04	3	0.01	15	0.01	42	0.03	11	0.01	77	0.02	77	0.02	\N	\N	2021-03-17 10:06:21.220199	t
2	2	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.5	15	0.24999999999999997	0	0.0	0		0		0		0		11	0.01	77	0.02	77	0.02	\N	\N	2021-03-17 10:06:21.315146	t
3	3	80	80	85	90	100	100	100	0	98	118	150	180	190	220	250	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.5	18	0.14999999999999997	18	0.01	42	0.04	3	0.01	15	0.01	42	0.03	11	0.01	77	0.02	77	0.02	\N	\N	2021-03-17 10:06:21.344126	t
4	4	80	80	85	90	110	120	130	120	120	130	150	180	190	220	250	15	15	20	20	25	25	25	25	25	35	35	35	45	45	0	0.5	33	0.14999999999999997	24	0.01	24	0.04	3	0.01	15	0.01	18	0.03	11	0.01	77	0.02	77	0.02	\N	\N	2021-03-17 10:06:21.370112	t
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
a91344953523
\.


--
-- Data for Name: facturation_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facturation_client (id, n_facture, client, "Montant_HT", "Date_de_creation", "Date_reglement_client", "Statut", "Observations_suivi_paiement", "Date_première_relance", "Date_seconde_relance", "Date_mise_en_demeure", visibility) FROM stdin;
\.


--
-- Data for Name: facturation_mission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facturation_mission (id, ref_mission, fact_mission, visibility) FROM stdin;
\.


--
-- Data for Name: prospect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prospect (id, reference, "TYPE", societe, sexe, nom, email, numero, siret, date_creation, visibility) FROM stdin;
1	107108.0	Locataire	Amexpert	\N	 jovanovic et turle jonathan et mirela	test@gmail.com	675337250	\N	2021-02-20 16:14:38.258716	t
2	107481.0	Locataire	Amexpert	\N	asfaux laureen 	test@gmail.com	675337250	\N	2021-02-20 16:14:38.304688	t
3	69213.0	Locataire	Amexpert	\N	ihfa myriem	test@gmail.com	675337250	\N	2021-02-20 16:14:38.330675	t
4	107612.0	Locataire	Amexpert	\N	autechaud andeol	test@gmail.com	675337250	\N	2021-02-20 16:14:38.35666	t
5	107616.0	Locataire	Amexpert	\N	hayouma mimoun ben et barbara	test@gmail.com	675337250	\N	2021-02-20 16:14:38.386643	t
6	107622.0	Locataire	Amexpert	\N	gelis, schwartz, maelstaf noemie claire violaine	test@gmail.com	675337250	\N	2021-02-20 16:14:38.413626	t
7	107653.0	Locataire	Amexpert	\N	elaoud miriam 	test@gmail.com	675337250	\N	2021-02-20 16:14:38.438613	t
8	107655.0	Locataire	Amexpert	\N	cherif julien 	test@gmail.com	675337250	\N	2021-02-20 16:14:38.459601	t
9	107712.0	Locataire	Amexpert	\N	pain hugo 	test@gmail.com	675337250	\N	2021-02-20 16:14:38.484586	t
10	107767.0	Locataire	Amexpert	\N	pellerin matis	test@gmail.com	675337250	\N	2021-02-20 16:14:38.523564	t
11	96997.0	Locataire	Amexpert	\N	labbe hugo ; brion heloise	test@gmail.com	675337250	\N	2021-02-20 16:14:38.545551	t
12	107991.0	Locataire	Amexpert	\N	boukhechem et le goff gauthier et jeanne	test@gmail.com	675337250	\N	2021-02-20 16:14:38.576534	t
13	107998.0	Locataire	Amexpert	\N	perez pacome	test@gmail.com	675337250	\N	2021-02-20 16:14:38.594524	t
14	108005.0	Locataire	Amexpert	\N	darras anne	test@gmail.com	675337250	\N	2021-02-20 16:14:38.613513	t
15	108236.0	Locataire	Amexpert	\N	deloye et lourdin guillaume et alyssa	test@gmail.com	675337250	\N	2021-02-20 16:14:38.6365	t
16	108251.0	Locataire	Amexpert	\N	faure alex	test@gmail.com	675337250	\N	2021-02-20 16:14:38.656489	t
17	108313.0	Locataire	Amexpert	\N	le goff & marivain morgane et servane	test@gmail.com	675337250	\N	2021-02-20 16:14:38.675477	t
18	108331.0	Locataire	Amexpert	\N	bouchard marie	test@gmail.com	675337250	\N	2021-02-20 16:14:38.695469	t
19	108359.0	Locataire	Amexpert	\N	naturel gregoire	test@gmail.com	675337250	\N	2021-02-20 16:14:38.716453	t
20	83692.0	Locataire	Amexpert	\N	richet thomas	test@gmail.com	675337250	\N	2021-02-20 16:14:38.734444	t
21	108417.0	Locataire	Amexpert	\N	brunois maxime et alexis	test@gmail.com	675337250	\N	2021-02-20 16:14:38.755431	t
22	108419.0	Locataire	Amexpert	\N	perlat laurent	test@gmail.com	675337250	\N	2021-02-20 16:14:38.776419	t
23	108421.0	Locataire	Amexpert	\N	nebbia-badoud laura	test@gmail.com	675337250	\N	2021-02-20 16:14:38.795409	t
24	69839.0	Locataire	Amexpert	\N	m. shin wonho  ; seo kyung sil 	test@gmail.com	675337250	\N	2021-02-20 16:14:38.814396	t
25	108475.0	Locataire	Amexpert	\N	bedos julien	test@gmail.com	675337250	\N	2021-02-20 16:14:38.837386	t
26	88280.0	Locataire	Amexpert	\N	cliquet isaure	test@gmail.com	675337250	\N	2021-02-20 16:14:38.857372	t
27	107302.0	Locataire	Amexpert	\N	bacquet sarah 	test@gmail.com	675337250	\N	2021-02-20 16:14:38.876361	t
28	107308.0	Locataire	Amexpert	\N	hauchard mathias 	test@gmail.com	675337250	\N	2021-02-20 16:14:38.895353	t
29	85170.0	Locataire	Amexpert	\N	pilisi claire	test@gmail.com	675337250	\N	2021-02-20 16:14:38.916339	t
30	107310.0	Locataire	Amexpert	\N	richier et reygasse paul et penelope	test@gmail.com	675337250	\N	2021-02-20 16:14:38.937327	t
31	107314.0	Locataire	Amexpert	\N	sahraoui 	test@gmail.com	675337250	\N	2021-02-20 16:14:38.958316	t
32	107319.0	Locataire	Amexpert	\N	bigorgne marie 	test@gmail.com	675337250	\N	2021-02-20 16:14:38.978307	t
33	107337.0	Locataire	Amexpert	\N	beaslay et sayrin thiphanie, clement	test@gmail.com	675337250	\N	2021-02-20 16:14:39.00229	t
34	107466.0	Locataire	Amexpert	\N	durand sylvie 	test@gmail.com	675337250	\N	2021-02-20 16:14:39.020279	t
35	71425.0	Locataire	Amexpert	\N	papacatzis bertrand 	test@gmail.com	675337250	\N	2021-02-20 16:14:39.040269	t
36	107490.0	Locataire	Amexpert	\N	daoudi issam	test@gmail.com	675337250	\N	2021-02-20 16:14:39.061258	t
37	95020.0	Locataire	Amexpert	\N	cantrelle netie ; ranson margaux	test@gmail.com	675337250	\N	2021-02-20 16:14:39.084244	t
38	76934.0	Locataire	Amexpert	\N	touimer neila	test@gmail.com	675337250	\N	2021-02-20 16:14:39.10723	t
39	107583.0	Locataire	Amexpert	\N	societe dyson monsieur quilitz	test@gmail.com	675337250	\N	2021-02-20 16:14:39.128222	t
40	107618.0	Locataire	Amexpert	\N	trini meryam	test@gmail.com	675337250	\N	2021-02-20 16:14:39.155203	t
41	62888.0	Locataire	Amexpert	\N	rasoamanana laura	test@gmail.com	675337250	\N	2021-02-20 16:14:39.180187	t
42	107706.0	Locataire	Amexpert	\N	dray felix 	test@gmail.com	675337250	\N	2021-02-20 16:14:39.206172	t
43	107714.0	Locataire	Amexpert	\N	hauchard muriel 	test@gmail.com	675337250	\N	2021-02-20 16:14:39.22816	t
44	107718.0	Locataire	Amexpert	\N	aubouin estelle 	test@gmail.com	675337250	\N	2021-02-20 16:14:39.247152	t
45	100312.0	Locataire	Amexpert	\N	viale & vitali timothee & marie	test@gmail.com	675337250	\N	2021-02-20 16:14:39.26714	t
46	72302.0	Locataire	Amexpert	\N	marti baez sergi	test@gmail.com	675337250	\N	2021-02-20 16:14:39.288131	t
47	107798.0	Locataire	Amexpert	\N	gesta florian	test@gmail.com	675337250	\N	2021-02-20 16:14:39.307114	t
48	71069.0	Locataire	Amexpert	\N	jouanne  ophelie	test@gmail.com	675337250	\N	2021-02-20 16:14:39.328105	t
49	107812.0	Locataire	Amexpert	\N	recoche 	test@gmail.com	675337250	\N	2021-02-20 16:14:39.351094	t
50	107861.0	Locataire	Amexpert	\N	plazanet marie	test@gmail.com	675337250	\N	2021-02-20 16:14:39.371079	t
51	107864.0	Locataire	Amexpert	\N	desesquelles noe	test@gmail.com	675337250	\N	2021-02-20 16:14:39.390067	t
52	107871.0	Locataire	Amexpert	\N	adelaide benedicte	test@gmail.com	675337250	\N	2021-02-20 16:14:39.412055	t
53	107946.0	Locataire	Amexpert	\N	delporte margaux	test@gmail.com	675337250	\N	2021-02-20 16:14:39.441043	t
54	107988.0	Locataire	Amexpert	\N	dymny fabien	test@gmail.com	675337250	\N	2021-02-20 16:14:39.469024	t
55	108029.0	Locataire	Amexpert	\N	quinart emilien	test@gmail.com	675337250	\N	2021-02-20 16:14:39.49601	t
56	108034.0	Locataire	Amexpert	\N	secher louann	test@gmail.com	675337250	\N	2021-02-20 16:14:39.524993	t
57	107758.0	Locataire	Amexpert	\N	travail josepha 	test@gmail.com	675337250	\N	2021-02-20 16:14:39.554973	t
58	108036.0	Locataire	Amexpert	\N	alcaraz, boufadene, monnier angelo, siwam, clement	test@gmail.com	675337250	\N	2021-02-20 16:14:39.578961	t
59	108039.0	Locataire	Amexpert	\N	baris florent	test@gmail.com	675337250	\N	2021-02-20 16:14:39.605944	t
60	53869.0	Locataire	Amexpert	\N	haas thibaut	test@gmail.com	675337250	\N	2021-02-20 16:14:39.647923	t
61	108031.0	Locataire	Amexpert	\N	de zerbi philippe	test@gmail.com	675337250	\N	2021-02-20 16:14:39.686898	t
62	108042.0	Locataire	Amexpert	\N	walace hugo	test@gmail.com	675337250	\N	2021-02-20 16:14:39.711883	t
63	108158.0	Locataire	Amexpert	\N	claude alice numata leo	test@gmail.com	675337250	\N	2021-02-20 16:14:39.737869	t
64	108187.0	Locataire	Amexpert	\N	oriz sierra & lopez herrera luisa & esteban	test@gmail.com	675337250	\N	2021-02-20 16:14:39.764856	t
65	108194.0	Locataire	Amexpert	\N	caroff emeline	test@gmail.com	675337250	\N	2021-02-20 16:14:39.790838	t
66	71881.0	Locataire	Amexpert	\N	signoud clara	test@gmail.com	675337250	\N	2021-02-20 16:14:39.811828	t
67	108232.0	Locataire	Amexpert	\N	devimeux arthur	test@gmail.com	675337250	\N	2021-02-20 16:14:39.829817	t
68	108234.0	Locataire	Amexpert	\N	kalai djida	test@gmail.com	675337250	\N	2021-02-20 16:14:39.852803	t
69	108244.0	Locataire	Amexpert	\N	bray maxime	test@gmail.com	675337250	\N	2021-02-20 16:14:39.872793	t
70	108256.0	Locataire	Amexpert	\N	ponsar lucile	test@gmail.com	675337250	\N	2021-02-20 16:14:39.89278	t
71	108333.0	Locataire	Amexpert	\N	 routaboule et foy raphaelle et axel	test@gmail.com	675337250	\N	2021-02-20 16:14:39.915768	t
72	108337.0	Locataire	Amexpert	\N	albahary et dayras olivier	test@gmail.com	675337250	\N	2021-02-20 16:14:39.934757	t
73	108349.0	Locataire	Amexpert	\N	lanneluc clément	test@gmail.com	675337250	\N	2021-02-20 16:14:39.953748	t
74	91146.0	Locataire	Amexpert	\N	gorvel lea	test@gmail.com	675337250	\N	2021-02-20 16:14:39.973735	t
75	108350.0	Locataire	Amexpert	\N	mahraoui sofiane	test@gmail.com	675337250	\N	2021-02-20 16:14:39.993725	t
76	108329.0	Locataire	Amexpert	\N	demoisson emilie	test@gmail.com	675337250	\N	2021-02-20 16:14:40.014712	t
77	108469.0	Locataire	Amexpert	\N	mathez klelia	test@gmail.com	675337250	\N	2021-02-20 16:14:40.037697	t
78	108471.0	Locataire	Amexpert	\N	marrand -perrin thais	test@gmail.com	675337250	\N	2021-02-20 16:14:40.059684	t
79	108473.0	Locataire	Amexpert	\N	mme belugou & m. portes lionel et aline	test@gmail.com	675337250	\N	2021-02-20 16:14:40.084671	t
80	108541.0	Locataire	Amexpert	\N	banvillet & delaplace juliette	test@gmail.com	675337250	\N	2021-02-20 16:14:40.105661	t
81	84718.0	Locataire	Amexpert	\N	guinot  ophelie	test@gmail.com	675337250	\N	2021-02-20 16:14:40.128645	t
82	108347.0	Locataire	Amexpert	\N	rosengerg paul	test@gmail.com	675337250	\N	2021-02-20 16:14:40.147634	t
83	107304.0	Locataire	Amexpert	\N	seytor kenny	test@gmail.com	675337250	\N	2021-02-20 16:14:40.167622	t
84	107469.0	Locataire	Amexpert	\N	mei william 	test@gmail.com	675337250	\N	2021-02-20 16:14:40.189611	t
85	107488.0	Locataire	Amexpert	\N	dugast et dellouche-ladrat eric et melissa	test@gmail.com	675337250	\N	2021-02-20 16:14:40.211599	t
86	107517.0	Locataire	Amexpert	\N	barruel pol-eloi 	test@gmail.com	675337250	\N	2021-02-20 16:14:40.232588	t
87	107657.0	Locataire	Amexpert	\N	idelon gwendoline 	test@gmail.com	675337250	\N	2021-02-20 16:14:40.253576	t
88	107704.0	Locataire	Amexpert	\N	poulet alexandre 	test@gmail.com	675337250	\N	2021-02-20 16:14:40.272564	t
89	107710.0	Locataire	Amexpert	\N	mellano sophie 	test@gmail.com	675337250	\N	2021-02-20 16:14:40.294551	t
90	107994.0	Locataire	Amexpert	\N	cerceau cyprien cruse rebecca	test@gmail.com	675337250	\N	2021-02-20 16:14:40.318539	t
91	108156.0	Locataire	Amexpert	\N	moumen samir	test@gmail.com	675337250	\N	2021-02-20 16:14:40.341526	t
92	108196.0	Locataire	Amexpert	\N	texier et voinot simon et lorene	test@gmail.com	675337250	\N	2021-02-20 16:14:40.36551	t
93	108288.0	Locataire	Amexpert	\N	le bolloc'h guillaume	test@gmail.com	675337250	\N	2021-02-20 16:14:40.3855	t
94	108311.0	Locataire	Amexpert	\N	vignon et fournier matthieu et marine	test@gmail.com	675337250	\N	2021-02-20 16:14:40.405487	t
95	104713.0	Locataire	Amexpert	\N	dazin baptiste	test@gmail.com	675337250	\N	2021-02-20 16:14:40.425477	t
96	108533.0	Locataire	Amexpert	\N	moynot amelie	test@gmail.com	675337250	\N	2021-02-20 16:14:40.444464	t
97	108536.0	Locataire	Amexpert	\N	montant jean christophe	test@gmail.com	675337250	\N	2021-02-20 16:14:40.467454	t
98	108539.0	Locataire	Amexpert	\N	almon philippe	test@gmail.com	675337250	\N	2021-02-20 16:14:40.486441	t
99	107306.0	Locataire	Amexpert	\N	joly victor 	test@gmail.com	675337250	\N	2021-02-20 16:14:40.505432	t
100	107519.0	Locataire	Amexpert	\N	makhlouk oussama 	test@gmail.com	675337250	\N	2021-02-20 16:14:40.526417	t
101	107560.0	Locataire	Amexpert	\N	del bano aurelien	test@gmail.com	675337250	\N	2021-02-20 16:14:40.550406	t
102	107620.0	Locataire	Amexpert	\N	boid emilie 	test@gmail.com	675337250	\N	2021-02-20 16:14:40.576388	t
103	107708.0	Locataire	Amexpert	\N	cerf arthur 	test@gmail.com	675337250	\N	2021-02-20 16:14:40.598378	t
104	107564.0	Locataire	Amexpert	\N	nikiema kris viimes 	test@gmail.com	675337250	\N	2021-02-20 16:14:40.620364	t
105	107868.0	Locataire	Amexpert	\N	casanova-beyhurst marie	test@gmail.com	675337250	\N	2021-02-20 16:14:40.640354	t
106	107992.0	Locataire	Amexpert	\N	motsch elise	test@gmail.com	675337250	\N	2021-02-20 16:14:40.660342	t
107	107996.0	Locataire	Amexpert	\N	claudon alizee	test@gmail.com	675337250	\N	2021-02-20 16:14:40.682332	t
108	108254.0	Locataire	Amexpert	\N	touzani aziza	test@gmail.com	675337250	\N	2021-02-20 16:14:40.701317	t
109	108535.0	Locataire	Amexpert	\N	pierre lola	test@gmail.com	675337250	\N	2021-02-20 16:14:40.721306	t
110	107021.0	Locataire	Amexpert	\N	rousseau emeline bochereau marine	test@gmail.com	675337250	\N	2021-02-20 16:14:40.741296	t
111	107226.0	Locataire	Amexpert	\N	ingremeau max	test@gmail.com	675337250	\N	2021-02-20 16:14:40.760284	t
112	107364.0	Locataire	Amexpert	\N	loire perrault lola	test@gmail.com	675337250	\N	2021-02-20 16:14:40.789269	t
113	107365.0	Locataire	Amexpert	\N	avril mathilde	test@gmail.com	675337250	\N	2021-02-20 16:14:40.818253	t
114	107366.0	Locataire	Amexpert	\N	tritscler francois	test@gmail.com	675337250	\N	2021-02-20 16:14:40.846237	t
115	107368.0	Locataire	Amexpert	\N	fremont karine	test@gmail.com	675337250	\N	2021-02-20 16:14:40.87722	t
116	107370.0	Locataire	Amexpert	\N	paranthoen - bosse jean.baptiste - emmanuelle	test@gmail.com	675337250	\N	2021-02-20 16:14:40.904206	t
117	107371.0	Locataire	Amexpert	\N	lefevre marc - catherine	test@gmail.com	675337250	\N	2021-02-20 16:14:40.931188	t
118	107375.0	Locataire	Amexpert	\N	farhat ibrahim - laetitia	test@gmail.com	675337250	\N	2021-02-20 16:14:40.957174	t
119	107376.0	Locataire	Amexpert	\N	nowak sylvie	test@gmail.com	675337250	\N	2021-02-20 16:14:40.983158	t
120	107023.0	Locataire	Amexpert	\N	pennard elric	test@gmail.com	675337250	\N	2021-02-20 16:14:41.011146	t
121	107386.0	Locataire	Amexpert	\N	cauchie et gaussin stephane	test@gmail.com	675337250	\N	2021-02-20 16:14:41.040123	t
122	107384.0	Locataire	Amexpert	\N	pean jade	test@gmail.com	675337250	\N	2021-02-20 16:14:41.066112	t
123	107452.0	Locataire	Amexpert	\N	serin chloe	test@gmail.com	675337250	\N	2021-02-20 16:14:41.093094	t
124	107455.0	Locataire	Amexpert	\N	issorat nathalie	test@gmail.com	675337250	\N	2021-02-20 16:14:41.130074	t
125	94523.0	Locataire	Amexpert	\N	marcelo ines	test@gmail.com	675337250	\N	2021-02-20 16:14:41.157058	t
126	107470.0	Locataire	Amexpert	\N	haquin paul	test@gmail.com	675337250	\N	2021-02-20 16:14:41.249009	t
127	107471.0	Locataire	Amexpert	\N	legout marine	test@gmail.com	675337250	\N	2021-02-20 16:14:41.270994	t
128	107472.0	Locataire	Amexpert	\N	ramee - behary laul sirder marie therese - gabrielle	test@gmail.com	675337250	\N	2021-02-20 16:14:41.289983	t
129	107476.0	Locataire	Amexpert	\N	dahaoui sabri	test@gmail.com	675337250	\N	2021-02-20 16:14:41.311971	t
130	107479.0	Locataire	Amexpert	\N	duveau caroline	test@gmail.com	675337250	\N	2021-02-20 16:14:41.332956	t
131	107482.0	Locataire	Amexpert	\N	bruneteau vincent	test@gmail.com	675337250	\N	2021-02-20 16:14:41.354946	t
132	101568.0	Locataire	Amexpert	\N	trichet  chloe	test@gmail.com	675337250	\N	2021-02-20 16:14:41.377934	t
133	107483.0	Locataire	Amexpert	\N	cottin helene	test@gmail.com	675337250	\N	2021-02-20 16:14:41.398921	t
134	107484.0	Locataire	Amexpert	\N	mironneau carla	test@gmail.com	675337250	\N	2021-02-20 16:14:41.436897	t
135	107459.0	Locataire	Amexpert	\N	donadoni matteo	test@gmail.com	675337250	\N	2021-02-20 16:14:41.455887	t
136	107494.0	Locataire	Amexpert	\N	 nespola - delamarche lou - anne / jennyfer	test@gmail.com	675337250	\N	2021-02-20 16:14:41.477876	t
137	107363.0	Locataire	Amexpert	\N	fiacre - foezon rafael - baptiste	test@gmail.com	675337250	\N	2021-02-20 16:14:41.495867	t
138	107499.0	Locataire	Amexpert	\N	lorieu jimmy	test@gmail.com	675337250	\N	2021-02-20 16:14:41.517851	t
139	36751.0	Locataire	Amexpert	\N	cabirol josiane et patrice	test@gmail.com	675337250	\N	2021-02-20 16:14:41.53884	t
140	107027.0	Locataire	Amexpert	\N	barnes ellen	test@gmail.com	675337250	\N	2021-02-20 16:14:41.558828	t
141	107552.0	Locataire	Amexpert	\N	opsomer maureen	test@gmail.com	675337250	\N	2021-02-20 16:14:41.57682	t
142	107596.0	Locataire	Amexpert	\N	paradis martin	test@gmail.com	675337250	\N	2021-02-20 16:14:41.595807	t
143	107597.0	Locataire	Amexpert	\N	gauffre melanie	test@gmail.com	675337250	\N	2021-02-20 16:14:41.616795	t
144	80681.0	Locataire	Amexpert	\N	dupuis caroline	test@gmail.com	675337250	\N	2021-02-20 16:14:41.636785	t
145	107635.0	Locataire	Amexpert	\N	mondelot marie-agnes	test@gmail.com	675337250	\N	2021-02-20 16:14:41.657772	t
146	107592.0	Locataire	Amexpert	\N	ducouret mathieu	test@gmail.com	675337250	\N	2021-02-20 16:14:41.677762	t
147	107690.0	Locataire	Amexpert	\N	dupuis - rivron cindy - jeremy	test@gmail.com	675337250	\N	2021-02-20 16:14:41.69875	t
148	107017.0	Locataire	Amexpert	\N	cherif  samir	test@gmail.com	675337250	\N	2021-02-20 16:14:41.719735	t
149	107695.0	Locataire	Amexpert	\N	maillet anne-emmanuelle	test@gmail.com	675337250	\N	2021-02-20 16:14:41.738725	t
150	107725.0	Locataire	Amexpert	\N	sco rugby mr delbart	test@gmail.com	675337250	\N	2021-02-20 16:14:41.757715	t
151	107726.0	Locataire	Amexpert	\N	averseng damien	test@gmail.com	675337250	\N	2021-02-20 16:14:41.781703	t
152	107728.0	Locataire	Amexpert	\N	joubert thimothee	test@gmail.com	675337250	\N	2021-02-20 16:14:41.801691	t
153	107025.0	Locataire	Amexpert	\N	pettre canelle	test@gmail.com	675337250	\N	2021-02-20 16:14:41.820678	t
154	107756.0	Locataire	Amexpert	\N	juin loan	test@gmail.com	675337250	\N	2021-02-20 16:14:41.840666	t
155	107764.0	Locataire	Amexpert	\N	briland-couet ludovic-elise	test@gmail.com	675337250	\N	2021-02-20 16:14:41.861658	t
156	107765.0	Locataire	Amexpert	\N	bigeard-berthaudeau ines-ines	test@gmail.com	675337250	\N	2021-02-20 16:14:41.884645	t
157	107749.0	Locataire	Amexpert	\N	pauvert kentin	test@gmail.com	675337250	\N	2021-02-20 16:14:41.904632	t
158	107832.0	Locataire	Amexpert	\N	seniow antoine	test@gmail.com	675337250	\N	2021-02-20 16:14:41.925621	t
159	96181.0	Locataire	Amexpert	\N	charrier theo	test@gmail.com	675337250	\N	2021-02-20 16:14:41.947606	t
160	107855.0	Locataire	Amexpert	\N	da cunha tony	test@gmail.com	675337250	\N	2021-02-20 16:14:41.969595	t
161	107856.0	Locataire	Amexpert	\N	chasle marie-therese	test@gmail.com	675337250	\N	2021-02-20 16:14:41.989582	t
162	107857.0	Locataire	Amexpert	\N	legendre erwan	test@gmail.com	675337250	\N	2021-02-20 16:14:42.010572	t
163	107858.0	Locataire	Amexpert	\N	lupi alexia	test@gmail.com	675337250	\N	2021-02-20 16:14:42.032559	t
164	107859.0	Locataire	Amexpert	\N	guicheteau-hudon kevin-tiffany	test@gmail.com	675337250	\N	2021-02-20 16:14:42.055546	t
165	107894.0	Locataire	Amexpert	\N	gauteul christopher	test@gmail.com	675337250	\N	2021-02-20 16:14:42.074535	t
166	107896.0	Locataire	Amexpert	\N	maes emilie	test@gmail.com	675337250	\N	2021-02-20 16:14:42.095523	t
167	102823.0	Locataire	Amexpert	\N	pannetier-denoual herve-sylvie	test@gmail.com	675337250	\N	2021-02-20 16:14:42.116511	t
168	107788.0	Locataire	Amexpert	\N	carie thibaud	test@gmail.com	675337250	\N	2021-02-20 16:14:42.1345	t
169	107905.0	Locataire	Amexpert	\N	guianvarc'h justine	test@gmail.com	675337250	\N	2021-02-20 16:14:42.155489	t
170	107899.0	Locataire	Amexpert	\N	joineau arnaud	test@gmail.com	675337250	\N	2021-02-20 16:14:42.186473	t
171	107901.0	Locataire	Amexpert	\N	boigne cindy plasson francois	test@gmail.com	675337250	\N	2021-02-20 16:14:42.212455	t
172	107931.0	Locataire	Amexpert	\N	lemenager franck	test@gmail.com	675337250	\N	2021-02-20 16:14:42.239439	t
173	107933.0	Locataire	Amexpert	\N	oganessova tabatha - elea	test@gmail.com	675337250	\N	2021-02-20 16:14:42.267424	t
174	107934.0	Locataire	Amexpert	\N	audren - tessier charlyne - mathis	test@gmail.com	675337250	\N	2021-02-20 16:14:42.293408	t
175	107936.0	Locataire	Amexpert	\N	dardenne-dejoie vincent- joanne	test@gmail.com	675337250	\N	2021-02-20 16:14:42.322396	t
176	107937.0	Locataire	Amexpert	\N	joel - patricia 	test@gmail.com	675337250	\N	2021-02-20 16:14:42.352378	t
177	107938.0	Locataire	Amexpert	\N	rethore thomas	test@gmail.com	675337250	\N	2021-02-20 16:14:42.385357	t
178	107939.0	Locataire	Amexpert	\N	cauchy romain	test@gmail.com	675337250	\N	2021-02-20 16:14:42.41134	t
179	107903.0	Locataire	Amexpert	\N	roynard gaelle	test@gmail.com	675337250	\N	2021-02-20 16:14:42.445321	t
180	107974.0	Locataire	Amexpert	\N	allard karen	test@gmail.com	675337250	\N	2021-02-20 16:14:42.471306	t
181	73653.0	Locataire	Amexpert	\N	chambiron nicolas	test@gmail.com	675337250	\N	2021-02-20 16:14:42.500294	t
182	107984.0	Locataire	Amexpert	\N	talbot ingrid	test@gmail.com	675337250	\N	2021-02-20 16:14:42.526277	t
183	107977.0	Locataire	Amexpert	\N	greaume belinda	test@gmail.com	675337250	\N	2021-02-20 16:14:42.556263	t
184	107981.0	Locataire	Amexpert	\N	gabrovsek clara	test@gmail.com	675337250	\N	2021-02-20 16:14:42.581243	t
185	98216.0	Locataire	Amexpert	\N	redon coline	test@gmail.com	675337250	\N	2021-02-20 16:14:42.603233	t
186	108026.0	Locataire	Amexpert	\N	aubert patricia	test@gmail.com	675337250	\N	2021-02-20 16:14:42.628217	t
187	108027.0	Locataire	Amexpert	\N	el achchab helene	test@gmail.com	675337250	\N	2021-02-20 16:14:42.651204	t
188	108083.0	Locataire	Amexpert	\N	belliard nicolas	test@gmail.com	675337250	\N	2021-02-20 16:14:42.670195	t
189	108084.0	Locataire	Amexpert	\N	karmowski mathieu	test@gmail.com	675337250	\N	2021-02-20 16:14:42.689184	t
190	108085.0	Locataire	Amexpert	\N	guerrier manon	test@gmail.com	675337250	\N	2021-02-20 16:14:42.70917	t
191	97351.0	Locataire	Amexpert	\N	stene lucas	test@gmail.com	675337250	\N	2021-02-20 16:14:42.736156	t
192	108112.0	Locataire	Amexpert	\N	hypeau jacques	test@gmail.com	675337250	\N	2021-02-20 16:14:42.756143	t
193	108115.0	Locataire	Amexpert	\N	meunier etienne	test@gmail.com	675337250	\N	2021-02-20 16:14:42.776132	t
194	108116.0	Locataire	Amexpert	\N	bizon leo	test@gmail.com	675337250	\N	2021-02-20 16:14:42.795123	t
195	107983.0	Locataire	Amexpert	\N	gendry remi	test@gmail.com	675337250	\N	2021-02-20 16:14:42.818112	t
196	108124.0	Locataire	Amexpert	\N	lair camille	test@gmail.com	675337250	\N	2021-02-20 16:14:42.841096	t
197	15902.0	Locataire	Amexpert	\N	gouzy mathieu	test@gmail.com	675337250	\N	2021-02-20 16:14:42.860084	t
198	108052.0	Locataire	Amexpert	\N	dumont juliette	test@gmail.com	675337250	\N	2021-02-20 16:14:42.880072	t
199	53998.0	Locataire	Amexpert	\N	chauveau nathan 	test@gmail.com	675337250	\N	2021-02-20 16:14:42.901062	t
200	108175.0	Locataire	Amexpert	\N	batut heloise	test@gmail.com	675337250	\N	2021-02-20 16:14:42.920052	t
201	108211.0	Locataire	Amexpert	\N	pommereau david	test@gmail.com	675337250	\N	2021-02-20 16:14:42.943037	t
202	108212.0	Locataire	Amexpert	\N	bautier solene	test@gmail.com	675337250	\N	2021-02-20 16:14:42.965025	t
203	108213.0	Locataire	Amexpert	\N	monsanglant melanie	test@gmail.com	675337250	\N	2021-02-20 16:14:42.986015	t
204	108214.0	Locataire	Amexpert	\N	herisset - chevrier theo - felix	test@gmail.com	675337250	\N	2021-02-20 16:14:43.005003	t
205	106466.0	Locataire	Amexpert	\N	sarron nicolas	test@gmail.com	675337250	\N	2021-02-20 16:14:43.024996	t
206	108215.0	Locataire	Amexpert	\N	moreau-choquet zenon-pauline	test@gmail.com	675337250	\N	2021-02-20 16:14:43.043979	t
207	108216.0	Locataire	Amexpert	\N	maton alix	test@gmail.com	675337250	\N	2021-02-20 16:14:43.065966	t
208	108126.0	Locataire	Amexpert	\N	besnier thomas	test@gmail.com	675337250	\N	2021-02-20 16:14:43.086957	t
209	96613.0	Locataire	Amexpert	\N	levard solene	test@gmail.com	675337250	\N	2021-02-20 16:14:43.104947	t
210	108270.0	Locataire	Amexpert	\N	joly sophie	test@gmail.com	675337250	\N	2021-02-20 16:14:43.123934	t
211	108271.0	Locataire	Amexpert	\N	borde christopher	test@gmail.com	675337250	\N	2021-02-20 16:14:43.145925	t
212	108263.0	Locataire	Amexpert	\N	hamm eliot	test@gmail.com	675337250	\N	2021-02-20 16:14:43.352802	t
213	71074.0	Locataire	Amexpert	\N	bigot_schwarz benoit_eva	test@gmail.com	675337250	\N	2021-02-20 16:14:43.396781	t
214	73952.0	Locataire	Amexpert	\N	denis amandine	test@gmail.com	675337250	\N	2021-02-20 16:14:43.416766	t
215	84692.0	Locataire	Amexpert	\N	garreau thomas	test@gmail.com	675337250	\N	2021-02-20 16:14:43.439755	t
216	108315.0	Locataire	Amexpert	\N	gauquelin delphine	test@gmail.com	675337250	\N	2021-02-20 16:14:43.45974	t
217	108317.0	Locataire	Amexpert	\N	huyghe - ede 	test@gmail.com	675337250	\N	2021-02-20 16:14:43.479731	t
218	108318.0	Locataire	Amexpert	\N	menuet jean pierre - genevieve	test@gmail.com	675337250	\N	2021-02-20 16:14:43.499723	t
219	88275.0	Locataire	Amexpert	\N	raffara jean	test@gmail.com	675337250	\N	2021-02-20 16:14:43.522705	t
220	108258.0	Locataire	Amexpert	\N	delayre julien	test@gmail.com	675337250	\N	2021-02-20 16:14:43.542693	t
221	108260.0	Locataire	Amexpert	\N	chevalier marie	test@gmail.com	675337250	\N	2021-02-20 16:14:43.57068	t
222	108353.0	Locataire	Amexpert	\N	garreau  estelle	test@gmail.com	675337250	\N	2021-02-20 16:14:43.602659	t
223	108423.0	Locataire	Amexpert	\N	baudry - romero guillaume	test@gmail.com	675337250	\N	2021-02-20 16:14:43.630645	t
224	99113.0	Locataire	Amexpert	\N	ferron clemence	test@gmail.com	675337250	\N	2021-02-20 16:14:43.656632	t
225	71161.0	Locataire	Amexpert	\N	gabard alexandre	test@gmail.com	675337250	\N	2021-02-20 16:14:43.685612	t
226	108427.0	Locataire	Amexpert	\N	gilbert eva	test@gmail.com	675337250	\N	2021-02-20 16:14:43.715595	t
227	108431.0	Locataire	Amexpert	\N	golab et meat frederic  aurelie	test@gmail.com	675337250	\N	2021-02-20 16:14:43.741582	t
228	75493.0	Locataire	Amexpert	\N	choisne morgann	test@gmail.com	675337250	\N	2021-02-20 16:14:43.838525	t
229	108438.0	Locataire	Amexpert	\N	neau elza	test@gmail.com	675337250	\N	2021-02-20 16:14:43.915484	t
230	88535.0	Locataire	Amexpert	\N	louboutin antoine	test@gmail.com	675337250	\N	2021-02-20 16:14:43.939466	t
231	108457.0	Locataire	Amexpert	\N	dexet nathan	test@gmail.com	675337250	\N	2021-02-20 16:14:43.958455	t
232	93633.0	Locataire	Amexpert	\N	moysan marie	test@gmail.com	675337250	\N	2021-02-20 16:14:43.980444	t
233	108458.0	Locataire	Amexpert	\N	julienne - moreau maxence	test@gmail.com	675337250	\N	2021-02-20 16:14:44.00243	t
234	108218.0	Locataire	Amexpert	\N	pardelinha dylan	test@gmail.com	675337250	\N	2021-02-20 16:14:44.02342	t
235	108488.0	Locataire	Amexpert	\N	jegat vicent	test@gmail.com	675337250	\N	2021-02-20 16:14:44.046406	t
236	108552.0	Locataire	Amexpert	\N	sabardin christian-marie france	test@gmail.com	675337250	\N	2021-02-20 16:14:44.068392	t
237	70748.0	Locataire	Amexpert	\N	duret alexis	test@gmail.com	675337250	\N	2021-02-20 16:14:44.088384	t
238	100661.0	Locataire	Amexpert	\N	gravouille justine	test@gmail.com	675337250	\N	2021-02-20 16:14:44.11137	t
239	94904.0	Locataire	Amexpert	\N	navel clovis	test@gmail.com	675337250	\N	2021-02-20 16:14:44.143351	t
240	108553.0	Locataire	Amexpert	\N	strumeyer sophie	test@gmail.com	675337250	\N	2021-02-20 16:14:44.168339	t
241	108554.0	Locataire	Amexpert	\N	beasse jean-francois	test@gmail.com	675337250	\N	2021-02-20 16:14:44.190323	t
242	107081.0	Locataire	Amexpert	\N	froustey anthony	test@gmail.com	675337250	\N	2021-02-20 16:14:44.218308	t
243	107082.0	Locataire	Amexpert	\N	delrieu romain	test@gmail.com	675337250	\N	2021-02-20 16:14:44.238296	t
244	107145.0	Locataire	Amexpert	\N	gata laurine	test@gmail.com	675337250	\N	2021-02-20 16:14:44.257288	t
245	107186.0	Locataire	Amexpert	\N	riviere laure	test@gmail.com	675337250	\N	2021-02-20 16:14:44.277277	t
246	107558.0	Locataire	Amexpert	\N	sarrazin patrick	test@gmail.com	675337250	\N	2021-02-20 16:14:44.300261	t
247	107575.0	Locataire	Amexpert	\N	braud martin	test@gmail.com	675337250	\N	2021-02-20 16:14:44.318251	t
248	107822.0	Locataire	Amexpert	\N	bergeon daksha	test@gmail.com	675337250	\N	2021-02-20 16:14:44.349233	t
249	108092.0	Locataire	Amexpert	\N	baldovini et lacouture david et bastien	test@gmail.com	675337250	\N	2021-02-20 16:14:44.36922	t
250	108140.0	Locataire	Amexpert	\N	magnat ludivine	test@gmail.com	675337250	\N	2021-02-20 16:14:44.388211	t
251	108141.0	Locataire	Amexpert	\N	djani faouzi	test@gmail.com	675337250	\N	2021-02-20 16:14:44.410199	t
252	108226.0	Locataire	Amexpert	\N	olmedo thomas	test@gmail.com	675337250	\N	2021-02-20 16:14:44.432185	t
253	108322.0	Locataire	Amexpert	\N	dijoux louna	test@gmail.com	675337250	\N	2021-02-20 16:14:44.457172	t
254	108464.0	Locataire	Amexpert	\N	liccioni elena	test@gmail.com	675337250	\N	2021-02-20 16:14:44.481158	t
255	108504.0	Locataire	Amexpert	\N	guillemin et combret philippe et aurélie	test@gmail.com	675337250	\N	2021-02-20 16:14:44.502145	t
256	108507.0	Locataire	Amexpert	\N	salecroix caroline	test@gmail.com	675337250	\N	2021-02-20 16:14:44.523135	t
257	107162.0	Locataire	Amexpert	\N	le bars  simon	test@gmail.com	675337250	\N	2021-02-20 16:14:44.586099	t
258	107164.0	Locataire	Amexpert	\N	barre marion	test@gmail.com	675337250	\N	2021-02-20 16:14:44.605087	t
259	107165.0	Locataire	Amexpert	\N	audran louison	test@gmail.com	675337250	\N	2021-02-20 16:14:44.624078	t
260	107205.0	Locataire	Amexpert	\N	levieux alexendre	test@gmail.com	675337250	\N	2021-02-20 16:14:44.648064	t
261	107457.0	Locataire	Amexpert	\N	le breton et amiaux florent et honoré	test@gmail.com	675337250	\N	2021-02-20 16:14:44.668049	t
262	107461.0	Locataire	Amexpert	\N	le roi juliette	test@gmail.com	675337250	\N	2021-02-20 16:14:44.687043	t
263	107463.0	Locataire	Amexpert	\N	martin sophie	test@gmail.com	675337250	\N	2021-02-20 16:14:44.711025	t
264	107641.0	Locataire	Amexpert	\N	duroudier / ribeiro julie  florian	test@gmail.com	675337250	\N	2021-02-20 16:14:44.733013	t
265	107643.0	Locataire	Amexpert	\N	renouard styliann	test@gmail.com	675337250	\N	2021-02-20 16:14:44.752004	t
266	107644.0	Locataire	Amexpert	\N	moal thomas	test@gmail.com	675337250	\N	2021-02-20 16:14:44.773991	t
267	107645.0	Locataire	Amexpert	\N	louvet tricoire sylvain	test@gmail.com	675337250	\N	2021-02-20 16:14:44.796979	t
268	107834.0	Locataire	Amexpert	\N	toudic  vaslet melvyn  yann	test@gmail.com	675337250	\N	2021-02-20 16:14:44.820965	t
269	107837.0	Locataire	Amexpert	\N	nour drevillon latifa	test@gmail.com	675337250	\N	2021-02-20 16:14:44.844951	t
270	107838.0	Locataire	Amexpert	\N	martin samuel	test@gmail.com	675337250	\N	2021-02-20 16:14:44.870936	t
271	107910.0	Locataire	Amexpert	\N	brieux juliana	test@gmail.com	675337250	\N	2021-02-20 16:14:44.89592	t
272	107912.0	Locataire	Amexpert	\N	favier celine  robert	test@gmail.com	675337250	\N	2021-02-20 16:14:44.924904	t
273	108060.0	Locataire	Amexpert	\N	corre et roussel philippe et joelle	test@gmail.com	675337250	\N	2021-02-20 16:14:44.95689	t
274	108062.0	Locataire	Amexpert	\N	 malet alexandre	test@gmail.com	675337250	\N	2021-02-20 16:14:44.983873	t
275	108063.0	Locataire	Amexpert	\N	lanos et balannec mathias et pierre	test@gmail.com	675337250	\N	2021-02-20 16:14:45.008856	t
276	108064.0	Locataire	Amexpert	\N	doussin emerique	test@gmail.com	675337250	\N	2021-02-20 16:14:45.035845	t
277	108066.0	Locataire	Amexpert	\N	bourdoulous et bergugnat elodie et anthony	test@gmail.com	675337250	\N	2021-02-20 16:14:45.086816	t
278	108082.0	Locataire	Amexpert	\N	volantin  deborah	test@gmail.com	675337250	\N	2021-02-20 16:14:45.111796	t
279	108223.0	Locataire	Amexpert	\N	pazos canedo maëva sandrine	test@gmail.com	675337250	\N	2021-02-20 16:14:45.140782	t
280	108225.0	Locataire	Amexpert	\N	le moal lémuel	test@gmail.com	675337250	\N	2021-02-20 16:14:45.168767	t
281	108238.0	Locataire	Amexpert	\N	roussel theo	test@gmail.com	675337250	\N	2021-02-20 16:14:45.198748	t
282	108462.0	Locataire	Amexpert	\N	bouchet  oceane	test@gmail.com	675337250	\N	2021-02-20 16:14:45.238724	t
283	108463.0	Locataire	Amexpert	\N	graille sarah	test@gmail.com	675337250	\N	2021-02-20 16:14:45.262711	t
284	108544.0	Locataire	Amexpert	\N	michaud sylvain	test@gmail.com	675337250	\N	2021-02-20 16:14:45.284697	t
285	108546.0	Locataire	Amexpert	\N	ambroise pascal	test@gmail.com	675337250	\N	2021-02-20 16:14:45.305688	t
286	108548.0	Locataire	Amexpert	\N	iquel sébastien	test@gmail.com	675337250	\N	2021-02-20 16:14:45.328674	t
287	108550.0	Locataire	Amexpert	\N	beauchamp audrey	test@gmail.com	675337250	\N	2021-02-20 16:14:45.357658	t
288	108551.0	Locataire	Amexpert	\N	le cossec et depail stéphanie et alexandre	test@gmail.com	675337250	\N	2021-02-20 16:14:45.376647	t
289	107326.0	Locataire	Amexpert	\N	quelard maud	test@gmail.com	675337250	\N	2021-02-20 16:14:45.398633	t
290	107351.0	Locataire	Amexpert	\N	blondel maxime	test@gmail.com	675337250	\N	2021-02-20 16:14:45.418623	t
291	107495.0	Locataire	Amexpert	\N	frouin maxime	test@gmail.com	675337250	\N	2021-02-20 16:14:45.439609	t
292	107639.0	Locataire	Amexpert	\N	thomas ludovic	test@gmail.com	675337250	\N	2021-02-20 16:14:45.459599	t
293	107914.0	Locataire	Amexpert	\N	bernard thomas	test@gmail.com	675337250	\N	2021-02-20 16:14:45.477587	t
294	108046.0	Locataire	Amexpert	\N	puchala morgane	test@gmail.com	675337250	\N	2021-02-20 16:14:45.498575	t
295	108049.0	Locataire	Amexpert	\N	bousquet lucas	test@gmail.com	675337250	\N	2021-02-20 16:14:45.519563	t
296	108240.0	Locataire	Amexpert	\N	chereau vincent	test@gmail.com	675337250	\N	2021-02-20 16:14:45.539552	t
297	108252.0	Locataire	Amexpert	\N	gueho marine	test@gmail.com	675337250	\N	2021-02-20 16:14:45.560541	t
298	108428.0	Locataire	Amexpert	\N	de bonfils lavernelle guillemette	test@gmail.com	675337250	\N	2021-02-20 16:14:45.582527	t
299	108429.0	Locataire	Amexpert	\N	cavalier tanguy	test@gmail.com	675337250	\N	2021-02-20 16:14:45.602518	t
300	108432.0	Locataire	Amexpert	\N	buteau-herve robin oscar	test@gmail.com	675337250	\N	2021-02-20 16:14:45.621507	t
301	107241.0	Locataire	Amexpert	\N	gomes papa	test@gmail.com	675337250	\N	2021-02-20 16:14:45.644493	t
302	107336.0	Locataire	Amexpert	\N	gillery sarah	test@gmail.com	675337250	\N	2021-02-20 16:14:45.665482	t
303	107440.0	Locataire	Amexpert	\N	dupre olivier	test@gmail.com	675337250	\N	2021-02-20 16:14:45.68347	t
304	107239.0	Locataire	Amexpert	\N	baaklini elie	test@gmail.com	675337250	\N	2021-02-20 16:14:45.703458	t
305	107624.0	Locataire	Amexpert	\N	chabane et boria malik et gaelle	test@gmail.com	675337250	\N	2021-02-20 16:14:45.723447	t
306	107668.0	Locataire	Amexpert	\N	mazoir rida / sabrina	test@gmail.com	675337250	\N	2021-02-20 16:14:45.744439	t
307	107670.0	Locataire	Amexpert	\N	varela vanessa	test@gmail.com	675337250	\N	2021-02-20 16:14:45.768423	t
308	107674.0	Locataire	Amexpert	\N	baaklini elie	test@gmail.com	675337250	\N	2021-02-20 16:14:45.79141	t
309	107850.0	Locataire	Amexpert	\N	grezanle maxime	test@gmail.com	675337250	\N	2021-02-20 16:14:45.810398	t
310	108037.0	Locataire	Amexpert	\N	amonfo guifty	test@gmail.com	675337250	\N	2021-02-20 16:14:45.830388	t
311	108071.0	Locataire	Amexpert	\N	rodrigues dos reis maria	test@gmail.com	675337250	\N	2021-02-20 16:14:45.851376	t
312	108286.0	Locataire	Amexpert	\N	vancayzeele ophelie	test@gmail.com	675337250	\N	2021-02-20 16:14:45.871362	t
313	108376.0	Locataire	Amexpert	\N	faguet  jules	test@gmail.com	675337250	\N	2021-02-20 16:14:45.897348	t
314	108381.0	Locataire	Amexpert	\N	mercuri enzo	test@gmail.com	675337250	\N	2021-02-20 16:14:45.922332	t
315	108392.0	Locataire	Amexpert	\N	dreux isabelle	test@gmail.com	675337250	\N	2021-02-20 16:14:45.943325	t
316	108394.0	Locataire	Amexpert	\N	juggeta aurelie	test@gmail.com	675337250	\N	2021-02-20 16:14:45.964311	t
317	75450.0	Locataire	Amexpert	\N	bonneau  maude ; germain pierre	test@gmail.com	675337250	\N	2021-02-20 16:14:45.987295	t
318	107389.0	Locataire	Amexpert	\N	boutillier stephanie	test@gmail.com	675337250	\N	2021-02-20 16:14:46.006286	t
319	107976.0	Locataire	Amexpert	\N	mace de gastines gabriel et candice	test@gmail.com	675337250	\N	2021-02-20 16:14:46.027273	t
320	108076.0	Locataire	Amexpert	\N	guerault franck	test@gmail.com	675337250	\N	2021-02-20 16:14:46.048262	t
321	108160.0	Locataire	Amexpert	\N	claisse lucie	test@gmail.com	675337250	\N	2021-02-20 16:14:46.068251	t
322	108220.0	Locataire	Amexpert	\N	zimmer gianni ; turcaud auxane	test@gmail.com	675337250	\N	2021-02-20 16:14:46.090238	t
323	70257.0	Locataire	Amexpert	\N	wiplier loic et eloise	test@gmail.com	675337250	\N	2021-02-20 16:14:46.109227	t
324	78634.0	Locataire	Amexpert	\N	rabreau karine	test@gmail.com	675337250	\N	2021-02-20 16:14:46.128215	t
325	108360.0	Locataire	Amexpert	\N	moriniere pierre ; de cathelineau marie	test@gmail.com	675337250	\N	2021-02-20 16:14:46.150202	t
326	108362.0	Locataire	Amexpert	\N	hugel adrien	test@gmail.com	675337250	\N	2021-02-20 16:14:46.173191	t
327	64624.0	Locataire	Amexpert	\N	lamy etienne	test@gmail.com	675337250	\N	2021-02-20 16:14:46.196177	t
328	108365.0	Locataire	Amexpert	\N	gregorio quentin ; mannoury margaux	test@gmail.com	675337250	\N	2021-02-20 16:14:46.217168	t
329	107999.0	Locataire	Amexpert	\N	dumottier martin	test@gmail.com	675337250	\N	2021-02-20 16:14:46.24515	t
330	108003.0	Locataire	Amexpert	\N	delattre theo	test@gmail.com	675337250	\N	2021-02-20 16:14:46.271136	t
331	108154.0	Locataire	Amexpert	\N	rousseau  micheline et roger	test@gmail.com	675337250	\N	2021-02-20 16:14:46.300117	t
332	76187.0	Locataire	Amexpert	\N	bachelet_oliveira aurelie_julien	test@gmail.com	675337250	\N	2021-02-20 16:14:46.328101	t
333	108186.0	Locataire	Amexpert	\N	viau michael	test@gmail.com	675337250	\N	2021-02-20 16:14:46.355085	t
334	108265.0	Locataire	Amexpert	\N	heurtault capucine	test@gmail.com	675337250	\N	2021-02-20 16:14:46.383071	t
335	108370.0	Locataire	Amexpert	\N	kozohorsky corentin ; nicoleau marie-melanie	test@gmail.com	675337250	\N	2021-02-20 16:14:46.411056	t
336	108364.0	Locataire	Amexpert	\N	leblond geoffroy	test@gmail.com	675337250	\N	2021-02-20 16:14:46.449032	t
337	93239.0	Locataire	Amexpert	\N	oumanetz/ andre damien et aurore	test@gmail.com	675337250	\N	2021-02-20 16:14:46.475018	t
338	108542.0	Locataire	Amexpert	\N	vezin ariane ; beneteau clement	test@gmail.com	675337250	\N	2021-02-20 16:14:46.501003	t
339	107238.0	Locataire	Amexpert	\N	feron et chane thieng alexandre et laure	test@gmail.com	675337250	\N	2021-02-20 16:14:46.526987	t
340	107439.0	Locataire	Amexpert	\N	institut international aksur  represente par m jacques melot	test@gmail.com	675337250	\N	2021-02-20 16:14:46.56097	t
341	107614.0	Locataire	Amexpert	\N	fofana - gaiguant sekou junior - coline	test@gmail.com	675337250	\N	2021-02-20 16:14:46.586954	t
342	107681.0	Locataire	Amexpert	\N	cettier et huret joane et benoît	test@gmail.com	675337250	\N	2021-02-20 16:14:46.610941	t
343	107435.0	Locataire	Amexpert	\N	makhroub et triolet léa et mallaury	test@gmail.com	675337250	\N	2021-02-20 16:14:46.62993	t
344	107791.0	Locataire	Amexpert	\N	saussereau teddy	test@gmail.com	675337250	\N	2021-02-20 16:14:46.650918	t
345	108068.0	Locataire	Amexpert	\N	coureur et bouchet françois-xavier et kévin	test@gmail.com	675337250	\N	2021-02-20 16:14:46.697891	t
346	108352.0	Locataire	Amexpert	\N	de nascimento célia	test@gmail.com	675337250	\N	2021-02-20 16:14:46.721876	t
347	108386.0	Locataire	Amexpert	\N	dupagne julien	test@gmail.com	675337250	\N	2021-02-20 16:14:46.741866	t
348	108388.0	Locataire	Amexpert	\N	dominguez garcia et diaz perez fabiola et juan carlos	test@gmail.com	675337250	\N	2021-02-20 16:14:46.759856	t
349	108390.0	Locataire	Amexpert	\N	laures  anne	test@gmail.com	675337250	\N	2021-02-20 16:14:46.827817	t
350	108383.0	Locataire	Amexpert	\N	cler et llau adrien et leslie	test@gmail.com	675337250	\N	2021-02-20 16:14:46.849804	t
351	108384.0	Locataire	Amexpert	\N	laborie et napolitano florian et sarah	test@gmail.com	675337250	\N	2021-02-20 16:14:46.872792	t
352	107444.0	Locataire	Amexpert	\N	silva mathieu et eve anne	test@gmail.com	675337250	\N	2021-02-20 16:14:46.893788	t
353	107573.0	Locataire	Amexpert	\N	martin et leveque thomas et camille	test@gmail.com	675337250	\N	2021-02-20 16:14:46.916766	t
354	107781.0	Locataire	Amexpert	\N	amourous brigitte	test@gmail.com	675337250	\N	2021-02-20 16:14:46.934759	t
355	107783.0	Locataire	Amexpert	\N	perrin domergue myriam	test@gmail.com	675337250	\N	2021-02-20 16:14:46.959739	t
356	107821.0	Locataire	Amexpert	\N	iriarte claire	test@gmail.com	675337250	\N	2021-02-20 16:14:46.988723	t
357	107848.0	Locataire	Amexpert	\N	dumonteil maureen	test@gmail.com	675337250	\N	2021-02-20 16:14:47.0327	t
358	107935.0	Locataire	Amexpert	\N	gianelli angelique	test@gmail.com	675337250	\N	2021-02-20 16:14:47.055684	t
\.


--
-- Data for Name: prospect_History; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."prospect_History" (id, prospect, adresse, cp, ville, pays, etat_client, date, visibility) FROM stdin;
1	1	48  RUE DE PASSY 	75016.0	PARIS	Britain	true	2021-02-20 16:14:38.292694	t
2	2	 35 RUE VICTOR DURUY	75015.0	PARIS	Britain	true	2021-02-20 16:14:38.32168	t
3	3	 38 RUE SAINT LAMBERT	75015.0	PARIS 	Britain	true	2021-02-20 16:14:38.346666	t
4	4	 65 RUE DULONG	75017.0	PARIS	Britain	true	2021-02-20 16:14:38.376647	t
5	5	 13 RUE GALVANI	75017.0	PARIS	Britain	true	2021-02-20 16:14:38.404631	t
6	6	 19 RUE DE BOULAINVILLIERS	75018.0	PARIS	Britain	true	2021-02-20 16:14:38.429617	t
7	7	 254 RUE LECOURBE	75015.0	PARIS	Britain	true	2021-02-20 16:14:38.453603	t
8	8	 254 RUE LECOURBE	75015.0	PARIS	Britain	true	2021-02-20 16:14:38.475599	t
9	9	 3 RUE MALASSIS	75015.0	PARIS	Britain	true	2021-02-20 16:14:38.51557	t
10	10	221 RUE DE LA CONVENTION	75015.0	PARIS	Britain	true	2021-02-20 16:14:38.539557	t
11	11	 21 RUE DES MORILLONS	75015.0	PARIS	Britain	true	2021-02-20 16:14:38.560542	t
12	12	38 RUE SAINT LAURENT	75015.0	PARIS	Britain	true	2021-02-20 16:14:38.588528	t
13	13	48 RUE MATHURIN REGNIER	75015.0	PARIS	Britain	true	2021-02-20 16:14:38.607517	t
14	14	 16 RUE LEON JOST	75017.0	PARIS	Britain	true	2021-02-20 16:14:38.627504	t
15	15	 56 RUE SANTOS-DUMONT	75015.0	PARIS	Britain	true	2021-02-20 16:14:38.649492	t
16	16	 9 RUE OZWALDO CRUZ	75016.0	PARIS	Britain	true	2021-02-20 16:14:38.668484	t
17	17	3 PLACE JACQUES MARETTE	75015.0	PARIS	Britain	true	2021-02-20 16:14:38.688472	t
18	18	 26 RUE OLIVIER DE SERRES	75015.0	PARIS	Britain	true	2021-02-20 16:14:38.708457	t
19	19	 13 RUE GALVANI	75017.0	PARIS	Britain	true	2021-02-20 16:14:38.727447	t
20	20	 15 RUE CRONSTADT	75015.0	PARIS	Britain	true	2021-02-20 16:14:38.747434	t
21	21	 77 RUE BRILLAT SAVARIN	75013.0	PARIS	Britain	true	2021-02-20 16:14:38.768426	t
22	22	 1 RUE HENRY DUCHENE	75015.0	PARIS	Britain	true	2021-02-20 16:14:38.789412	t
23	23	 56 RUE SANTOS-DUMONT	75015.0	PARIS	Britain	true	2021-02-20 16:14:38.806404	t
24	24	 97 RUE DES MORILLONS	75015.0	PARIS	Britain	true	2021-02-20 16:14:38.828388	t
25	25	 15 RUE DESNOUETTES	75015.0	PARIS	Britain	true	2021-02-20 16:14:38.851375	t
26	26	 163 RUE DE ROME 	75017.0	PARIS 	Britain	true	2021-02-20 16:14:38.869366	t
27	27	 2 BIS RUE DE NICE	75011.0	PARIS	Britain	true	2021-02-20 16:14:38.889357	t
28	28	 18 PLACE RAOUL FOLLEREAU	75010.0	PARIS	Britain	true	2021-02-20 16:14:38.909342	t
29	29	 11 RUE ACHILLE MARTINET	75018.0	PARIS	Britain	true	2021-02-20 16:14:38.929332	t
30	30	 56 BOULEVARD DE CLICHY	75018.0	PARIS	Britain	true	2021-02-20 16:14:38.951317	t
31	31	 36 RUE DE TURIN	75008.0	PARIS	Britain	true	2021-02-20 16:14:38.971309	t
32	32	 28 BOULEVARD ARISTIDE-BRIAND	93100.0	MONTREUIL	Britain	true	2021-02-20 16:14:38.995299	t
33	33	50 AVENUE FLACHAT	92600.0	ASNIERE SUR SEINE	Britain	true	2021-02-20 16:14:39.013283	t
34	34	 70 RUE DU MONT CENIS	75018.0	PARIS	Britain	true	2021-02-20 16:14:39.033276	t
35	35	 20 RUE SAULNIER	75009.0	PARIS	Britain	true	2021-02-20 16:14:39.054259	t
36	36	 126 AVENUE MICHELET	93400.0	SAINT-OUEN	Britain	true	2021-02-20 16:14:39.075249	t
37	37	 24 AVENUE PHILIPPE AUGUSTE	75011.0	PARIS 	Britain	true	2021-02-20 16:14:39.100235	t
38	38	 7 RUE CLAPEYRON	75008.0	PARIS	Britain	true	2021-02-20 16:14:39.121222	t
39	39	 15 RUE DE BELLEFOND	75009.0	PARIS	Britain	true	2021-02-20 16:14:39.14121	t
40	40	50 RUE BARBES	92130.0	ISSY LES MOULINEAUX	Britain	true	2021-02-20 16:14:39.173193	t
41	41	45 RUE DES TILLEULS	92100.0	BOULOGNE BILLANCOURT	Britain	true	2021-02-20 16:14:39.198178	t
42	42	 20 RUE DE L'OURCQ	75019.0	PARIS	Britain	true	2021-02-20 16:14:39.222166	t
43	43	 6 RUE NEUVE POPINCOURT	75011.0	PARIS	Britain	true	2021-02-20 16:14:39.241154	t
44	44	 30 RUE SAINT AMBROISE	75011.0	PARIS	Britain	true	2021-02-20 16:14:39.260141	t
45	45	 5 BOULEVARD ORNANO	75018.0	PARIS	Britain	true	2021-02-20 16:14:39.282132	t
46	46	 97 RUE DE CHARONNE	75011.0	PARIS	Britain	true	2021-02-20 16:14:39.30012	t
47	47	 42 RUE CAULAINCOURT	75018.0	PARIS	Britain	true	2021-02-20 16:14:39.319108	t
48	48	 134 BIS AVENUE DE SAINT OUEN	75018.0	PARIS	Britain	true	2021-02-20 16:14:39.343094	t
49	49	 34 AVENUE DE SAINT-OUEN	75018.0	PARIS	Britain	true	2021-02-20 16:14:39.362083	t
50	50	 6 RUE GANNERON	75018.0	PARIS	Britain	true	2021-02-20 16:14:39.383075	t
51	51	 62 RUE DU CHATEAU D'EAU	75010.0	PARIS	Britain	true	2021-02-20 16:14:39.40406	t
52	52	 45 RUE DES TILLEULS	92100.0	BOULOGNE-BILLANCOURT	Britain	true	2021-02-20 16:14:39.430047	t
53	53	 7 RUE CLAPEYRON	75008.0	PARIS	Britain	true	2021-02-20 16:14:39.458029	t
54	54	 1 RUE CHAMPIONNET	75018.0	PARIS	Britain	true	2021-02-20 16:14:39.486013	t
55	55	 9 RUE BARON LE ROY	74017.0	PARIS	Britain	true	2021-02-20 16:14:39.514997	t
56	56	16 BOULEVARD VOLTAIRE	92130.0	ISSY-LES_MOULINEAUX	Britain	true	2021-02-20 16:14:39.541983	t
57	57	 9 RUE VASCO DE GAMA	75015.0	PARIS	Britain	true	2021-02-20 16:14:39.569968	t
58	58	 22 AVENUE DE LA GARE	91570.0	BIEVRES	Britain	true	2021-02-20 16:14:39.595952	t
59	59	 99 RUE DE CHARONNE	75011.0	PARIS	Britain	true	2021-02-20 16:14:39.637926	t
60	60	 131 TER AVENUE DE CLICHY	75017.0	PARIS	Britain	true	2021-02-20 16:14:39.667908	t
61	61	 49 RUE BARGUE	75015.0	PARIS	Britain	true	2021-02-20 16:14:39.70289	t
62	62	 62 BOULEVARDDE CLICHY	75018.0	PARIS	Britain	true	2021-02-20 16:14:39.728876	t
63	63	 26 RUE DES ROSIERS	75004.0	PARIS	Britain	true	2021-02-20 16:14:39.756861	t
64	64	 70 RUE DU MONT CENIS	75018.0	PARIS	Britain	true	2021-02-20 16:14:39.779847	t
65	65	110 RUE DE MONTREUIL	75011.0	PARIS	Britain	true	2021-02-20 16:14:39.805836	t
66	66	 123 RUE DE MONTREUIL	75011.0	PARIS	Britain	true	2021-02-20 16:14:39.823821	t
67	67	 3 RUE CYRANO DE BERGERAC	75018.0	PARIS	Britain	true	2021-02-20 16:14:39.84381	t
68	68	 40 QUAI DE JEMMAPES	75010.0	PARIS	Britain	true	2021-02-20 16:14:39.866796	t
69	69	 50 RUE MARX DORMOY	75018.0	PARIS	Britain	true	2021-02-20 16:14:39.885785	t
70	70	 42 RUE CURIAL	75019.0	PARIS	Britain	true	2021-02-20 16:14:39.908771	t
71	71	 24 AVENUE PHILIPPE AUGUSTE	75011.0	PARIS 	Britain	true	2021-02-20 16:14:39.92876	t
72	72	 72 RUE LEMERCIER	75017.0	PARIS	Britain	true	2021-02-20 16:14:39.945752	t
73	73	134  BIS AVENUE DE SAINT OUEN	75018.0	PARIS	Britain	true	2021-02-20 16:14:39.966738	t
74	74	18 RUE CAMILLE DESMOULINS	75011.0	PARIS	Britain	true	2021-02-20 16:14:39.985728	t
75	75	18 RUE CAMILLE DESMOULINS	75011.0	PARIS	Britain	true	2021-02-20 16:14:40.006718	t
76	76	 62 BOULEVARD DE CLICHY	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.028702	t
77	77	 85 RUE DE LA VERRERIE	75004.0	PARIS	Britain	true	2021-02-20 16:14:40.051693	t
78	78	 58 RUE DE LA CHAUSSEE D'ANTIN	75009.0	PARIS	Britain	true	2021-02-20 16:14:40.074677	t
79	79	 3 RUE JEAN DOLFUS	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.096668	t
80	80	 125 RUE LAMARCK	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.122649	t
81	81	1 RUE GUSTAVE GOUBLIER	75010.0	PARIS	Britain	true	2021-02-20 16:14:40.140642	t
82	82	 63 BOULEVARD SAINT GERMAIN	75005.0	PARIS	Britain	true	2021-02-20 16:14:40.159628	t
83	83	 16 RUE DU SIMPLON	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.182615	t
84	84	 21 RUE AFFRE	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.203605	t
85	85	 128 RUE DU MONT CENIS	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.225592	t
86	86	 6 CITE LA CHAPELLE	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.246579	t
87	87	 28 RUE VAUQUELIN	75005.0	PARIS	Britain	true	2021-02-20 16:14:40.266568	t
88	88	 7 BOULEVARD ORNANO	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.286558	t
89	89	 37 RUE GABRIELLE	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.310543	t
90	90	 48 RUE CHAMPIONNET	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.333529	t
91	91	 48 RUE CHAMPIONNET	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.357516	t
92	92	4 RUE FERDINAND FLOCON	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.378506	t
93	93	70 72 AVENUE PAUL LANGEVIN	92260.0	FONTENAY AUX ROSES	Britain	true	2021-02-20 16:14:40.399495	t
94	94	 153 RUE SAINT CHARLES	75015.0	PARIS	Britain	true	2021-02-20 16:14:40.418482	t
95	95	 34 RUE DU DOCTOR HEULIN	75017.0	PARIS	Britain	true	2021-02-20 16:14:40.438469	t
96	96	 34 RUE DU DOCTOR HEULIN	75017.0	PARIS	Britain	true	2021-02-20 16:14:40.460456	t
97	97	 37 RUE GABRIELLE	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.479444	t
98	98	 12 RUE DE CALAIS	75009.0	PARIS	Britain	true	2021-02-20 16:14:40.498436	t
99	99	 12 RUE LAGILLE	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.517426	t
100	100	 27 RUE HERMEL	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.539417	t
101	101	 4 RUE RAVIGNAN	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.569394	t
102	102	 68 RUE MARCADET	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.591385	t
103	103	 99 RUE ORFILA	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.609373	t
104	104	 27 RUE HERMEL	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.633357	t
105	105	 28 RUE LETORT	75018.0	PARIS	Britain	true	2021-02-20 16:14:40.653345	t
106	106	 75 RUE DU CHEVALERET	75013.0	PARIS	Britain	true	2021-02-20 16:14:40.672336	t
107	107	 93 ROUTE DES FUSILLES DE LA RESITANCE	92150.0	SURESNES	Britain	true	2021-02-20 16:14:40.693322	t
108	108	 29 RUE BERZELIUS	75017.0	PARIS	Britain	true	2021-02-20 16:14:40.712312	t
109	109	 28 RUE DES EPINETTES	75017.0	PARIS	Britain	true	2021-02-20 16:14:40.733301	t
110	110	31 DES BANCHAIS	49100.0	ANGERS	Britain	true	2021-02-20 16:14:40.754289	t
111	111	1 bis D'ANDIGNE	49220.0	LE LION D'ANGERS	Britain	true	2021-02-20 16:14:40.777278	t
112	112	15 PLACE PIERRE SEMARD	49100.0	ANGERS	Britain	true	2021-02-20 16:14:40.807258	t
113	113	114 AVENUE RENE GASNIER	49100.0	ANGERS	Britain	true	2021-02-20 16:14:40.836244	t
114	114	116 AVENUE PASTEUR	49100.0	ANGERS	Britain	true	2021-02-20 16:14:40.864228	t
115	115	10 LE GRAND NOIZE	49540.0	TIGNE	Britain	true	2021-02-20 16:14:40.894208	t
116	116	6 D'HEDOUVILLE	49100.0	ANGERS	Britain	true	2021-02-20 16:14:40.921193	t
117	117	6 D'HEDOUVILLE	49100.0	ANGERS	Britain	true	2021-02-20 16:14:40.948178	t
118	118	2 RUE DES PRUNELIERS	49330.0	CHATEAUNEUF SUR SARTHE	Britain	true	2021-02-20 16:14:40.973164	t
119	119	2 RUE GODARD FAULTRIER	49100.0	ANGERS	Britain	true	2021-02-20 16:14:41.00215	t
120	120	116 AVENUE PASTEUR	49100.0	ANGERS	Britain	true	2021-02-20 16:14:41.029133	t
121	121	24 CAMILLE PISSARO	49240.0	AVRILLE	Britain	true	2021-02-20 16:14:41.056114	t
122	122	2 RUE D'HEDOUVILLE	49100.0	ANGERS	Britain	true	2021-02-20 16:14:41.0831	t
123	123	23 GRANDE RUE	49330.0	CHATEAUNEUF SUR SARTHE	Britain	true	2021-02-20 16:14:41.122079	t
124	124	19 RUE DES CLOSIERS	49124.0	SAINT-BARTHELEMY-D'ANJOU	Britain	true	2021-02-20 16:14:41.148063	t
125	125	56 JULES GUITTON	49100.0	ANGERS	Britain	true	2021-02-20 16:14:41.242014	t
126	126	21 RUE DU MAIL	49100.0	ANGERS	Britain	true	2021-02-20 16:14:41.262	t
127	127	41 RUE EVAIN	49000.0	ANGERS	Britain	true	2021-02-20 16:14:41.282987	t
128	128	5  PLACE NOTRE DAME DE LA LEGION D'HONNEUR	49160.0	LONGUE JUMELLES	Britain	true	2021-02-20 16:14:41.304973	t
129	129	5 AVENUE MARECHAL LECLERC	53000.0	LAVAL	Britain	true	2021-02-20 16:14:41.323963	t
130	130	12 RUE DE LA CHARMILLE	53200.0	LAIGNE	Britain	true	2021-02-20 16:14:41.34795	t
131	131	12 RUE DE LA CHARMILLE	53200.0	LAIGNE	Britain	true	2021-02-20 16:14:41.371934	t
132	132	48 TROUVEE	53200.0	CHATEAU GONTIER	Britain	true	2021-02-20 16:14:41.390923	t
133	133	48 TROUVEE	53200.0	CHATEAU GONTIER	Britain	true	2021-02-20 16:14:41.427902	t
134	134	9 RUE DU MARCHE	49220.0	LE LION D'ANGERS	Britain	true	2021-02-20 16:14:41.447891	t
135	135	2  RUE DE LA CENSERIE	49100.0	ANGERS	Britain	true	2021-02-20 16:14:41.470883	t
136	136	 Z L'OCEANE  RUE BENNEFRAY	49140.0	VILLEVEQUE	Britain	true	2021-02-20 16:14:41.489868	t
137	137	 8 RUE VOLTAIRE	49100.0	ANGERS	Britain	true	2021-02-20 16:14:41.508861	t
138	138	30 LE QUARTERON	49270.0	LANDEMONT	Britain	true	2021-02-20 16:14:41.531843	t
139	139	3  IMPASSE DE LA GRANDE COUR	49380.0	FAYE D'ANJOU	Britain	true	2021-02-20 16:14:41.552833	t
140	140	21 -21 BIS RUE DU MAIL	49000.0	ANGERS	Britain	true	2021-02-20 16:14:41.571825	t
141	141	37 EDOUARD VAILLANT	49800.0	TRELAZE	Britain	true	2021-02-20 16:14:41.590809	t
142	142	2 LA GOUPILLERE	49240.0	AVRILLE	Britain	true	2021-02-20 16:14:41.608799	t
143	143	10 DESCAZEAUX	49100.0	ANGERS	Britain	true	2021-02-20 16:14:41.628787	t
144	144	4 RUE DU CURE PIERRE HOUET	49150.0	BAUGE EN ANJOU	Britain	true	2021-02-20 16:14:41.651774	t
145	145	6 IMPASSE DE L'EVECHE	49380.0	THOUARCE	Britain	true	2021-02-20 16:14:41.670765	t
146	146	37 EDOUARD VAILLANT	49800.0	TRELAZE	Britain	true	2021-02-20 16:14:41.690753	t
147	147	337 LIEU DIT LE MESNIL	49380.0	THOUARCE	Britain	true	2021-02-20 16:14:41.712741	t
148	148	48 BOULEVARD GASTON BIRGE	49100.0	ANGERS	Britain	true	2021-02-20 16:14:41.731732	t
149	149	78 RUE VOLNEY	49000.0	ANGERS	Britain	true	2021-02-20 16:14:41.751718	t
150	150	19-21  RUE ARMAND BROUSSE	49610.0	SAINT MELAINE SUR AUBANCE	Britain	true	2021-02-20 16:14:41.774704	t
151	151	55 D'ANGERS	49370.0	BECON LES GRANITS	Britain	true	2021-02-20 16:14:41.792698	t
152	152	11 BIS RUE JEAN BODIN	49000.0	ANGERS	Britain	true	2021-02-20 16:14:41.814682	t
153	153	21 -21BIS RUE DU MAIL	49000.0	ANGERS	Britain	true	2021-02-20 16:14:41.83467	t
154	154	 2 RUE GODARD FAULTRIER	49100.0	ANGERS	Britain	true	2021-02-20 16:14:41.855658	t
155	155	 2 RUE GODARD FAULTRIER	49100.0	ANGERS	Britain	true	2021-02-20 16:14:41.877651	t
156	156	 2 RUE GODARD FAULTRIER	49100.0	ANGERS	Britain	true	2021-02-20 16:14:41.898637	t
157	157	21 21 BIS RUE DU MAIL	49100.0	ANGERS	Britain	true	2021-02-20 16:14:41.917623	t
158	158	 ROUTE DE SAINT CLEMENT	49770.0	LE PLESSIS MACE	Britain	true	2021-02-20 16:14:41.939614	t
159	159	13 RUE DES TILLEULS	49500.0	MARANS	Britain	true	2021-02-20 16:14:41.962599	t
160	160	61  RUE DESJARDINS	49100.0	ANGERS	Britain	true	2021-02-20 16:14:41.982586	t
161	161	55 RUE D'ANGERS	49370.0	BECON LES GRANITS	Britain	true	2021-02-20 16:14:42.002576	t
162	162	 5 RUE NATIONALE	49170.0	SAINT GEORGES SUR LOIRE	Britain	true	2021-02-20 16:14:42.02556	t
163	163	 5 RUE NATIONALE	49170.0	SAINT GEORGES SUR LOIRE	Britain	true	2021-02-20 16:14:42.046549	t
164	164	2  RUE DE L'EGLISE	49560.0	NUEIL SUR LAYON	Britain	true	2021-02-20 16:14:42.06854	t
165	165	2  PLACE VERDUN	49700.0	DOUE LA FONTAINE	Britain	true	2021-02-20 16:14:42.088528	t
166	166	12 RUE DU 4 SEPTEMBRE	49800.0	TRELAZE	Britain	true	2021-02-20 16:14:42.107517	t
167	167	15 GRANDE RUE	53200.0	CHATEAU GONTIER	Britain	true	2021-02-20 16:14:42.128501	t
168	168	116 AVENUE PASTEUR	49100.0	ANGERS	Britain	true	2021-02-20 16:14:42.147494	t
169	169	207 RUE NATIONALE	49120.0	CHEMILLE	Britain	true	2021-02-20 16:14:42.176477	t
170	170	171 AVENUE DE LA REPUBLIQUE	49800.0	TRELAZE	Britain	true	2021-02-20 16:14:42.204462	t
171	171	436 RUE SAINT LEONARD	49100.0	ANGERS	Britain	true	2021-02-20 16:14:42.229444	t
172	172	25 RUE NATIONALE	49330.0	CHATEAUNEUF SUR SARTHE	Britain	true	2021-02-20 16:14:42.257428	t
173	173	19 AVENUE DE CHANZY	49000.0	ANGERS	Britain	true	2021-02-20 16:14:42.284418	t
174	174	14  RUE VOTIER	49000.0	ANGERS	Britain	true	2021-02-20 16:14:42.312402	t
175	175	3  IMPASSE DE LA GRANDE COUR	49380.0	FAYE D'ANJOU	Britain	true	2021-02-20 16:14:42.34238	t
176	176	62 RUE DE VERDUN	49320.0	BRISSAC QINCE	Britain	true	2021-02-20 16:14:42.374362	t
177	177	12  RUE NATIONALE	49330.0	CHATEAUNEUF SUR SARTHE	Britain	true	2021-02-20 16:14:42.402349	t
178	178	7 DU PRE DU CAMP	49700.0	DOUE LA FONTAINE	Britain	true	2021-02-20 16:14:42.436326	t
179	179	5 RUE DES MOINES	49290.0	CHALONNES SUR LOIRE	Britain	true	2021-02-20 16:14:42.461315	t
180	180	38 ROUTE DE SOUCELLES	49125.0	BRIOLLAY	Britain	true	2021-02-20 16:14:42.490296	t
181	181	20 DE TIVOLI	49630.0	CORNE	Britain	true	2021-02-20 16:14:42.517283	t
182	182	20 DE TIVOLI	49630.0	CORNE	Britain	true	2021-02-20 16:14:42.544266	t
183	183	1 QUAI MONSEIGNEUR PROVOST	49570.0	MONTJEAN SUR LOIRE	Britain	true	2021-02-20 16:14:42.572248	t
184	184	123 RUE DU HAUT PRESSOIR	49000.0	ANGERS	Britain	true	2021-02-20 16:14:42.595235	t
185	185	1 DE LA BELLE ANGEVINE	49750.0	SAINT LAMBERT DU LATTAY	Britain	true	2021-02-20 16:14:42.62222	t
186	186	13 RUE LUDOVIC SAVATIER	49240.0	AVRILLE	Britain	true	2021-02-20 16:14:42.643207	t
187	187	16 RUE DU GENERAL LECLERC	49220.0	LE LION D'ANGERS	Britain	true	2021-02-20 16:14:42.662197	t
188	188	4 RUE DU CURE PIERRE HOUET	49150.0	BAUGE EN ANJOU	Britain	true	2021-02-20 16:14:42.682185	t
189	189	6 RUE DU BOURGUILLAUME	49250.0	BEAUFORT EN ANJOU	Britain	true	2021-02-20 16:14:42.703175	t
190	190	21 RUE DU MAIL	49100.0	ANGERS	Britain	true	2021-02-20 16:14:42.726161	t
191	191	40 DES LICES	49100.0	ANGERS	Britain	true	2021-02-20 16:14:42.749148	t
192	192	55 RUE D'ANGERS	49370.0	BECON LES GRANITS	Britain	true	2021-02-20 16:14:42.768137	t
193	193	4 RUE DE L'EPERON	49260.0	LE PUY NOTRE DAME	Britain	true	2021-02-20 16:14:42.789126	t
194	194	1  DES HALLES	49380.0	THOUARCE	Britain	true	2021-02-20 16:14:42.810113	t
195	195	81 RUE SAINT-JACQUES	49000.0	ANGERS	Britain	true	2021-02-20 16:14:42.835098	t
196	196	123 RUE DU HAUT PRESSOIR	49000.0	ANGERS	Britain	true	2021-02-20 16:14:42.853087	t
197	197	16 RUE DU CHANOINE PANAGET	49540.0	MARTIGNE BRIAND	Britain	true	2021-02-20 16:14:42.873079	t
198	198	20 DU MARQUIS DE DION	44470.0	CARQUEFOU	Britain	true	2021-02-20 16:14:42.894066	t
199	199	 27 RUE TOUSSAINT	49000.0	ANGERS	Britain	true	2021-02-20 16:14:42.912055	t
200	200	 27 RUE TOUSSAINT	49000.0	ANGERS	Britain	true	2021-02-20 16:14:42.936041	t
201	201	16 RUE DU CHANOINE PANAGET	49540.0	MARTIGNE BRIAND	Britain	true	2021-02-20 16:14:42.958028	t
202	202	3 D ANDIGNE	49220.0	LE LION D'ANGERS	Britain	true	2021-02-20 16:14:42.977023	t
203	203	13 RUE DES TILLEULS	49500.0	MARANS	Britain	true	2021-02-20 16:14:42.998005	t
204	204	10  BOULEVARD DESCAZEAUX	49100.0	ANGERS	Britain	true	2021-02-20 16:14:43.017995	t
205	205	30 RUE DES PONTS DE CE	49000.0	ANGERS	Britain	true	2021-02-20 16:14:43.036984	t
206	206	30 RUE DES PONTS DE CE	49000.0	ANGERS	Britain	true	2021-02-20 16:14:43.05897	t
207	207	14 DU ROI RENE	49100.0	ANGERS	Britain	true	2021-02-20 16:14:43.080961	t
208	208	37 GRANDE RUE	53200.0	CHATEAU GONTIER	Britain	true	2021-02-20 16:14:43.097947	t
209	209	66  AVENUE VICTOR CHATENAY	49100.0	ANGERS	Britain	true	2021-02-20 16:14:43.117938	t
210	210	23 GRANDE RUE	49110.0	CHATEAUNEUF SUR SARTHE	Britain	true	2021-02-20 16:14:43.138925	t
211	211	11 BIS RUE JEAN BODIN	49000.0	ANGERS	Britain	true	2021-02-20 16:14:43.254858	t
212	212	8 RUELLE BOULAIN	53000.0	LAVAL	Britain	true	2021-02-20 16:14:43.386783	t
213	213	14 DE RENNES	49370.0	LE LOUROUX BECONNAIS	Britain	true	2021-02-20 16:14:43.40877	t
214	214	2 RUE DU PONT LEVIS	49380.0	THOUARCE	Britain	true	2021-02-20 16:14:43.433755	t
215	215	 7 RUE SAINT JEAN	49380.0	THOUARCE	Britain	true	2021-02-20 16:14:43.453744	t
216	216	 LE PETIT BONNEZEAUX	49380.0	BELLEVIGNE EN LAYON	Britain	true	2021-02-20 16:14:43.472735	t
217	217	1 RUE DU CHENE VERT	49124.0	LE PLESSIS GRAMMOIRE	Britain	true	2021-02-20 16:14:43.492724	t
218	218	1 RUE DU CHENE VERT	49124.0	LE PLESSIS GRAMMOIRE	Britain	true	2021-02-20 16:14:43.511714	t
219	219	31 PASTEUR	49800.0	TRELAZE	Britain	true	2021-02-20 16:14:43.536699	t
220	220	7 CHEVERT	44100.0	NANTES	Britain	true	2021-02-20 16:14:43.560684	t
221	221	42 DE LA BOISBONNIERE	44300.0	NANTES	Britain	true	2021-02-20 16:14:43.591667	t
222	222	8 RUELLE BOULAIN	53000.0	LAVAL	Britain	true	2021-02-20 16:14:43.620651	t
223	223	34 RUE DU LIEUTENANT COLONEL PAUL VIGIERE	49290.0	CHALONNES SUR LOIRE	Britain	true	2021-02-20 16:14:43.646634	t
224	224	48 DE QUINCONCE	49100.0	ANGERS	Britain	true	2021-02-20 16:14:43.676624	t
225	225	28 RUE DES CARMES	49100.0	ANGERS	Britain	true	2021-02-20 16:14:43.705601	t
226	226	28 RUE DES CARMES	49100.0	ANGERS	Britain	true	2021-02-20 16:14:43.731589	t
227	227	7 DE LOCTUDY	44300.0	NANTES	Britain	true	2021-02-20 16:14:43.773562	t
228	228	2A DU BOURG JOLI	49125.0	TIERCE	Britain	true	2021-02-20 16:14:43.908484	t
229	229	30 DE L EGLISE	49130.0	SAINTE GEMMES SUR LOIRE	Britain	true	2021-02-20 16:14:43.93247	t
230	230	6 RUE DE VERDUN	49320.0	BRISSAC QUINCE	Britain	true	2021-02-20 16:14:43.951461	t
231	231	1 RUE BLEUE	49125.0	CHEFFES	Britain	true	2021-02-20 16:14:43.972447	t
232	232	10 DESCAZEAUX	49100.0	ANGERS	Britain	true	2021-02-20 16:14:43.993437	t
233	233	81 RUE SAINT-JACQUES	49000.0	ANGERS	Britain	true	2021-02-20 16:14:44.017426	t
234	234	40 RUE DES LICES	49100.0	ANGERS	Britain	true	2021-02-20 16:14:44.037417	t
235	235	28 DES LILAS	44700.0	ORVAULT	Britain	true	2021-02-20 16:14:44.060399	t
236	236	6 RUE DE VERDUN	49320.0	BRISSAC QUINCE	Britain	true	2021-02-20 16:14:44.082388	t
237	237	1 RUE DE LA BELLE ANGEVINE	49750.0	SAINT LAMBERT DU LATTAY	Britain	true	2021-02-20 16:14:44.105372	t
238	238	18  MENAGE	49100.0	ANGERS	Britain	true	2021-02-20 16:14:44.134356	t
239	239	4 RUE DU COMMERCE	49125.0	TIERCE	Britain	true	2021-02-20 16:14:44.156347	t
240	240	4 RUE DU COMMERCE	49125.0	TIERCE	Britain	true	2021-02-20 16:14:44.182329	t
241	241	1 RUE DE THIONVILLE	53200.0	CHATEAU GONTIER	Britain	true	2021-02-20 16:14:44.209313	t
242	242	3 RUE FRANCOISE DOLTO	33700.0	MERIGNAC	Britain	true	2021-02-20 16:14:44.2313	t
243	243	189 RUE SAINTE CATHERINE	33000.0	BORDEAUX	Britain	true	2021-02-20 16:14:44.25029	t
244	244	77/79 AVENUE CHARLES DE GAULLE	33200.0	BORDEAUX	Britain	true	2021-02-20 16:14:44.271278	t
245	245	3 RUE FRANCOISE DOLTO	33700.0	MERIGNAC	Britain	true	2021-02-20 16:14:44.291265	t
246	246	7 Rue rené Dumont	33130.0	BEGLES	Britain	true	2021-02-20 16:14:44.311254	t
247	247	67 COURS PASTEUR	33200.0	BORDEAUX	Britain	true	2021-02-20 16:14:44.342238	t
248	248	47 Rue carpenteyre	33000.0	BORDEAUX	Britain	true	2021-02-20 16:14:44.362224	t
249	249	2 Avenue Raymond Poincaré	33700.0	MERIGNAC	Britain	true	2021-02-20 16:14:44.381214	t
250	250	2 Avenue Raymond Poincaré	33700.0	MERIGNAC	Britain	true	2021-02-20 16:14:44.403202	t
251	251	67 COURS PASTEUR	33200.0	BORDEAUX	Britain	true	2021-02-20 16:14:44.425191	t
252	252	189 RUE SAINTE CATHERINE	33000.0	BORDEAUX	Britain	true	2021-02-20 16:14:44.444178	t
253	253	47 Rue carpenteyre	33000.0	BORDEAUX	Britain	true	2021-02-20 16:14:44.473165	t
254	254	189 RUE SAINTE CATHERINE	33000.0	BORDEAUX	Britain	true	2021-02-20 16:14:44.494152	t
255	255	3 RUE FRANCOISE DOLTO	33700.0	MERIGNAC	Britain	true	2021-02-20 16:14:44.517139	t
256	256	3 RUE FRANCOISE DOLTO	33700.0	MERIGNAC	Britain	true	2021-02-20 16:14:44.576109	t
257	257	65 DE DOUARNENEZ	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:44.598092	t
258	258	2 RUE CREAC'H AL ALN	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:44.618083	t
259	259	19  RUE DE LA PRAIRIE	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:44.639069	t
260	260	2 RUE CREAC'H AL LAN	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:44.660056	t
261	261	15 RUE DE LA HUBAUDIERE	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:44.681047	t
262	262	1 RUE DE L'AMIRAL COSMAO	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:44.704031	t
263	263	3 RUE HENT AR GLUJAR	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:44.724019	t
264	264	6 DU VERGER	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:44.744011	t
265	265	2 VERDELET	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:44.767993	t
266	266	 142 RUE DE PONT-L'ABBE	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:44.786984	t
267	267	40 AVENUE DE LA LIBERATION	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:44.811968	t
268	268	95 DE BENODET	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:44.836958	t
269	269	15 DE STANG BIHAN	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:44.86394	t
270	270	15 DE STANG BIHAN	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:44.886925	t
271	271	9 RUE DE LA FONTAINE	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:44.915911	t
272	272	13 DE KERDREZEC	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:44.946893	t
273	273	78 BIS ROUTE DE LA GARE	29460.0	HANVEC	Britain	true	2021-02-20 16:14:44.972876	t
274	274	6 VIEILLE ROUTE DE CONCARNEAU	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:44.99986	t
275	275	27 QUAI DE L'YSER	29100.0	DOUARNENEZ	Britain	true	2021-02-20 16:14:45.025847	t
276	276	2 RUE JACQUELINE DOMERGUE	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:45.052832	t
277	277	7 ALLEE DE MENEZ GROAS	29500.0	ERGUE GABERIC	Britain	true	2021-02-20 16:14:45.102804	t
278	278	24 AVENUE DE LA LIBERATION	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:45.129787	t
279	279	1 RUE DES 7 ILES	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:45.156773	t
280	280	4 RUE DE SAINT EXUPERY	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:45.188752	t
281	281	19  RUE DE LA PRAIRIE	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:45.21574	t
282	282	1 RUE DES 7 ILES	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:45.25372	t
283	283	6 RUE KEREON	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:45.276704	t
284	284	18 RUE ROUGET DE LISLE	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:45.298691	t
285	285	45 RUE DU GENERAL DE GAULLE	29510.0	BRIEC	Britain	true	2021-02-20 16:14:45.320678	t
286	286	3 RUE JEANNE LAZOU	29500.0	ERGUE GABERIC	Britain	true	2021-02-20 16:14:45.35066	t
287	287	95 RUE DE BENODET	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:45.37065	t
288	288	95 RUE DE BENODET	29000.0	QUIMPER	Britain	true	2021-02-20 16:14:45.391636	t
289	289	18 AMPERE	44470.0	CARQUEFOU	Britain	true	2021-02-20 16:14:45.410625	t
290	290	8 DES MERISIERS	44470.0	CARQUEFOU	Britain	true	2021-02-20 16:14:45.432615	t
291	291	2 DE LA PORTE DOUILLARD	44300.0	NANTES	Britain	true	2021-02-20 16:14:45.452603	t
292	292	8 DE LA HALTINIERE	44300.0	NANTES	Britain	true	2021-02-20 16:14:45.471593	t
293	293	2 AMPERE	44470.0	CARQUEFOU	Britain	true	2021-02-20 16:14:45.490582	t
294	294	1 DE FLORENCE	44470.0	CARQUEFOU	Britain	true	2021-02-20 16:14:45.511569	t
295	295	8 SAINT PIERRE	44470.0	CARQUEFOU	Britain	true	2021-02-20 16:14:45.533559	t
296	296	8 DES MERISIERS	44470.0	CARQUEFOU	Britain	true	2021-02-20 16:14:45.553547	t
297	297	20 DU MARQUIS DE DION	44470.0	CARQUEFOU	Britain	true	2021-02-20 16:14:45.575532	t
298	298	7 CHEVERT	44100.0	NANTES	Britain	true	2021-02-20 16:14:45.593521	t
299	299	42 DE LA BOISBONNIERE	44300.0	NANTES	Britain	true	2021-02-20 16:14:45.614509	t
300	300	9 FRUCTIDOR	44300.0	NANTES	Britain	true	2021-02-20 16:14:45.638497	t
301	301	1 PLACE CHARLES PATHE	77680.0	ROISSY EN BRIE	Britain	true	2021-02-20 16:14:45.656486	t
302	302	51  AVENUE DE LA REPUBLIQUE	77340.0	PONTAULT COMBAULT	Britain	true	2021-02-20 16:14:45.676476	t
303	303	3 BIS AVENUE THIERS	77330.0	OZOIRE LA FERRIERE	Britain	true	2021-02-20 16:14:45.695463	t
304	304	140 AVENUE CHARLES ROUXEL	77340.0	PONTAULT COMBAULT	Britain	true	2021-02-20 16:14:45.714453	t
305	305	39 SQUARE SAINT EXUPERY	94510.0	LA QUEUE EN BRIE	Britain	true	2021-02-20 16:14:45.736443	t
306	306	8 RUE DE L'AFFINOIRE	77340.0	PONTAULT COMBAULT	Britain	true	2021-02-20 16:14:45.760428	t
307	307	18 AVENUE DE LA REPUBLIQUE	77340.0	PONTAULT COMBAULT	Britain	true	2021-02-20 16:14:45.783413	t
308	308	8 RUE GILBERT REY	77340.0	PONTAULT COMBAULT	Britain	true	2021-02-20 16:14:45.803403	t
309	309	37 AVENUE THIBAUD DE CHAMPAGNE	77700.0	CHESSY	Britain	true	2021-02-20 16:14:45.823389	t
310	310	50 AVENUE DU MARECHAL FOCH	77500.0	CHELLES	Britain	true	2021-02-20 16:14:45.84338	t
311	311	29 A AVENUE DES CHARDONS	77340.0	PONTAULT COMBAULT	Britain	true	2021-02-20 16:14:45.86437	t
312	312	134  AVENUE DE LA REPUBLIQUE	77340.0	PONTAULT COMBAULT	Britain	true	2021-02-20 16:14:45.888354	t
313	313	2 AVENUE PAUL DOUMER	93460.0	GOURNAY SUR MARNE	Britain	true	2021-02-20 16:14:45.913341	t
314	314	106 RUE CHARLES ROUXEL	77340.0	PONTAULT COMBAULT	Britain	true	2021-02-20 16:14:45.936328	t
315	315	3 BIS AVENUE THIERS	77330.0	OZOIR LA FERRIERE	Britain	true	2021-02-20 16:14:45.957313	t
316	316	30 AVENUE DU GENERAL DE GAULLE	77340.0	PONTAULT COMBAULT	Britain	true	2021-02-20 16:14:45.9803	t
317	317	42 RUE DES ORMEAUX	85500.0	LES HERBIERS	Britain	true	2021-02-20 16:14:46.00029	t
318	318	 13 PLACE SAINT LAURENT	85500.0	BEAUREPAIRE	Britain	true	2021-02-20 16:14:46.020278	t
319	319	 13 PLACE SAINT LAURENT	85500.0	BEAUREPAIRE	Britain	true	2021-02-20 16:14:46.041267	t
320	320	3 PLACE DU MAIL	85700.0	SEVREMONT	Britain	true	2021-02-20 16:14:46.061255	t
321	321	 LA PIERRE SAINT BENOIT	85110.0	MONSIREIGNE	Britain	true	2021-02-20 16:14:46.08424	t
322	322	 2 RUE DES ORANCHERES	85130.0	BAZOGES EN PAILLERS	Britain	true	2021-02-20 16:14:46.10423	t
323	323	12 RUE CAMILLE SAINT SAENS	85500.0	LES HERBIERS	Britain	true	2021-02-20 16:14:46.12122	t
324	324	36 RUE DES MOUETTES	85500.0	LES HERBIERS	Britain	true	2021-02-20 16:14:46.140209	t
325	325	36 RUE DES MOUETTES	85500.0	LES HERBIERS	Britain	true	2021-02-20 16:14:46.164196	t
326	326	42 RUE DES ORMEAUX	85500.0	LES HERBIERS	Britain	true	2021-02-20 16:14:46.185184	t
327	327	5 RUE DES AMANDIERS	85500.0	LES HERBIERS	Britain	true	2021-02-20 16:14:46.210172	t
328	328	5 RUE DES AMANDIERS	85500.0	LES HERBIERS	Britain	true	2021-02-20 16:14:46.236155	t
329	329	66 RUE EMILE BAUMANN	85000.0	LA ROCHE SUR YON	Britain	true	2021-02-20 16:14:46.262142	t
330	330	 16 AVENUE DE LATTRE DE TASSIGNY	85000.0	LA ROCHE SUR YON	Britain	true	2021-02-20 16:14:46.290123	t
331	331	 11 IMPASSE DU CHATELET	85000.0	LA ROCHE SUR YON	Britain	true	2021-02-20 16:14:46.319111	t
332	332	 60 IMPASSE JACQUES DEMY	85000.0	LA ROCHE SUR YON	Britain	true	2021-02-20 16:14:46.345092	t
333	333	 60 IMPASSE JACQUES DEMY	85000.0	LA ROCHE SUR YON	Britain	true	2021-02-20 16:14:46.373075	t
334	334	 48 RUE BOSSUET	85000.0	LA ROCHE SUR YON	Britain	true	2021-02-20 16:14:46.403061	t
335	335	 13 RUE HAXO	85000.0	LA ROCHE SUR YON	Britain	true	2021-02-20 16:14:46.431043	t
336	336	 32 RUE PIERRE BROSSOLETTE	85000.0	LA ROCHE SUR YON	Britain	true	2021-02-20 16:14:46.466021	t
337	337	 49 rue BOSSUET	85000.0	LA ROCHE SUR YON	Britain	true	2021-02-20 16:14:46.491009	t
338	338	 49 rue BOSSUET	85000.0	LA ROCHE SUR YON	Britain	true	2021-02-20 16:14:46.517993	t
339	339	2 IMPASSE DES MOUETTES	78610.0	LE PERRAY EN YVELINES	Britain	true	2021-02-20 16:14:46.542978	t
340	340	4 RUE JOSEPH JACQUARD	78120.0	RAMBOUILLET	Britain	true	2021-02-20 16:14:46.577959	t
341	341	24 RUE DE LA MARE	28630.0	MORANCEZ	Britain	true	2021-02-20 16:14:46.602944	t
342	342	13 BIS RUE DES LACHAUX	78120.0	RAMBOUILLET	Britain	true	2021-02-20 16:14:46.622933	t
343	343	13  SQUARE DES PERRAYADES	78610.0	LE PERRAY EN YVELINES	Britain	true	2021-02-20 16:14:46.642923	t
344	344	2 RUE EMILE DAMARS	28100.0	DREUX	Britain	true	2021-02-20 16:14:46.690897	t
345	345	7 RUE DE LA BOURBONNERIE	78690.0	LES ESSARTS LE ROI	Britain	true	2021-02-20 16:14:46.711883	t
346	346	3 SQUARE DES PERRAYADES	78610.0	le Perray en Yvelines 	Britain	true	2021-02-20 16:14:46.735867	t
347	347	35 RUE DE CHATEAUDUN	28000.0	CHARTRES	Britain	true	2021-02-20 16:14:46.753862	t
348	348	4 BIS RUE LEOPOLD BELLAN	78490.0	MERE	Britain	true	2021-02-20 16:14:46.820819	t
349	349	24 RUE RAYMOND PATENOTRE	78120.0	RAMBOUILLET	Britain	true	2021-02-20 16:14:46.839807	t
350	350	 Sol de la rente	31460.0	CARAMAN	Britain	true	2021-02-20 16:14:46.864798	t
351	351	 Sol de la rente	31460.0	CARAMAN	Britain	true	2021-02-20 16:14:46.886782	t
352	352	1 PLACE DU PRINTEMPS	33600.0	PESSAC	Britain	true	2021-02-20 16:14:46.907771	t
353	353	17 RUE PAUL DOUMER	33700.0	MERIGNAC	Britain	true	2021-02-20 16:14:46.927757	t
354	354	45 RUE DE LANDEGRAND	33290.0	PAREMPUYRE	Britain	true	2021-02-20 16:14:46.950746	t
355	355	49 Rue du Moulin Rouge	33200.0	BORDEAUX	Britain	true	2021-02-20 16:14:46.978728	t
356	356	23 Allée du haut l'évêque	33600.0	PESSAC	Britain	true	2021-02-20 16:14:47.002715	t
357	357	45 RUE DE LANDEGRAND	33290.0	PAREMPUYRE	Britain	true	2021-02-20 16:14:47.047689	t
358	358	3 RUE HUSTIN	33185.0	LE HAILLAN	Britain	true	2021-02-20 16:14:47.072675	t
\.


--
-- Data for Name: suivi_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suivi_client (id, client, responsable, commentaire, date_creation, date_modif, visibility) FROM stdin;
\.


--
-- Data for Name: suivi_prospect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suivi_prospect (id, prospect_id, responsable, commentaire, date_creation, date_modif, visibility) FROM stdin;
1	1	1	C'es un bon clients	2021-02-20 16:44:52.658318	2021-02-20 16:44:52.658318	t
\.


--
-- Name: Agenda_expert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Agenda_expert_id_seq"', 1, false);


--
-- Name: Agenda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Agenda_id_seq"', 1, false);


--
-- Name: Client_History_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Client_History_id_seq"', 9, true);


--
-- Name: Client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Client_id_seq"', 4, true);


--
-- Name: Client_negotiateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Client_negotiateur_id_seq"', 1, true);


--
-- Name: Expert_History_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Expert_History_id_seq"', 41, true);


--
-- Name: Expert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Expert_id_seq"', 53, true);


--
-- Name: Facturation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Facturation_id_seq"', 1, false);


--
-- Name: Mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Mission_id_seq"', 99, true);


--
-- Name: Negotiateur_History_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Negotiateur_History_id_seq"', 1, true);


--
-- Name: Tarif_base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tarif_base_id_seq"', 1, false);


--
-- Name: Tarifs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tarifs_id_seq"', 4, true);


--
-- Name: facturation_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facturation_client_id_seq', 1, false);


--
-- Name: facturation_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facturation_mission_id_seq', 1, false);


--
-- Name: prospect_History_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."prospect_History_id_seq"', 358, true);


--
-- Name: prospect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prospect_id_seq', 358, true);


--
-- Name: seq_street_segment_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_street_segment_id', 6, true);


--
-- Name: suivi_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suivi_client_id_seq', 1, false);


--
-- Name: suivi_prospect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suivi_prospect_id_seq', 1, true);


--
-- Name: Agenda_expert Agenda_expert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agenda_expert"
    ADD CONSTRAINT "Agenda_expert_pkey" PRIMARY KEY (id);


--
-- Name: Agenda Agenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agenda"
    ADD CONSTRAINT "Agenda_pkey" PRIMARY KEY (id);


--
-- Name: Client_History Client_History_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client_History"
    ADD CONSTRAINT "Client_History_pkey" PRIMARY KEY (id);


--
-- Name: Client_negotiateur Client_negotiateur_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client_negotiateur"
    ADD CONSTRAINT "Client_negotiateur_email_key" UNIQUE (email);


--
-- Name: Client_negotiateur Client_negotiateur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client_negotiateur"
    ADD CONSTRAINT "Client_negotiateur_pkey" PRIMARY KEY (id);


--
-- Name: Client Client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client"
    ADD CONSTRAINT "Client_pkey" PRIMARY KEY (id);


--
-- Name: Expert_History Expert_History_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Expert_History"
    ADD CONSTRAINT "Expert_History_pkey" PRIMARY KEY (id);


--
-- Name: Expert Expert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Expert"
    ADD CONSTRAINT "Expert_pkey" PRIMARY KEY (id);


--
-- Name: Facturation Facturation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturation"
    ADD CONSTRAINT "Facturation_pkey" PRIMARY KEY (id);


--
-- Name: Mission Mission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_pkey" PRIMARY KEY (id);


--
-- Name: Negotiateur_History Negotiateur_History_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Negotiateur_History"
    ADD CONSTRAINT "Negotiateur_History_pkey" PRIMARY KEY (id);


--
-- Name: Tarif_base Tarif_base_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarif_base"
    ADD CONSTRAINT "Tarif_base_pkey" PRIMARY KEY (id);


--
-- Name: Tarifs Tarifs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarifs"
    ADD CONSTRAINT "Tarifs_pkey" PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: facturation_client facturation_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturation_client
    ADD CONSTRAINT facturation_client_pkey PRIMARY KEY (id);


--
-- Name: facturation_mission facturation_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturation_mission
    ADD CONSTRAINT facturation_mission_pkey PRIMARY KEY (id);


--
-- Name: prospect_History prospect_History_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."prospect_History"
    ADD CONSTRAINT "prospect_History_pkey" PRIMARY KEY (id);


--
-- Name: prospect prospect_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prospect
    ADD CONSTRAINT prospect_pkey PRIMARY KEY (id);


--
-- Name: suivi_client suivi_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivi_client
    ADD CONSTRAINT suivi_client_pkey PRIMARY KEY (id);


--
-- Name: suivi_prospect suivi_prospect_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivi_prospect
    ADD CONSTRAINT suivi_prospect_pkey PRIMARY KEY (id);


--
-- Name: Agenda_expert Agenda_expert_agenda_taken_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agenda_expert"
    ADD CONSTRAINT "Agenda_expert_agenda_taken_fkey" FOREIGN KEY (agenda_taken) REFERENCES public."Agenda"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Expert_History Expert_History_expert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Expert_History"
    ADD CONSTRAINT "Expert_History_expert_id_fkey" FOREIGN KEY (expert_id) REFERENCES public."Expert"(id);


--
-- Name: Facturation Facturation_Destinataire_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturation"
    ADD CONSTRAINT "Facturation_Destinataire_fkey" FOREIGN KEY ("Destinataire") REFERENCES public."Client"(id);


--
-- Name: Facturation Facturation_Locataire_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturation"
    ADD CONSTRAINT "Facturation_Locataire_fkey" FOREIGN KEY ("Locataire") REFERENCES public."Client"(id);


--
-- Name: Facturation Facturation_Proprietaire_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturation"
    ADD CONSTRAINT "Facturation_Proprietaire_fkey" FOREIGN KEY ("Proprietaire") REFERENCES public."Client"(id);


--
-- Name: Facturation Facturation_expediteur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturation"
    ADD CONSTRAINT "Facturation_expediteur_fkey" FOREIGN KEY (expediteur) REFERENCES public."Expert"(id);


--
-- Name: Mission Mission_ID_AS_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_AS_fkey" FOREIGN KEY ("ID_AS") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_Agent_CellTech_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_Agent_CellTech_fkey" FOREIGN KEY ("ID_Agent_CellTech") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_Agent_saisie_Cell_Planif_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_Agent_saisie_Cell_Planif_fkey" FOREIGN KEY ("ID_Agent_saisie_Cell_Planif") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_INTERV_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_INTERV_fkey" FOREIGN KEY ("ID_INTERV") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_Respon_Cell_Dev_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_Respon_Cell_Dev_fkey" FOREIGN KEY ("ID_Respon_Cell_Dev") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_Respon_Cell_Planif_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_Respon_Cell_Planif_fkey" FOREIGN KEY ("ID_Respon_Cell_Planif") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_Respon_Cell_Tech_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_Respon_Cell_Tech_fkey" FOREIGN KEY ("ID_Respon_Cell_Tech") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_Suiveur_Cell_Planif_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_Suiveur_Cell_Planif_fkey" FOREIGN KEY ("ID_Suiveur_Cell_Planif") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_Suiveur_Cell_Tech_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_Suiveur_Cell_Tech_fkey" FOREIGN KEY ("ID_Suiveur_Cell_Tech") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_agent_Cell_Dev_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_agent_Cell_Dev_fkey" FOREIGN KEY ("ID_agent_Cell_Dev") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_agent_chiffrage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_agent_chiffrage_fkey" FOREIGN KEY ("ID_agent_chiffrage") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_ID_manager_chiffrage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_ID_manager_chiffrage_fkey" FOREIGN KEY ("ID_manager_chiffrage") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_Reference_BAILLEUR_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_Reference_BAILLEUR_fkey" FOREIGN KEY ("Reference_BAILLEUR") REFERENCES public."Client"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Negotiateur_History Negotiateur_History_negotiateur_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Negotiateur_History"
    ADD CONSTRAINT "Negotiateur_History_negotiateur_id_fkey" FOREIGN KEY (negotiateur_id) REFERENCES public."Client_negotiateur"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Tarifs Tarifs_reference_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarifs"
    ADD CONSTRAINT "Tarifs_reference_client_fkey" FOREIGN KEY (reference_client) REFERENCES public."Client"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: facturation_client facturation_client_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturation_client
    ADD CONSTRAINT facturation_client_client_fkey FOREIGN KEY (client) REFERENCES public."Client"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: facturation_mission facturation_mission_fact_mission_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturation_mission
    ADD CONSTRAINT facturation_mission_fact_mission_fkey FOREIGN KEY (fact_mission) REFERENCES public.facturation_client(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: facturation_mission facturation_mission_ref_mission_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturation_mission
    ADD CONSTRAINT facturation_mission_ref_mission_fkey FOREIGN KEY (ref_mission) REFERENCES public."Mission"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: prospect_History prospect_History_prospect_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."prospect_History"
    ADD CONSTRAINT "prospect_History_prospect_fkey" FOREIGN KEY (prospect) REFERENCES public.prospect(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: suivi_prospect suivi_prospect_prospect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suivi_prospect
    ADD CONSTRAINT suivi_prospect_prospect_id_fkey FOREIGN KEY (prospect_id) REFERENCES public.prospect(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

