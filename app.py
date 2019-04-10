from flask import Flask, render_template, request, url_for, session, redirect
from flask_wtf import FlaskForm

import pymysql

app = Flask(__name__)
app.secret_key = 'any random string'

db = pymysql.connect('localhost','root',"",'startrek')
conn = pymysql.connect('localhost','root',"",'startrek')



@app.route('/index')
def index():
	return render_template('mainpage.html')

@app.route('/aboutus')
def aboutus():
	return render_template('About us.html')

@app.route('/contact-us')
def contactus():
	return render_template('contact-us.html')


@app.route('/Highlights')
def highlight():
	return render_template('Highlights.html')


@app.route('/tamron')
def tamron():
	return render_template('lens-tamron.html')

@app.route('/nikkor')
def nikkor():
	return render_template('lens-nikkor.html')

@app.route('/sigma')
def sigma():
	return render_template('lens-sigma.html')

@app.route('/lens-canon')
def canon():
	return render_template('lens-canon.html')

@app.route('/DSLR-nikon')
def DSLRN():
	return render_template('DSLR-nikon.html')

@app.route('/DSLR-canon')
def DSLRC():
	return render_template('DSLR-canon.html')


@app.route('/batteries')
def battery():
	return render_template('batteries.html')

@app.route('/Filters')
def filter():
	return render_template('Filters.html')

@app.route('/orderdetails')
def orderdetails():
	return render_template('orderdetails.html')


@app.route("/login", methods = ['POST', 'GET'])
def login():
	if request.method == 'POST':
		user = request.form['user']
		pwdf = request.form['pwd']
		print(user)
		print(pwdf)
		
		#try:
		cursor = db.cursor ()
		print('can connect')
		sql = " SELECT username FROM customers WHERE username='%s'" % (user)
		cursor.execute(sql)
		username = cursor.fetchall()
		a = str(username)
		checkuser = a[3:-5]
		db.commit()
		print(user,' check ',username,';test2;',checkuser)


		cursor2 = db.cursor ()
		sql2 = " SELECT pwd FROM customers WHERE pwd='%s'" % (pwdf)
		cursor2.execute(sql2)
		password = cursor2.fetchall()
		b = str(password)
		checkpw = b[3:-5]
		db.commit()
		print(pwdf,' check3 ',password,';test3;',checkpw)

		if user == checkuser and pwdf == checkpw:
			print('password ok')
			session['user'] = username
			return render_template('Highlights.html')
		else:
			print('all wrong')


	        #return render_template('Highlights.html')

		#except Exception:

			#error ='Wrong user name or password'
			#return render_template('login.html', error = error)

	return render_template('login.html')


@app.route("/orderchecking",methods = ["GET","POST"])
def orderchecking():
	if request.method == 'POST':
		user = request.form.get('user')
		orderno  = request.form.get('orderID')
		print(user)
		print(orderno)
		
		#try:
		cursor = db.cursor ()
		print('can connect')
		sql = " SELECT customerid FROM orders WHERE customerid='%s'" % (user)
		cursor.execute(sql)
		customerid = cursor.fetchall()
		a = str(customerid)
		checkuser = a[2:-4]
		db.commit()
		print(user,' check ',customerid,';test2;',checkuser)

		cursor2 = db.cursor ()
		sql2 = " SELECT orderID FROM orders WHERE orderID='%s'" % (orderno)
		cursor2.execute(sql2)
		orderID = cursor2.fetchall()
		b = str(orderID)
		checkID = b[2:-4]
		db.commit()
		print(orderno,' check3 ',orderID,';test3;',checkID)

		if user == checkuser and orderno == checkID:
			
			#try:
			cursor3 = conn.cursor()

			
			cursor3.execute(" SELECT * FROM  orders WHERE customerid = %s and orderID = %s", (customerid,orderID))
			results = cursor3.fetchall()
			for row in results:
			   orderID = row[0]
			   customerid = row[1]
			   orderDate = row[2]
			   arrivalDate = row[3]
			   status = row[4]
			    
			conn.commit()
			return render_template('orderdetails.html',results = results)

		elif orderno != checkID:	
			print('invaild orderID' )

		else:
			print('you have no orders')

		    #return render_template('Highlights.html')

		#except Exception:

			#error ='Wrong user id or orderID'
			#return render_template('orderchecking.html', error = error)


	return render_template('orderchecking.html')


@app.route("/logout")
def logout():
	session.pop('username',None)
	return render_template('login.html')




@app.route("/signin",methods = ["POST","GET"])
def signin():

	if request.method == "POST":
		username = request.form.get("user")
		email = request.form.get("email")
		HKID = request.form.get("HKID")
		pwd = request.form.get("pwd")
		TelNo = request.form.get("TelNo")
		
		cursor = db.cursor()

		sql = "INSERT INTO customers (username, email,HKID,pwd,TelNo) VALUES ('%s','%s', '%s', '%s', '%s') " 

		cursor.execute(sql%(username, email,HKID,pwd,TelNo))
		results = cursor.fetchall()
		db.commit()
        
		return render_template('login.html')

	return render_template('register.html')


@app.route("/addTocart", methods = ["POST","GET"] )
def addTocart():
    
    if  request.method == "POST":
       
        productID = request.form.get("productID")
        productName = request.form.get("productName")
        productBrand = request.form.get("productBrand")
        Price = request.form.get("Price")

        cursor = conn.cursor()

        sql = "INSERT INTO kart (productID, productName, productBrand, Price) VALUES ('%s', '%s', '%s', '%s') " 

        cursor.execute(sql%(productID, productName, productBrand, Price))
        results = cursor.fetchall()
        conn.commit()

        return render_template('Highlights.html')

    elif 'user' not in session:
    	return render_template('login.html')

    else:
    	return render_template('addtocart.html')



@app.route("/cart")
def cart():
	
   
   cursor = conn.cursor()

   sql = "SELECT * FROM kart"
   cursor.execute(sql)
   goods = cursor.fetchall()
   
   for row in goods:
   	productID = row[0]
   	productName = row[1]
   	productBrand = row[2]
   	Price = row[3]

   	conn.commit()


   return render_template("cart.html", goods = goods)




@app.route("/payment", methods = ["POST","GET"] )
def payment():

	if 'user' not in session:
		return render_template('login.html')
	else:
		cursor = conn.cursor()
		cursor.execute("SELECT * FROM  kart")
		products = cursor.fetchall()
		amount = 0

		for row in products:
			productID = row[0]
			productName = row[1]
			productBrand = row[2]
			Price = row[3]
			amount += int(row[3])
			sql=("INSERT INTO payment (productID,amount) VALUES ('%s', '%s') ")
			cursor.execute(sql%(productID,amount))
			results = cursor.fetchall()
			conn.commit()

			return render_template('payment.html',products = products,amount = amount)	



if __name__ == '__main__':
	app.run(debug = True)
