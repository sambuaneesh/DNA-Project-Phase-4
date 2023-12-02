- fork this repo https://github.com/sambuaneesh/DNA-Project-Phase-4
- clone that repo to your local pc
- execute the following commands in the folder you cloned

```sh
python -m venv dataBased
source dataBased/bin/activate
pip install -r requirements.txt
sudo su
mysql -u root
```

```sql
create database dataBased;
exit
```

```sh
mysql -u root -p dataBased < data.sql
```

- Open the `config.json` file in vscode
  ![](https://i.imgur.com/B7KuIWM.png)
- change the line 3 and line 6
  - line 3 = name of your pc, just open your terminal, it is the name displayed after "@"
  - line 6 = your mysql password

try running the code now

````sh
python cafe.py
	```
````

# Functions

Certainly! Below is an analysis of the provided functions:

### 1. `getMenu(OutletID)`

- **Purpose:**
  - Retrieves the menu items for a specific outlet.

- **Query:**
  - Selects information about menu items from the `MenuOutlet` and `MenuItem` tables.

- **Output:**
  - Displays menu items with details such as ID, name, description, price, and image URL.

### 2. `displayOutlets()`

- **Purpose:**
  - Displays details about all available outlets.

- **Query:**
  - Selects information about outlets from the `Outlet` table.

- **Output:**
  - Presents outlet details including ID, name, address, phone, rating, popular item, and capacity.

### 3. `searchItems(ItemName, ItemDescription)`

- **Purpose:**
  - Searches for menu items based on name and description.

- **Query:**
  - Retrieves items from the `MenuItem`, `MenuOutlet`, and `Outlet` tables using a LIKE condition.

- **Output:**
  - Displays items found with their name, description, and associated outlet.

### 4. `searchOutlets(Address, PopularItem)`

- **Purpose:**
  - Searches for outlets based on address and popular item.

- **Query:**
  - Retrieves outlets from the `Outlet` table using a LIKE condition.

- **Output:**
  - Displays outlets found with their name, address, and rating.

### 5. `employeeDetails_byID(EmployeeID)`

- **Purpose:**
  - Retrieves details of an employee based on their ID.

- **Query:**
  - Selects all columns from the `Employee` table where the EmployeeID matches.

- **Output:**
  - Displays employee details including ID, name, role, and supervisor's ID if available.

### 6. `employeeDetails_byName(Name)`

- **Purpose:**
  - Retrieves details of employees based on their name.

- **Query:**
  - Selects relevant columns from the `Employee` table where the name matches partially.

- **Output:**
  - Displays a table of employee details including ID, name, role, and supervisor's ID if available.

### 7. `employeeDetails_bySupervisorID(SupervisorID)`

- **Purpose:**
  - Retrieves details of employees based on their supervisor's ID.

- **Query:**
  - Selects all columns from the `Employee` table where the SupervisorID matches.

- **Output:**
  - Displays a table of employee details including ID, name, role, and supervisor's ID.

### 8. `customerDetails_byID(CustomerID)`

- **Purpose:**
  - Retrieves details of a customer based on their ID.

- **Query:**
  - Selects all columns from the `Customer` table where the CustomerID matches.

- **Output:**
  - Displays customer details including ID, name, phone, and email.

### 9. `customerDetails_byName(CustomerName)`

- **Purpose:**
  - Retrieves details of customers based on their name.

- **Query:**
  - Selects relevant columns from the `Customer` table where the name matches partially.

- **Output:**
  - Displays a table of customer details including ID, name, phone, and email.

### 10. `customerDetails_byNo(CustomerNumber)`

- **Purpose:**
  - Retrieves details of a customer based on their phone number.

- **Query:**
  - Selects all columns from the `Customer` table where the phone number matches.

- **Output:**
  - Displays customer details including ID, name, phone, and email.

### 11. `dispatch(ch)`

- **Purpose:**
  - Provides a menu for dispatching various functions based on user input.

### 12. `employeeNames()`

- **Purpose:**
  - Displays a list of employee names with their IDs.

- **Query:**
  - Selects employee IDs and names from the `Employee` table.

- **Output:**
  - Presents a table of employee IDs and names.

### 13. `totalRevenue()`

- **Purpose:**
  - Calculates and displays the total revenue of all outlets.

- **Query:**
  - Selects the sum of revenue from the `Outlet` table.

- **Output:**
  - Displays the total revenue.

### 14. `meanRevenue()`

- **Purpose:**
  - Calculates and displays the mean revenue of all outlets.

- **Query:**
  - Selects the average of revenue from the `Outlet` table.

- **Output:**
  - Displays the mean revenue.

### 15. `maxRevenue()`

- **Purpose:**
  - Finds and displays the maximum revenue among all outlets.

- **Query:**
  - Selects the maximum revenue from the `Outlet` table.

- **Output:**
  - Displays the maximum revenue.

### 16. `minRevenue()`

- **Purpose:**
  - Finds and displays the minimum revenue among all outlets.

- **Query:**
  - Selects the minimum revenue from the `Outlet` table.

- **Output:**
  - Displays the minimum revenue.

### 17. `medianRevenue()`

- **Purpose:**
  - Calculates and displays the median revenue of all outlets.

- **Query:**
  - Uses a subquery to find the median revenue from the `Outlet` table.

- **Output:**
  - Displays the median revenue.

### 18. `modeRevenue()`

- **Purpose:**
  - Calculates and displays the mode revenue of all outlets.

- **Query:**
  - Uses a subquery to find the mode revenue from the `Outlet` table.

- **Output:**
  - Displays the mode revenue.

### 19. `reservation(DateOfBooking)`

- **Purpose:**
  - Retrieves and displays reservation details for a specific date.

- **Query:**
  - Selects reservation details from the `Reservation` table where the date matches.

- **Output:**
  - Displays reservation details.

### 20. `customersByDiscount(Discount)`

- **Purpose:**
  - Retrieves and displays customers with a discount greater than or equal to a specified value.

- **Query:**
  - Selects customer details from the `Customer` table where the discount is greater than or equal to the specified value.

- **Output:**
  - Displays customer details.

### 21. `totalOrdersByOnOff()`

- **Purpose:**
  - Calculates and displays the total number of online and offline orders.

- **Query:**
  - Uses a conditional sum to count online and offline orders from the `Orders` table.

- **Output:**
  - Displays the total number of online and offline orders.

### 22. `avgProbabilityOfMember()`

- **Purpose:**
  - Calculates and displays the average membership probability of customers.

- **Query:**
  - Selects the average membership probability from the `Customer` table.

- **Output:**
  - Displays the average membership probability.

### 23. `searchEmployee(role, yearsOfExperience)`

- **Purpose:**
  - Retrieves and displays employees based on their role and years of experience.

- **Query:**
  - Selects employee details from the `Employee` table where the role

 matches, and years of experience are greater than or equal to the specified value.

- **Output:**
  - Displays employee details.

### 24. `totalMembers()`

- **Purpose:**
  - Calculates and displays the total number of members.

- **Query:**
  - Counts the number of customers with membership equal to 1.

- **Output:**
  - Displays the total number of members.

### 25. `checkOrderStatus(PartnerID)`

- **Purpose:**
  - Retrieves and displays order status for a specific partner.

- **Query:**
  - Selects order details from the `Orders` and `OrderPartners` tables based on a specific partner ID.

- **Output:**
  - Displays order status.

### 26. `maxOutletRating()`

- **Purpose:**
  - Finds and displays the maximum rating among all outlets.

- **Query:**
  - Selects the maximum rating from the `Outlet` table.

- **Output:**
  - Displays the maximum rating.

### 27. `minOutletRating()`

- **Purpose:**
  - Finds and displays the minimum rating among all outlets.

- **Query:**
  - Selects the minimum rating from the `Outlet` table.

- **Output:**
  - Displays the minimum rating.

### 28. `meanOutletRating()`

- **Purpose:**
  - Calculates and displays the mean rating of all outlets.

- **Query:**
  - Selects the average rating from the `Outlet` table.

- **Output:**
  - Displays the mean rating.

### 29. `allEmployees()`

- **Purpose:**
  - Displays details of all employees.

- **Query:**
  - Selects all columns from the `Employee` table.

- **Output:**
  - Presents a table of all employee details.

### 30. `allEmployeesByRole(role)`

- **Purpose:**
  - Displays details of all employees based on their role.

- **Query:**
  - Selects specific columns from the `Employee` table where the role matches.

- **Output:**
  - Presents a table of employee details based on role.

### 31. `allEmployeesByExperience(years)`

- **Purpose:**
  - Displays details of employees with experience greater than or equal to a specified value.

- **Query:**
  - Selects specific columns from the `Employee` table where years of experience are greater than or equal to the specified value.

- **Output:**
  - Presents a table of employee details based on experience.

### 32. `menuByItemID(ID)`

- **Purpose:**
  - Displays details of a menu item based on its ID.

- **Query:**
  - Selects all columns from the `MenuItem` table where the ItemId matches.

- **Output:**
  - Presents details of the menu item.

### 33. `menuItemByName(name)`

- **Purpose:**
  - Displays details of a menu item based on its name.

- **Query:**
  - Selects all columns from the `MenuItem` table where the ItemName matches.

- **Output:**
  - Presents details of the menu item.

### 34. `analyzeMostOrdered()`

- **Purpose:**
  - Analyzes and displays the most ordered menu items.

- **Query:**
  - Counts the number of times each menu item has been ordered.

- **Output:**
  - Presents a table of menu items with their order counts, ordered in descending order.

### 35. `analyzeMeanOrderValue()`

- **Purpose:**
  - Analyzes and displays the mean order value for each customer.

- **Query:**
  - Calculates the average order value for each customer.

- **Output:**
  - Presents a table of customer IDs and their average order values.

### 36. `analyzeOrderFrequency()`

- **Purpose:**
  - Analyzes and displays the order frequency for each customer.

- **Query:**
  - Counts the number of orders for each customer.

- **Output:**
  - Presents a table of customer IDs and their order frequencies.

### 37. `tableTurnOver()`

- **Purpose:**
  - Displays the table turnover for each hour at each outlet.

- **Query:**
  - Counts the number of reservations for each outlet and hour.

- **Output:**
  - Presents a table of outlet IDs, reservation hours, and reservation counts.

### 38. `analyzeDeliveryOrders()`

- **Purpose:**
  - Analyzes and displays the number of orders for each delivery partner.

- **Query:**
  - Counts the number of orders associated with each delivery partner.

- **Output:**
  - Presents a table of delivery partners and their order counts.

### 39. `newOutlet(OutletID, OutletName, Address, Phone, Rating, PopularItem, Revenue, OutletCapacity)`

- **Purpose:**
  - Inserts a new outlet into the database.

- **Query:**
  - Inserts values into the `Outlet` table.

- **Output:**
  - Prints a message indicating successful addition.
### 40. `searchOutlets(address, popularItem)`

- **Purpose:**
  - Searches and displays outlets based on the given address or popular item.

- **Query:**
  - Selects outlets from the `Outlet` table based on the provided address or popular item.

- **Output:**
  - Displays a list of outlets that match the search criteria.

### 41. `viewCustomerOrders(customerID)`

- **Purpose:**
  - Displays a list of orders for a specific customer.

- **Query:**
  - Selects orders from the `Orders` table based on the provided customer ID.

- **Output:**
  - Displays a table of order details for the specified customer.

### 42. `viewCustomerReservations(customerID)`

- **Purpose:**
  - Displays a list of reservations for a specific customer.

- **Query:**
  - Selects reservations from the `Reservation` table based on the provided customer ID.

- **Output:**
  - Displays a table of reservation details for the specified customer.

### 43. `displayOutlets()`

- **Purpose:**
  - Displays details of all outlets.

- **Query:**
  - Selects all columns from the `Outlet` table.

- **Output:**
  - Presents a table of all outlet details.

### 44. `getMenu(outletID)`

- **Purpose:**
  - Displays the menu for a specific outlet.

- **Query:**
  - Selects menu items from the `MenuItem` table based on the provided outlet ID.

- **Output:**
  - Presents a table of menu items available at the specified outlet.

### 45. `searchItems(itemName, itemDescription)`

- **Purpose:**
  - Searches and displays menu items based on the given name or description.

- **Query:**
  - Selects menu items from the `MenuItem` table based on the provided name or description.

- **Output:**
  - Displays a list of menu items that match the search criteria.

### 46. `maxOutletRating()`

- **Purpose:**
  - Finds and displays the maximum rating among all outlets.

- **Query:**
  - Selects the maximum rating from the `Outlet` table.

- **Output:**
  - Displays the maximum rating.

### 47. `minOutletRating()`

- **Purpose:**
  - Finds and displays the minimum rating among all outlets.

- **Query:**
  - Selects the minimum rating from the `Outlet` table.

- **Output:**
  - Displays the minimum rating.

### 48. `meanOutletRating()`

- **Purpose:**
  - Calculates and displays the mean rating of all outlets.

- **Query:**
  - Selects the average rating from the `Outlet` table.

- **Output:**
  - Displays the mean rating.

### 49. `updateOrderStatus(itemID, customerID, outletID, newStatus)`

- **Purpose:**
  - Updates the order status for a specific order.

- **Query:**
  - Updates the `Orders` table with the new order status based on the provided item ID, customer ID, and outlet ID.

- **Output:**
  - Prints a message indicating the successful update.

  ### 50. `calculateBill(customerID, outletID, dateOfOrder)`

- **Purpose:**
  - Calculates and updates the bill amount for a specific customer's order.

- **Query:**
  - Updates the `Bill` table with the calculated bill amount based on the provided customer ID, outlet ID, and date of order.

- **Output:**
  - Prints a message indicating successful bill calculation.

### 51. `customer()`

- **Purpose:**
  - Provides an interactive menu for customer interactions.

- **Input:**
  - Takes user inputs for various choices in the customer menu.

- **Output:**
  - Displays information based on the selected choices.

### 52. `deliveryPartner()`

- **Purpose:**
  - Provides an interactive menu for delivery partners.

- **Input:**
  - Takes user inputs for checking order statuses.

- **Output:**
  - Displays information about order statuses for the delivery partner.

### 53. `chef(id)`

- **Purpose:**
  - Provides an interactive menu for chefs.

- **Input:**
  - Takes user inputs for adding, updating, and deleting menu items, as well as updating order status.

- **Output:**
  - Displays messages indicating the success of the performed operations.

### 54. `manager(id)`

- **Purpose:**
  - Provides an interactive menu for managers.

- **Input:**
  - Takes user inputs for various managerial tasks, including searching employees, viewing customers, managing outlets, and analyzing data.

- **Output:**
  - Displays information and messages based on the selected managerial tasks.

### 55. `waiter(id)`

- **Purpose:**
  - Provides an interactive menu for waiters.

- **Input:**
  - Takes user inputs for tasks such as viewing customer details, adding new customers, viewing menu items, managing reservations, and handling orders.

- **Output:**
  - Displays information and messages based on the selected tasks.

### 56. `supervisor(id)`

- **Purpose:**
  - Provides an interactive menu for supervisors.

- **Input:**
  - Takes user inputs for tasks such as searching employees, viewing customers, managing reservations, viewing statistics, managing employees, and exiting.

- **Output:**
  - Displays information and messages based on the selected tasks.

### 57. `employee()`

- **Purpose:**
  - Determines the role of the employee based on the provided employee ID and directs them to the corresponding role-specific function (Manager, Chef, Waiter, Supervisor).

- **Input:**
  - Takes user input for the employee ID.

- **Output:**
  - Invokes the appropriate role-specific function or indicates that the employee was not found.

### 58. `clearScreen()`

- **Purpose:**
  - Clears the terminal screen for better user interaction.

- **Implementation:**
  - Uses `sp.call("clear", shell=True)` to clear the screen.

### 59. `main()`

- **Purpose:**
  - Serves as the entry point of the program.

- **Input:**
  - Takes user input for choosing a role (Customer, Employee, Delivery Partner, Exit).

- **Output:**
  - Invokes the corresponding function based on the user's role choice or exits the program.

# For demonstration:

### `customer()`

- **Purpose:**
  - Provides an interactive menu for customer interactions.

- **Input:**
  - Takes user inputs for various choices in the customer menu.

- **Output:**
  - Displays information based on the selected choices.

### `searchOutlets(Address, PopularItem)`

- **Purpose:**
  - Searches for outlets based on address and popular item.

- **Query:**
  - Retrieves outlets from the `Outlet` table using a LIKE condition.

- **Output:**
  - Displays outlets found with their name, address, and rating.

### `viewCustomerOrders(customerID)`

- **Purpose:**
  - Displays a list of orders for a specific customer.

- **Query:**
  - Selects orders from the `Orders` table based on the provided customer ID.

- **Output:**
  - Displays a table of order details for the specified customer.

###  `viewCustomerReservations(customerID)`

- **Purpose:**
  - Displays a list of reservations for a specific customer.

- **Query:**
  - Selects reservations from the `Reservation` table based on the provided customer ID.

- **Output:**
  - Displays a table of reservation details for the specified customer.

### `displayOutlets()`

- **Purpose:**
  - Displays details of all outlets.

- **Query:**
  - Selects all columns from the `Outlet` table.

- **Output:**
  - Presents a table of all outlet details.

### `menuByItemID(ID)`

- **Purpose:**
  - Displays details of a menu item based on its ID.

- **Query:**
  - Selects all columns from the `MenuItem` table where the ItemId matches.

- **Output:**
  - Presents details of the menu item.

### `menuItemByName(name)`

- **Purpose:**
  - Displays details of a menu item based on its name.

- **Query:**
  - Selects all columns from the `MenuItem` table where the ItemName matches.

- **Output:**
  - Presents details of the menu item.


### `searchItems(ItemName, ItemDescription)`

- **Purpose:**
  - Searches for menu items based on name and description.

- **Query:**
  - Retrieves items from the `MenuItem`, `MenuOutlet`, and `Outlet` tables using a LIKE condition.

- **Output:**
  - Displays items found with their name, description, and associated outlet.

### `maxOutletRating()`

- **Purpose:**
  - Finds and displays the maximum rating among all outlets.

- **Query:**
  - Selects the maximum rating from the `Outlet` table.

- **Output:**
  - Displays the maximum rating.

### `deliveryPartner()`

- **Purpose:**
  - Provides an interactive menu for delivery partners.

- **Input:**
  - Takes user inputs for checking order statuses.

- **Output:**
  - Displays information about order statuses for the delivery partner.

### `analyzeDeliveryOrders()`

- **Purpose:**
  - Analyzes and displays the number of orders for each delivery partner.

- **Query:**
  - Counts the number of orders associated with each delivery partner.

- **Output:**
  - Presents a table of delivery partners and their order counts.

### `employee()`

- **Purpose:**
  - Determines the role of the employee based on the provided employee ID and directs them to the corresponding role-specific function (Manager, Chef, Waiter, Supervisor).

- **Input:**
  - Takes user input for the employee ID.

- **Output:**
  - Invokes the appropriate role-specific function or indicates that the employee was not found.

### `searchEmployee(role, yearsOfExperience)`

- **Purpose:**
  - Retrieves and displays employees based on their role and years of experience.

- **Query:**
  - Selects employee details from the `Employee` table where the role

 matches, and years of experience are greater than or equal to the specified value.

- **Output:**
  - Displays employee details.

### `viewCustomerOrders(customerID)`

- **Purpose:**
  - Displays a list of orders for a specific customer.

- **Query:**
  - Selects orders from the `Orders` table based on the provided customer ID.

- **Output:**
  - Displays a table of order details for the specified customer.


### `viewCustomerReservations(customerID)`

- **Purpose:**
  - Displays a list of reservations for a specific customer.

- **Query:**
  - Selects reservations from the `Reservation` table based on the provided customer ID.

- **Output:**
  - Displays a table of reservation details for the specified customer.

### `totalOrdersByOnOff()`

- **Purpose:**
  - Calculates and displays the total number of online and offline orders.

- **Query:**
  - Uses a conditional sum to count online and offline orders from the `Orders` table.

- **Output:**
  - Displays the total number of online and offline orders.

### `newOutlet(OutletID, OutletName, Address, Phone, Rating, PopularItem, Revenue, OutletCapacity)`

- **Purpose:**
  - Inserts a new outlet into the database.

- **Query:**
  - Inserts values into the `Outlet` table.

- **Output:**
  - Prints a message indicating successful addition.

### `analyzeOrderFrequency()`

- **Purpose:**
  - Analyzes and displays the order frequency for each customer.

- **Query:**
  - Counts the number of orders for each customer.

- **Output:**
  - Presents a table of customer IDs and their order frequencies.

### `analyzeMostOrdered()`

- **Purpose:**
  - Analyzes and displays the most ordered menu items.

- **Query:**
  - Counts the number of times each menu item has been ordered.

- **Output:**
  - Presents a table of menu items with their order counts, ordered in descending order.

### `supervisor(id)`

- **Purpose:**
  - Provides an interactive menu for supervisors.

- **Input:**
  - Takes user inputs for tasks such as searching employees, viewing customers, managing reservations, viewing statistics, managing employees, and exiting.

- **Output:**
  - Displays information and messages based on the selected tasks.

### `addNewCustomer(newCustomerID, newName, newPhone, newEmail, newMember, newMemberSince, newCustomerSince, newDiscount)`

- **Purpose:**
  - Adds a new customer to the database with the provided details.

- **Input:**
  - `newCustomerID`: The ID of the new customer.
  - `newName`: The name of the new customer.
  - `newPhone`: The phone number of the new customer.
  - `newEmail`: The email address of the new customer.
  - `newMember`: Membership information of the new customer.
  - `newMemberSince`: Date since the customer has been a member.
  - `newCustomerSince`: Date when the customer joined.
  - `newDiscount`: Discount information for the new customer.

- **Query:**
  - Inserts a new record into the `Customer` table with the provided information.

- **Output:**
  - Prints a message indicating successful addition of the new customer.

### `deleteCustomer(customerID)`

- **Purpose:**
  - Deletes a customer from the database based on the provided customer ID.

- **Input:**
  - `customerID`: The ID of the customer to be deleted.

- **Query:**
  - Deletes the customer record from the `Customer` table based on the provided customer ID.

- **Output:**
  - Prints a message indicating successful deletion of the customer.

### `waiter(id)`

- **Purpose:**
  - Provides an interactive menu for waiters.

- **Input:**
  - Takes user inputs for tasks such as viewing customer details, adding new customers, viewing menu items, managing reservations, and handling orders.

- **Output:**
  - Displays information and messages based on the selected tasks.

### `calculateBill(customerID, outletID, dateOfOrder)`

- **Purpose:**
  - Calculates and updates the bill amount for a specific customer's order.

- **Query:**
  - Updates the `Bill` table with the calculated bill amount based on the provided customer ID, outlet ID, and date of order.

- **Output:**
  - Prints a message indicating successful bill calculation.

### `chef(id)`

- **Purpose:**
  - Provides an interactive menu for chefs.

- **Input:**
  - Takes user inputs for adding, updating, and deleting menu items, as well as updating order status.

- **Output:**
  - Displays messages indicating the success of the performed operations.

### `updateOrderStatus(itemID, customerID, outletID, newStatus)`

- **Purpose:**
  - Updates the order status for a specific order.

- **Query:**
  - Updates the `Orders` table with the new order status based on the provided item ID, customer ID, and outlet ID.

- **Output:**
  - Prints a message indicating the successful update.
