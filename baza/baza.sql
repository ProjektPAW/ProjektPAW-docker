-- Tworzenie tabeli ról użytkowników
CREATE TABLE public.roles (
    id_role SERIAL PRIMARY KEY,
    role VARCHAR(50) NOT NULL
);

-- Tworzenie tabeli użytkowników
CREATE TABLE public.users (
    id_user SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    emailverified BOOLEAN DEFAULT FALSE,
    id_role INTEGER REFERENCES public.roles(id_role) ON DELETE SET NULL,
    email_token varchar(255) not null
);

-- Tworzenie tabeli zdjęć
CREATE TABLE public.photos (
    id_photo SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    path VARCHAR(500) NOT NULL,
    is_private BOOLEAN DEFAULT FALSE,
    added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(500),
    id_user INTEGER REFERENCES public.users(id_user) ON DELETE CASCADE
);

-- Tworzenie tabeli katalogów
CREATE TABLE public.catalog (
    id_catalog SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    id_user INTEGER REFERENCES public.users(id_user) ON DELETE CASCADE
);

-- Tworzenie tabeli połączeniowej dla katalogów i zdjęć
CREATE TABLE public.catalog_photo (
    id_catalog_photo SERIAL PRIMARY KEY,
    id_catalog INTEGER REFERENCES public.catalog(id_catalog) ON DELETE CASCADE,
    id_photo INTEGER REFERENCES public.photos(id_photo) ON DELETE CASCADE
);

insert into public.roles(id_role, role) values(0,'user');
insert into public.roles(id_role, role) values(1,'admin');

insert into public.users(username,email,password,emailverified,id_role,email_token) 
values('user','user@user','$2b$10$cGFTl6FiWkuMQ4YdEqn7De7IZUrXg2dP.KHkgni4MWEJ9/RZFp4R.',false,0,'');
insert into public.users(username,email,password,emailverified,id_role,email_token) 
values('admin','admin@admin','$2b$10$nbeY8iGit/Zs39yyBB/07edyEgGoyhxUJcv47dffdMlzRgolmouMi',true,1,'');