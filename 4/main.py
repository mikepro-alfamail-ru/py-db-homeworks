import random
request = ''
with open('db.txt') as db:
    artists = {}
    albums = {}
    genres = {}
    tracks = set()
    artist_id = 1
    album_id = 1
    track_id = 1
    genre_id = 1
    artist = db.readline().strip().replace('\'', '&amp')

    while artist:
        if artist.lower() not in artists:
            request += f"insert into performers(name) values ('{artist}');\n"
            artists[artist.lower()] = artist_id
            artist_id += 1
        album = db.readline().strip().replace('\'', '&amp')
        albums[album] = album_id
        album_id += 1
        year = int(db.readline().strip())
        request += f"insert into albums(title, year) values ('{album}', {year});\n"
        genre = db.readline().strip().replace('\'', '&amp')
        if genre not in genres:
            genres[genre] = genre_id
            genre_id += 1
            request += f"insert into gengres(name) values ('{genre}');\n"

        request += f"insert into PerformersGengres(GengreID, performerID) values ({genres[genre]}, {artists[artist.lower()]}) ON CONFLICT DO NOTHING;\n"

        no_of_tracks = int(db.readline().strip())
        for tr in range(no_of_tracks):
            line = db.readline().strip()
            track = line.split('\t')[0].replace('\'', '&amp')
            duration = int(float(line.replace(',', '.').split('\t')[-1])*60)
            request += f"insert into tracks(albumid, title, duration) values ({albums[album]}, '{track}', {duration});\n"
            tracks.add(track_id)
            track_id += 1
        db.readline()

        request += f"insert into PerformersAlbums(performerID, albumID) values ({artists[artist.lower()]}, {albums[album]}) ON CONFLICT DO NOTHING;\n"
        request += '\n'

        artist = db.readline().strip()

for _ in range(8):
    request += f"insert into collections(title, year) values ('Collection {_ + 1}', {random.randint(2015, 2021)});\n"
    for _track in random.choices(list(tracks), k=5):
        request += f"insert into CollectionsTracks(CollectionID, TrackID) values ({_ + 1}, {_track}) ON CONFLICT DO NOTHING;\n"

with open("request.sql", "w") as output_file:
    output_file.writelines(request)
