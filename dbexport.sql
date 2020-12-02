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
    clien_t integer,
    audit_planner integer,
    "Agent_referent_du_client" integer,
    "Validation_par_agent" boolean,
    "Lieu" character varying,
    "Date_" timestamp without time zone NOT NULL,
    "Rapport" character varying,
    "Status" boolean
);


ALTER TABLE public."Agenda" OWNER TO postgres;

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
-- Name: Chiffrage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Chiffrage" (
    id integer NOT NULL,
    "Mission" character varying,
    "Type_expert" character varying,
    "Pourcentage_gain" character varying
);


ALTER TABLE public."Chiffrage" OWNER TO postgres;

--
-- Name: Chiffrage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Chiffrage_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Chiffrage_id_seq" OWNER TO postgres;

--
-- Name: Chiffrage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Chiffrage_id_seq" OWNED BY public."Chiffrage".id;


--
-- Name: Client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Client" (
    id integer NOT NULL,
    "Reference" integer,
    "TYPE" character varying,
    "SOCIETE" character varying,
    "TITRE" character varying,
    "NOM" character varying,
    "EMAIL" character varying,
    "NUMERO" character varying,
    "ADRESSE1" character varying,
    "ADRESSE2" character varying,
    "CP" character varying,
    "VILLE" character varying,
    "Pays" character varying,
    "Numero_de_compte" character varying,
    "Visibility" boolean
);


ALTER TABLE public."Client" OWNER TO postgres;

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
-- Name: Expert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Expert" (
    id integer NOT NULL,
    "TITRE" character varying,
    "NOM" character varying,
    "TYPE" character varying,
    "EMAIL" character varying,
    "NUMERO" integer,
    password character varying(60)
);


ALTER TABLE public."Expert" OWNER TO postgres;

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
    id integer,
    "Facture_no" integer NOT NULL,
    "Date_" timestamp without time zone NOT NULL,
    "Pays" character varying,
    "Destinataire" integer,
    "expéditeur" integer,
    "Montant" character varying,
    "TVA" character varying,
    "Total" character varying,
    "Type" character varying,
    "Proprietaire" integer,
    "Locataire" integer,
    "Ville" character varying,
    "Surface" character varying,
    "Tarif" character varying,
    "Appt_Pav" character varying
);


ALTER TABLE public."Facturation" OWNER TO postgres;

--
-- Name: Facturation_Facture_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Facturation_Facture_no_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Facturation_Facture_no_seq" OWNER TO postgres;

--
-- Name: Facturation_Facture_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Facturation_Facture_no_seq" OWNED BY public."Facturation"."Facture_no";


