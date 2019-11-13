
@logging_time

def dbConnect()
    params = config()

    # connect to the PostgreSQL server
    print('Connecting to the PostgreSQL database...')
    conn = psycopg2.connect(**params)
    cur = conn.cursor()
    return cur


imgList = spatialSelection(  "photo_xy_with_gps", """ST_Contains(
                    ST_MakePolygon(
                        ST_GeomFromText(
                            'LINESTRING(-74.0134 40.7455,
                            -74.0232 40.7018,
                            -74.0113 40.6950,
                            -73.9874 40.7015,
                            -73.9556 40.7582,
                            -73.9889 40.7590,
                            -74.0134 40.7455)'
                        , 4326)
                    ), geom) )""" ):



def spatialSelection(tableName, spatialCondition, columns=6):
    """ get photoInfos in JKF Airport from database  """
    # jfk air port
    # sql = """   SELECT user_id, photo_id, file_path, count_person, lonlat[0] as lon, lonlat[1] as lat
    #             FROM photo_direction
    #             WHERE ST_Contains(
    #                     ST_MakeEnvelope(-73.79590, 40.65263, -73.77178, 40.63261, 4326)
    #                     , photo_direction.geom_lonlat)
    #                     order by user_id, photo_id
    #             """
    # Central Park
    # sql = """   SELECT user_id, photo_id, file_path, count_person, lonlat[0] as lon, lonlat[1] as lat
    #             FROM photo_xy_with_gps
    #             WHERE ST_Contains(
    #             ST_MakePolygon(
    #                 ST_GeomFromText(
    #                     'LINESTRING(-74.0008 40.7370,
    #                     -73.9898 40.7322,
    #                     -73.9697 40.7493,
    #                     -73.9556 40.7882,
    #                     -73.9889 40.7940,
    #                     -74.0008 40.7370)'
    #                 , 4326)
    #             )
    #             , photo_xy_with_gps.geom)
    #             """
    # world trade center 1468
    # sql = """   SELECT user_id, photo_id, file_path, count_person, lonlat[0] as lon, lonlat[1] as lat
    #             FROM photo_xy_with_gps
    #             WHERE ST_Contains(
    #             ST_MakePolygon(
    #                 ST_GeomFromText(
    #                     'LINESTRING(-74.0134 40.7455,
    #                     -74.0232 40.7018,
    #                     -74.0113 40.6950,
    #                     -73.9874 40.7015,
    #                     -73.9739 40.7339,
    #                     -74.0125 40.7543,
    #                     -74.0134 40.7455)'
    #                 , 4326)
    #             )
    #             , photo_xy_with_gps.geom)
    #             """
    # world trade center + central park 2057

    sql_front = " SELECT * FROM "
    sql_where = " WHERE "

    if None is sql:
        sql = """   SELECT user_id, photo_id, file_path, count_person, lonlat[0] as lon, lonlat[1] as lat
                    FROM photo_xy_with_gps
                    WHERE ST_Contains(
                    ST_MakePolygon(
                        ST_GeomFromText(
                            'LINESTRING(-74.0134 40.7455,
                            -74.0232 40.7018,
                            -74.0113 40.6950,
                            -73.9874 40.7015,
                            -73.9556 40.7582,
                            -73.9889 40.7590,
                            -74.0134 40.7455)'
                        , 4326)
                    ), geom)
                    """
    conn = None
    photoInfos = []
    aRow = []
    rnd_user_id = None
    rnd_photo_id = None
    try:
        cur = dbConnect()
        cur.execute(sql)
        rows = cur.fetchall()

        for row in rows:
            photoInfos.append(  row )
            if columns > 6:
                rnd_user_id = row[6]
                rnd_photo_id = row[7]

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()

    print('Spatial selection length : {}'.format(len(photoInfos)))
    return photoInfos,rnd_user_id, rnd_photo_id
