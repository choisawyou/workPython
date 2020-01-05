import json
import pymysql


def getConnection():
    return pymysql.connect(host="localhost", user="root", port=3306, password="ehdgus2",
                           db='parking', charset="utf8", use_unicode=True, autocommit=True, )


def getCars():
    conn = getConnection()
    cur = conn.cursor()
    cur.callproc('car_select')
    if cur.rowcount:
        result = cur.fetchall()
        print(result)
    else:
        result = 0

    cur.close()
    conn.close()
    return result

def setCars(carData):
    conn = getConnection()
    cur = conn.cursor()
    args = (carData['carNum'], carData['name'], carData['enroll'], carData['type'])
    cur.callproc('car_insert', args)
    result = cur.rowcount
    cur.close()
    conn.close()
    return json.dumps({'rows':result})

def delCars(in_name):
    conn = getConnection()
    cur = conn.cursor()
    args = (in_name)
    cur.callproc('car_delete', args)
    cur.execute('select @_car_delete_1')
    result = cur.fetchone()
    result = cur.rowcount
    cur.close()
    conn.close()
    return json.dumps({'rows':result})

def putCars(carData):
    conn = getConnection()
    cur = conn.cursor()
    args = (carData['name'], carData['intime'], carData['outtime'])
    cur.callproc('car_updatetime', args)
    cur.execute('select @_car_update_5')
    result = cur.fetchone()
    result = cur.rowcount
    cur.close()
    conn.close()
    return json.dumps({'rows':result})