--
-- Name: Mission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Mission" (
    id integer NOT NULL,
    "Reference_BAILLEUR" character varying,
    "SOCIETE_BAILLEUR" character varying,
    "TITRE_BAILLEUR" character varying,
    "NOM_BAILLEUR" integer,
    "ADRESSE1_BAILLEUR" character varying,
    "ADRESSE2_BAILLEUR" character varying,
    "CP_BAILLEUR" character varying,
    "VILLE_BAILLEUR" character varying,
    "NRO_FACTURE" character varying,
    "ABONNEMENT" character varying,
    "TITRE_CONCESS" character varying,
    "NOM_CONCESS" integer,
    "DATE_REALISE_EDL" character varying,
    "PRIX_HT_EDL" character varying,
    "TVA_EDL" character varying,
    "PRIX_TTC_EDL" character varying,
    "TITRE_INTERV" character varying,
    "NOM_INTERV" integer,
    "REF_LOCATAIRE" character varying,
    "TITRE_LOCATAIRE" character varying,
    "NOM_LOCATAIRE" integer,
    "ADRESSE1_BIEN" character varying,
    "ADRESSE2_BIEN" character varying,
    "CP_BIEN" character varying,
    "VILLE_BIEN" character varying,
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
    "Nom_manager_chiffrage" integer,
    "POURCENTAGE_agent_chiffrage" character varying,
    "Nom_agent_chiffrage" integer,
    "TYPE_EDL" character varying,
    "DATE_FACTURE" character varying,
    "TITRE_PROPRIO" character varying,
    "NOMPROPRIO" character varying,
    "DATE_FACT_REGLEE" character varying,
    "DATE_COM_REGLEE_AS" character varying,
    "MONTANT_COM_REGLEE_AS" character varying,
    "DATE_COM_REGLEE_AC" character varying,
    "MONTANT_COM_REGLEE_AC" character varying,
    "TYPE_LOGEMENT" character varying,
    "NBRE_EDL_ABOONEMENT" character varying,
    "MAIL_CONTACT_ENVOI_FACT" character varying,
    "DATE_saisie_enregistrement" character varying,
    "CODE_AMEXPERT" character varying,
    "COMMENTAIRE_FACTURE" character varying,
    "TYPE_PAIEMENT" character varying,
    "N_REMISE_DE_CHEQUE" character varying,
    "SAISIE_TRAITE_PAR" character varying,
    "infos_et_TRAITEMENT" character varying,
    "LOGEMENT_MEUBLE" character varying,
    "CODE_FACTURATION" character varying,
    "TYPE_DE_BIEN" character varying,
    surface_logement1 character varying,
    "ETAGE" character varying,
    "POINTAGE" character varying,
    "DATE_POINTAGE" character varying,
    "DEVEL" character varying,
    "DATE_EXTRACTION_COMPTABLE" character varying,
    "POURCENTAGE_COM_AS_DU_CLIENT" character varying,
    "Nom_Respon_Cell_Dev" integer,
    "POURCENTAGE_Respon_Cell_Dev" character varying,
    "Nom_agent_Cell_Dev" integer,
    "POURCENTAGE_Agent_Cell_Dev" character varying,
    "Nom_Agent_CellTech" integer,
    "POURCENTAGE_Agent_Cell_Tech" character varying,
    "Nom_Respon_Cell_Tech" character varying,
    "POURCENTAGE_Respon_Cell_Tech" character varying,
    "Nom_Suiveur_Cell_Tech" integer,
    "POURCENTAGE_Suiveur_Cell_Tech" character varying,
    "Nom_Respon_Cell_Planif" integer,
    "POURCENTAGE_Respon_Cell_Planif" character varying,
    "Nom_Suiveur_Cell_Planif" integer,
    "POURCENTAGE_Suiveur_Cell_Planif" character varying,
    "Nom_Agent_saisie_Cell_Planif" integer,
    "POURCENTAGE_Agent_saisie_CEll_planif" character varying
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
-- Name: Tarifs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tarifs" (
    id integer NOT NULL,
    "Service_offert" character varying,
    "Type" character varying,
    "Prix" character varying
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
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    session_id character varying(255),
    data text,
    expiry timestamp without time zone
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: Agenda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agenda" ALTER COLUMN id SET DEFAULT nextval('public."Agenda_id_seq"'::regclass);


--
-- Name: Chiffrage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Chiffrage" ALTER COLUMN id SET DEFAULT nextval('public."Chiffrage_id_seq"'::regclass);


--
-- Name: Client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client" ALTER COLUMN id SET DEFAULT nextval('public."Client_id_seq"'::regclass);


--
-- Name: Expert id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Expert" ALTER COLUMN id SET DEFAULT nextval('public."Expert_id_seq"'::regclass);


--
-- Name: Facturation Facture_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturation" ALTER COLUMN "Facture_no" SET DEFAULT nextval('public."Facturation_Facture_no_seq"'::regclass);


--
-- Name: Mission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission" ALTER COLUMN id SET DEFAULT nextval('public."Mission_id_seq"'::regclass);


