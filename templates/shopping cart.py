def getLoginDetails():

    with sqlite3.connect('database.db') as conn:
        cur = conn.cursor()
        if 'username' not in session:
            loggedIn = False
            noOfItems = 0
        else:
            loggedIn = True
            cur.execute("SELECT customerid, username FROM customers WHERE  = ?", (session['username'], ))
            userId, firstName = cur.fetchone()
            cur.execute("SELECT count(productId) FROM kart WHERE userId = ?", (userId, ))
            noOfItems = cur.fetchone()[0]
    conn.close()
    return (loggedIn, noOfItems)

@app.route("/")
def root():
    loggedIn, firstName, noOfItems = getLoginDetails()
    with sqlite3.connect('database.db') as conn:
        cur = conn.cursor()
        cur.execute('SELECT productId, productName, productType, productBrand, quanttityInStock, price FROM products')
        itemData = cur.fetchall()
        cur.execute('SELECT categoryId, name FROM categories')
        categoryData = cur.fetchall()
    itemData = parse(itemData)   
    return render_template('home.html', itemData=itemData, loggedIn=loggedIn, firstName=firstName, noOfItems=noOfItems, categoryData=categoryData)



@app.route("/addToCart")
def addToCart():
    if 'username' not in session:
        return redirect(url_for('login'))
    else:
        productId = int(request.args.get('productId'))
        with sqlite3.connect('database.db') as conn:
            cur = db.cursor()
            cur.execute("SELECT customerid FROM customers WHERE username = ?", (session['username'], ))
            userId = cur.fetchall()
            try:
                cur.execute("INSERT INTO  (customerid, productID) VALUES (?, ?)", (customerid, productID))
                conn.commit()
                msg = "Added successfully"
            except:
                conn.rollback()
                msg = "Error occured"
        conn.close()
        return redirect(url_for('root'))

@app.route("/cart")
def cart():
    if 'username' not in session:
        return redirect(url_for('login'))
    loggedIn, noOfItems = getLoginDetails()
    user = session['email']
    with sqlite3.connect('database.db') as conn:
        cur = conn.cursor()
        cur.execute("SELECT customerid FROM customers WHERE username = ?", (ema, ))
        userId = cur.fetchone()[0]
        cur.execute("SELECT products.productID, products.productName, price FROM products, kart WHERE products.productID = kart.productID AND kart.customerid = ?", (customerid, ))
        products = cur.fetchall()
    totalPrice = 0
    for row in products:
        totalPrice += row[2]
    return render_template("cart.html", products = products, totalPrice=totalPrice, loggedIn=loggedIn, firstName=firstName, noOfItems=noOfItems)

@app.route("/removeFromCart")
def removeFromCart():
    if 'email' not in session:
        return redirect(url_for('login'))
    email = session['email']
    productId = int(request.args.get('productId'))
    with sqlite3.connect('database.db') as conn:
        cur = conn.cursor()
        cur.execute("SELECT customerid FROM customers WHERE username  = ?", (email, ))
        userId = cur.fetchone()[0]
        try:
            cur.execute("DELETE FROM kart WHERE customerid = ? AND productID = ?", (userId, productId))
            conn.commit()
            msg = "removed successfully"
        except:
            conn.rollback()
            msg = "error occured"
    conn.close()
    return redirect(url_for('root'))
