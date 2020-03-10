--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--





--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5d56138d78cededb5d94790ccc6aeffe4';






--
-- Database creation
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.11 (Debian 10.11-1.pgdg90+1)
-- Dumped by pg_dump version 10.11 (Debian 10.11-1.pgdg90+1)

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: confirm_email_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.confirm_email_token (
    token character varying(128) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.confirm_email_token OWNER TO postgres;

--
-- Name: core_contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_contact (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    dienthoai character varying(200) NOT NULL
);


ALTER TABLE public.core_contact OWNER TO postgres;

--
-- Name: core_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_contact_id_seq OWNER TO postgres;

--
-- Name: core_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_contact_id_seq OWNED BY public.core_contact.id;


--
-- Name: core_duan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_duan (
    id integer NOT NULL,
    code integer NOT NULL,
    name character varying(200) NOT NULL,
    phuongxa_id integer NOT NULL
);


ALTER TABLE public.core_duan OWNER TO postgres;

--
-- Name: core_duan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_duan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_duan_id_seq OWNER TO postgres;

--
-- Name: core_duan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_duan_id_seq OWNED BY public.core_duan.id;


--
-- Name: core_duongpho; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_duongpho (
    id integer NOT NULL,
    code integer NOT NULL,
    name character varying(200) NOT NULL,
    phuongxa_id integer NOT NULL
);


ALTER TABLE public.core_duongpho OWNER TO postgres;

--
-- Name: core_duongpho_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_duongpho_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_duongpho_id_seq OWNER TO postgres;

--
-- Name: core_duongpho_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_duongpho_id_seq OWNED BY public.core_duongpho.id;


--
-- Name: core_huong; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_huong (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.core_huong OWNER TO postgres;

--
-- Name: core_huong_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_huong_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_huong_id_seq OWNER TO postgres;

--
-- Name: core_huong_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_huong_id_seq OWNED BY public.core_huong.id;


--
-- Name: core_loaibds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_loaibds (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.core_loaibds OWNER TO postgres;

--
-- Name: core_loaibds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_loaibds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_loaibds_id_seq OWNER TO postgres;

--
-- Name: core_loaibds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_loaibds_id_seq OWNED BY public.core_loaibds.id;


--
-- Name: core_loaitin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_loaitin (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.core_loaitin OWNER TO postgres;

--
-- Name: core_loaitin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_loaitin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_loaitin_id_seq OWNER TO postgres;

--
-- Name: core_loaitin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_loaitin_id_seq OWNED BY public.core_loaitin.id;


--
-- Name: core_newspost; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_newspost (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    "desc" text NOT NULL,
    gia_tien double precision NOT NULL,
    dientich integer NOT NULL,
    sotang integer NOT NULL,
    so_phong_ngu integer NOT NULL,
    co_mat_tien boolean NOT NULL,
    mattien double precision NOT NULL,
    dia_chi character varying(200) NOT NULL,
    trang_thai_nha boolean NOT NULL,
    co_nha_bep boolean NOT NULL,
    co_phong_an boolean NOT NULL,
    co_san_thuong boolean NOT NULL,
    co_cho_de_xe_hoi boolean NOT NULL,
    anh_1 character varying(100),
    anh_2 character varying(100),
    anh_3 character varying(100),
    anh_4 character varying(100),
    anh_5 character varying(100),
    loai_bds_id integer,
    loai_tin_id integer,
    phaply_id integer
);


ALTER TABLE public.core_newspost OWNER TO postgres;

--
-- Name: core_newspost_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_newspost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_newspost_id_seq OWNER TO postgres;

--
-- Name: core_newspost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_newspost_id_seq OWNED BY public.core_newspost.id;


--
-- Name: core_phaply; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_phaply (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.core_phaply OWNER TO postgres;

--
-- Name: core_phaply_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_phaply_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_phaply_id_seq OWNER TO postgres;

--
-- Name: core_phaply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_phaply_id_seq OWNED BY public.core_phaply.id;


--
-- Name: core_phuongxa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_phuongxa (
    id integer NOT NULL,
    code integer NOT NULL,
    name character varying(200) NOT NULL,
    huyen_id integer NOT NULL
);


ALTER TABLE public.core_phuongxa OWNER TO postgres;

--
-- Name: core_phuongxa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_phuongxa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_phuongxa_id_seq OWNER TO postgres;

--
-- Name: core_phuongxa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_phuongxa_id_seq OWNED BY public.core_phuongxa.id;


--
-- Name: core_quanhuyen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_quanhuyen (
    id integer NOT NULL,
    code integer NOT NULL,
    name character varying(200) NOT NULL,
    tinh_id integer NOT NULL
);


ALTER TABLE public.core_quanhuyen OWNER TO postgres;

--
-- Name: core_quanhuyen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_quanhuyen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_quanhuyen_id_seq OWNER TO postgres;

--
-- Name: core_quanhuyen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_quanhuyen_id_seq OWNED BY public.core_quanhuyen.id;


--
-- Name: core_templatebaiviet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_templatebaiviet (
    id integer NOT NULL,
    baiviet text NOT NULL
);


ALTER TABLE public.core_templatebaiviet OWNER TO postgres;

--
-- Name: core_templatebaiviet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_templatebaiviet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_templatebaiviet_id_seq OWNER TO postgres;

--
-- Name: core_templatebaiviet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_templatebaiviet_id_seq OWNED BY public.core_templatebaiviet.id;


--
-- Name: core_tinh; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_tinh (
    id integer NOT NULL,
    code integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.core_tinh OWNER TO postgres;

--
-- Name: core_tinh_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_tinh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_tinh_id_seq OWNER TO postgres;

--
-- Name: core_tinh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_tinh_id_seq OWNED BY public.core_tinh.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: login_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login_history (
    id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    num_date integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.login_history OWNER TO postgres;

--
-- Name: login_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.login_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_history_id_seq OWNER TO postgres;

--
-- Name: login_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.login_history_id_seq OWNED BY public.login_history.id;


--
-- Name: notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification (
    id integer NOT NULL,
    title text NOT NULL,
    body text NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.notification OWNER TO postgres;

--
-- Name: notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_id_seq OWNER TO postgres;

--
-- Name: notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notification_id_seq OWNED BY public.notification.id;


--
-- Name: reset_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reset_token (
    reset_token character varying(10) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.reset_token OWNER TO postgres;

--
-- Name: token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.token (
    key character varying(128) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.token OWNER TO postgres;

--
-- Name: user_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_notification (
    id integer NOT NULL,
    is_read boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    notification_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.user_notification OWNER TO postgres;

--
-- Name: user_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_notification_id_seq OWNER TO postgres;

--
-- Name: user_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_notification_id_seq OWNED BY public.user_notification.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: core_contact id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_contact ALTER COLUMN id SET DEFAULT nextval('public.core_contact_id_seq'::regclass);


--
-- Name: core_duan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_duan ALTER COLUMN id SET DEFAULT nextval('public.core_duan_id_seq'::regclass);


--
-- Name: core_duongpho id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_duongpho ALTER COLUMN id SET DEFAULT nextval('public.core_duongpho_id_seq'::regclass);


--
-- Name: core_huong id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_huong ALTER COLUMN id SET DEFAULT nextval('public.core_huong_id_seq'::regclass);


--
-- Name: core_loaibds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_loaibds ALTER COLUMN id SET DEFAULT nextval('public.core_loaibds_id_seq'::regclass);


--
-- Name: core_loaitin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_loaitin ALTER COLUMN id SET DEFAULT nextval('public.core_loaitin_id_seq'::regclass);


--
-- Name: core_newspost id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_newspost ALTER COLUMN id SET DEFAULT nextval('public.core_newspost_id_seq'::regclass);


--
-- Name: core_phaply id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_phaply ALTER COLUMN id SET DEFAULT nextval('public.core_phaply_id_seq'::regclass);


--
-- Name: core_phuongxa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_phuongxa ALTER COLUMN id SET DEFAULT nextval('public.core_phuongxa_id_seq'::regclass);


--
-- Name: core_quanhuyen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_quanhuyen ALTER COLUMN id SET DEFAULT nextval('public.core_quanhuyen_id_seq'::regclass);


--
-- Name: core_templatebaiviet id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_templatebaiviet ALTER COLUMN id SET DEFAULT nextval('public.core_templatebaiviet_id_seq'::regclass);


--
-- Name: core_tinh id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_tinh ALTER COLUMN id SET DEFAULT nextval('public.core_tinh_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: login_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_history ALTER COLUMN id SET DEFAULT nextval('public.login_history_id_seq'::regclass);


--
-- Name: notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification ALTER COLUMN id SET DEFAULT nextval('public.notification_id_seq'::regclass);


--
-- Name: user_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_notification ALTER COLUMN id SET DEFAULT nextval('public.user_notification_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add contact	7	add_contact
26	Can change contact	7	change_contact
27	Can delete contact	7	delete_contact
28	Can view contact	7	view_contact
29	Can add huong	8	add_huong
30	Can change huong	8	change_huong
31	Can delete huong	8	delete_huong
32	Can view huong	8	view_huong
33	Can add loai bds	9	add_loaibds
34	Can change loai bds	9	change_loaibds
35	Can delete loai bds	9	delete_loaibds
36	Can view loai bds	9	view_loaibds
37	Can add loai tin	10	add_loaitin
38	Can change loai tin	10	change_loaitin
39	Can delete loai tin	10	delete_loaitin
40	Can view loai tin	10	view_loaitin
41	Can add phap ly	11	add_phaply
42	Can change phap ly	11	change_phaply
43	Can delete phap ly	11	delete_phaply
44	Can view phap ly	11	view_phaply
45	Can add Mẫu tin	12	add_templatebaiviet
46	Can change Mẫu tin	12	change_templatebaiviet
47	Can delete Mẫu tin	12	delete_templatebaiviet
48	Can view Mẫu tin	12	view_templatebaiviet
49	Can add tinh	13	add_tinh
50	Can change tinh	13	change_tinh
51	Can delete tinh	13	delete_tinh
52	Can view tinh	13	view_tinh
53	Can add quan huyen	14	add_quanhuyen
54	Can change quan huyen	14	change_quanhuyen
55	Can delete quan huyen	14	delete_quanhuyen
56	Can view quan huyen	14	view_quanhuyen
57	Can add phuong xa	15	add_phuongxa
58	Can change phuong xa	15	change_phuongxa
59	Can delete phuong xa	15	delete_phuongxa
60	Can view phuong xa	15	view_phuongxa
61	Can add Nhà	16	add_newspost
62	Can change Nhà	16	change_newspost
63	Can delete Nhà	16	delete_newspost
64	Can view Nhà	16	view_newspost
65	Can add duong pho	17	add_duongpho
66	Can change duong pho	17	change_duongpho
67	Can delete duong pho	17	delete_duongpho
68	Can view duong pho	17	view_duongpho
69	Can add du an	18	add_duan
70	Can change du an	18	change_duan
71	Can delete du an	18	delete_duan
72	Can view du an	18	view_duan
73	Can add notification	19	add_notification
74	Can change notification	19	change_notification
75	Can delete notification	19	delete_notification
76	Can view notification	19	view_notification
77	Can add user notification	20	add_usernotification
78	Can change user notification	20	change_usernotification
79	Can delete user notification	20	delete_usernotification
80	Can view user notification	20	view_usernotification
81	Can add token	21	add_token
82	Can change token	21	change_token
83	Can delete token	21	delete_token
84	Can view token	21	view_token
85	Can add reset token	22	add_resettoken
86	Can change reset token	22	change_resettoken
87	Can delete reset token	22	delete_resettoken
88	Can view reset token	22	view_resettoken
89	Can add login history	23	add_loginhistory
90	Can change login history	23	change_loginhistory
91	Can delete login history	23	delete_loginhistory
92	Can view login history	23	view_loginhistory
93	Can add confirm email token	24	add_confirmemailtoken
94	Can change confirm email token	24	change_confirmemailtoken
95	Can delete confirm email token	24	delete_confirmemailtoken
96	Can view confirm email token	24	view_confirmemailtoken
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$7qBWjWdUfQzj$dz21+7DSG/OTroKVdK9xRSFBKawNq5CJET7cutr0Pno=	2020-03-05 11:24:11.955468+00	t	sonnh				t	t	2020-03-05 11:23:51.1436+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: confirm_email_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.confirm_email_token (token, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: core_contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_contact (id, name, dienthoai) FROM stdin;
\.


--
-- Data for Name: core_duan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_duan (id, code, name, phuongxa_id) FROM stdin;
\.


--
-- Data for Name: core_duongpho; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_duongpho (id, code, name, phuongxa_id) FROM stdin;
\.


--
-- Data for Name: core_huong; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_huong (id, name) FROM stdin;
\.


--
-- Data for Name: core_loaibds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_loaibds (id, name) FROM stdin;
1	Nhà phố
2	Nhà riêng
3	Biệt thự liền kề
4	Chung cư
5	Nhà hàng, khách sạn
6	Văn phòng
7	Phòng trọ
8	Trang trại, khu nghỉ dưỡng
9	Mặt bằng, cửa hàng
10	Đất nền, phân lô
11	Đất nông, lâm nghiệp
12	Nhà xưởng
13	Các loại khác
\.


--
-- Data for Name: core_loaitin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_loaitin (id, name) FROM stdin;
1	Cần bán
2	Cho thuê
3	Cần mua
4	Cần thuê
\.


--
-- Data for Name: core_newspost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_newspost (id, title, "desc", gia_tien, dientich, sotang, so_phong_ngu, co_mat_tien, mattien, dia_chi, trang_thai_nha, co_nha_bep, co_phong_an, co_san_thuong, co_cho_de_xe_hoi, anh_1, anh_2, anh_3, anh_4, anh_5, loai_bds_id, loai_tin_id, phaply_id) FROM stdin;
1	hsadfa	<p>sonnh</p>	1	1	1	0	t	3	h	t	t	f	f	f						2	1	1
\.


--
-- Data for Name: core_phaply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_phaply (id, name) FROM stdin;
1	Sổ đỏ/ sổ hồng
2	Giấy tờ hợp lệ
3	Giấy phép xây dựng
4	Giấy phép kinh doanh
\.


--
-- Data for Name: core_phuongxa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_phuongxa (id, code, name, huyen_id) FROM stdin;
\.


--
-- Data for Name: core_quanhuyen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_quanhuyen (id, code, name, tinh_id) FROM stdin;
\.


--
-- Data for Name: core_templatebaiviet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_templatebaiviet (id, baiviet) FROM stdin;
\.


--
-- Data for Name: core_tinh; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_tinh (id, code, name) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-03-07 05:14:55.971842+00	1	hsadfa	1	[{"added": {}}]	16	1
2	2020-03-10 04:51:25.918358+00	1	LoaiTin object (1)	1	[{"added": {}}]	10	1
3	2020-03-10 04:51:41.629523+00	2	LoaiTin object (2)	1	[{"added": {}}]	10	1
4	2020-03-10 04:51:54.092749+00	3	LoaiTin object (3)	1	[{"added": {}}]	10	1
5	2020-03-10 04:52:00.312434+00	4	LoaiTin object (4)	1	[{"added": {}}]	10	1
6	2020-03-10 04:55:11.168264+00	1	Nhà phố	1	[{"added": {}}]	9	1
7	2020-03-10 04:55:23.827684+00	2	Nhà riêng	1	[{"added": {}}]	9	1
8	2020-03-10 04:55:43.845066+00	3	Biệt thự liền kề	1	[{"added": {}}]	9	1
9	2020-03-10 04:56:13.213549+00	4	Chung cư	1	[{"added": {}}]	9	1
10	2020-03-10 04:56:35.161589+00	5	Nhà hàng, khách sạn	1	[{"added": {}}]	9	1
11	2020-03-10 04:56:50.873+00	6	Văn phòng	1	[{"added": {}}]	9	1
12	2020-03-10 04:56:56.958103+00	7	Phòng trọ	1	[{"added": {}}]	9	1
13	2020-03-10 04:57:26.231703+00	8	Trang trại, khu nghỉ dưỡng	1	[{"added": {}}]	9	1
14	2020-03-10 04:57:48.991833+00	9	Mặt bằng, cửa hàng	1	[{"added": {}}]	9	1
15	2020-03-10 04:58:12.432453+00	10	Đất nền, phân lô	1	[{"added": {}}]	9	1
16	2020-03-10 04:58:30.169179+00	11	Đất nông, lâm nghiệp	1	[{"added": {}}]	9	1
17	2020-03-10 04:58:43.083611+00	12	Nhà xưởng	1	[{"added": {}}]	9	1
18	2020-03-10 04:58:49.502148+00	13	Các loại khác	1	[{"added": {}}]	9	1
19	2020-03-10 06:32:57.958378+00	1	Sổ đỏ/ sổ hồng	1	[{"added": {}}]	11	1
20	2020-03-10 06:33:10.910001+00	2	Giấy tờ hợp lệ	1	[{"added": {}}]	11	1
21	2020-03-10 06:33:28.181344+00	3	Giấy phép xây dựng	1	[{"added": {}}]	11	1
22	2020-03-10 06:33:40.894643+00	4	Giấy phép kinh doanh	1	[{"added": {}}]	11	1
23	2020-03-10 06:39:49.951154+00	1	hsadfa	2	[{"changed": {"fields": ["loai_tin", "loai_bds", "phaply"]}}]	16	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	core	contact
8	core	huong
9	core	loaibds
10	core	loaitin
11	core	phaply
12	core	templatebaiviet
13	core	tinh
14	core	quanhuyen
15	core	phuongxa
16	core	newspost
17	core	duongpho
18	core	duan
19	users	notification
20	users	usernotification
21	users	token
22	users	resettoken
23	users	loginhistory
24	users	confirmemailtoken
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-03-05 11:22:31.241352+00
2	auth	0001_initial	2020-03-05 11:22:31.293575+00
3	admin	0001_initial	2020-03-05 11:22:31.342503+00
4	admin	0002_logentry_remove_auto_add	2020-03-05 11:22:31.363198+00
5	admin	0003_logentry_add_action_flag_choices	2020-03-05 11:22:31.376676+00
6	contenttypes	0002_remove_content_type_name	2020-03-05 11:22:31.399829+00
7	auth	0002_alter_permission_name_max_length	2020-03-05 11:22:31.407954+00
8	auth	0003_alter_user_email_max_length	2020-03-05 11:22:31.420957+00
9	auth	0004_alter_user_username_opts	2020-03-05 11:22:31.432248+00
10	auth	0005_alter_user_last_login_null	2020-03-05 11:22:31.444428+00
11	auth	0006_require_contenttypes_0002	2020-03-05 11:22:31.447675+00
12	auth	0007_alter_validators_add_error_messages	2020-03-05 11:22:31.457904+00
13	auth	0008_alter_user_username_max_length	2020-03-05 11:22:31.473197+00
14	auth	0009_alter_user_last_name_max_length	2020-03-05 11:22:31.48468+00
15	auth	0010_alter_group_name_max_length	2020-03-05 11:22:31.495391+00
16	auth	0011_update_proxy_permissions	2020-03-05 11:22:31.505993+00
17	core	0001_initial	2020-03-05 11:22:31.582213+00
18	sessions	0001_initial	2020-03-05 11:22:31.616058+00
19	users	0001_initial	2020-03-05 11:22:31.692563+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
n5qju0xxf3i2nds0nnmjexqtrxt30w6h	YzE4ZTZjZDY1ZDlkNTNjY2EzMWJhMDIwYmMxNTZmMDAxZWJmZDA5ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ODQ4Mzk0MjUwMDgxMWRiNTZiZTQ5YmRhZjE0NzE2ZTZhYzRlNTg3In0=	2020-03-19 11:24:11.958548+00
\.


--
-- Data for Name: login_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login_history (id, start_date, end_date, num_date, user_id) FROM stdin;
\.


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notification (id, title, body, created_at) FROM stdin;
\.


--
-- Data for Name: reset_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reset_token (reset_token, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: user_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_notification (id, is_read, created_at, notification_id, user_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 96, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: core_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_contact_id_seq', 1, false);


--
-- Name: core_duan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_duan_id_seq', 1, false);


--
-- Name: core_duongpho_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_duongpho_id_seq', 1, false);


--
-- Name: core_huong_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_huong_id_seq', 1, false);


--
-- Name: core_loaibds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_loaibds_id_seq', 13, true);


--
-- Name: core_loaitin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_loaitin_id_seq', 4, true);


--
-- Name: core_newspost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_newspost_id_seq', 1, true);


--
-- Name: core_phaply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_phaply_id_seq', 4, true);


--
-- Name: core_phuongxa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_phuongxa_id_seq', 1, false);


--
-- Name: core_quanhuyen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_quanhuyen_id_seq', 1, false);


--
-- Name: core_templatebaiviet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_templatebaiviet_id_seq', 1, false);


--
-- Name: core_tinh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_tinh_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 23, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 24, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: login_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.login_history_id_seq', 1, false);


--
-- Name: notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notification_id_seq', 1, false);


--
-- Name: user_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_notification_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: confirm_email_token confirm_email_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.confirm_email_token
    ADD CONSTRAINT confirm_email_token_pkey PRIMARY KEY (token);


--
-- Name: core_contact core_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_contact
    ADD CONSTRAINT core_contact_pkey PRIMARY KEY (id);


--
-- Name: core_duan core_duan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_duan
    ADD CONSTRAINT core_duan_pkey PRIMARY KEY (id);


--
-- Name: core_duongpho core_duongpho_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_duongpho
    ADD CONSTRAINT core_duongpho_pkey PRIMARY KEY (id);


--
-- Name: core_huong core_huong_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_huong
    ADD CONSTRAINT core_huong_pkey PRIMARY KEY (id);


--
-- Name: core_loaibds core_loaibds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_loaibds
    ADD CONSTRAINT core_loaibds_pkey PRIMARY KEY (id);


--
-- Name: core_loaitin core_loaitin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_loaitin
    ADD CONSTRAINT core_loaitin_pkey PRIMARY KEY (id);


--
-- Name: core_newspost core_newspost_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_newspost
    ADD CONSTRAINT core_newspost_pkey PRIMARY KEY (id);


--
-- Name: core_phaply core_phaply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_phaply
    ADD CONSTRAINT core_phaply_pkey PRIMARY KEY (id);


--
-- Name: core_phuongxa core_phuongxa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_phuongxa
    ADD CONSTRAINT core_phuongxa_pkey PRIMARY KEY (id);


--
-- Name: core_quanhuyen core_quanhuyen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_quanhuyen
    ADD CONSTRAINT core_quanhuyen_pkey PRIMARY KEY (id);


--
-- Name: core_templatebaiviet core_templatebaiviet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_templatebaiviet
    ADD CONSTRAINT core_templatebaiviet_pkey PRIMARY KEY (id);


--
-- Name: core_tinh core_tinh_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_tinh
    ADD CONSTRAINT core_tinh_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: login_history login_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_history
    ADD CONSTRAINT login_history_pkey PRIMARY KEY (id);


--
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- Name: reset_token reset_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reset_token
    ADD CONSTRAINT reset_token_pkey PRIMARY KEY (reset_token);


--
-- Name: token token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_pkey PRIMARY KEY (key);


--
-- Name: user_notification user_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_notification
    ADD CONSTRAINT user_notification_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: confirm_email_token_token_5b011d0e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX confirm_email_token_token_5b011d0e_like ON public.confirm_email_token USING btree (token varchar_pattern_ops);


--
-- Name: confirm_email_token_user_id_a738242a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX confirm_email_token_user_id_a738242a ON public.confirm_email_token USING btree (user_id);


--
-- Name: core_duan_phuongxa_id_0071f41c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_duan_phuongxa_id_0071f41c ON public.core_duan USING btree (phuongxa_id);


--
-- Name: core_duongpho_phuongxa_id_a0f8daab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_duongpho_phuongxa_id_a0f8daab ON public.core_duongpho USING btree (phuongxa_id);


--
-- Name: core_newspost_loai_bds_id_4bc70106; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_newspost_loai_bds_id_4bc70106 ON public.core_newspost USING btree (loai_bds_id);


--
-- Name: core_newspost_loai_tin_id_782fba2a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_newspost_loai_tin_id_782fba2a ON public.core_newspost USING btree (loai_tin_id);


--
-- Name: core_newspost_phaply_id_7a47cb72; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_newspost_phaply_id_7a47cb72 ON public.core_newspost USING btree (phaply_id);


--
-- Name: core_phuongxa_huyen_id_8d33b047; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_phuongxa_huyen_id_8d33b047 ON public.core_phuongxa USING btree (huyen_id);


--
-- Name: core_quanhuyen_tinh_id_6b5df546; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_quanhuyen_tinh_id_6b5df546 ON public.core_quanhuyen USING btree (tinh_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: login_history_user_id_0eeaebb8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX login_history_user_id_0eeaebb8 ON public.login_history USING btree (user_id);


--
-- Name: reset_token_reset_token_23a1de31_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reset_token_reset_token_23a1de31_like ON public.reset_token USING btree (reset_token varchar_pattern_ops);


--
-- Name: reset_token_user_id_aae5d20a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reset_token_user_id_aae5d20a ON public.reset_token USING btree (user_id);


--
-- Name: token_key_86d3c722_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX token_key_86d3c722_like ON public.token USING btree (key varchar_pattern_ops);


--
-- Name: token_user_id_1c65fba4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX token_user_id_1c65fba4 ON public.token USING btree (user_id);


--
-- Name: user_notification_notification_id_02fe6489; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_notification_notification_id_02fe6489 ON public.user_notification USING btree (notification_id);


--
-- Name: user_notification_user_id_66a31b4a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_notification_user_id_66a31b4a ON public.user_notification USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: confirm_email_token confirm_email_token_user_id_a738242a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.confirm_email_token
    ADD CONSTRAINT confirm_email_token_user_id_a738242a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_duan core_duan_phuongxa_id_0071f41c_fk_core_duongpho_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_duan
    ADD CONSTRAINT core_duan_phuongxa_id_0071f41c_fk_core_duongpho_id FOREIGN KEY (phuongxa_id) REFERENCES public.core_duongpho(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_duongpho core_duongpho_phuongxa_id_a0f8daab_fk_core_phuongxa_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_duongpho
    ADD CONSTRAINT core_duongpho_phuongxa_id_a0f8daab_fk_core_phuongxa_id FOREIGN KEY (phuongxa_id) REFERENCES public.core_phuongxa(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_newspost core_newspost_loai_bds_id_4bc70106_fk_core_loaibds_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_newspost
    ADD CONSTRAINT core_newspost_loai_bds_id_4bc70106_fk_core_loaibds_id FOREIGN KEY (loai_bds_id) REFERENCES public.core_loaibds(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_newspost core_newspost_loai_tin_id_782fba2a_fk_core_loaitin_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_newspost
    ADD CONSTRAINT core_newspost_loai_tin_id_782fba2a_fk_core_loaitin_id FOREIGN KEY (loai_tin_id) REFERENCES public.core_loaitin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_newspost core_newspost_phaply_id_7a47cb72_fk_core_phaply_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_newspost
    ADD CONSTRAINT core_newspost_phaply_id_7a47cb72_fk_core_phaply_id FOREIGN KEY (phaply_id) REFERENCES public.core_phaply(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_phuongxa core_phuongxa_huyen_id_8d33b047_fk_core_quanhuyen_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_phuongxa
    ADD CONSTRAINT core_phuongxa_huyen_id_8d33b047_fk_core_quanhuyen_id FOREIGN KEY (huyen_id) REFERENCES public.core_quanhuyen(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_quanhuyen core_quanhuyen_tinh_id_6b5df546_fk_core_tinh_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_quanhuyen
    ADD CONSTRAINT core_quanhuyen_tinh_id_6b5df546_fk_core_tinh_id FOREIGN KEY (tinh_id) REFERENCES public.core_tinh(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: login_history login_history_user_id_0eeaebb8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_history
    ADD CONSTRAINT login_history_user_id_0eeaebb8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reset_token reset_token_user_id_aae5d20a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reset_token
    ADD CONSTRAINT reset_token_user_id_aae5d20a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: token token_user_id_1c65fba4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_user_id_1c65fba4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_notification user_notification_notification_id_02fe6489_fk_notification_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_notification
    ADD CONSTRAINT user_notification_notification_id_02fe6489_fk_notification_id FOREIGN KEY (notification_id) REFERENCES public.notification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_notification user_notification_user_id_66a31b4a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_notification
    ADD CONSTRAINT user_notification_user_id_66a31b4a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.11 (Debian 10.11-1.pgdg90+1)
-- Dumped by pg_dump version 10.11 (Debian 10.11-1.pgdg90+1)

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