--
-- Name: Tarifs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarifs" ALTER COLUMN id SET DEFAULT nextval('public."Tarifs_id_seq"'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Data for Name: Agenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Agenda" (id, clien_t, audit_planner, "Agent_referent_du_client", "Validation_par_agent", "Lieu", "Date_", "Rapport", "Status") FROM stdin;
2	1	1	2	f	Damas	2020-10-30 00:00:00	\N	f
3	3	5	7	f	SImbock	2020-11-30 00:00:00	\N	f
\.


--
-- Data for Name: Chiffrage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Chiffrage" (id, "Mission", "Type_expert", "Pourcentage_gain") FROM stdin;
\.


--
-- Data for Name: Client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Client" (id, "Reference", "TYPE", "SOCIETE", "TITRE", "NOM", "EMAIL", "NUMERO", "ADRESSE1", "ADRESSE2", "CP", "VILLE", "Pays", "Numero_de_compte", "Visibility") FROM stdin;
2	1270235	BAILLEUR	SOMBIM RAMBOUILLET 	Monsieur	MOREL Jean Marc	TEST@gmail.com	1234567	20 RUE CHASLES		78120.0	RAMBOUILLET			t
3	1075491	BAILLEUR	L'ADRESSE-LES ARDOISIÈRES SARL 3B	Monsieur	BLANVILAIN Sébastien	TEST@gmail.com	1234567	184 RUE FERDINAND VEST		49800.0	TRELAZE			t
4	123630	BAILLEUR	L'ADRESSE LES HERBIERS - SARL LES HERBIERS GESTION 	Messieux	BLANVILLAIN et TEILLOL	TEST@gmail.com	1234567	48  RUE DE BRANDON		85500.0	LES HERBIERS			t
5	109750	BAILLEUR	ETUDE THIERRY KERAVEC NOTAIRE	Monsieur	KERAVEC Thierry	TEST@gmail.com	1234567	28 rue de Verdun		44210.0	PORNIC			t
6	124320	BAILLEUR	ORPI - IMMOBILIERE DU BOUQUET 	Monsieur	LAMOTTE Stéphane	TEST@gmail.com	1234567	55 AVENUE DE LA REPUBLIQUE		77340.0	PONTAULT COMBAULT			t
7	1270213	BAILLEUR	PROCITY IMMOBILIER	Monsieur	PAYEN Franck	TEST@gmail.com	1234567	95 RUE ORDENER		75018.0	PARIS			t
8	1270216	BAILLEUR	PROCITY GEST IMMOBILIER PROCITY GEST	Madame	DEESNOYERS DE BIEVILLE	TEST@gmail.com	1234567	57 RUE CAULAINCOURT		75018.0	PARIS			t
9	107801	BAILLEUR	BARBARA IMMOBILIER - GIC IMMOBILIER	Madame              	BARBARA SANDRINE	TEST@gmail.com	1234567	CENTRE COMMERCIAL DES GRANDES TERRES		78160.0	MARLY LE ROY			t
10	110570	BAILLEUR	CITYA NANTES	Madame	VANCAPEL Sandra	TEST@gmail.com	1234567	21 BOULEVARD GUIST'HAU		44000.0	NANTES			t
11	1270234	BAILLEUR	WEST IMMOBILIER  LAFORET QUIMPER	Monsieur 	LE FLOC'H François	TEST@gmail.com	1234567	57 RUE DE BENODET		29000.0	QUIMPER			t
12	124560	BAILLEUR	VESTALIA IMMO 	Monsieur	LESCURE Thierry	TEST@gmail.com	1234567	346 AVENUE D'ARES		33700.0	MERIGNAC			t
13	123000	BAILLEUR	GUY HOQUET-SAS BUSSAT DUNNE IMMOBILIER  	Monsieur	MONNERAY Jordan	TEST@gmail.com	1234567	 234 RUE DE LA CONVENTION		75015.0	PARIS 			t
14	124140	BAILLEUR	SARL AFI - GUY HOQUET L'IMMOBILIER PATRIMOINE EPONE	Madame	JOUVET	TEST@gmail.com	1234567	 1 CHEMIN DES ETANIERES		78680.0	EPONE			t
15	10510	BAILLEUR	CENTRAL IMMOBILIER	Monsieur	GARCIA Jérémy	TEST@gmail.com	1234567	21 COUR DUPONT		85100.0	LES SABLES D'OLONNE			t
16	123610	BAILLEUR	IMMO DE France LAVAL	Madame              	VAIGREVILLE Murielle	TEST@gmail.com	1234567	19 allée du Vieux Saint Louis		53000.0	LAVAL			t
17	122165	BAILLEUR	CABINET FRUCHET 	Monsieur	FRUCHET Benjamin	TEST@gmail.com	1234567	7 RUE NATIONALE		85110.0	CHANTONNAY			t
18	110270	BAILLEUR	POOL IMMOBILIER SABLAIS	Monsieur	VERCELLETO Antoine	TEST@gmail.com	1234567	1 RUE AMEDEE GORDINI		85109.0	LES SABLES D'OLONNE			t
19	110670	BAILLEUR	SAINT MARS IMMOBILIER-SARL ELSE IMMO	Madame	COLOMEZ Christine	TEST@gmail.com	1234567	4 rue Julienne David		44850.0	SAINT MARS DU DESERT			t
20	123490	BAILLEUR	L'ADRESSE - LABEL'IMMO 85 	Monsieur	TEILLOL Gilles	TEST@gmail.com	1234567	1 RUE DES HALLES		85000.0	LA ROCHE SUR YON			t
21	110920	BAILLEUR	AGENCE IMMOBILIERE THIERRY FOURNY	Monsieur	FOURNY THIERRY	TEST@gmail.com	1234567	20 B RUE DE L'OCEAN		44810.0	HERIC			t
22	1270240	BAILLEUR	ESPACE HABITAT - BCI 	Madame              	LAGUEYT BRIGITTE	TEST@gmail.com	1234567	14 PLACE FREDERIC OZANAM		33200.0	BORDEAUX CAUDERAN			t
23	123500	BAILLEUR	L'ADRESSE - CIVM 	Monsieur	POUYET Laurent	TEST@gmail.com	1234567	 25 GRANDE RUE CHARLES DE GAULLE		94360.0	BRY SUR MARNE			t
24	122160	BAILLEUR	CABINET PIGE	Monsieur	BRACHET SEBASTIEN	TEST@gmail.com	1234567	32 RUE DE L'ETANDUERE		49000.0	ANGERS			t
25	124110	BAILLEUR	COEUR LAURAGAIS IMMO 7 AGENCE QUINT-FONSEGRIVES	Monsieur	SOUAL Yannick	TEST@gmail.com	1234567	COURS GOUDOULI		31130.0	FONSEGRIVES			t
26	120070	BAILLEUR	DJC INVEST 	Monsieur	CRAUNOT DAVID	TEST@gmail.com	1234567	 96 Boulevard des Batignolles		75018.0	PARIS			t
27	1270223	BAILLEUR	PENN IMMOBILIER SARL MPI	Monsieur	PENN MARC	TEST@gmail.com	1234567	2 RUE DE BREST		35500.0	VITRE			t
28	1270206	BAILLEUR	SCI FDJ M. AZEMA DAVID	Monsieur	AZEMA DAVID	TEST@gmail.com	1234567	6 RUE D'EN BARTHAS		81570.0	SEMALENS			t
29	1270229	BAILLEUR	NESTENN - LOGETTE IMMOBILIER 	Madame	LOGETTE Christine	TEST@gmail.com	1234567	491 AVENUE DE VERDUN		33700.0	MERIGNAC			t
30	109662	BAILLEUR	L'ADRESSE LAU DES NAIADES	Madame              	THIBAUD GUILBAUD	TEST@gmail.com	1234567	11 BIS RUE GEORGES CLEMENCEAU		85200.0	FONTENAY LE COMTE			t
31	1270225	BAILLEUR	LAFORET SAINT ORENS DE GAMEVILLE	Monsieur	REZAG REMY	TEST@gmail.com	1234567	3 AVENUE DE GAMEVILLE		31650.0	ST-ORENS-DE-GAMEVILLE			t
32	124450	BAILLEUR	L'ADRESSE NATION - SASU DELF IMMOGEST	Madame	PERRILLAT Delphine	TEST@gmail.com	1234567	284 BOULEVARD VOLTAIRE		75011.0	PARIS			t
33	123450	BAILLEUR	LOCAGESTION-TOULOUSE 	Madame	VANHECKE Nathalie	TEST@gmail.com	1234567	40 ROUTE D'ALBI		31000.0	TOULOUSE			t
34	123560	BAILLEUR	PIERRES&COSAS SARPIG	Monsieur	SARRAZIN Pierre	TEST@gmail.com	1234567	4 RUE DES ARENES		49000.0	ANGERS			t
35	124460	BAILLEUR	GUY HOQUET SCEAUX - SARL CSG IMMOBILIER	Madame	COPPOLA Christine&Grégory	TEST@gmail.com	1234567	3 RUE FLORIAN		92330.0	SCEAUX			t
36	124170	BAILLEUR	TERRE D'ARGENCE IMMOBILIER 	Monsieur	POINCET Philippe	TEST@gmail.com	1234567	14 COURS GAMBETTA		30300.0	BEAUCAIRE			t
37	107108	LOCATAIRE			 JOVANOVIC ET TURLE Jonathan et Mirela	TEST@gmail.com	1234567	48  RUE DE PASSY 	DERNIER ETAGE	75016.0	PARIS		G12348966	t
38	107481	LOCATAIRE			ASFAUX LAUREEN 	TEST@gmail.com	1234567	 35 RUE VICTOR DURUY		75015.0	PARIS		G12348966	t
39	69213	LOCATAIRE			IHFA MYRIEM	TEST@gmail.com	1234567	 38 RUE SAINT LAMBERT		75015.0	PARIS 		G12348966	t
40	107612	LOCATAIRE			AUTECHAUD ANDEOL	TEST@gmail.com	1234567	 65 RUE DULONG		75017.0	PARIS		G12348966	t
41	107616	LOCATAIRE			HAYOUMA MIMOUN BEN ET BARBARA	TEST@gmail.com	1234567	 13 RUE GALVANI		75017.0	PARIS		G12348966	t
42	107622	LOCATAIRE			GELIS, SCHWARTZ, MAELSTAF NOEMIE CLAIRE VIOLAINE	TEST@gmail.com	1234567	 19 RUE DE BOULAINVILLIERS		75018.0	75016.0		G12348966	t
43	107653	LOCATAIRE			ELAOUD MIRIAM 	TEST@gmail.com	1234567	 254 RUE LECOURBE		75015.0	PARIS		G12348966	t
44	107655	LOCATAIRE			CHERIF JULIEN 	TEST@gmail.com	1234567	 254 RUE LECOURBE		75015.0	PARIS		G12348966	t
45	107712	LOCATAIRE			PAIN HUGO 	TEST@gmail.com	1234567	 3 RUE MALASSIS	PORTE GAUCHE 	75015.0	PARIS		G12348966	t
46	107767	LOCATAIRE			PELLERIN MATIS	TEST@gmail.com	1234567	221 RUE DE LA CONVENTION		75015.0	PARIS		G12348966	t
47	96997	LOCATAIRE			LABBE HUGO ; BRION HELOISE	TEST@gmail.com	1234567	 21 RUE DES MORILLONS		75015.0	PARIS		G12348966	t
48	\N	BAILLEUR			GAUTIER GILLES	TEST@gmail.com	1234567							t
49	\N	BAILLEUR			JAUNEAUD PATRICK 	TEST@gmail.com	1234567							t
50	\N	BAILLEUR			DAUBELCOUR DJANAME	TEST@gmail.com	1234567							t
51	\N	BAILLEUR			GROS DELPHINE 	TEST@gmail.com	1234567							t
52	\N	BAILLEUR			PREVOT ROBERT	TEST@gmail.com	1234567							t
53	\N	BAILLEUR			PAWLE ANNE 	TEST@gmail.com	1234567							t
54	\N	BAILLEUR			CHANE KIVE EMMANUEL 	TEST@gmail.com	1234567							t
55	\N	BAILLEUR			NUELLAS STEPHANE 	TEST@gmail.com	1234567							t
56	\N	BAILLEUR			RIHOUAY ANDRE	TEST@gmail.com	1234567							t
57	\N	BAILLEUR			LAGORCE MURIEL	TEST@gmail.com	1234567							t
1	\N	BAILLEUR	GUY HOQUET - CABINET FREDELION	Monsieur	BISMUTH & TEBOUL2		1234567	67 RUE CAULAINCOURT		75018.0	PARIS			t
\.


