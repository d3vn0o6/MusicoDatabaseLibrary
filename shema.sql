-- TABLE USERS--
CREATE TABLE mskt_users (
    id_user INTEGER PRIMARY KEY AUTOINCREMENT,
    user_username TEXT NOT NULL,
    user_email TEXT NOT NULL UNIQUE,
    user_password_hash TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- TABLE STYLES --
CREATE TABLE mskt_styles (
    id_style INTEGER PRIMARY KEY AUTOINCREMENT,
    style_name TEXT NOT NULL,
	style_description TEXT
);

-- TABLE ARTISTS --
CREATE TABLE mskt_artists(
    id_artist INTEGER PRIMARY KEY AUTOINCREMENT,
    artist_name TEXT NOT NULL,
	id_style INTEGER,
    artist_bio TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
	FOREIGN KEY (id_style) REFERENCES mskt_style(id_style) ON DELETE SET NULL
);

-- TABLE ALBUMS --
CREATE TABLE mskt_albums (
    id_album INTEGER PRIMARY KEY AUTOINCREMENT,
    album_title TEXT NOT NULL,
    album_release_date DATE,
    id_artist INTEGER NOT NULL,
    id_style INTEGER,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_artist) REFERENCES mskt_artists(id_artist) ON DELETE CASCADE,
    FOREIGN KEY (id_style) REFERENCES mskt_styles(id_style) ON DELETE SET NULL
);

-- TABLE SONGS --
CREATE TABLE IF NOT EXISTS mskt_songs (
    id_song INTEGER PRIMARY KEY AUTOINCREMENT,
    song_title TEXT NOT NULL,
    song_bpm INTEGER,
    song_release_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_album INTEGER,
    id_artist INTEGER NOT NULL,
    id_style INTEGER,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (id_album) REFERENCES mskt_album(id_album) ON DELETE SET NULL,
    FOREIGN KEY (id_artist) REFERENCES mskt_artists(id_artist) ON DELETE CASCADE,
    FOREIGN KEY (id_style) REFERENCES mskt_styles(id_style) ON DELETE SET NULL
);

-- FAVORITES --
CREATE TABLE mskt_favorites (
    id_favorite INTEGER AUTO_INCREMENT PRIMARY KEY,
    id_user INTEGER NOT NULL,
    id_song INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES mskt_users(id_user) ON DELETE CASCADE,
    FOREIGN KEY (id_song) REFERENCES mskt_songs(id_song) ON DELETE CASCADE
);

-- PLAYLISTS --
CREATE TABLE IF NOT EXISTS mskt_playlists (
    id_playlist INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    id_user INTEGER NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES mskt_users(id_user) ON DELETE CASCADE
);

-- PLAYLISTS_SONGS --
CREATE TABLE mskt_playlists_songs (
    id_playlist_song INTEGER PRIMARY KEY AUTOINCREMENT,
    id_playlist INTEGER NOT NULL,
    id_song INTEGER NOT NULL,
    FOREIGN KEY (id_playlist) REFERENCES mskt_playlists(id_playlist) ON DELETE CASCADE,
    FOREIGN KEY (id_song) REFERENCES Songs(song_id) ON DELETE CASCADE
);

-- INDEXES --
CREATE INDEX idx_songs_style ON mskt_styles(id_style);
CREATE INDEX idx_songs_artist ON mskt_songs(id_artist);
CREATE INDEX idx_albums_artist ON mskt_albums(id_artist);
CREATE INDEX idx_favorites_user_song ON mskt_favorites(id_user, id_song);


