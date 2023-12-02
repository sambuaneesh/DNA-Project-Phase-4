import subprocess as sp
import pymysql
import pymysql.cursors
import json
import time
from tabulate import tabulate

with open("config.json") as f:
    config_data = json.load(f)
db_config = config_data["database"]

conn = pymysql.connect(
    host=db_config["host"],
    port=db_config["port"],
    user=db_config["user"],
    password=db_config["password"],
    db=db_config["db"],
    cursorclass=pymysql.cursors.DictCursor,
)
if conn.open:
    print("Welcome to $dataBase*d")
    # time.sleep(0.5)
    print("Initiating process Cafè là Boutiquè")
    # time.sleep(0.5)
    print("Process initiated successfully!")
    # time.sleep(2)
else:
    print("Failed to connect")
    exit(0)


def getMenu(OutletID):
    query = """SELECT mo.OutletID, mo.ItemId, mi.ItemName, mi.ItemDescription, mi.ItemPrice, mi.ItemImageURL
FROM MenuOutlet mo
JOIN MenuItem mi ON mo.ItemId = mi.ItemId
WHERE mo.OutletID = %s;"""

    cur.execute(query, (OutletID))
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Menu Found for Outlet ID: ", OutletID)
        for item in result:
            print("Item ID\t\t\t:", item["ItemId"])
            print("Item Name\t\t:", item["ItemName"])
            print("Item Description\t:", item["ItemDescription"])
            print("Item Price\t\t:", item["ItemPrice"])
            print("Item Image URL\t\t:", item["ItemImageURL"])
            print("\n")


def displayOutlets():
    query = """SELECT OutletID, OutletName, Address, Phone, Rating, PopularItem, OutletCapacity
FROM Outlet;
"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Outlets Details")
        headers = [
            "Outlet ID",
            "Outlet Name",
            "Address",
            "Phone",
            "Rating",
            "Popular Item",
            "Outlet Capacity",
        ]
        rows = [
            [
                item["OutletID"],
                item["OutletName"],
                item["Address"],
                str(item["Phone"]),
                item["Rating"],
                item["PopularItem"],
                item["OutletCapacity"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="grid"))
        print("\n")


def searchItems(ItemName, ItemDescription):
    query = f"""SELECT MenuItem.ItemName, MenuItem.ItemDescription, Outlet.OutletName
FROM MenuItem
INNER JOIN MenuOutlet ON MenuItem.ItemId = MenuOutlet.ItemId
INNER JOIN Outlet ON MenuOutlet.OutletID = Outlet.OutletID
WHERE MenuItem.ItemName LIKE '%{ItemName}%' AND MenuItem.ItemDescription LIKE '%{ItemDescription}%';
"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Items Found")
        headers = [
            "Item Name",
            "Item Description",
            "Outlet Name",
        ]
        rows = [
            [
                item["ItemName"],
                item["ItemDescription"],
                item["OutletName"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="grid"))
        print("\n")


def searchOutlets(Address, PopularItem):
    query = f"""SELECT Outlet.OutletName, Outlet.Address, Outlet.Rating
FROM Outlet
WHERE Outlet.Address LIKE '%{Address}%' AND Outlet.PopularItem LIKE '%{PopularItem}%';
"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Outlet Name",
            "Address",
            "Rating",
        ]
        rows = [
            [
                item["OutletName"],
                item["Address"],
                item["Rating"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="simple"))
        print("\n")


def employeeDetails_byID(EmployeeID):
    query = f"""SELECT * FROM Employee WHERE EmployeeID = {EmployeeID}"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Employee Found!!")
        print("Employee ID\t\t:", result[0]["EmployeeID"])
        print("Employee Name\t\t:", result[0]["Name"])
        print("Employee Role\t\t:", result[0]["Role"])
        try:
            print("Employee's SupervisorID\t:", result[0]["SupervisorID"])
        except:
            pass
    else:
        print("Employee Not Found!!")


def employeeDetails_byName(Name):
    query = f"""SELECT * FROM Employee WHERE Name LIKE '%{Name}%'"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Employee ID",
            "Employee Name",
            "Employee Role",
            "Employee's SupervisorID",
        ]
        rows = [
            [
                item["EmployeeID"],
                item["Name"],
                item["Role"],
                item.get("SupervisorID", ""),
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="simple"))
        print()


def employeeDetails_bySupervisorID(SupervisorID):
    query = f"""SELECT * FROM Employee WHERE SupervisorID = {SupervisorID}"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Employee ID",
            "Employee Name",
            "Employee Role",
            "Employee's SupervisorID",
        ]
        rows = [
            [
                item["EmployeeID"],
                item["Name"],
                item["Role"],
                item.get("SupervisorID", ""),
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="simple"))
        print()


def customerDetails_byID(CustomerID):
    query = f"""SELECT * FROM Customer WHERE CustomerID = {CustomerID}"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Customer Found!!")
        print("Customer ID\t:\t", result[0]["CustomerId"])
        print("Customer Name\t:\t", result[0]["Name"])
        print("Customer Phone\t:\t", result[0]["Phone"])
        print("Customer Email\t:\t", result[0]["Email"])
    else:
        print("Customer Not Found!!")


def customerDetails_byName(CustomerName):
    query = f"""SELECT * FROM Customer WHERE Name LIKE '%{CustomerName}%'"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Customer ID",
            "Customer Name",
            "Customer Phone",
            "Customer Email",
        ]
        rows = [
            [
                item["CustomerId"],
                item["Name"],
                str(item["Phone"]),
                item["Email"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="simple"))
        print()


def customerDetails_byNo(CustomerNumber):
    query = f"""SELECT * FROM Customer WHERE Phone = {CustomerNumber}"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Customer Found!!")
        print("Customer ID\t:\t", result[0]["CustomerId"])
        print("Customer Name\t:\t", result[0]["Name"])
        print("Customer Phone\t:\t", result[0]["Phone"])
        print("Customer Email\t:\t", result[0]["Email"])
    else:
        print("Customer Not Found!!")


def employeeNames():
    query = f"""SELECT EmployeeID, Name
FROM Employee;
"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Employee ID",
            "Employee Name",
        ]
        rows = [
            [
                item["EmployeeID"],
                item["Name"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="grid"))
        print()


def totalRevenue():
    query = f"""SELECT SUM(Revenue) AS TotalRevenue FROM Outlet;"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Total Revenue: ", result[0]["TotalRevenue"])
        print()
    else:
        print("No Revenue")
        print()


def meanRevenue():
    query = f"""SELECT AVG(Revenue) AS MeanRevenue FROM Outlet;"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Mean Revenue: ", result[0]["MeanRevenue"])
        print()
    else:
        print("No Revenue")
        print()