--
-- Data for Name: Expert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Expert" (id, "TITRE", "NOM", "TYPE", "EMAIL", "NUMERO", password) FROM stdin;
1	MME	DE NAZELLE ANNE	Interv	test0001@gmail.com	1234567	\N
2	M.	ST- BURLON ROMAIN	Interv	test0001@gmail.com	1234567	\N
3	M.	SIMIER MATTHEW	Interv	test0001@gmail.com	1234567	\N
4	M.	ST-AJANA WISSAM	Interv	test0001@gmail.com	1234567	\N
6	M.	AMEXPERT France	CONCESS	test0001@gmail.com	1234567	\N
7	M.	CONRAUX ERIC	CONCESS	test0001@gmail.com	1234567	\N
8	M.	AMEXPERT FRANCE	CONCESS	test0001@gmail.com	1234567	\N
9	M.	LESNE ALAN	CONCESS	test0001@gmail.com	1234567	\N
10	M.	MANDIN CHRISTOPHE	CONCESS	test0001@gmail.com	1234567	\N
11	M.	MAFAT CEDRIC	CONCESS	test0001@gmail.com	1234567	\N
12		ATMANE LUDOVIC	agent Cell Dev	test0001@gmail.com	1234567	\N
13		KAMUS BERNARD	agent Cell Dev	test0001@gmail.com	1234567	\N
14		DURANTON EMMANUEL	agent Cell Dev	test0001@gmail.com	1234567	\N
15		NEUFCOURT PASCAL	agent Cell Dev	test0001@gmail.com	1234567	\N
16		JULLIEN NADIA	Suiveur Cell Tech	test0001@gmail.com	1234567	\N
17		DETOC TRISTAN	Suiveur Cell Planif	test0001@gmail.com	1234567	\N
18		LAUDE BLADINE	Suiveur Cell Planif	test0001@gmail.com	1234567	\N
19	Mr.	Admin	Admin	test0001@gmail.com	1234567	$2b$12$hfKw7PhTw1/s7d4wteTGfOqw3jmG0Negv4/YfXt6A5ezytgyUuq9u
20	Mr.	Audit	Audit	test0001@gmail.com	1234567	$2b$12$4kv8hElmUKgL.cEi7pyaLeaw8iAAk8Ry4.S.w7N10TGLGjl.fwe36
21	Mr.	Audit	Audit	test0001@gmail.com	1234567	$2b$12$YUl6mv.nIUb0idapE./.KuW3DYZ2kAsSF6WMYouC3sKuhChuZMGd2
5	M.	DETOC XAVIER	CONCESS	test0001@gmail.com	1234567	$2b$12$4UNh0I/WDc7Y1PSczZgrde5CWxDKXy0pszEAwPqHfgME5Pqtwq2cC
\.


