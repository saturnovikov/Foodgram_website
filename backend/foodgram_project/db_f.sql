PGDMP     %                     {            db_foodgram    12.13    12.13 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16845    db_foodgram    DATABASE     �   CREATE DATABASE db_foodgram WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE db_foodgram;
                postgres    false                        0    0    DATABASE db_foodgram    ACL     :   GRANT ALL ON DATABASE db_foodgram TO operator_dbfoodgram;
                   postgres    false    3103            �            1259    16878 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    operator_dbfoodgram    false            �            1259    16876    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          operator_dbfoodgram    false    209            !           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          operator_dbfoodgram    false    208            �            1259    16888    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    operator_dbfoodgram    false            �            1259    16886    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          operator_dbfoodgram    false    211            "           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          operator_dbfoodgram    false    210            �            1259    16870    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    operator_dbfoodgram    false            �            1259    16868    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          operator_dbfoodgram    false    207            #           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          operator_dbfoodgram    false    206            �            1259    17005    authtoken_token    TABLE     �   CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);
 #   DROP TABLE public.authtoken_token;
       public         heap    operator_dbfoodgram    false            �            1259    16983    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         heap    operator_dbfoodgram    false            �            1259    16981    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          operator_dbfoodgram    false    219            $           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          operator_dbfoodgram    false    218            �            1259    16860    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    operator_dbfoodgram    false            �            1259    16858    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          operator_dbfoodgram    false    205            %           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          operator_dbfoodgram    false    204            �            1259    16849    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    operator_dbfoodgram    false            �            1259    16847    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          operator_dbfoodgram    false    203            &           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          operator_dbfoodgram    false    202            �            1259    17169    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    operator_dbfoodgram    false            �            1259    17086    foodgram_favorites    TABLE     �   CREATE TABLE public.foodgram_favorites (
    id integer NOT NULL,
    recipe_id integer NOT NULL,
    user_id integer NOT NULL
);
 &   DROP TABLE public.foodgram_favorites;
       public         heap    operator_dbfoodgram    false            �            1259    17084    foodgram_favorites_id_seq    SEQUENCE     �   CREATE SEQUENCE public.foodgram_favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.foodgram_favorites_id_seq;
       public          operator_dbfoodgram    false    234            '           0    0    foodgram_favorites_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.foodgram_favorites_id_seq OWNED BY public.foodgram_favorites.id;
          public          operator_dbfoodgram    false    233            �            1259    17028    foodgram_ingredient    TABLE     �   CREATE TABLE public.foodgram_ingredient (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    measurement_unit character varying(200) NOT NULL
);
 '   DROP TABLE public.foodgram_ingredient;
       public         heap    operator_dbfoodgram    false            �            1259    17026    foodgram_ingredient_id_seq    SEQUENCE     �   CREATE SEQUENCE public.foodgram_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.foodgram_ingredient_id_seq;
       public          operator_dbfoodgram    false    222            (           0    0    foodgram_ingredient_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.foodgram_ingredient_id_seq OWNED BY public.foodgram_ingredient.id;
          public          operator_dbfoodgram    false    221            �            1259    17036    foodgram_recipe    TABLE     p  CREATE TABLE public.foodgram_recipe (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    image character varying(100) NOT NULL,
    text text NOT NULL,
    cooking_time integer NOT NULL,
    pub_date timestamp with time zone NOT NULL,
    author_id integer NOT NULL,
    CONSTRAINT foodgram_recipe_cooking_time_check CHECK ((cooking_time >= 0))
);
 #   DROP TABLE public.foodgram_recipe;
       public         heap    operator_dbfoodgram    false            �            1259    17034    foodgram_recipe_id_seq    SEQUENCE     �   CREATE SEQUENCE public.foodgram_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.foodgram_recipe_id_seq;
       public          operator_dbfoodgram    false    224            )           0    0    foodgram_recipe_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.foodgram_recipe_id_seq OWNED BY public.foodgram_recipe.id;
          public          operator_dbfoodgram    false    223            �            1259    17078    foodgram_recipe_tags    TABLE     �   CREATE TABLE public.foodgram_recipe_tags (
    id integer NOT NULL,
    recipe_id integer NOT NULL,
    tag_id integer NOT NULL
);
 (   DROP TABLE public.foodgram_recipe_tags;
       public         heap    operator_dbfoodgram    false            �            1259    17076    foodgram_recipe_tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.foodgram_recipe_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.foodgram_recipe_tags_id_seq;
       public          operator_dbfoodgram    false    232            *           0    0    foodgram_recipe_tags_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.foodgram_recipe_tags_id_seq OWNED BY public.foodgram_recipe_tags.id;
          public          operator_dbfoodgram    false    231            �            1259    17191    foodgram_recipeingredient    TABLE       CREATE TABLE public.foodgram_recipeingredient (
    id integer NOT NULL,
    amount smallint NOT NULL,
    ingredient_id integer NOT NULL,
    recipe_id integer NOT NULL,
    CONSTRAINT foodgram_recipeingredient_amount_bec1b54f_check CHECK ((amount >= 0))
);
 -   DROP TABLE public.foodgram_recipeingredient;
       public         heap    operator_dbfoodgram    false            �            1259    17189     foodgram_recipeingredient_id_seq    SEQUENCE     �   CREATE SEQUENCE public.foodgram_recipeingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.foodgram_recipeingredient_id_seq;
       public          operator_dbfoodgram    false    237            +           0    0     foodgram_recipeingredient_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.foodgram_recipeingredient_id_seq OWNED BY public.foodgram_recipeingredient.id;
          public          operator_dbfoodgram    false    236            �            1259    17070    foodgram_shoppingcart    TABLE     �   CREATE TABLE public.foodgram_shoppingcart (
    id integer NOT NULL,
    recipe_id integer NOT NULL,
    user_id integer NOT NULL
);
 )   DROP TABLE public.foodgram_shoppingcart;
       public         heap    operator_dbfoodgram    false            �            1259    17068    foodgram_shoppingcart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.foodgram_shoppingcart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.foodgram_shoppingcart_id_seq;
       public          operator_dbfoodgram    false    230            ,           0    0    foodgram_shoppingcart_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.foodgram_shoppingcart_id_seq OWNED BY public.foodgram_shoppingcart.id;
          public          operator_dbfoodgram    false    229            �            1259    17062    foodgram_subscription    TABLE     �   CREATE TABLE public.foodgram_subscription (
    id integer NOT NULL,
    following_id integer NOT NULL,
    user_id integer NOT NULL
);
 )   DROP TABLE public.foodgram_subscription;
       public         heap    operator_dbfoodgram    false            �            1259    17060    foodgram_subscription_id_seq    SEQUENCE     �   CREATE SEQUENCE public.foodgram_subscription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.foodgram_subscription_id_seq;
       public          operator_dbfoodgram    false    228            -           0    0    foodgram_subscription_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.foodgram_subscription_id_seq OWNED BY public.foodgram_subscription.id;
          public          operator_dbfoodgram    false    227            �            1259    17048    foodgram_tag    TABLE     �   CREATE TABLE public.foodgram_tag (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    color character varying(7),
    slug character varying(200) NOT NULL
);
     DROP TABLE public.foodgram_tag;
       public         heap    operator_dbfoodgram    false            �            1259    17046    foodgram_tag_id_seq    SEQUENCE     �   CREATE SEQUENCE public.foodgram_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.foodgram_tag_id_seq;
       public          operator_dbfoodgram    false    226            .           0    0    foodgram_tag_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.foodgram_tag_id_seq OWNED BY public.foodgram_tag.id;
          public          operator_dbfoodgram    false    225            �            1259    16922 
   users_user    TABLE     
  CREATE TABLE public.users_user (
    id integer NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    username character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    password character varying(150) NOT NULL,
    role character varying(150) NOT NULL
);
    DROP TABLE public.users_user;
       public         heap    operator_dbfoodgram    false            �            1259    16937    users_user_groups    TABLE     �   CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 %   DROP TABLE public.users_user_groups;
       public         heap    operator_dbfoodgram    false            �            1259    16935    users_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.users_user_groups_id_seq;
       public          operator_dbfoodgram    false    215            /           0    0    users_user_groups_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;
          public          operator_dbfoodgram    false    214            �            1259    16920    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          operator_dbfoodgram    false    213            0           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;
          public          operator_dbfoodgram    false    212            �            1259    16945    users_user_user_permissions    TABLE     �   CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 /   DROP TABLE public.users_user_user_permissions;
       public         heap    operator_dbfoodgram    false            �            1259    16943 "   users_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.users_user_user_permissions_id_seq;
       public          operator_dbfoodgram    false    217            1           0    0 "   users_user_user_permissions_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;
          public          operator_dbfoodgram    false    216            �
           2604    16881    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          operator_dbfoodgram    false    209    208    209            �
           2604    16891    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          operator_dbfoodgram    false    210    211    211            �
           2604    16873    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          operator_dbfoodgram    false    206    207    207            �
           2604    16986    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          operator_dbfoodgram    false    218    219    219            �
           2604    16863    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          operator_dbfoodgram    false    205    204    205            �
           2604    16852    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          operator_dbfoodgram    false    203    202    203            �
           2604    17089    foodgram_favorites id    DEFAULT     ~   ALTER TABLE ONLY public.foodgram_favorites ALTER COLUMN id SET DEFAULT nextval('public.foodgram_favorites_id_seq'::regclass);
 D   ALTER TABLE public.foodgram_favorites ALTER COLUMN id DROP DEFAULT;
       public          operator_dbfoodgram    false    233    234    234            �
           2604    17031    foodgram_ingredient id    DEFAULT     �   ALTER TABLE ONLY public.foodgram_ingredient ALTER COLUMN id SET DEFAULT nextval('public.foodgram_ingredient_id_seq'::regclass);
 E   ALTER TABLE public.foodgram_ingredient ALTER COLUMN id DROP DEFAULT;
       public          operator_dbfoodgram    false    221    222    222            �
           2604    17039    foodgram_recipe id    DEFAULT     x   ALTER TABLE ONLY public.foodgram_recipe ALTER COLUMN id SET DEFAULT nextval('public.foodgram_recipe_id_seq'::regclass);
 A   ALTER TABLE public.foodgram_recipe ALTER COLUMN id DROP DEFAULT;
       public          operator_dbfoodgram    false    224    223    224            �
           2604    17081    foodgram_recipe_tags id    DEFAULT     �   ALTER TABLE ONLY public.foodgram_recipe_tags ALTER COLUMN id SET DEFAULT nextval('public.foodgram_recipe_tags_id_seq'::regclass);
 F   ALTER TABLE public.foodgram_recipe_tags ALTER COLUMN id DROP DEFAULT;
       public          operator_dbfoodgram    false    231    232    232            �
           2604    17194    foodgram_recipeingredient id    DEFAULT     �   ALTER TABLE ONLY public.foodgram_recipeingredient ALTER COLUMN id SET DEFAULT nextval('public.foodgram_recipeingredient_id_seq'::regclass);
 K   ALTER TABLE public.foodgram_recipeingredient ALTER COLUMN id DROP DEFAULT;
       public          operator_dbfoodgram    false    237    236    237            �
           2604    17073    foodgram_shoppingcart id    DEFAULT     �   ALTER TABLE ONLY public.foodgram_shoppingcart ALTER COLUMN id SET DEFAULT nextval('public.foodgram_shoppingcart_id_seq'::regclass);
 G   ALTER TABLE public.foodgram_shoppingcart ALTER COLUMN id DROP DEFAULT;
       public          operator_dbfoodgram    false    230    229    230            �
           2604    17065    foodgram_subscription id    DEFAULT     �   ALTER TABLE ONLY public.foodgram_subscription ALTER COLUMN id SET DEFAULT nextval('public.foodgram_subscription_id_seq'::regclass);
 G   ALTER TABLE public.foodgram_subscription ALTER COLUMN id DROP DEFAULT;
       public          operator_dbfoodgram    false    228    227    228            �
           2604    17051    foodgram_tag id    DEFAULT     r   ALTER TABLE ONLY public.foodgram_tag ALTER COLUMN id SET DEFAULT nextval('public.foodgram_tag_id_seq'::regclass);
 >   ALTER TABLE public.foodgram_tag ALTER COLUMN id DROP DEFAULT;
       public          operator_dbfoodgram    false    225    226    226            �
           2604    16925    users_user id    DEFAULT     n   ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users_user ALTER COLUMN id DROP DEFAULT;
       public          operator_dbfoodgram    false    213    212    213            �
           2604    16940    users_user_groups id    DEFAULT     |   ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);
 C   ALTER TABLE public.users_user_groups ALTER COLUMN id DROP DEFAULT;
       public          operator_dbfoodgram    false    215    214    215            �
           2604    16948    users_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);
 M   ALTER TABLE public.users_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          operator_dbfoodgram    false    216    217    217            �          0    16878 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          operator_dbfoodgram    false    209   V      �          0    16888    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          operator_dbfoodgram    false    211   s      �          0    16870    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          operator_dbfoodgram    false    207   �                0    17005    authtoken_token 
   TABLE DATA           @   COPY public.authtoken_token (key, created, user_id) FROM stdin;
    public          operator_dbfoodgram    false    220   �                0    16983    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          operator_dbfoodgram    false    219   E      �          0    16860    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          operator_dbfoodgram    false    205   �      �          0    16849    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          operator_dbfoodgram    false    203   �                0    17169    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          operator_dbfoodgram    false    235   V                0    17086    foodgram_favorites 
   TABLE DATA           D   COPY public.foodgram_favorites (id, recipe_id, user_id) FROM stdin;
    public          operator_dbfoodgram    false    234   �      
          0    17028    foodgram_ingredient 
   TABLE DATA           I   COPY public.foodgram_ingredient (id, name, measurement_unit) FROM stdin;
    public          operator_dbfoodgram    false    222   �                0    17036    foodgram_recipe 
   TABLE DATA           c   COPY public.foodgram_recipe (id, name, image, text, cooking_time, pub_date, author_id) FROM stdin;
    public          operator_dbfoodgram    false    224   En                0    17078    foodgram_recipe_tags 
   TABLE DATA           E   COPY public.foodgram_recipe_tags (id, recipe_id, tag_id) FROM stdin;
    public          operator_dbfoodgram    false    232   +o                0    17191    foodgram_recipeingredient 
   TABLE DATA           Y   COPY public.foodgram_recipeingredient (id, amount, ingredient_id, recipe_id) FROM stdin;
    public          operator_dbfoodgram    false    237   oo                0    17070    foodgram_shoppingcart 
   TABLE DATA           G   COPY public.foodgram_shoppingcart (id, recipe_id, user_id) FROM stdin;
    public          operator_dbfoodgram    false    230   �o                0    17062    foodgram_subscription 
   TABLE DATA           J   COPY public.foodgram_subscription (id, following_id, user_id) FROM stdin;
    public          operator_dbfoodgram    false    228   �o                0    17048    foodgram_tag 
   TABLE DATA           =   COPY public.foodgram_tag (id, name, color, slug) FROM stdin;
    public          operator_dbfoodgram    false    226   p                0    16922 
   users_user 
   TABLE DATA           �   COPY public.users_user (id, last_login, is_superuser, is_staff, is_active, date_joined, username, email, first_name, last_name, password, role) FROM stdin;
    public          operator_dbfoodgram    false    213   �p                0    16937    users_user_groups 
   TABLE DATA           B   COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
    public          operator_dbfoodgram    false    215   �q                0    16945    users_user_user_permissions 
   TABLE DATA           Q   COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          operator_dbfoodgram    false    217   �q      2           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          operator_dbfoodgram    false    208            3           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          operator_dbfoodgram    false    210            4           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);
          public          operator_dbfoodgram    false    206            5           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 63, true);
          public          operator_dbfoodgram    false    218            6           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);
          public          operator_dbfoodgram    false    204            7           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 32, true);
          public          operator_dbfoodgram    false    202            8           0    0    foodgram_favorites_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.foodgram_favorites_id_seq', 2, true);
          public          operator_dbfoodgram    false    233            9           0    0    foodgram_ingredient_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.foodgram_ingredient_id_seq', 2189, true);
          public          operator_dbfoodgram    false    221            :           0    0    foodgram_recipe_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.foodgram_recipe_id_seq', 21, true);
          public          operator_dbfoodgram    false    223            ;           0    0    foodgram_recipe_tags_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.foodgram_recipe_tags_id_seq', 28, true);
          public          operator_dbfoodgram    false    231            <           0    0     foodgram_recipeingredient_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.foodgram_recipeingredient_id_seq', 34, true);
          public          operator_dbfoodgram    false    236            =           0    0    foodgram_shoppingcart_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.foodgram_shoppingcart_id_seq', 3, true);
          public          operator_dbfoodgram    false    229            >           0    0    foodgram_subscription_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.foodgram_subscription_id_seq', 2, true);
          public          operator_dbfoodgram    false    227            ?           0    0    foodgram_tag_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.foodgram_tag_id_seq', 3, true);
          public          operator_dbfoodgram    false    225            @           0    0    users_user_groups_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);
          public          operator_dbfoodgram    false    214            A           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);
          public          operator_dbfoodgram    false    212            B           0    0 "   users_user_user_permissions_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);
          public          operator_dbfoodgram    false    216                       2606    16918    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            operator_dbfoodgram    false    209                       2606    16904 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            operator_dbfoodgram    false    211    211                       2606    16893 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            operator_dbfoodgram    false    211                       2606    16883    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            operator_dbfoodgram    false    209                       2606    16895 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            operator_dbfoodgram    false    207    207            
           2606    16875 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            operator_dbfoodgram    false    207            0           2606    17009 $   authtoken_token authtoken_token_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);
 N   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_pkey;
       public            operator_dbfoodgram    false    220            2           2606    17011 +   authtoken_token authtoken_token_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_key;
       public            operator_dbfoodgram    false    220            ,           2606    16992 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            operator_dbfoodgram    false    219                       2606    16867 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            operator_dbfoodgram    false    205    205                       2606    16865 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            operator_dbfoodgram    false    205                       2606    16857 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            operator_dbfoodgram    false    203            ]           2606    17176 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            operator_dbfoodgram    false    235            V           2606    17091 *   foodgram_favorites foodgram_favorites_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.foodgram_favorites
    ADD CONSTRAINT foodgram_favorites_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.foodgram_favorites DROP CONSTRAINT foodgram_favorites_pkey;
       public            operator_dbfoodgram    false    234            4           2606    17033 ,   foodgram_ingredient foodgram_ingredient_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.foodgram_ingredient
    ADD CONSTRAINT foodgram_ingredient_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.foodgram_ingredient DROP CONSTRAINT foodgram_ingredient_pkey;
       public            operator_dbfoodgram    false    222            7           2606    17045 $   foodgram_recipe foodgram_recipe_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.foodgram_recipe
    ADD CONSTRAINT foodgram_recipe_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.foodgram_recipe DROP CONSTRAINT foodgram_recipe_pkey;
       public            operator_dbfoodgram    false    224            P           2606    17083 .   foodgram_recipe_tags foodgram_recipe_tags_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.foodgram_recipe_tags
    ADD CONSTRAINT foodgram_recipe_tags_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.foodgram_recipe_tags DROP CONSTRAINT foodgram_recipe_tags_pkey;
       public            operator_dbfoodgram    false    232            S           2606    17142 H   foodgram_recipe_tags foodgram_recipe_tags_recipe_id_tag_id_829d10e0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.foodgram_recipe_tags
    ADD CONSTRAINT foodgram_recipe_tags_recipe_id_tag_id_829d10e0_uniq UNIQUE (recipe_id, tag_id);
 r   ALTER TABLE ONLY public.foodgram_recipe_tags DROP CONSTRAINT foodgram_recipe_tags_recipe_id_tag_id_829d10e0_uniq;
       public            operator_dbfoodgram    false    232    232            a           2606    17196 8   foodgram_recipeingredient foodgram_recipeingredient_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.foodgram_recipeingredient
    ADD CONSTRAINT foodgram_recipeingredient_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.foodgram_recipeingredient DROP CONSTRAINT foodgram_recipeingredient_pkey;
       public            operator_dbfoodgram    false    237            J           2606    17075 0   foodgram_shoppingcart foodgram_shoppingcart_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.foodgram_shoppingcart
    ADD CONSTRAINT foodgram_shoppingcart_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.foodgram_shoppingcart DROP CONSTRAINT foodgram_shoppingcart_pkey;
       public            operator_dbfoodgram    false    230            E           2606    17067 0   foodgram_subscription foodgram_subscription_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.foodgram_subscription
    ADD CONSTRAINT foodgram_subscription_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.foodgram_subscription DROP CONSTRAINT foodgram_subscription_pkey;
       public            operator_dbfoodgram    false    228            :           2606    17057 #   foodgram_tag foodgram_tag_color_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.foodgram_tag
    ADD CONSTRAINT foodgram_tag_color_key UNIQUE (color);
 M   ALTER TABLE ONLY public.foodgram_tag DROP CONSTRAINT foodgram_tag_color_key;
       public            operator_dbfoodgram    false    226            =           2606    17055 "   foodgram_tag foodgram_tag_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.foodgram_tag
    ADD CONSTRAINT foodgram_tag_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.foodgram_tag DROP CONSTRAINT foodgram_tag_name_key;
       public            operator_dbfoodgram    false    226            ?           2606    17053    foodgram_tag foodgram_tag_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.foodgram_tag
    ADD CONSTRAINT foodgram_tag_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.foodgram_tag DROP CONSTRAINT foodgram_tag_pkey;
       public            operator_dbfoodgram    false    226            B           2606    17059 "   foodgram_tag foodgram_tag_slug_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.foodgram_tag
    ADD CONSTRAINT foodgram_tag_slug_key UNIQUE (slug);
 L   ALTER TABLE ONLY public.foodgram_tag DROP CONSTRAINT foodgram_tag_slug_key;
       public            operator_dbfoodgram    false    226            H           2606    17103 $   foodgram_subscription user_following 
   CONSTRAINT     p   ALTER TABLE ONLY public.foodgram_subscription
    ADD CONSTRAINT user_following UNIQUE (user_id, following_id);
 N   ALTER TABLE ONLY public.foodgram_subscription DROP CONSTRAINT user_following;
       public            operator_dbfoodgram    false    228    228            Z           2606    17107    foodgram_favorites user_recipe 
   CONSTRAINT     g   ALTER TABLE ONLY public.foodgram_favorites
    ADD CONSTRAINT user_recipe UNIQUE (user_id, recipe_id);
 H   ALTER TABLE ONLY public.foodgram_favorites DROP CONSTRAINT user_recipe;
       public            operator_dbfoodgram    false    234    234            N           2606    17105 /   foodgram_shoppingcart user_recipe_shopping_cart 
   CONSTRAINT     x   ALTER TABLE ONLY public.foodgram_shoppingcart
    ADD CONSTRAINT user_recipe_shopping_cart UNIQUE (user_id, recipe_id);
 Y   ALTER TABLE ONLY public.foodgram_shoppingcart DROP CONSTRAINT user_recipe_shopping_cart;
       public            operator_dbfoodgram    false    230    230                       2606    16934    users_user users_user_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);
 I   ALTER TABLE ONLY public.users_user DROP CONSTRAINT users_user_email_key;
       public            operator_dbfoodgram    false    213                        2606    16942 (   users_user_groups users_user_groups_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_pkey;
       public            operator_dbfoodgram    false    215            #           2606    16954 B   users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);
 l   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq;
       public            operator_dbfoodgram    false    215    215                       2606    16930    users_user users_user_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.users_user DROP CONSTRAINT users_user_pkey;
       public            operator_dbfoodgram    false    213            &           2606    16950 <   users_user_user_permissions users_user_user_permissions_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_permissions_pkey;
       public            operator_dbfoodgram    false    217            )           2606    16968 [   users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq;
       public            operator_dbfoodgram    false    217    217                       2606    16932 "   users_user users_user_username_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);
 L   ALTER TABLE ONLY public.users_user DROP CONSTRAINT users_user_username_key;
       public            operator_dbfoodgram    false    213                       1259    16919    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            operator_dbfoodgram    false    209                       1259    16915 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            operator_dbfoodgram    false    211                       1259    16916 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            operator_dbfoodgram    false    211                       1259    16901 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            operator_dbfoodgram    false    207            .           1259    17017 !   authtoken_token_key_10f0b77e_like    INDEX     p   CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);
 5   DROP INDEX public.authtoken_token_key_10f0b77e_like;
       public            operator_dbfoodgram    false    220            *           1259    17003 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            operator_dbfoodgram    false    219            -           1259    17004 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            operator_dbfoodgram    false    219            [           1259    17178 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            operator_dbfoodgram    false    235            ^           1259    17177 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            operator_dbfoodgram    false    235            W           1259    17165 %   foodgram_favorites_recipe_id_8810b0c9    INDEX     i   CREATE INDEX foodgram_favorites_recipe_id_8810b0c9 ON public.foodgram_favorites USING btree (recipe_id);
 9   DROP INDEX public.foodgram_favorites_recipe_id_8810b0c9;
       public            operator_dbfoodgram    false    234            X           1259    17166 #   foodgram_favorites_user_id_3c3d9071    INDEX     e   CREATE INDEX foodgram_favorites_user_id_3c3d9071 ON public.foodgram_favorites USING btree (user_id);
 7   DROP INDEX public.foodgram_favorites_user_id_3c3d9071;
       public            operator_dbfoodgram    false    234            5           1259    17113 "   foodgram_recipe_author_id_57f9899c    INDEX     c   CREATE INDEX foodgram_recipe_author_id_57f9899c ON public.foodgram_recipe USING btree (author_id);
 6   DROP INDEX public.foodgram_recipe_author_id_57f9899c;
       public            operator_dbfoodgram    false    224            Q           1259    17153 '   foodgram_recipe_tags_recipe_id_66e55bc3    INDEX     m   CREATE INDEX foodgram_recipe_tags_recipe_id_66e55bc3 ON public.foodgram_recipe_tags USING btree (recipe_id);
 ;   DROP INDEX public.foodgram_recipe_tags_recipe_id_66e55bc3;
       public            operator_dbfoodgram    false    232            T           1259    17154 $   foodgram_recipe_tags_tag_id_5e0c30c1    INDEX     g   CREATE INDEX foodgram_recipe_tags_tag_id_5e0c30c1 ON public.foodgram_recipe_tags USING btree (tag_id);
 8   DROP INDEX public.foodgram_recipe_tags_tag_id_5e0c30c1;
       public            operator_dbfoodgram    false    232            _           1259    17207 0   foodgram_recipeingredient_ingredient_id_7eae68fe    INDEX        CREATE INDEX foodgram_recipeingredient_ingredient_id_7eae68fe ON public.foodgram_recipeingredient USING btree (ingredient_id);
 D   DROP INDEX public.foodgram_recipeingredient_ingredient_id_7eae68fe;
       public            operator_dbfoodgram    false    237            b           1259    17208 ,   foodgram_recipeingredient_recipe_id_57696fdf    INDEX     w   CREATE INDEX foodgram_recipeingredient_recipe_id_57696fdf ON public.foodgram_recipeingredient USING btree (recipe_id);
 @   DROP INDEX public.foodgram_recipeingredient_recipe_id_57696fdf;
       public            operator_dbfoodgram    false    237            K           1259    17139 (   foodgram_shoppingcart_recipe_id_ca9d982b    INDEX     o   CREATE INDEX foodgram_shoppingcart_recipe_id_ca9d982b ON public.foodgram_shoppingcart USING btree (recipe_id);
 <   DROP INDEX public.foodgram_shoppingcart_recipe_id_ca9d982b;
       public            operator_dbfoodgram    false    230            L           1259    17140 &   foodgram_shoppingcart_user_id_2270a2ea    INDEX     k   CREATE INDEX foodgram_shoppingcart_user_id_2270a2ea ON public.foodgram_shoppingcart USING btree (user_id);
 :   DROP INDEX public.foodgram_shoppingcart_user_id_2270a2ea;
       public            operator_dbfoodgram    false    230            C           1259    17127 +   foodgram_subscription_following_id_7e652987    INDEX     u   CREATE INDEX foodgram_subscription_following_id_7e652987 ON public.foodgram_subscription USING btree (following_id);
 ?   DROP INDEX public.foodgram_subscription_following_id_7e652987;
       public            operator_dbfoodgram    false    228            F           1259    17128 &   foodgram_subscription_user_id_212e9383    INDEX     k   CREATE INDEX foodgram_subscription_user_id_212e9383 ON public.foodgram_subscription USING btree (user_id);
 :   DROP INDEX public.foodgram_subscription_user_id_212e9383;
       public            operator_dbfoodgram    false    228            8           1259    17115     foodgram_tag_color_f774ad31_like    INDEX     n   CREATE INDEX foodgram_tag_color_f774ad31_like ON public.foodgram_tag USING btree (color varchar_pattern_ops);
 4   DROP INDEX public.foodgram_tag_color_f774ad31_like;
       public            operator_dbfoodgram    false    226            ;           1259    17114    foodgram_tag_name_e98998b6_like    INDEX     l   CREATE INDEX foodgram_tag_name_e98998b6_like ON public.foodgram_tag USING btree (name varchar_pattern_ops);
 3   DROP INDEX public.foodgram_tag_name_e98998b6_like;
       public            operator_dbfoodgram    false    226            @           1259    17116    foodgram_tag_slug_cd05fe38_like    INDEX     l   CREATE INDEX foodgram_tag_slug_cd05fe38_like ON public.foodgram_tag USING btree (slug varchar_pattern_ops);
 3   DROP INDEX public.foodgram_tag_slug_cd05fe38_like;
       public            operator_dbfoodgram    false    226                       1259    16952    users_user_email_243f6e77_like    INDEX     j   CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);
 2   DROP INDEX public.users_user_email_243f6e77_like;
       public            operator_dbfoodgram    false    213                       1259    16966 #   users_user_groups_group_id_9afc8d0e    INDEX     e   CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);
 7   DROP INDEX public.users_user_groups_group_id_9afc8d0e;
       public            operator_dbfoodgram    false    215            !           1259    16965 "   users_user_groups_user_id_5f6f5a90    INDEX     c   CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);
 6   DROP INDEX public.users_user_groups_user_id_5f6f5a90;
       public            operator_dbfoodgram    false    215            $           1259    16980 2   users_user_user_permissions_permission_id_0b93982e    INDEX     �   CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);
 F   DROP INDEX public.users_user_user_permissions_permission_id_0b93982e;
       public            operator_dbfoodgram    false    217            '           1259    16979 ,   users_user_user_permissions_user_id_20aca447    INDEX     w   CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);
 @   DROP INDEX public.users_user_user_permissions_user_id_20aca447;
       public            operator_dbfoodgram    false    217                       1259    16951 !   users_user_username_06e46fe6_like    INDEX     p   CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);
 5   DROP INDEX public.users_user_username_06e46fe6_like;
       public            operator_dbfoodgram    false    213            e           2606    16910 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          operator_dbfoodgram    false    2826    211    207            d           2606    16905 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          operator_dbfoodgram    false    209    211    2831            c           2606    16896 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          operator_dbfoodgram    false    205    2821    207            l           2606    17012 A   authtoken_token authtoken_token_user_id_35299eff_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_35299eff_fk_users_user_id;
       public          operator_dbfoodgram    false    220    2842    213            j           2606    16993 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          operator_dbfoodgram    false    205    2821    219            k           2606    16998 C   django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id;
       public          operator_dbfoodgram    false    213    2842    219            t           2606    17155 N   foodgram_favorites foodgram_favorites_recipe_id_8810b0c9_fk_foodgram_recipe_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.foodgram_favorites
    ADD CONSTRAINT foodgram_favorites_recipe_id_8810b0c9_fk_foodgram_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.foodgram_recipe(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.foodgram_favorites DROP CONSTRAINT foodgram_favorites_recipe_id_8810b0c9_fk_foodgram_recipe_id;
       public          operator_dbfoodgram    false    2871    224    234            u           2606    17160 G   foodgram_favorites foodgram_favorites_user_id_3c3d9071_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.foodgram_favorites
    ADD CONSTRAINT foodgram_favorites_user_id_3c3d9071_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.foodgram_favorites DROP CONSTRAINT foodgram_favorites_user_id_3c3d9071_fk_users_user_id;
       public          operator_dbfoodgram    false    2842    234    213            m           2606    17108 C   foodgram_recipe foodgram_recipe_author_id_57f9899c_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.foodgram_recipe
    ADD CONSTRAINT foodgram_recipe_author_id_57f9899c_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.foodgram_recipe DROP CONSTRAINT foodgram_recipe_author_id_57f9899c_fk_users_user_id;
       public          operator_dbfoodgram    false    213    224    2842            r           2606    17143 R   foodgram_recipe_tags foodgram_recipe_tags_recipe_id_66e55bc3_fk_foodgram_recipe_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.foodgram_recipe_tags
    ADD CONSTRAINT foodgram_recipe_tags_recipe_id_66e55bc3_fk_foodgram_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.foodgram_recipe(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.foodgram_recipe_tags DROP CONSTRAINT foodgram_recipe_tags_recipe_id_66e55bc3_fk_foodgram_recipe_id;
       public          operator_dbfoodgram    false    2871    232    224            s           2606    17148 L   foodgram_recipe_tags foodgram_recipe_tags_tag_id_5e0c30c1_fk_foodgram_tag_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.foodgram_recipe_tags
    ADD CONSTRAINT foodgram_recipe_tags_tag_id_5e0c30c1_fk_foodgram_tag_id FOREIGN KEY (tag_id) REFERENCES public.foodgram_tag(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.foodgram_recipe_tags DROP CONSTRAINT foodgram_recipe_tags_tag_id_5e0c30c1_fk_foodgram_tag_id;
       public          operator_dbfoodgram    false    232    226    2879            v           2606    17197 R   foodgram_recipeingredient foodgram_recipeingre_ingredient_id_7eae68fe_fk_foodgram_    FK CONSTRAINT     �   ALTER TABLE ONLY public.foodgram_recipeingredient
    ADD CONSTRAINT foodgram_recipeingre_ingredient_id_7eae68fe_fk_foodgram_ FOREIGN KEY (ingredient_id) REFERENCES public.foodgram_ingredient(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.foodgram_recipeingredient DROP CONSTRAINT foodgram_recipeingre_ingredient_id_7eae68fe_fk_foodgram_;
       public          operator_dbfoodgram    false    237    2868    222            w           2606    17202 N   foodgram_recipeingredient foodgram_recipeingre_recipe_id_57696fdf_fk_foodgram_    FK CONSTRAINT     �   ALTER TABLE ONLY public.foodgram_recipeingredient
    ADD CONSTRAINT foodgram_recipeingre_recipe_id_57696fdf_fk_foodgram_ FOREIGN KEY (recipe_id) REFERENCES public.foodgram_recipe(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.foodgram_recipeingredient DROP CONSTRAINT foodgram_recipeingre_recipe_id_57696fdf_fk_foodgram_;
       public          operator_dbfoodgram    false    2871    224    237            p           2606    17129 T   foodgram_shoppingcart foodgram_shoppingcart_recipe_id_ca9d982b_fk_foodgram_recipe_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.foodgram_shoppingcart
    ADD CONSTRAINT foodgram_shoppingcart_recipe_id_ca9d982b_fk_foodgram_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.foodgram_recipe(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.foodgram_shoppingcart DROP CONSTRAINT foodgram_shoppingcart_recipe_id_ca9d982b_fk_foodgram_recipe_id;
       public          operator_dbfoodgram    false    2871    230    224            q           2606    17134 M   foodgram_shoppingcart foodgram_shoppingcart_user_id_2270a2ea_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.foodgram_shoppingcart
    ADD CONSTRAINT foodgram_shoppingcart_user_id_2270a2ea_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.foodgram_shoppingcart DROP CONSTRAINT foodgram_shoppingcart_user_id_2270a2ea_fk_users_user_id;
       public          operator_dbfoodgram    false    230    213    2842            n           2606    17117 R   foodgram_subscription foodgram_subscription_following_id_7e652987_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.foodgram_subscription
    ADD CONSTRAINT foodgram_subscription_following_id_7e652987_fk_users_user_id FOREIGN KEY (following_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.foodgram_subscription DROP CONSTRAINT foodgram_subscription_following_id_7e652987_fk_users_user_id;
       public          operator_dbfoodgram    false    213    2842    228            o           2606    17122 M   foodgram_subscription foodgram_subscription_user_id_212e9383_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.foodgram_subscription
    ADD CONSTRAINT foodgram_subscription_user_id_212e9383_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.foodgram_subscription DROP CONSTRAINT foodgram_subscription_user_id_212e9383_fk_users_user_id;
       public          operator_dbfoodgram    false    2842    228    213            g           2606    16960 F   users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id;
       public          operator_dbfoodgram    false    2831    209    215            f           2606    16955 E   users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id;
       public          operator_dbfoodgram    false    213    215    2842            i           2606    16974 T   users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm;
       public          operator_dbfoodgram    false    207    217    2826            h           2606    16969 Y   users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id;
       public          operator_dbfoodgram    false    2842    213    217            �      x������ � �      �      x������ � �      �     x���An1���)rg�i��
]"�!1�vf43)tGA�@l��҈�U�+87�y~�ߛ&�ڮ2������J�̊^6��N�YOm}.����vC9 dr�3�(7���>�-�T� ���=�6g��O���B�Z��)5�@tG�ꏱh����"#�#����.�H� |Kէ��:�BDQOA;���\N��IY�v�z�y�����fF�!�Ӂ��G�[�G��O��~{\7����H�Cj62�3`c�1bh�c�~�!p�fe�����Y�/֟̕Y�̍Y���fa����,���\�|g��h倅居�9_��鱵p|-��V�m�ub*���
q ���ZOs�����`�TƲ�C�-R��tC%1��ݐ/����!tR�In�k��нGY�;(:�(Iv��	o���1�%h��f`���-�X&qu��Ga)����������ran͍���t����y�n����n���2��6�O1UI��i\���$�7�+s۳��g���
垽測*{>&Y��!��~����_���
��Ι�����c�piS����P�1}���u��F�Yݢ�&����-"l��xN�H�"�y��fU�~2���Zl�B��w��Z��N�	6�T���ܡ�j�9�;4ВS�D��t!�{���@�X��������x;�<.�n=��uˣ袪��0�@Q+�,��q`J��h
����*%�6���g<�*�7<-��Z��5�e��X�����R����8p         �   x�M̷1 �UA��sި�S�%0���U9Ak0-���c#c��X�G�x��O��Q�0"��� �9�̥���P^�'��X�]~��J׸�����4q�9�>>�l��W&������w�+ \���}���Tv2�         �  x��XKn�F]�N1�*F"����?����6if$+0$A��a@6d#^f�M. �(Nd_��Q����IJc	�8C�.V�~U=0A�zK���S�%�]�h�_+=�������\<�ܞ���r����G;���J��k�&��ߪ�Uu=@��@P�R#��:�R˾ �N�N��`�����J�J����.�^�R]To���\?N0�̞l�E��������||����"�7������L��x��o��f�in.�������m>j�f�T�@2N5a���zS]V�G�n���_[�U5��	Jt�5�����m��n{�$�P����a(B�#��:9=�?ػ���%�$���R����i����L����E�~�[[��ҕr.�q�]�%�ϒ^!����T�*�8H�����V����i���Y4z��4�w�>/��T�w��~]}�_կ��_���x��7>V���^ݱ�+���HL{e�R��1�+�*e��TEJ� �Ua��!�R#Dn���SԔG-~ 6��Q�ڠoߒ�q��� ť�B;n�hڨ�	��]pt�-[Xm��E�b3���V�rDԴׇ�"~%��+����!>�y�B2�q��9U�q%�MK\��!��=dV%Ⱦ����� ��1X"FS\G�1:�pɶ ��j��tt��N��Zް�iZ�����H@�n�Nw�_�N�_���u�+FOfšw�N��D�&�t�GS	$�CZ Q��R!}_ A4}f�Z�R��E/��EwIR�h��]� �`}^�$�B�8&���q��i��] �u�(�A���xI�%�Y�8��GX�Q:v�5X�fA4�cwX�FX�D��Z,8�bM���Z,z���h<��0���ݭő+���F�hN��*nY(eE�j�\���y{S��K�N#��w&��-�'�a1�� �S`�X���'-�'�q�]�Sj�)���[N���F��U��nƹ0m�8W]ׯ��ُ[����X��5�p�h��'A,��֡�G�H�´ͩ�2��,;-�2�&IC7C֥���:$;Lc��[��C�Fh���]c���R�������L��@����⃘ޅ�4�ҕ�S����1��r,�)F#�I$�7�C��:���)D��LƇ� G��es3f�xd��M�Z�Lǹ�ϥ�0�!�C��������E�f�� O҂b�&g'��ǃyҁ��	� ��MH)�S�՚vf<3�v�X�d��nww�a�sKC+pX��+�ƃ�ʤ=��V��r��d�f6o����w)A���a%�fs�l�dv�t�x�U�-D�\������b���3�;��>���xL��Z��U�o�n�l^�`���@T�� ,c�gI�yتR��;�
�H͆0Y�ǦM�3�������^Cq�      �   �   x�]�ˎ�0E��Ǡ1�׿�	�	4�lѿ�NG(���uM�1exJ��:�B�;�1�%ɸ�'Q�젗�s�O�m-p�˄}<�Md�F���xl$�<�yO�*�i^vn�CD�i���zM��.�
w)e��u�m+��K49�������5�gX"�����t����� �/u�rp      �   �  x����n�0��������gƿ<�JJ��Z����}�5�@H������9�쎡�\�u���c`}�;_V;dH�^�yA,�*h	���(�FW�Og�v�c��v�(��댢]�w���|�-��E{q��m�C�h���V�9�m�)�QbFф��tqu�GbR�܁�)��2\r9�ҵ�D%i@�!nU�v�
g�����	�g�Lf|�>�nd��0�m�S/ff���ϲ�����d]�!�ڵmyv��%RE8Ѐ�8�9�G3N>���L2?&��H)uF�lB�c�/Oa8����9� ���9{����&����$GÀ�&�8yB	"�5)���7�5�4���hp�SJD����E�݆Ih2D-Z C&�c7����<��{��_�!��Y�����'���]3ۅ(��C���8di5!J��m��� k��5�`S��oc����N�X֏J��"�+�]�d=�)B����&" ��f
�P���X�t'N��mq��ƒ�"�+���mʹD���Z��V�`�Q�)�p3�Y/ry���9�I�����B�����>��|s����9��S0y`FN�[qh>zu�ӫr�X1� U0��MX!�QRZcfpB�P�L3��h�9�jf���/�h
�i��,����~���8g         a  x���Kn�@  �u=E�f>�;)*"B!J�4(��)��o��M�	oJ�.
�u����V3�����j�~�>-�ns�?N����f��1�0|P��/1�x��vcQ�����}��͆!��c�����F~>�!{+�XWc����|� ��K�ɩO��.8LF�X�Z?]N��4��uX�D���z;G��Lǲ����2�{��R���T��� �4+��jP.8��8�}�١���{���z4xB a@�g�TQQ1YJ�JD/ /�\�:���rc93V��M>�t�L��E[/����ϭE��Z�����+ڸ�lH|=>(rd��^���1������By)��{��\,��S�l            x�3�44�4����� )�      
      x���I�]I�&�f���Z���s|����JhI+���JEe*2���a�!d"V� �[*To����7��/��/�/�����eB�A^�����惙�������/�}�/ԓ������q�>NϏ�����j���H�Wǻӏǫ'�_�M���g��L@���w����T�-���y�����"!�ӟ�/\>� U��t�Ho��x����������T��^ 6xk���xxr�?�[�O/S%/�� ���x��xׅi�gO�X�by^��ب��rX�����Sj�h�T�[D`�}��/�Z�͚|���Ͽ�O��S��?<՗
ߕ��*Ux}�#���C�ss����Z@jn��P��3��rw���/�����k�x����$���Wد.���$�/��m��+z�mqK�$�$�����6}���V��?m'����&
� |����BW��qzK"�Τ�y�v��U�?=ik�Ay��	�ljV��VQ��v�+蛷Ǜ/�.���A;��"?��]�����/�ج��?O?r����6��}*�D1ҟA����[���o��^S/�aδ17�)�<�����@�la�Yʬ�v �}j�w(l�Tg8+�$��FV���Ɯ��^�u%3�i�A�����^i`�[�EM�m���)��%N?!��קY�f�8l.�5�!���EӉe�����-ċU����%�����ǖ��A��q�3���֌(췷��7��$�m�����i�i�LC�Nf����H�4`|������>���xx$����-Tt@��v���uU�n�wQσ1t?�α�<�&}���x�һ9����s<��A��h��.*��j{@�gdBun(N�Q���' Z���V���<�� �� f�Ն���B%g(�ӟ*��cN�ao��eSpj��ŵ�������OM����4H��V���e�P �k0��"T�'�%i)�zv�H�-4ҟP�H�ȑȟR�8��Lzn1a�Qy^�7�H��M=�0/X���z�a���w�/�$�\/7�5ha0��׍�`'��-��!�w$m��<�b�� ?����*Į0�S-�(z��*��\���U!���KIy���v8�>F�$��y,�[T,җFn��vb�t�h;i��c�YA�$݈�\���:

Y�S�Nm��BѴcS��u!q�
K����Zhw$Rx�{QB�E��1�P5�'���z��5��W �
t_A0G���MK���u�#��J�g�Y� 셴�� s>@� %��m�Pʹ��,��`�Hu���3�������ui��.߀�q����� �C��U9�.Л�'Ar˾���9�����Pꁰ�v���)�PԼu喇��2�n�=��_�*	Rr`�s�U	Xy�<�DuY��Ua�
��W�}M��R������Xvύ&_�t���K}y5����j���+l7�w�R��\��r����2�s0�?�Ū!|�����7|ܘ*t���]c�|����&��Ӱ�A���b�굃�dE-�A�C]�
&iۙ4���f}�&�a������ H�a����Ucc����x.�)C{��L����?�<���4T-*mձ��'�l�v�gy��y�{!�I�jT���.�"��y�R�w��$��^�8��Ȑ5���i��8����F��V?��T`���Au�a��`�u�ly�j ��p�M�OS�� v�ey�=X��R�~�^M���/�5��c�������y괖PפѢ׏V���f�i���@7�0qR�^�h=(��eǓO��X�%v���n@�	Z�ڕr���\��R=�FԫҌ�?��N�^��ՙ{	k1��HpQ���i(g6;�}"}.O�t=f=R�:����|�л�8��A~����.+뙋M=�jxG��ZI��
+�d�ʰ�غ^�b$��TBm���p\�`ڀ�D�ʼ�HVo�#���S�a�V�jQm{���s^$��{�JN�T�RX���ȡ��+'��J耾�y#��#D���Ai%����xwW0�F`���o�]UC��7Nx`�G��:�Y*����%>��ݎx���@$\�ʼ�@o�$V%�
Z���B-p�s���q�P��@���SQe�7*�MY��Hш�%��
:
�-�_`g�i<���V���3�V�$�j*�a����8�����
����ʹ��Ʀŗ��l�=j����J�Z��g����0����\��X��"wbS��F�N��yS��f�6!����U���)��8-^�SK�,��ɜ��e���%}�Kt�h�ǙZ�8�#3ZMѳz��ϛ��kw�V��ռE��w//���T˧�	p��g������	}��z7b2�5P�,?�_���Z&h�2o��7�$�>z֓��zl$��J{QJϙ��He΃v�_��w#K�Rݱ��P�&n\h�U���x����-V*T�=V��9t6U�<)d�^���F�^�ռ�V����t[��0Ӓ|2�����r��U?������H�N�:��[��(*ӵ�P����^mCO�2K���ʬl>B��A톬2z���<n̈��UU�N�20��dy]_�Tη�v�� �X���
�#�Jd�\ׇ:x��KS��9�#��<�6@�`�!u�\��p���
P9ǍKy�Kʢ�r���&��5���*�K��J��c��gtQ>�	��U��X�QP�ʄj��h�<MZ����5�x��P0�?��%<�%J=�z/q�H�X������`GE?��r�+��?�c�V�//�E���Ύ��Q�s�Z_�.�3�~>l��p&sW^9���َF��?����l�ǿ_pͮJj<��M�	���Tu��'Ey= �l�����,n���̩ҳ���A'E9����.���k����CW�;yl�NF��HRaʻm��a-���FN��Aط��f�qH\BtФ:��у�8�%2��v�An ����l���{�xK��� ��h6�Ha
�AӒ�;��7Y�e�}@���]:�	�u v{L R�����Y�٩����z�@��Te{�+���n���,�Kqq��m�����~ST��m}��qh�,C��uW/k�@�^�Iѷ^����A�v����c!���Kټ�	^/�� "��2Y���yA/nJ��i��>JP/�������T��^b8nl�T[�z]F�ϨӔ�׵ @���9��y�T��[?�}>.�k1}-�W���kJ�*���l��u�;��E�CH��a���k�PK�%�0��}�ղc��_	��Zzm�-3$Z���R#����!�q'��e�w�E|�Qous�^;t�������Q��j���h�Ϭ�&kZ|��t�n�B���U�*XX�5heXU	Vp����5��0��w�!gBD)��lsSP����)\!9�l\)�˶�;VJ��#��H�E:7�=4S�0iq\��h�ц�֡{�����_6��o@�&@�<���ʜ7�6F�w؋x�E[�%�p��e��}r�0�ov�cЄ�k��u� � Zn�x�q�:�]���2��Z�+)?ȮStf���!<��w�C0[��ꎁV�W�`�A�-�a/��ڪ��b%���/��[\g<�چ.�;����܋��1��/���Bs�$��9jߩ�T���tC��� Ր�}��5�Zz�l:����N ^�����3�sj�ڪ�fv�����k�m�PY�o�i/���8G�iO�P���6��KO�`�{�\�4�!���0?����#'��S�̾>Lȳ�	�ǂ܏���<9�����i.g/�Fs8=��I�A#)&�"��h�� _V4=���Mݼ�Qۊs� �x��B���@H�T5�� �����)������G�߃��	���OcO5������|�<�,S:%Ǖ���ʆ��:(XU��;ŧ�����D���0j�0Ƀ�j���̪���N�p|8���ϙ;��[@�,�4� �����R�zɳ�G���    SoJ�0DkP?C04[@�j�CB`u^RA�:`-Ȁ�yIcB�&lr�O܀}�b1��M�Y�܀Iy%��&ُ����̅��g��`�p����m�Miv6f�_��0b6��8&:HB��K�����7`�~�S�ϸߎ�!W�Ovf�~de2;��� T�M�L;��%{�Q"|m!��f�˱!�G����9�^����_lN�)��䪥���?4��vx�����'�(��Y�`�F�{���B�g[ ��>{U�b�j����Ų��s�</-�6��gZ�Kq�[���{�@��C~Xg��D+c�6�$���T;+�ʀ����,ߋgـ��	U�g�V]�ǁ?����v;w90[>����|$i���_��iߔ5�G�=���x'3�P���O)�tN6���ϳ�A����l�O��ր�֔6�<V۞�t�$��B������V�*��OR0h�ǿ��b0�\��0`�	���7`��i��~��w��y�8��2`ye\�Ь�8i�I��9ʞz&�)�~0y�n���X[1ў�Kl��m]���oND_a����H�"���RI���4S"�-��M"6���
�6NM`�R7[̝nxN�I�괮3���M�tO��v����� s��k�sS�M;�y#!���+u���_GHѨ	��D�6^��Q��f�T碌�r�8��NuŞIIWx����C�����Ǫd�e�����d��gʧ X={�L��
F��7t���$�-�
l��0���lS��~�|N�`��}����Ўi��<�/O9������8��Ё�7�.`����n�):��7�u�DjJ�zuXP��NC�%�ZͶC>Մ��Cl�}0��Y3�y�7d��ʴ��	�WEj|�쪊��ڻ�΂q��>+FW�/��)��]�[vvai��2=��n �`z��a�b����\ۅ���=J��y
W(8�������z��K���t"��	�#���u��\��n)�*��dW%�w%�Ů�+mfP�!S(��Iv喽C��Y��d�!�]��:��@9�����D�J�$�5v���ʹ[��U�	jX�8L��Ƽg�� _��؄EY�F8����%Ѹ.p�X�Yu�*3�s]|cV�	�=�>�ܐV�	�T���0��#��2�m�[��e�w��9�7�^�O�Y=��$F�5ԃ���C�HD��~�;�;ȱ=𡝘���ToVI��LPM�$���r�KY���w����&��oq��	�,5�:l�:P&��Qlǧ�k�ŗa��aE��okL��{�+ex�����8)�$I���?�׻�y�3a��qk�k�'�伵�AI�osc����j��Z����}�0]`e�'�4M�Pb��!��Zא��>śc�4���I� �0���/5��)�V�$�Y�2e��\�Hn� ��({3���Ԕ�v���䵨���mp�7�Μ��5�nA?�T����ܝ�����S�f��!�������(#��.6W��_H,��,�����L��G���^ ����A֫�;���XȝT6Y��=���ϒ�YoPis���mb�yו�tN��cH�f
/@lt���������FI����ľ������⨔��NG�sG��W�3i�` ��&|�{Ҧ(��(�+�������k���E����Z4��>J�XA�=dc�6m\:��Ŕ#�TW�}GS=�))�O�xX����[��P��r�����������)ߤ��3�`s���rj�(e{Z���X��7�Y�{��|M%�*a���-�08�kW�����qd��)�*��9�+��'��gdO�2�iH	��mJ蒀����[� �X�� �7����#�p���ғ��{17���n�ȑ������#��и�ӣw��t��d��92�%�ܑ1x����n��dވ%O�D4E:2ŉ>��sdR�r��H�d 6�m��,{��:��ۑ��0<���#S�}ܤ?���ag҄8��&�|}�*�đ�׀��e���m�.o$�ѩ��s��w1�\�z�`i��:��a]��,�*ۉӺ)��Ks�t�s�D��g��j��T��^�:�H�[��4���5�Y6aقsd�pwp+�Ƒ�� ���XTs�*�PM��%(릉�udޑ/��0*���Ev� %���͐b��v�	�L����3���X����8j�T��J�&�Fvb��Fޘ�	ٮ#�NUX5ÎI>�Z]Ay�,v8k�7�L�RוN�Q8�π��yΆ�g
�#�UǷ�-��Okuk?��Z�j�עU���U��/���7��׿���_JjT��
8?�ʳ%���
��SdB%Os,g����5�֏�YST��α�dI�zXLw��SC7\���=��p�%t�)��Yx�� ��_�������U�{*Gl]4a;W�}�{~������/^S������Ё\�R�w'7~�(���D3ޠ$� �%������q�3��,Ǽ=1�َ���.��d6�>ƑU؁��#۰�R'����݌O� �1���e3}�,��n�����̾�2ُ�}"JS�6�t��v��9�ǭ[DuUҜ|,�`2��*�U�F����zzխ��U����>��}��A��=̯z�A!��d��|�7�������e�`+G��l$��	dX0�6]�M۝K��)����|+-�J$���k�>�K%�>��/�"����;��V�mW�-*z	��>P]��|1�snuS�G�xv�i�/���^<ڼ��[N��=ѩ����^޵�aO�켸$�?V� {4�{���ۇ��iY���u���`-|d1Km��ڑW��5<���I��������| �x��ޭ��^����;�R�++Tb�U����i�UͬL]���i����l��}��WU����c��̼ʽ����;�[(�z��Q^/�k����^��>uV{����f=2W���S�X�t1�N``�~(.g:��kߔ�g����,�[j����ʄ��6�MOT���s��_QT�7"h���e��-5�N�7Z�pE%�iʚ#/@����z�*�Fh�7�pp6�;�����Ӌ�nQ���;C�w�ό�'oR�2�l���Ѫ�P�����ģݖ��y��{�3�>��L�5��( G>��W����J��rzգ�>�U�3��4��h��0���P�u�x�����p��2��۫���;�T3�h�n�l{ֻA�4/����e�H�A��-ݾ�;�筜���I	����oe���ƙ~�+4e3q�8�47�x���I��k�o[��WWw�dx���O�n�}O��r�N��
 b��Qγ#��� ��@xd?萏��0��qf`r����r�3��q�Hg�M���ÚY8��LC�ݱ:�� 9Z�G`0� ��Z9||�#[2��9�d����	i�/�����m�m����M���:@�E"��`�h:��s�(�����m�Ƌ�e}
��NJ�w}p� ��`�)��G@�y�e��2?C8��Q
��A�6aY���K9,k��׈Sn��nA�����4sinϒ���+Z������7e�1o1>@���:d���տ�*RKݐ��1~0���~[��TX�5C���ey`�3�$5Z =�wG�]B|�5�|�R`��|(ǸX��$�U�ɟpC�U�9���Q{�O
���n�>g&zxx"�K�;��m(W��L?�s��6�l��U����DEY�}/1RA��$��\o�tD|�ek.��]�"wb�H��|Gg%��	w�^�ף��#߃-�$�*RFl����)��ߌ��^�p�����Ĥ�U���
Ϲ�~I�+���A�'�Ί��+��|�7oT�Gc#�\]$SЎȼ~��S�Ctx��=��U������շ��
7,�Y�o����?���DZk�����|��1��)���_���~���M�41.k�3SC�nd'!�}R��#q�qO��Bz�(����Z_b�Ի��L����?��]HY�e!    �o����kב��n5XՃ�n��ܤ��L �m�`��5�F��`���W�ƾ�d��TV:��F��?��Ʈt�P	�Z���6��6<��@�;P���TJ�b�̔2�������GZ�9�r�V�pn��
Hp��p_r�){܆Mp��j�:-~iA����%�n�eQ�j����yÚ�书������y��K
V����AB7�m4���V����m��@x����Ũa_+�����w>T�2��	� ����V@������ b*���]ν ������p9'Z9�]]�:��ɻ{ywD�S����a�\���ۼs��nL�KA���G���{�h��j$wl���a��������}䁨���(R��E�E���9#}�ؾ?ӭs%�3�=�<O�Pi��K���#�A��+Hۢҵ+��<>L���1Dw�n�a�/�|�'��qD^������l$g�E0��'��Ti,�8{����=����3`�Y���|zJ�g0�('lK����������c�8�x�U%.�1�����+9u�i׾_��A�ۋv*�k�=��G��+�V�n����+��k��¿����ъ�l@tm��v��;>�HvC�St�绣v���/���/���_G�38��i�Z����sG�n<����65�M4���z��b7����8y��Pj�o��a��-��F�W����j���ٗlk��׿�ݯ����|�5KBMd�ͳ����|�Ga��c��$Y��z"�%|(��'��!|������wѣa���H���
Щ��_����4��i����կ�g'#P���{�	���S�/-B��_E��W�je��	ߑ ���Y�9/ 0����YԱ��񥫙�}���ZC�w�QS`ul%=��i�A���h�R8��� �ޒ�*��d�{8�0�U'^�m�géXnq0��`׊���2ZU�����arI�&�?��Z!^6J�x����v}�~\��ц6��6N`�J����0f��ё0d�K�	����<���P�����_������ �E��8_�{Y��Ȧn�;/�z�s�+��:E�\�I��_�/hbF���S�Κa��iF��K��)���� �z��F~�7��?�9��H��Rߕ�K�}(���H9�;��>6��-n|��PuXΒ������LcamX8�w�0S04u��\}u��:�)�3�� ��.ƥ�+�EB4�*s`����!(����I��|0���H������b\�wQO"����m���5�ڱf}��L&I*�
Kzv�P%�$�ˤ��A���{�+����}��1�E�Ǐ��[2��H�Ŏ��D��w!�,������+�D=���i��D7�l���������
S���� K�<����c(��@.�M��}Wܞ��̨0���윫��g�LQ*�.[��I�u��$���7*/��ctKM\s�+!��K^��^KA�	�˨�*w� �����7{M	7�h�.j��Ɩ�����z����WT/����ey��z2�T�A���B�*R�k
�����-�vr'*53(fO��H�'�N|7PI��.ddR�j�C�0�Y%�J������|7�����,ƮW�]�w'H�R�Bq-E�o)�W QBOqB�-�p�Y�r���-�y�S;FM�u&��1����)v=�*�VJBu�u�$����C��cs�i�vr��ǒk�|�u�nAM��E�fzߪ�ԩN���b��rP�)�Nd��`8|�TJ�(���o3� �d0��B{{c.aL��/b��م���*�����3���c��gSY2kp�	�@&_�8̮�N�u���Pؗu���=�1�x=�wA��2S����S���2Z��̈́t3�jW��eJ�W*�I�������C�	kdN�S]<�5�����;��_b�t�!v'ձ>\Ǚ�N��W@�/��%���M��n����E���^���Hd�}σ�&�	)7a6w0&�U֧��1������9>N����.a�a�5�i}��:�^��7�P��hJ�}���j��9J��c�D*h�2M�4[h������/���ݿ�0��Ӿ;�DZ�-F^�W�|#�ݣ��M�ƪ���N .�)��W�ݣ�UmZ���(7��K���\F����%���x�[$.���t��3Ϯ��[An�\HH� ���JƱ�NNu��xzV���*&2�����Y��$?v�hBhڊ�A�y='�L�aN?�9�+��c8���$��ϧ|���!��*_�,�ZS_b6>�%e�w��	�ZD����I}5�\@7Ffw�5����p�VP<���i��57Ӧ�O�+���'�
B.��7$z�ԌZץ��n=�W>gzj1�U�R<e�LA�N�ś�J�
,:d6��+]K�ʵǂ[�%%���0�?�R.�M�L��|V�7�Ȼ[M�+��X���Hӗ.R�,w\���9�U���LP��T��=�l��vA'󄔔4�p;�Y)ES%xs��;���������k	�ja���k�t����W�V�h��O�o}����+Lh5�Gʪu���Cuʬ�jS�N���	aD�������XZ��sh��_R]������6�>f�Ǐ�y�Nܷ[�Y�Y��>��ĸv���s��x�
\�����L\��:uWz%�ݽ�	�"���n^��DD��If�Y�o
�3�ʠ<�̚p��n��U�W�4�F�fĺ��+S5��a�r_*��*��I�B���J`ׁ;�0)X��Q�bCW�5�)[�|ePf]Mk��p�*+##Î��׫�[�'�
C�8U���:W�{��C�:s�����?~�������|�;fA��c��©ȼ���!X?�W���64�3�$�#���rn��`�YGL��P�I�jXv`�VIfߡ}���%�*�AB���9�<��`�V�l�2�uT4:��B-V��n��w�W7g���c�̾������h��aQ%�����9��=c߈��$��q�߉E���`G?�@x�ܔ�v�[zS��r���20T��#jU97A"�a8��P�P|�j)��x�9	��yϡ2t��T`�D!�) =L�d���:0$�<3�d���K`Fޣ�B�KRal
�|��p�d,R1��U�:%��9FG�Z�p�g��&��j�f'-M4Y���x<SZ�~��.Z�v����e��Lٗ)t'^S��@^�Q�<j��uy��֋[_�ZI�'
��gM�����Q��*�����l����(l�WհV�m�s��=�Z6�+06������Vk�'Q2U�Q[��{�I�"�C�jm
�����X�b��v�8r�m���Y�m_��Vܐ�y�T����S>�;^IH�d��\������S�7�'�%3 ���<����J�舋TU�c��Bb�]����=T���f�מ�N�Ԓ'JM$�`9������F^�v��{�KyRN��g�	
UQw�f��9U���DE����̲�;z�Y7�Yͻ�0��Q/�>�݌���)��y�i�Ll�a�!\1���mhd��s��	�L+`����V?4�~��r�i"q�J|���Ս
y��y%�V֠Ɩo$m�yԴ��y��l[���[-�ϱ|D������9�L�Csy���H��a~p뙪F�om�����4�m���L�V���-������s�t%�J���p=�	�Zqd�s�f~�rU��o�袾�ք=LL^ulW�����2����u�(�e�l#&s������ݻs�������iQ��*������y?W�3L?�
]���o ��,��:��;�����z_��Q�[h{E�p���݂=F�	n�{"��7ᛚ1��q��gU�3�,�,�X����9[7Ql�ms��,���ώz
́n�(c/qF�����N�mʦ��,��UW��$��`�1E��ɮy�����s���>λ����;�y<�U��^�?;=�Pj@��Jo��sD���b�L��LYB�M�X�z9�)��E�:?��E�����%�!�}B�	j��.Q-H�˄O    �s��:��H�l��UM�cȂ^Y4��ǘ�p�y�W�av�ݷ_���]O;�˚\�{������؏_H�bÀE-�x�q<D�{�����|��cg��rt�V���?�(H��w�=���8QF�VC����c���8�=�j�����z��kqA�B���4�D�(���u�������Ptx��b.ءʎ�M��&�c�k��ż������V�$����*:Ű7�'�&�5fW�E���D�v�#A����s��v�(w�x��%�|2�4K���@����K�E�bx����{�x��GF���}=M��
�g.��S�<3�����s8�A�C%��jitp�YYʌ�`�_��Vm�CL��U��	W�ʜc��m�_S�q�|�n�?��,ڮ��T�d�d+��gV��<��p�<���~hm�����d�G���D�gL�GI?˘I�*���w�{^�︘�~;���P�!��P��ٖ��C��z���V�a[y�B���@KUٽ��4 W잜�󞘩����&8й5�`�Hv��Eb�:�Pv��+<��y������j������_����Ѕ�qJL�����Y)��?���r�1O��R�b��2U�oe���4#zX�y;�i/�K��C'U�窜����g��3�`�,K]0@�?Iڙ��3F��'}��٨�:�Y�qc��<�~����N���;ǩ�<�h�Y_�����>6̺�8d�X�k��D��^�s�0!}@�;�Z���K]�:��K6+Ҡ�Dƙ�� �SӁ�GS�9��\&��$f�i/d��()E���y��IM��A�o � L���(�b`�Tŵ�%���ւ���5z-���=��������PJ!��K>���mS��*߆������}��E�C��FWD]�5O�|��y 6f>�!2AD.�	�[��AwÈ��]����L�>�Hl��s?�T���F�\}��AĀ˝5{i��0���`�.�M0�p6�`聹Q�z���:�|��q(v���Y�(��	�Q�̺�L{�j%8�����r��7�*%hB�m��n��c�p��0�aVG���=����_��O�ZbS�§�>�#�4^KD-3��İ��
�EiĹ�g�zv~�g�֏���s�V���pt7F�yT�g����g+�
�7
�O��/e��BN\�?NnF"���9"���W����#��Y[���M��ZXTS@�@yn�&L��M�[�BN;�����wU���S��K3됩��Ɣ����h�B�k�#͘�+�Cbt/E~+�m�%f4�����8��1�J��R䷼�-Tv|f�);�w�����Ic|f��&�
CE����c�\b����j����v�]Gʎvl$ޯS�/kU�Lǩ�U������cfS3�ʷ�v ]#�\B�~�>�r���&˂���?r7�r�1��a�\�%)A��yHv̚Z��|F#JS���ƙ�J7^��l�{��A�(�=˾�;��������C"!hfkzs�4�/hC���'�� h
*�/�U�6ܣU/�^��:��"�"�`�e�ג��<����n����Vu'�:?fx��O��ڰ�>|dX�)�"��Z�ixw*w������Y6"4�D��
���p�y,&[	�./��1	mÍ�,������D��n�ۼP$�}�#`g�;*�Ђ��=��q��Q0����J�G�,:��?�̌֞�2�V����7Ltg�m��F��j�LqUUq�^�j3�.�6�~�]�|J#\��
�ɹ�ݻ=��BKfv)�xz��M(�]� ���57�����Uy�:��&A\<S��ٰ���Vdp�d7G���
'������Sum��s�������/�6P�Acpv���`ѨL��#�z�}|^��FhN��v��Q!�J�Yע1YKZ*V�s����Xu��iYѳ`�?o�Z0	��:ߤf�`챧�|�j͍���VE;n�w���p�; .r{�A�E�`U0���J�b�A�+l���Y�4(yg}C0k�)!U�a��S��Y6��j��)(�dznNaȍٝF;�ltH���x!Y�BO�|���X�KU&�HEr�qq��ُo��vU�Kk��2kTS��Xj����l�L2��>Ą�����C��P�ϕ஁ˤk|W���֣�P[R�Ǫh�ck�Ҡ.y��\�6��J@B���ap�4����fʌr`��h�j���R���E���1km�G���G�s���?vYu�?���9+l�a;�A���71:Nг]R�
y��������▾��9�HƦ[�a�\�,�γt��$=2��$5ֵoN�V��Ōw*��/K��༆�;��/�ֲ��5���<g�(в)U�J������='Qح_��Y&@�ׂ9��fߡ�}�K81��Ő��O�.�^��'���5���=��,;XJ=�C夃Ɵ��m��y�&�$;��c�+�i�6�FyjX� ��Y�a�xB�X]	�0j��A�6t":o��`���,{���	6�\�Ų���J�%���+���,9B/�������cc%�.�ݢ/E�!�:�JgE7� W��BH�"[#"ڎZ�3���l1�^Pp)(�,a�cD�1w��&D���jcG?��츬��e9��Jf��kˋ��.��nQ�����n��O91C����w���'�}f����pj��)��vKx����-qRG㰐����i�:�C֜ݺ��'��T��nU.?I7���\٘Ǥ[̀�1"��v�zĹ�Es���n�U�|rrk�1'9�R豣o���ycdB����b�R]q턭�h�� ���D�D�J��B9����%�E��.�dpdKך�#ә�����K�����������;*Ѵ��R�R?��F��φ�3�lr��jt��AGvy�����;T�=�>����Ȗ/	��G�{��.O��o��w4+��
Gl	Z?��Dvw�����2���g�-F���H&��
/���X	g������ �S?θ	������#�T{��Z8/�c)�)��>�~�.U��,U��q�'pzG�wN��CH!���rL������,�a�,����^���tK��C�9�8ɐ��Sw��EfrCJ�,Kd7� ��'��L�lC���֞�3�H�K��A�t���J�\�H����[���eV_�-%������Z#Ϲ���Uٯ�%��^כTH)L�b�82@��#K��9�Ⱥ<�><�,z{A�#��p�[���W�*�O�'Ewd)��AW�M�;��^$�D@��]����K/q�}���N�2�s�Pu������D�}{+����k�It��m�W��
e� ��=�@���1�
W;��]�|�s���[c�h;�&P2�:�Ԫ�,ݗ'	X�ə��Hf\�:s�:2⪎Evm��7_��ow�՗�k2��/�W_~���W�|�����D#�x������P���#]��f�qd����4U�'����8a�g��V�;i?�m�*U!��*;�xH���Ӆ��s��TM���"�p��I���/��]�2���_|C����a4�闰�ܡ�t!g�Օ��-n�����ھ=��J '�S�Pȯ�@���~U#��@Q�S	&�t�x��ʒy�?Q�Y�95��@k�������L�s�er�x�ݼF�Ș�"��@��}��'����A��Qf�<œy�����H��	�m���B�DJJ�_�+�Wܖu��W܂��ܮ�U(E/�f��8�d�ݣBM�p�F��{���{��NtgGNY�K � v-�k܂�9��.�&'���u�v�F��刘G#H�����4�&f�G���z��/B��@������F.|�3���@QF`���4~�I͠�(��������u
��C�5���W1ڵ�Sj�_#ʩ�c}I�7APػn�Q�&N����ݷ�:���Rs�m7P'ZD͙��.h�>���s�ǯ�����j�������h�x�̏��mw��y�h�r� ST����!� 6  �ӳ���*}��Z�V�C���2����!g0�h�r'`s�o��ŷ�U�NI�H�L�-3ݴ�
�w��I��]�d[�Q����J��y��
����Kk]�����[�Iˑ!Sn��XwZ��x����`~��J0x�~m�7�{T3�Wb�1����aJP�������͹	SZ���,{�g�
Q}�0�|i�~��MJ��3SbE����8q���R�(�MP�ú�=Tl�e;���M���B� ��3����0����k��!75	�͘�s~���?B�&�['D,j���������L�̢��R�-Ϋ���o����P��P<�>�ƬX��+*c,-�]��閪��#�u~ς��m�:�փI���n���.XR����1�0|�i9��4!>�m>�YNK���җ�����?$���͚����`'��V�43Ӏ� �RF��� 6�^���Ucӵ�%�%4������Ͱ.m���-�R��������Cȡ˫e:��R�
m��k�����auST���P��*HX�6��N�e�H���ÂV���Q<W�'���O��-�s�.J��F|P��^ӂY�he*:�솰�e�
HӠs��
	���x���?��7s	*�>#��c0;�u5h�}_Z��1�J]9���`KҚ�P�]��y�=���z����7���5�mX�z�8��shЮA4i&�w����p��a��딬�C���ή�{ܩɔ5|�i��V2{ڸJ���r8�B5�"W��A�mę�2��9WϤ�kz|#I^��j(CZ������[�;���$�O�ȤH�[
�}�F�4�I���$m�k�qj�Yɪ>�R;����(Y܃��`��1Xl���/ַ�!oa��Apd챽BZ�郍���	nqնHp뜞����m�,�Zt���9��]�9�N��}��!Ɣw��c�t1��xSFP�SɅt׭�1��U#OB8}Ǚ�ؔ9YɎg����#���P<��f��*�?�D���,L�n_ c�Oqy��*�,~`]ֈv �D�3g.��oy�X�=r�&� vf���j�������Ȃ�菻2]���ŪO􄀭���:͆�J�UY����O�S`3o��aN)�B�f�9�t��X� F�K��Y�`'梹�Z|�w����!ŠKlQ {0U��`�V��y�Ƶ�q^;�:\�E�*����wO!�^���BJ �Oh/\��2�3.k]'��G>�/l/Jf"҉�n
'����r�Ah�y&�`��#I	��{)Z}�-4��� �����d*����\bƖⴍ`6�*��Ɨ'��T�����^�hz9ٜ��+6����~����j�1����(�\䞈���E������7r��/��W|�.�y_�p+�8���VaU�otE���G��
��
H9���bl��v���;_ Ȍ�c��H�&���#ؓ������� ̇��kR�?��m���*�g~�[��o6)���u�9P:Ij��;�Wۡ9�gtD�z�-�k�0�o0���Qm��~���G��9�9	�<��»TX���CW܆_&���6��A�݆��"�V"����e�5�*��h�H�AI��@{4���ԋS9�Ue12�f��E�j=�>��5K|MxR�o�'��eߖ'�
Ϸ ��X�v�����i��D�E�&��)ܼ���Vwl{Z$NuPl��<j�i��$zx��Z7vȽG_UV���t�W7��cE�*|���#��]�[6q�U�:CN���P��L?����I�s(>:��G�3M�t"t��P�E�m�~G�:��S�E�;��Ν��.��Gn_jt�5ڝ_:�#�#ظx��G�:�q��mE��w��c6�6�0j�(�rD�p�2ܪ	�w�G�k�O����c"�u����44�QL�K�`���y��V�`��j`��m4�s�����%G�c+�,a|�Z�b@���W�������U���?���+x���LQ���d��u�6�\��](��#g��.����͌V��B0���(���F��*<�r/��q��}�$d?��{���А�[n�c���Z���bߕ�H���Q�;!^��	\��f���"0bw]:���:Li�>V�>�g��4�"�F�a��	�ZL׋�� A}�W�S��b!R��KJJ�Vy�M"����Z�%ӛ#g�B����*�I�Y<`[$\B�X��VG��V�l�\���H�J=5��8�)�hc��?��H�{�Ĵ&Z@7s9���Kڵ�ٹ�\O�<�]'<��,��ҫs�	��lﱞ�,(�H5VK�
H�I�[B�����
uS���\�dNÆ"�EQJŶ+~ʭ��͑n��u�O}�Jo�"�E�|Gk*M���0�0�iv{v���)
��>�F!a0Y����Yź������.��R����RS����A>�p�\؉W�SY�T#T�w�qs�M��6Cj/5���=G�'*}^�)�K!.w�q� gȜ?%�

���f M��-+�jA�z}�`���U���R�(TO���	�kܛ\lr1\MN�%�mP2��?�*8k���j��ޝ��Ǉ��W_��>�إ��P$�k�tG��2�ص�J�Hi�N�V�A�t�HOH��C,f�R_m���)r�g���:��q��������t0ˢ$���Bl
k�\Vl��bf��[+LV��'���5�U� �xb����qB�_�0��O;f.P$�M��9������M� �4�W�HI��H'�8t������.�V�QK�ԗ�M��M�9 ��+�v&E�L�`��A��;Q�S�m
�Ȇ��.!]�l�/��=�˫���>����B!�n� u�y�[�jɃ�*�+<�)&!�)����ĥ6�ap'n��=�!T�̜��� I���;���lT|B�=�k>C��'���ܕ�g���	ir�8!QJ{>璓�%�ޚ��f�#������K#�):���ڠ�Gl�*D��]Wܙ�	��g���|����IAUR]����G*��.K�){���3��9NvAp'U�jĎ.ф��Sr���Y�*f`#Oq��8�5L�^h��c�<a�K/�ם�J,�X���2"l/3�t����� ���x�8[�t���ܼȎ����������
�(��HZ�Q�C�VB�b.�#�+�����O]{�ή���,�H=ò�!���,[�R"�c�o��H��u�����pU(N��3{	Ԛ˦�2	��[y\��­eO�0z�6We[LG�(v��8Q�)�LhRpA���瀀3/~�n_���L�Ԟ���L�?�mL��8Q48h>?<���^\`���GDo��>�����=�D�3.`1�l��cB�J���oqk� {!�pm
w�[�o��kB�Is���Q�c\f�
Ft���\IM����l�.E��0���*�0��-�p,t�;l�|<)M�8�����b��Lk��v�1��)R(�W�U��Z����Z=���&���J�_B�A�R1;��n]��L���Q�1�&��0�����8���LU�[&�&X/aP�Ms�N�%��'P9&W�G\}R%!LA�+N��
lSAɍJ����/�܂^��չ�uH��P�P������i�0�?�X��bE��~� �x�:�r��eTfx�2X�����.FNp���ـ���&o
�m��P����m$��}��|�n��ۈ��ү�r��N�̯֚�dX��##T�h}=u?
(���z�:���}�n��߳K��}�jQF�l�_ەr�Z�J��!��m�ʃQ�Q�Y��!�������=���_~���Uֳ(         �   x�}��N�@�g�SDbDul�}������)��4͐4
!��BK(�@^�����,`�=�_�(�笊Q�B�%����0�cW'����nn����-�0�_���YK�}A��3%�4j�34|o3��ͭ��������T
�]wh&�*ZX������:�97��c��L,� oZ}�^����I���_j�����3)'5;�=�s�ǔiJ         4   x���  ��]�����A���L��l��Ђ�lMW�������2          M   x����0��TL��8�K��#�?���H�4^���j��x1%�_Nꪘ�����4�9��Wm�̥T�������8W            x�3�44�4�2�44R1z\\\ �t            x�3�4�4����� �Z         c   x�3�0��.6]l һ8�]�̜�\8��R���K��8/̻����[8�-,,9S2��R���9/,���{9��܀2�ť@�=... m$�         =  x�mPQo�@~>~���]�;�%�4"*�XL�M0��mz�d�~��,�ڴM�/_��r�6�g0�&�[;�:��1E�J�+�)�B�Ee��x�*C��`����,;�r6ˬ��l�0�aؠK�OJ��R�2�B^GM�x�%X�g	���qi�v��rH�E��ԍG�h��aЎ�4=�qOf*8���S1o\������"���U�����p.H%0���`�����0m�h����풻u������s|�r�ba���ƾM�Տq6�ᗘܽ���	�L���T�i���{sl���C�ht/MӾ��|�            x������ � �            x������ � �     