def maxRevenue():
    query = f"""SELECT MAX(Revenue) AS MaxRevenue FROM Outlet;"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Max Revenue: ", result[0]["MaxRevenue"])
        print()
    else:
        print("No Revenue")
        print()


def minRevenue():
    query = f"""SELECT MIN(Revenue) AS MinRevenue FROM Outlet;"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Min Revenue: ", result[0]["MinRevenue"])
        print()
    else:
        print("No Revenue")
        print()


def medianRevenue():
    query = f"""SELECT Revenue AS MedianRevenue
FROM (
  SELECT Revenue, ROW_NUMBER() OVER (ORDER BY Revenue) AS RowAsc,
               ROW_NUMBER() OVER (ORDER BY Revenue DESC) AS RowDesc
  FROM Outlet
) AS Subquery
WHERE RowAsc = RowDesc;
"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Median Revenue: ", result[0]["MedianRevenue"])
        print()
    else:
        print("No Revenue")
        print()


def modeRevenue():
    query = f"""SELECT Revenue AS ModeRevenue
FROM (
  SELECT Revenue, COUNT(*) AS Frequency
  FROM Outlet
  GROUP BY Revenue
  ORDER BY Frequency DESC
  LIMIT 1
) AS ModeQuery;
"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Mode Revenue: ", result[0]["ModeRevenue"])
        print()
    else:
        print("No Revenue")
        print()


def reservation(DateOfBooking):
    query = f"""SELECT * FROM Reservation WHERE DateOfBooking = '{DateOfBooking}';"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Date Of Booking",
            "Customer ID",
            "Outlet ID",
            "Payment Mode",
        ]
        rows = [
            [
                item["DateOfBooking"],
                item["CustomerID"],
                item["OutletID"],
                item["PaymentMode"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="grid"))
        print()


def customersByDiscount(Discount):
    query = f"SELECT * FROM Customer WHERE Discount >= {Discount};"
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Customer ID",
            "Customer Name",
            "Customer Phone",
            "Customer Email",
            "Discount",
        ]
        rows = [
            [
                item["CustomerId"],
                item["Name"],
                str(item["Phone"]),
                item["Email"],
                item["Discount"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="grid"))
        print()


def totalOrdersByOnOff():
    query = f"""SELECT 
  SUM(CASE WHEN Mode = 1 THEN 1 ELSE 0 END) AS OnlineOrders,
  SUM(CASE WHEN Mode = 0 THEN 1 ELSE 0 END) AS OfflineOrders
FROM Orders;
"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Total Online Orders: ", result[0]["OnlineOrders"])
        print("Total Offline Orders: ", result[0]["OfflineOrders"])
        print()
    else:
        print("No Orders")
        print()


def avgProbabilityOfMember():
    query = f"""SELECT AVG(Member) AS AvgMembershipProbability FROM Customer;"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Average Membership Probability: ", result[0]["AvgMembershipProbability"])
        print()
    else:
        print("No Orders")
        print()


def searchEmployee(role, yearsOfExperience):
    query = f"""SELECT Employee.Name, Employee.Role, Employee.YearsOfExperience
FROM Employee
WHERE Employee.Role = '{role}' and Employee.YearsOfExperience >= {yearsOfExperience};
"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Employee Name",
            "Employee Role",
            "Employee Years of Experience",
        ]
        rows = [
            [
                item["Name"],
                item["Role"],
                item["YearsOfExperience"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="grid"))
        print()


def totalMembers():
    query = f"""SELECT COUNT(*) AS TotalMembers FROM Customer WHERE Member = 1;"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Total Members: ", result[0]["TotalMembers"])
        print()
    else:
        print("No Members")
        print()


def checkOrderStatus(PartnerID):
    query = f"""SELECT Orders.ItemId, Orders.OrderStatus
FROM Orders
JOIN OrderPartners ON Orders.OutletID = OrderPartners.OutletID
                   AND Orders.CustomerID = OrderPartners.CustomerID
                   AND Orders.ItemId = OrderPartners.ItemId
WHERE OrderPartners.PartnerID = 1;
"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Item ID",
            "Order Status",
        ]
        rows = [
            [
                item["ItemId"],
                item["OrderStatus"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="grid"))
        print()


def maxOutletRating():
    query = f"""SELECT MAX(Rating) AS MaxRating FROM Outlet;"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Max Rating: ", result[0]["MaxRating"])
        print()
    else:
        print("No Rating")
        print()


def minOutletRating():
    query = f"""SELECT MIN(Rating) AS MinRating FROM Outlet;"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Min Rating: ", result[0]["MinRating"])
        print()
    else:
        print("No Rating")
        print()