--
-- Data for Name: Facturation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Facturation" (id, "Facture_no", "Date_", "Pays", "Destinataire", "expéditeur", "Montant", "TVA", "Total", "Type", "Proprietaire", "Locataire", "Ville", "Surface", "Tarif", "Appt_Pav") FROM stdin;
\.


--
-- Data for Name: Mission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Mission" (id, "Reference_BAILLEUR", "SOCIETE_BAILLEUR", "TITRE_BAILLEUR", "NOM_BAILLEUR", "ADRESSE1_BAILLEUR", "ADRESSE2_BAILLEUR", "CP_BAILLEUR", "VILLE_BAILLEUR", "NRO_FACTURE", "ABONNEMENT", "TITRE_CONCESS", "NOM_CONCESS", "DATE_REALISE_EDL", "PRIX_HT_EDL", "TVA_EDL", "PRIX_TTC_EDL", "TITRE_INTERV", "NOM_INTERV", "REF_LOCATAIRE", "TITRE_LOCATAIRE", "NOM_LOCATAIRE", "ADRESSE1_BIEN", "ADRESSE2_BIEN", "CP_BIEN", "VILLE_BIEN", "CA_HT_AS", "TVA_AS", "CA_TTC_AS", "CA_HT_AC", "CA_TTC_AC", "CA_HT_TRUST", "TVA_TRUST", "Date_chiffrage_regle", "Prix_ht_chiffrage", "POURCENTAGE_suiveur_chiffrage", "POURCENTAGE_AS_chiffrage", "POURCENTAGE_manager_chiffrage", "Nom_manager_chiffrage", "POURCENTAGE_agent_chiffrage", "Nom_agent_chiffrage", "TYPE_EDL", "DATE_FACTURE", "TITRE_PROPRIO", "NOMPROPRIO", "DATE_FACT_REGLEE", "DATE_COM_REGLEE_AS", "MONTANT_COM_REGLEE_AS", "DATE_COM_REGLEE_AC", "MONTANT_COM_REGLEE_AC", "TYPE_LOGEMENT", "NBRE_EDL_ABOONEMENT", "MAIL_CONTACT_ENVOI_FACT", "DATE_saisie_enregistrement", "CODE_AMEXPERT", "COMMENTAIRE_FACTURE", "TYPE_PAIEMENT", "N_REMISE_DE_CHEQUE", "SAISIE_TRAITE_PAR", "infos_et_TRAITEMENT", "LOGEMENT_MEUBLE", "CODE_FACTURATION", "TYPE_DE_BIEN", surface_logement1, "ETAGE", "POINTAGE", "DATE_POINTAGE", "DEVEL", "DATE_EXTRACTION_COMPTABLE", "POURCENTAGE_COM_AS_DU_CLIENT", "Nom_Respon_Cell_Dev", "POURCENTAGE_Respon_Cell_Dev", "Nom_agent_Cell_Dev", "POURCENTAGE_Agent_Cell_Dev", "Nom_Agent_CellTech", "POURCENTAGE_Agent_Cell_Tech", "Nom_Respon_Cell_Tech", "POURCENTAGE_Respon_Cell_Tech", "Nom_Suiveur_Cell_Tech", "POURCENTAGE_Suiveur_Cell_Tech", "Nom_Respon_Cell_Planif", "POURCENTAGE_Respon_Cell_Planif", "Nom_Suiveur_Cell_Planif", "POURCENTAGE_Suiveur_Cell_Planif", "Nom_Agent_saisie_Cell_Planif", "POURCENTAGE_Agent_saisie_CEll_planif") FROM stdin;
\.


