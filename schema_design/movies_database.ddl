!!!!!!!!!!!!!
CREATE TABLE IF NOT EXISTS content.genre (
    id UUID PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    created TIMESTAMP WITHOUT TIME ZONE,
    modified TIMESTAMP WITHOUT TIME ZONE
);
CREATE TABLE IF NOT EXISTS content.genre_film_work (
    id UUID PRIMARY KEY,
    genre_id UUID NOT NULL,
    film_work_id UUID NOT NULL,
    created TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT genre_id, film_work_id
        FOREIGN KEY (genre_id, film_work_id)
        REFERENCES genre (id), film_work(id)
        ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS content.film_work (
    id uuid PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    creation_date DATE,
    rating FLOAT,
    type TEXT NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone
);
CREATE TABLE IF NOT EXISTS content.person (
    id uuid PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    created TIMESTAMP WITHOUT TIME ZONE,
    modified timestamp with time zone
);
CREATE TABLE IF NOT EXISTS content.person_film_work (
    id uuid PRIMARY KEY,
    person_id uuid NOT NULL,
    film_work_id uuid NOT NULL,
    role TEXT NOT NULL,
    created timestamp with time zone
); 
CREATE INDEX IF NOT EXISTS genre_name_idx ON content.genre (name);
CREATE UNIQUE INDEX genre_film_work_idx ON content.genre_film_work (genre_id, film_work_id); 
CREATE INDEX film_work_creation_date_idx ON content.film_work(creation_date);
CREATE UNIQUE INDEX film_work_person_idx ON content.person_film_work (film_work_id, person_id); 