def meanOutletRating():
    query = f"""SELECT AVG(Rating) AS MeanRating FROM Outlet;"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        print("Mean Rating: ", result[0]["MeanRating"])
        print()
    else:
        print("No Rating")
        print()


def allEmployees():
    query = f"""SELECT * FROM Employee;"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Employee ID",
            "Employee Name",
            "Employee Role",
            "Employee's SupervisorID",
            "Aadhar Number",
            "Years of Experience",
            "Salary",
            "Age",
            "Gender",
            "Resume Link",
            "Date of Joining",
        ]
        rows = [
            [
                item["EmployeeID"],
                item["Name"],
                item["Role"],
                item.get("SupervisorID", ""),
                item["Number"],
                item["YearsOfExperience"],
                item["Salary"],
                item["Age"],
                item["Gender"],
                item["ResumeLink"],
                item["DOJ"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="grid"))
        print()


def allEmployeesByRole(role):
    query = """SELECT * FROM Employee WHERE Role = %s;"""
    cur.execute(query, (role))
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "ID",
            "Name",
            "SupervisorID",
            "Aadhar Number",
            "Years of Experience",
            "Salary",
            "Age",
            "Gender",
            "DOJ",
        ]
        rows = [
            [
                item["EmployeeID"],
                item["Name"],
                item.get("SupervisorID", ""),
                item["Number"],
                item["YearsOfExperience"],
                item["Salary"],
                item["Age"],
                item["Gender"],
                item["DOJ"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="grid"))
        print()


def allEmployeesByExperience(years):
    # select all the employees with experience greater than or equal to years
    query = """SELECT * FROM Employee WHERE YearsOfExperience >= %s;"""
    cur.execute(query, (years))
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "ID",
            "Name",
            "Role",
            "SupervisorID",
            "Aadhar Number",
            "Experience",
            "Salary",
            "Age",
            "Gender",
            # "Resume Link",
            "DOJ",
        ]
        rows = [
            [
                item["EmployeeID"],
                item["Name"],
                item["Role"],
                item.get("SupervisorID", ""),
                item["Number"],
                item["YearsOfExperience"],
                item["Salary"],
                item["Age"],
                item["Gender"],
                # item["ResumeLink"],
                item["DOJ"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="grid"))
        print()


def menuByItemID(ID):
    query = """SELECT * FROM MenuItem WHERE ItemId = %s;"""
    cur.execute(query, (ID))
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Item ID",
            "Item Name",
            "Item Description",
            "Item Price",
            "Item Image URL",
        ]
        rows = [
            [
                item["ItemId"],
                item["ItemName"],
                item["ItemDescription"],
                item["ItemPrice"],
                item["ItemImageURL"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="simple"))
        print()


def menuItemByName(name):
    query = """SELECT * FROM MenuItem WHERE ItemName = %s;"""
    cur.execute(query, (name))
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Item ID",
            "Item Name",
            "Item Description",
            "Item Price",
            "Item Image URL",
        ]
        rows = [
            [
                item["ItemId"],
                item["ItemName"],
                item["ItemDescription"],
                item["ItemPrice"],
                item["ItemImageURL"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="simple"))
        print()


def analyzeMostOrdered():
    query = f"""SELECT mi.ItemName, COUNT(o.ItemId) AS OrderCount
FROM Orders o
INNER JOIN MenuItem mi ON o.ItemId = mi.ItemId
GROUP BY mi.ItemName
ORDER BY OrderCount DESC;
"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Item Name",
            "Order Count",
        ]
        rows = [
            [
                item["ItemName"],
                item["OrderCount"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="grid"))
        print()


def analyzeMeanOrderValue():
    query = f"""select CustomerID, avg(BillAmount) as AverageExp from Bill
group by CustomerID;
"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Customer ID",
            "Average Expense",
        ]
        rows = [
            [
                item["CustomerID"],
                item["AverageExp"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="grid"))
        print()


def analyzeOrderFrequency():
    query = f"""SELECT c.CustomerId, COUNT(o.ItemId) AS OrderFrequency
FROM Customer c
LEFT JOIN Orders o ON c.CustomerId = o.CustomerId
GROUP BY c.CustomerId;
"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Customer ID",
            "Order Frequency",
        ]
        rows = [
            [
                item["CustomerId"],
                item["OrderFrequency"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="grid"))
        print()


def tableTurnOver():
    query = f"""SELECT r.OutletID, HOUR(r.DateOfBooking) AS ReservationHour, COUNT(*) AS ReservationCount
FROM Reservation r
GROUP BY r.OutletID, ReservationHour;
"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Outlet ID",
            "Reservation Hour",
            "Reservation Count",
        ]
        rows = [
            [
                item["OutletID"],
                item["ReservationHour"],
                item["ReservationCount"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="grid"))
        print()


def analyzeDeliveryOrders():
    query = f"""SELECT dp.PartnerName, COUNT(op.ItemId) AS PartnerOrderCount
FROM DeliveryPartner dp
LEFT JOIN OrderPartners op ON dp.PartnerID = op.PartnerID
GROUP BY dp.PartnerName;
"""
    cur.execute(query)
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Partner Name",
            "Partner Order Count",
        ]
        rows = [
            [
                item["PartnerName"],
                item["PartnerOrderCount"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="grid"))
        print()


def newOutlet(
    OutletID, OutletName, Address, Phone, Rating, PopularItem, Revenue, OutletCapacity
):
    query = """INSERT INTO Outlet 
                    (OutletID, OutletName, Address, Phone, Rating, PopularItem, Revenue, OutletCapacity) 
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s);"""
    cur.execute(
        query,
        (
            OutletID,
            OutletName,
            Address,
            Phone,
            Rating,
            PopularItem,
            Revenue,
            OutletCapacity,
        ),
    )

    conn.commit()
    print("Outlet Added Successfully")


def newEmployee(
    employeeID,
    name,
    aadhar,
    number,
    address,
    salary,
    gender,
    dob,
    doj,
    role,
    supervisorid,
    yearsofexp,
    age,
    resumelink,
    outletid,
):
    # add new employee
    query = """INSERT INTO Employee
    (EmployeeID, Name, Aadhar, Number, Address, Salary, Gender, DOJ, DOB, Role, SupervisorID, YearsOfExperience, Age, ResumeLink, OutletID)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s,%s,%s,%s,%s,%s);"""
    cur.execute(
        query,
        (
            employeeID,
            name,
            aadhar,
            number,
            address,
            salary,
            gender,
            doj,
            dob,
            role,
            supervisorid,
            yearsofexp,
            age,
            resumelink,
            outletid,
        ),
    )
    conn.commit()
    print("Employee Added Successfully")


def addMenuItem(ItemId, ItemName, ItemDescription, ItemPrice, ItemImageURL):
    query = """INSERT INTO MenuItem 
                    (ItemId, ItemName, ItemDescription, ItemPrice, ItemImageURL) 
                    VALUES (%s, %s, %s, %s, %s);"""
    cur.execute(
        query,
        (
            ItemId,
            ItemName,
            ItemDescription,
            ItemPrice,
            ItemImageURL,
        ),
    )

    conn.commit()
    print("Menu Item Added Successfully")


def addNewCustomer(
    CustomerId, Name, Phone, Email, Member, MemberSince, CustomerSince, Discount
):
    if MemberSince == "":
        MemberSince = None
    query = """INSERT INTO Customer 
                    (CustomerId, Name, Phone, Email, Member, MemberSince, CustomerSince, Discount) 
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s);"""
    cur.execute(
        query,
        (
            CustomerId,
            Name,
            Phone,
            Email,
            Member,
            MemberSince,
            CustomerSince,
            Discount,
        ),
    )

    conn.commit()
    print("Customer Added Successfully")


def addNewReservation(DateOfBooking, CustomerID, OutletID, PaymentMode):
    query = """INSERT INTO Reservation 
                    (DateOfBooking, CustomerID, OutletID, PaymentMode) 
                    VALUES (%s, %s, %s, %s);"""
    cur.execute(
        query,
        (
            DateOfBooking,
            CustomerID,
            OutletID,
            PaymentMode,
        ),
    )

    conn.commit()
    print("Reservation Added Successfully")


def addNewOrder(OutletID, CustomerID, Mode, OrderStatus, ItemId):
    query = """INSERT INTO Orders 
                    (OutletID, CustomerID, Mode, OrderStatus, ItemId) 
                    VALUES (%s, %s, %s, %s, %s);"""
    cur.execute(
        query,
        (
            OutletID,
            CustomerID,
            Mode,
            OrderStatus,
            ItemId,
        ),
    )

    conn.commit()
    print("Order Added Successfully")


def addDeliveryPartner(PartnerID, PartnerName):
    query = """INSERT INTO DeliveryPartner 
                    (PartnerID, PartnerName) 
                    VALUES (%s, %s);"""
    cur.execute(
        query,
        (
            PartnerID,
            PartnerName,
        ),
    )

    conn.commit()
    print("Delivery Partner Added Successfully")


def updateEmployeeInfo(employeeID, newName, newAddress, newSalary, newRole):
    query = """UPDATE Employee
    SET Name = %s, Address = %s, Salary = %s, Role = %s
    WHERE EmployeeID = %s;"""
    cur.execute(
        query,
        (
            newName,
            newAddress,
            newSalary,
            newRole,
            employeeID,
        ),
    )
    conn.commit()
    print("Employee Updated Successfully")


def updateCustomerDetails(CustomerID, phone, email, member):
    query = """UPDATE Customer
    SET Phone = %s, Email = %s, Member = %s
    WHERE CustomerID = %s;"""
    cur.execute(
        query,
        (
            phone,
            email,
            member,
            CustomerID,
        ),
    )
    conn.commit()
    print("Customer Updated Successfully")


def updateMenuItem(itemID, newName, newDescription, newPrice, newImage):
    query = """UPDATE MenuItem
    SET ItemName = %s, ItemDescription = %s, ItemPrice = %s, ItemImageURL = %s
    WHERE ItemId = %s;"""
    cur.execute(
        query,
        (
            newName,
            newDescription,
            newPrice,
            newImage,
            itemID,
        ),
    )
    conn.commit()
    print("Menu Item Updated Successfully")


def updateOutletInfo(outletID, newName, newAddress, newPhone, newPopularItem):
    query = """UPDATE Outlet
    SET OutletName = %s, Address = %s, Phone = %s, PopularItem = %s
    WHERE OutletID = %s;"""
    cur.execute(
        query,
        (
            newName,
            newAddress,
            newPhone,
            newPopularItem,
            outletID,
        ),
    )
    conn.commit()
    print("Outlet Updated Successfully")


def orderStatus(customerID, outletID, orderStatus, partnerID, itemID):
    query = f"""UPDATE Orders
SET OrderStatus = {orderStatus}, PartnerID = {partnerID}, Mode = 1
WHERE CustomerID = {customerID} AND OutletID = {outletID} AND ItemId = {itemID};
"""
    cur.execute(query)
    conn.commit()
    print("Order Status Updated Successfully")


def deleteEmployee(employeeID):
    # Update dependent rows
    update_query = (
        """UPDATE Employee SET SupervisorID = NULL WHERE SupervisorID = %s;"""
    )
    cur.execute(update_query, (employeeID,))

    # Delete the employee
    delete_query = """DELETE FROM Employee WHERE EmployeeID = %s;"""
    cur.execute(delete_query, (employeeID,))
    conn.commit()
    print("Employee Deleted Successfully")


def deleteCustomer(customerID):
    query = """DELETE FROM Customer
    WHERE CustomerID = %s;"""
    cur.execute(
        query,
        (customerID,),
    )
    conn.commit()
    print("Customer Deleted Successfully")


def deleteMenuItem(itemID):
    query = """DELETE FROM MenuItem
    WHERE ItemId = %s;"""
    cur.execute(
        query,
        (itemID,),
    )
    conn.commit()
    print("Menu Item Deleted Successfully")


def deleteOutlet(outletID):
    query = """DELETE FROM Outlet
    WHERE OutletID = %s;"""
    cur.execute(
        query,
        (outletID,),
    )
    conn.commit()
    print("Outlet Deleted Successfully")


def deleteReservation(customerID, outletID, dateOfBooking):
    query = """DELETE FROM Reservation
    WHERE CustomerID = %s AND OutletID = %s AND DateOfBooking = %s;"""
    cur.execute(
        query,
        (
            customerID,
            outletID,
            dateOfBooking,
        ),
    )
    conn.commit()
    print("Reservation Deleted Successfully")


def deleteOrder(customerID, outletID, itemID):
    query = """DELETE FROM Orders
    WHERE CustomerID = %s AND OutletID = %s AND ItemId = %s;"""
    cur.execute(
        query,
        (
            customerID,
            outletID,
            itemID,
        ),
    )
    conn.commit()
    print("Order Deleted Successfully")


def deleteDeliveryPartner(partnerID):
    query = """DELETE FROM DeliveryPartner
    WHERE PartnerID = %s;"""
    cur.execute(
        query,
        (partnerID,),
    )
    conn.commit()
    print("Delivery Partner Deleted Successfully")


def viewCustomerOrders(customerID):
    query = """SELECT * FROM Orders WHERE CustomerID = %s;"""
    cur.execute(query, (customerID))
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Outlet ID",
            "Customer ID",
            "Mode",
            "Order Status",
            "Item ID",
        ]
        rows = [
            [
                item["OutletID"],
                item["CustomerID"],
                item["Mode"],
                item["OrderStatus"],
                item["ItemId"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="simple"))
        print()
    else:
        print("No Orders")
        print()


def viewCustomerReservations(customerID):
    query = """SELECT * FROM Reservation WHERE CustomerID = %s;"""
    cur.execute(query, (customerID))
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        headers = [
            "Date Of Booking",
            "Customer ID",
            "Outlet ID",
            "Payment Mode",
        ]
        rows = [
            [
                item["DateOfBooking"],
                item["CustomerID"],
                item["OutletID"],
                item["PaymentMode"],
            ]
            for item in result
        ]
        print(tabulate(rows, headers=headers, tablefmt="simple"))
        print()
    else:
        print("No Reservations")
        print()


def updateOrderStatus(itemID, customerID, outletID, newStatus):
    query = """UPDATE Orders
    SET OrderStatus = %s
    WHERE ItemId = %s AND CustomerID = %s AND OutletID = %s;"""
    cur.execute(
        query,
        (
            newStatus,
            itemID,
            customerID,
            outletID,
        ),
    )
    conn.commit()
    print("Order Status Updated Successfully")


def calculateBill(customerID, outletID, dateOfOrder):
    query = """UPDATE Bill
    SET BillAmount = (
        SELECT SUM(MI.ItemPrice)
        FROM BillItems BI
        JOIN Orders O ON BI.OutletID = O.OutletID AND BI.CustomerID = O.CustomerID
        JOIN MenuItem MI ON BI.OrderedItems = MI.ItemId
        WHERE BI.CustomerID = %s
          AND BI.OutletID = %s
          AND O.dateOfOrder = %s
    )
    WHERE CustomerID = %s AND OutletID = %s AND DateOfBill = %s;"""

    cur.execute(
        query,
        (
            customerID,
            outletID,
            dateOfOrder,
            customerID,
            outletID,
            dateOfOrder,
        ),
    )
    conn.commit()
    print("Bill Calculated Successfully")


def customer():
    while True:
        customerID = input("Enter Customer ID: ")
        query = """SELECT Name FROM Customer WHERE CustomerID = %s;"""
        cur.execute(query, (customerID))
        result = cur.fetchall()
        tmp = sp.call("clear", shell=True)
        if result:
            pass
        else:
            print("Customer Not Found")
            continue
        while True:
            print("Welcome", result[0]["Name"])
            print()
            # search outlets based on address or popular item
            print("1. Search Outlets by Address or Popular Item")
            print("2. View my Orders")
            print("3. View my Reservations")
            print("4. View Outlets")
            print("5. Display Menu by Outlet ID")
            print("6. Search Items by Name or Description")
            print("7. View Rating Statistics")
            print("8. Exit")
            print()
            inp = int(input("Enter choice> "))
            if inp == 1:
                print("Enter Address (Leave blank if not required)")
                address = input()
                print("Enter Popular Item (Leave blank if not required)")
                popularItem = input()
                searchOutlets(address, popularItem)
            if inp == 2:
                viewCustomerOrders(customerID)
            if inp == 3:
                viewCustomerReservations(customerID)
            if inp == 4:
                displayOutlets()
            if inp == 5:
                print("Enter Outlet ID")
                outletID = input()
                getMenu(outletID)
            if inp == 6:
                print("Enter Item Name (Leave blank if not required)")
                itemName = input()
                print("Enter Item Description (Leave blank if not required)")
                itemDescription = input()
                searchItems(itemName, itemDescription)
            if inp == 7:
                print("1. Max Rating")
                print("2. Min Rating")
                print("3. Mean Rating")
                print()
                inp = int(input("Enter choice> "))
                if inp == 1:
                    maxOutletRating()
                if inp == 2:
                    minOutletRating()
                if inp == 3:
                    meanOutletRating()
            if inp == 8:
                print("Thank you for using $dataBase*d")
                exit(0)
            tmp = input("Press Enter to continue...")
            tmp = sp.call("clear", shell=True)


def deliveryPartner():
    partnerID = input("Please enter your ID: ")
    tmp = sp.call("clear", shell=True)
    # get name of delivery partner by ID
    query = """SELECT PartnerName FROM DeliveryPartner WHERE PartnerID = %s;"""
    cur.execute(query, (partnerID))
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        pass
    else:
        print("Delivery Partner Not Found")
        exit(0)
    print("Welcome Partner", result[0]["PartnerName"])
    print("Press Enter to check your Orders Status")
    tmp = input()
    tmp = sp.call("clear", shell=True)
    checkOrderStatus(partnerID)
    print("Thank you for using $dataBase*d")


def chef(id):
    # search name of chef by ID
    query = """SELECT Name FROM Employee WHERE EmployeeID = %s;"""
    cur.execute(query, (id))
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        pass
    else:
        print("Chef Not Found")
        exit(0)
    while True:
        print("Welcome Chef", result[0]["Name"])
        print()
        print("1. Add new Menu Item")
        print("2. Update Menu Item")
        # print("3. Delete Menu Item")
        print("3. Update Order Status")
        print("4. Exit")
        print()
        inp = int(input("Enter choice> "))
        if inp == 1:
            print("Enter Item ID")
            itemID = input()
            print("Enter Item Name")
            itemName = input()
            print("Enter Item Description")
            itemDescription = input()
            print("Enter Item Price")
            itemPrice = input()
            print("Enter Item Image URL")
            itemImageURL = input()
            addMenuItem(itemID, itemName, itemDescription, itemPrice, itemImageURL)
        if inp == 2:
            print("Enter Item ID")
            itemID = input()
            print("Enter New Item Name")
            newName = input()
            print("Enter New Item Description")
            newDescription = input()
            print("Enter New Item Price")
            newPrice = input()
            print("Enter New Item Image URL")
            newImage = input()
            updateMenuItem(itemID, newName, newDescription, newPrice, newImage)
        # if inp == 3:
        #     print("Enter Item ID")
        #     itemID = input()
        #     deleteMenuItem(itemID)
        if inp == 3:
            print("Enter Item ID")
            itemID = input()
            print("Enter Customer ID")
            customerID = input()
            print("Enter Outlet ID")
            outletID = input()
            print("Enter New Order Status")
            newStatus = input()
            updateOrderStatus(itemID, customerID, outletID, newStatus)
        if inp == 4:
            print("Thank you for using $dataBase*d")
            exit(0)
        tmp = input("Press Enter to continue...")
        tmp = sp.call("clear", shell=True)


def manager(id):
    # get name of manager by ID
    query = """SELECT Name FROM Employee WHERE EmployeeID = %s;"""
    cur.execute(query, (id))
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        pass
    else:
        print("Manager Not Found")
        exit(0)
    while True:
        print("Welcome Manager", result[0]["Name"])
        print()
        print("A. Search Employees")
        print("B. View Customers")
        print("C. View all Reservations")
        print("D. View Statistics")
        print("E. Manage Employees")
        print("F. Manage Customers")
        print("G. Manage Outlets")
        print("H. Analyze Data")
        print("I. Exit")
        print()
        choice = input("Enter choice> ")
        if choice == "A":
            print("1. by Employee ID")
            print("2. by Employee Name")
            print("3. by Employee Supervisor")
            print("4. All Employees")
            print("5. All Employees by Role")
            print("6. All Employees by Experience")
            print()
            cho = int(input("Enter choice> "))
            if cho == 1:
                emp_id = input("Enter Employee ID: ")
                employeeDetails_byID(emp_id)
            elif cho == 2:
                emp_name = input("Enter Employee Name: ")
                employeeDetails_byName(emp_name)
            elif cho == 3:
                emp_sup = input("Enter Employee Supervisor ID: ")
                employeeDetails_bySupervisorID(emp_sup)
            elif cho == 4:
                allEmployees()
            elif cho == 5:
                print("Enter Role")
                role = input()
                allEmployeesByRole(role)
            elif cho == 6:
                print("Enter Years of Experience")
                yearsOfExperience = input()
                allEmployeesByExperience(yearsOfExperience)
        elif choice == "B":
            print("1. by Customer ID")
            print("2. by Customer Name")
            print("3. by Customer Phone")
            print("4. by Customer Discount")
            print()
            cho = int(input("Enter choice> "))
            if cho == 1:
                cust_id = input("Enter Customer ID: ")
                customerDetails_byID(cust_id)
            elif cho == 2:
                cust_name = input("Enter Customer Name: ")
                customerDetails_byName(cust_name)
            elif cho == 3:
                cust_phone = input("Enter Customer Phone: ")
                customerDetails_byNo(cust_phone)
            elif cho == 4:
                cust_discount = input("Enter Customer Discount: ")
                customersByDiscount(cust_discount)
        elif choice == "C":
            print("Enter Date of Booking")
            dateOfBooking = input()
            reservation(dateOfBooking)
        elif choice == "D":
            print("1. Total Revenue")
            print("2. Mean Revenue")
            print("3. Max Revenue")
            print("4. Min Revenue")
            print("5. Median Revenue")
            print("6. Mode Revenue")
            print("7. Total Orders by Online/Offline")
            print("8. Average Probability of Member")
            print("9. Search Employees by Role and Experience")
            print("10. Total Members")
            print()
            cho = int(input("Enter choice> "))
            if cho == 1:
                totalRevenue()
            elif cho == 2:
                meanRevenue()
            elif cho == 3:
                maxRevenue()
            elif cho == 4:
                minRevenue()
            elif cho == 5:
                medianRevenue()
            elif cho == 6:
                modeRevenue()
            elif cho == 7:
                totalOrdersByOnOff()
            elif cho == 8:
                avgProbabilityOfMember()
            elif cho == 9:
                print("Enter Role")
                role = input()
                print("Enter Years of Experience")
                yearsOfExperience = input()
                searchEmployee(role, yearsOfExperience)
            elif cho == 10:
                totalMembers()
        elif choice == "E":
            print("1. Add new Employee")
            print("2. Update Employee Info")
            print("3. Delete Employee")
            print()
            cho = int(input("Enter choice> "))
            if cho == 1:
                newEmployeeID = input("Enter Employee ID: ")
                newName = input("Enter Employee Name: ")
                newAadhar = input("Enter Aadhar Number: ")
                newNumber = input("Enter Phone Number: ")
                newAddress = input("Enter Address: ")
                newSalary = input("Enter Salary: ")
                newGender = input("Enter Gender: ")
                newDOB = input("Enter Date of Birth: ")
                newDOJ = input("Enter Date of Joining: ")
                newRole = input("Enter Role: ")
                newSupervisorID = input("Enter Supervisor ID: ")
                newYearsOfExperience = input("Enter Years of Experience: ")
                newAge = input("Enter Age: ")
                newResumeLink = input("Enter Resume Link: ")
                newOutletID = input("Enter Outlet ID: ")
                newEmployee(
                    newEmployeeID,
                    newName,
                    newAadhar,
                    newNumber,
                    newAddress,
                    newSalary,
                    newGender,
                    newDOB,
                    newDOJ,
                    newRole,
                    newSupervisorID,
                    newYearsOfExperience,
                    newAge,
                    newResumeLink,
                    newOutletID,
                )
            elif cho == 2:
                employeeID = input("Enter Employee ID: ")
                newName = input("Enter New Employee Name: ")
                newAddress = input("Enter New Address: ")
                newSalary = input("Enter New Salary: ")
                newRole = input("Enter New Role: ")
                updateEmployeeInfo(employeeID, newName, newAddress, newSalary, newRole)
            elif cho == 3:
                employeeID = input("Enter Employee ID: ")
                deleteEmployee(employeeID)
        elif choice == "F":
            print("1. Add new Customer")
            print("2. Update Customer Details")
            print("3. Delete Customer")
            print()
            cho = int(input("Enter choice> "))
            if cho == 1:
                newCustomerID = input("Enter Customer ID: ")
                newName = input("Enter Customer Name: ")
                newPhone = input("Enter Phone Number: ")
                newEmail = input("Enter Email: ")
                newMember = input("Enter Member: ")
                newMemberSince = input("Enter Member Since: ")
                newCustomerSince = input("Enter Customer Since: ")
                newDiscount = input("Enter Discount: ")
                addNewCustomer(
                    newCustomerID,
                    newName,
                    newPhone,
                    newEmail,
                    newMember,
                    newMemberSince,
                    newCustomerSince,
                    newDiscount,
                )
            elif cho == 2:
                customerID = input("Enter Customer ID: ")
                phone = input("Enter New Phone Number: ")
                email = input("Enter New Email: ")
                member = input("Enter New Member: ")
                updateCustomerDetails(customerID, phone, email, member)
            elif cho == 3:
                customerID = input("Enter Customer ID: ")
                deleteCustomer(customerID)
        elif choice == "G":
            print("1. Add new Outlet")
            print("2. Update Outlet Info")
            print("3. Delete Outlet")
            print()
            cho = int(input("Enter choice> "))
            if cho == 1:
                newOutletID = input("Enter Outlet ID: ")
                newOutletName = input("Enter Outlet Name: ")
                newAddress = input("Enter Address: ")
                newPhone = input("Enter Phone Number: ")
                newRating = input("Enter Rating: ")
                newPopularItem = input("Enter Popular Item: ")
                newRevenue = input("Enter Revenue: ")
                newOutletCapacity = input("Enter Outlet Capacity: ")
                newOutlet(
                    newOutletID,
                    newOutletName,
                    newAddress,
                    newPhone,
                    newRating,
                    newPopularItem,
                    newRevenue,
                    newOutletCapacity,
                )
            elif cho == 2:
                outletID = input("Enter Outlet ID: ")
                newName = input("Enter New Outlet Name: ")
                newAddress = input("Enter New Address: ")
                newPhone = input("Enter New Phone Number: ")
                newPopularItem = input("Enter New Popular Item: ")
                updateOutletInfo(
                    outletID, newName, newAddress, newPhone, newPopularItem
                )
            elif cho == 3:
                outletID = input("Enter Outlet ID: ")
                deleteOutlet(outletID)
        elif choice == "H":
            print("1. Analyze Most Ordered")
            print("2. Analyze Mean Order Value")
            print("3. Analyze Order Frequency")
            print("4. Table Turn Over")
            print("5. Analyze Delivery Orders")
            print()
            cho = int(input("Enter choice> "))
            if cho == 1:
                analyzeMostOrdered()
            elif cho == 2:
                analyzeMeanOrderValue()
            elif cho == 3:
                analyzeOrderFrequency()
            elif cho == 4:
                tableTurnOver()
            elif cho == 5:
                analyzeDeliveryOrders()
        elif choice == "I":
            print("Thank you for using $dataBase*d")
            exit(0)
        tmp = input("Press Enter to continue...")
        tmp = sp.call("clear", shell=True)


def waiter(id):
    # search name of waiter by ID
    query = """SELECT Name FROM Employee WHERE EmployeeID = %s;"""
    cur.execute(query, (id))
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        pass
    else:
        print("Waiter Not Found")
        exit(0)
    while True:
        print("Welcome Waiter", result[0]["Name"])
        print()
        print("1. View Customer by ID")
        print("2. View Customer by Name")
        print("3. Add Customer")
        print("4. View Menu Item by ID")
        print("5. View Menu Item by Name")
        print("6. View all Reservations")
        print("7. View all Orders")
        print("8. Delete Order")
        print("9. Add new Order")
        print("10. Calculate Bill")
        print("11. Exit")
        print()
        inp = int(input("Enter choice> "))
        if inp == 1:
            print("Enter Customer ID")
            customerID = input()
            customerDetails_byID(customerID)
        if inp == 2:
            print("Enter Customer Name")
            customerName = input()
            customerDetails_byName(customerName)
        if inp == 3:
            newCustomerID = input("Enter Customer ID: ")
            newName = input("Enter Customer Name: ")
            newPhone = input("Enter Phone Number: ")
            newEmail = input("Enter Email: ")
            newMember = input("Enter Member: ")
            newMemberSince = input("Enter Member Since: ")
            newCustomerSince = input("Enter Customer Since: ")
            newDiscount = input("Enter Discount: ")
            addNewCustomer(
                newCustomerID,
                newName,
                newPhone,
                newEmail,
                newMember,
                newMemberSince,
                newCustomerSince,
                newDiscount,
            )
        if inp == 4:
            print("Enter Item ID")
            itemID = input()
            menuByItemID(itemID)
        if inp == 5:
            print("Enter Item Name")
            itemName = input()
            menuItemByName(itemName)
        if inp == 6:
            print("Enter Date of Booking")
            dateOfBooking = input()
            reservation(dateOfBooking)
        if inp == 7:
            print("Enter Customer ID")
            customerID = input()
            viewCustomerOrders(customerID)
        if inp == 8:
            print("Enter Customer ID")
            customerID = input()
            print("Enter Outlet ID")
            outletID = input()
            print("Enter Item ID")
            itemID = input()
            deleteOrder(customerID, outletID, itemID)
        if inp == 9:
            print("Enter Outlet ID")
            outletID = input()
            print("Enter Customer ID")
            customerID = input()
            print("Enter Mode")
            mode = input()
            print("Enter Order Status")
            orderStatus = input()
            print("Enter Item ID")
            itemID = input()
            addNewOrder(outletID, customerID, mode, orderStatus, itemID)
        if inp == 10:
            print("Enter Customer ID")
            customerID = input()
            print("Enter Outlet ID")
            outletID = input()
            print("Enter Date of Order")
            dateOfOrder = input()
            calculateBill(customerID, outletID, dateOfOrder)
        if inp == 11:
            print("Thank you for using $dataBase*d")
            exit(0)
        tmp = input("Press Enter to continue...")
        tmp = sp.call("clear", shell=True)


def supervisor(id):
    # search name of supervisor by ID
    query = """SELECT Name FROM Employee WHERE EmployeeID = %s;"""
    cur.execute(query, (id))
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        pass
    else:
        print("Supervisor Not Found")
        exit(0)
    while True:
        print("Welcome Supervisor", result[0]["Name"])
        print()
        print("A. Search Employees")
        print("B. View Customers")
        print("C. View all Reservations")
        print("D. View Statistics")
        print("E. Manage Employees")
        print("F. Exit")
        print()
        choice = input("Enter choice> ")
        if choice == "A":
            print("1. by Employee ID")
            print("2. by Employee Name")
            print("3. by Employee Supervisor")
            print("4. All Employees")
            print("5. All Employees by Role")
            print("6. All Employees by Experience")
            print()
            cho = int(input("Enter choice> "))
            if cho == 1:
                emp_id = input("Enter Employee ID: ")
                employeeDetails_byID(emp_id)
            elif cho == 2:
                emp_name = input("Enter Employee Name: ")
                employeeDetails_byName(emp_name)
            elif cho == 3:
                emp_sup = input("Enter Employee Supervisor ID: ")
                employeeDetails_bySupervisorID(emp_sup)
            elif cho == 4:
                allEmployees()
            elif cho == 5:
                print("Enter Role")
                role = input()
                allEmployeesByRole(role)
            elif cho == 6:
                print("Enter Years of Experience")
                yearsOfExperience = input()
                allEmployeesByExperience(yearsOfExperience)
        elif choice == "B":
            print("1. by Customer ID")
            print("2. by Customer Name")
            print("3. by Customer Phone")
            print("4. by Customer Discount")
            print()
            cho = int(input("Enter choice> "))
            if cho == 1:
                cust_id = input("Enter Customer ID: ")
                customerDetails_byID(cust_id)
            elif cho == 2:
                cust_name = input("Enter Customer Name: ")
                customerDetails_byName(cust_name)
            elif cho == 3:
                cust_phone = input("Enter Customer Phone: ")
                customerDetails_byNo(cust_phone)
            elif cho == 4:
                cust_discount = input("Enter Customer Discount: ")
                customersByDiscount(cust_discount)
        elif choice == "C":
            print("Enter Date of Booking")
            dateOfBooking = input()
            reservation(dateOfBooking)
        elif choice == "D":
            print("1. Total Revenue")
            print("2. Mean Revenue")
            print("3. Max Revenue")
            print("4. Min Revenue")
            print("5. Median Revenue")
            print("6. Mode Revenue")
            print("7. Total Orders by Online/Offline")
            print("8. Average Probability of Member")
            print("9. Search Employees by Role and Experience")
            print("10. Total Members")
            print()
            cho = int(input("Enter choice> "))
            if cho == 1:
                totalRevenue()
            elif cho == 2:
                meanRevenue()
            elif cho == 3:
                maxRevenue()
            elif cho == 4:
                minRevenue()
            elif cho == 5:
                medianRevenue()
            elif cho == 6:
                modeRevenue()
            elif cho == 7:
                totalOrdersByOnOff()
            elif cho == 8:
                avgProbabilityOfMember()
            elif cho == 9:
                print("Enter Role")
                role = input()
                print("Enter Years of Experience")
                yearsOfExperience = input()
                searchEmployee(role, yearsOfExperience)
            elif cho == 10:
                totalMembers()
        elif choice == "E":
            print("1. Add new Employee")
            print("2. Update Employee Info")
            print("3. Delete Employee")
            print()
            cho = int(input("Enter choice> "))
            if cho == 1:
                newEmployeeID = input("Enter Employee ID: ")
                newName = input("Enter Employee Name: ")
                newAadhar = input("Enter Aadhar ID: ")
                newNumber = input("Enter Aadhar Number: ")
                newAddress = input("Enter Address: ")
                newSalary = input("Enter Salary: ")
                newGender = input("Enter Gender: ")
                newDOB = input("Enter Date of Birth: ")
                newDOJ = input("Enter Date of Joining: ")
                newRole = input("Enter Role: ")
                newSupervisorID = input("Enter Supervisor ID: ")
                newYearsOfExperience = input("Enter Years of Experience: ")
                newAge = input("Enter Age: ")
                newResumeLink = input("Enter Resume Link: ")
                newOutletID = input("Enter Outlet ID: ")
                newEmployee(
                    newEmployeeID,
                    newName,
                    newAadhar,
                    newNumber,
                    newAddress,
                    newSalary,
                    newGender,
                    newDOB,
                    newDOJ,
                    newRole,
                    newSupervisorID,
                    newYearsOfExperience,
                    newAge,
                    newResumeLink,
                    newOutletID,
                )
            elif cho == 2:
                employeeID = input("Enter Employee ID: ")
                newName = input("Enter New Employee Name: ")
                newAddress = input("Enter New Address: ")
                newSalary = input("Enter New Salary: ")
                newRole = input("Enter New Role: ")
                updateEmployeeInfo(employeeID, newName, newAddress, newSalary, newRole)
            elif cho == 3:
                employeeID = input("Enter Employee ID: ")
                deleteEmployee(employeeID)
        elif choice == "F":
            print("Thank you for using $dataBase*d")
            exit(0)
        tmp = input("Press Enter to continue...")
        tmp = sp.call("clear", shell=True)


def employee():
    inp = input("Enter Employee ID: ")
    # get role of employee by ID
    query = """SELECT Role FROM Employee WHERE EmployeeID = %s;"""
    cur.execute(query, (inp))
    result = cur.fetchall()
    tmp = sp.call("clear", shell=True)
    if result:
        role = result[0]["Role"]
        if role == "Manager":
            manager(inp)
        elif role == "Chef":
            chef(inp)
        elif role == "waiter":
            waiter(inp)
        elif role == "Supervisor":
            supervisor(inp)
    else:
        print("Employee Not Found")


with conn.cursor() as cur:
    time.sleep(2)
    tmp = sp.call("clear", shell=True)
    print("Choose your role:")
    inp = int(
        input(
            "1. Customer\n2. Employee\n3. Delivery Partner\n4. Exit\n\nEnter choice> "
        )
    )
    tmp = sp.call("clear", shell=True)
    if inp == 1:
        customer()
    elif inp == 2:
        employee()
    elif inp == 3:
        deliveryPartner()
    elif inp == 4:
        print("Thank you for using $dataBase*d")
        exit(0)