--
-- Data for Name: Tarifs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tarifs" (id, "Service_offert", "Type", "Prix") FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, session_id, data, expiry) FROM stdin;
\.


--
-- Name: Agenda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Agenda_id_seq"', 3, true);


--
-- Name: Chiffrage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Chiffrage_id_seq"', 1, false);


--
-- Name: Client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Client_id_seq"', 57, true);


--
-- Name: Expert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Expert_id_seq"', 21, true);


--
-- Name: Facturation_Facture_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Facturation_Facture_no_seq"', 1, false);


--
-- Name: Mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Mission_id_seq"', 1, false);


--
-- Name: Tarifs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tarifs_id_seq"', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);


--
-- Name: Agenda Agenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agenda"
    ADD CONSTRAINT "Agenda_pkey" PRIMARY KEY (id);


--
-- Name: Chiffrage Chiffrage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Chiffrage"
    ADD CONSTRAINT "Chiffrage_pkey" PRIMARY KEY (id);


--
-- Name: Client Client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client"
    ADD CONSTRAINT "Client_pkey" PRIMARY KEY (id);


--
-- Name: Expert Expert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Expert"
    ADD CONSTRAINT "Expert_pkey" PRIMARY KEY (id);


--
-- Name: Facturation Facturation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturation"
    ADD CONSTRAINT "Facturation_pkey" PRIMARY KEY ("Facture_no");


