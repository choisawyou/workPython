from flask import Flask, render_template, request
from car import park

app = Flask(__name__)


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/car_call')
def car_call():
    result = park.getCars()
    return render_template('car.html', object_list=result)


@app.route('/carAct', methods=["GET", "POST", "PUT", "DELETE"])
def carAct():
    if request.method == "GET":
        return park.getCars()
    elif request.method == "POST":
        carNum = request.form['carNum']
        name = request.form['name']
        enroll = request.form['enroll']
        type = request.form['type']
        cardata = {'carNum': carNum, 'name': name, 'enroll': enroll, 'type': type}
        return park.setCars(cardata)
    elif request.method == "DELETE":
        name = request.form['name']
        return park.delCars(name)
    elif request.method == "PUT":
        carData = request.form
        return park.putCars(carData)


if __name__ == '__main__':
    app.run(host="127.0.0.1", port=80)