--
-- Name: Mission Mission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_pkey" PRIMARY KEY (id);


--
-- Name: Tarifs Tarifs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarifs"
    ADD CONSTRAINT "Tarifs_pkey" PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_session_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_session_id_key UNIQUE (session_id);


--
-- Name: Agenda Agenda_Agent_referent_du_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agenda"
    ADD CONSTRAINT "Agenda_Agent_referent_du_client_fkey" FOREIGN KEY ("Agent_referent_du_client") REFERENCES public."Expert"(id);


--
-- Name: Agenda Agenda_audit_planner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agenda"
    ADD CONSTRAINT "Agenda_audit_planner_fkey" FOREIGN KEY (audit_planner) REFERENCES public."Expert"(id);


--
-- Name: Agenda Agenda_clien_t_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Agenda"
    ADD CONSTRAINT "Agenda_clien_t_fkey" FOREIGN KEY (clien_t) REFERENCES public."Client"(id);


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
-- Name: Facturation Facturation_expéditeur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturation"
    ADD CONSTRAINT "Facturation_expéditeur_fkey" FOREIGN KEY ("expéditeur") REFERENCES public."Expert"(id);


--
-- Name: Mission Mission_NOM_BAILLEUR_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_NOM_BAILLEUR_fkey" FOREIGN KEY ("NOM_BAILLEUR") REFERENCES public."Client"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_NOM_CONCESS_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_NOM_CONCESS_fkey" FOREIGN KEY ("NOM_CONCESS") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_NOM_INTERV_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_NOM_INTERV_fkey" FOREIGN KEY ("NOM_INTERV") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_NOM_LOCATAIRE_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_NOM_LOCATAIRE_fkey" FOREIGN KEY ("NOM_LOCATAIRE") REFERENCES public."Client"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_Nom_Agent_CellTech_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_Nom_Agent_CellTech_fkey" FOREIGN KEY ("Nom_Agent_CellTech") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_Nom_Agent_saisie_Cell_Planif_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_Nom_Agent_saisie_Cell_Planif_fkey" FOREIGN KEY ("Nom_Agent_saisie_Cell_Planif") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_Nom_Respon_Cell_Dev_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_Nom_Respon_Cell_Dev_fkey" FOREIGN KEY ("Nom_Respon_Cell_Dev") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_Nom_Respon_Cell_Planif_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_Nom_Respon_Cell_Planif_fkey" FOREIGN KEY ("Nom_Respon_Cell_Planif") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_Nom_Suiveur_Cell_Planif_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_Nom_Suiveur_Cell_Planif_fkey" FOREIGN KEY ("Nom_Suiveur_Cell_Planif") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_Nom_Suiveur_Cell_Tech_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_Nom_Suiveur_Cell_Tech_fkey" FOREIGN KEY ("Nom_Suiveur_Cell_Tech") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_Nom_agent_Cell_Dev_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_Nom_agent_Cell_Dev_fkey" FOREIGN KEY ("Nom_agent_Cell_Dev") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_Nom_agent_chiffrage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_Nom_agent_chiffrage_fkey" FOREIGN KEY ("Nom_agent_chiffrage") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Mission Mission_Nom_manager_chiffrage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_Nom_manager_chiffrage_fkey" FOREIGN KEY ("Nom_manager_chiffrage") REFERENCES public."Expert"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

