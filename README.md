
---

# **Medicarmy**

Medicarmy is a comprehensive digital healthcare platform designed to simplify and modernize access to medical services. It allows users to:

- Book appointments with doctors online.
- Browse available specialists and schedule consultations at their convenience.
- Access virtual consultations through a secure chat system.
- Receive electronic prescriptions, processed and delivered through partnered medical shops.

Medicarmy bridges the gap between healthcare providers and patients, offering a seamless, accessible, and user-friendly approach to healthcare. It addresses minor and non-urgent medical needs with convenience and efficiency.

---

## **Table of Contents**

1. [Features](#features)  
2. [Technologies Used](#technologies-used)  
3. [Getting Started](#getting-started)  
   - [Prerequisites](#prerequisites)  
   - [Setup Instructions](#setup-instructions)  
4. [Database Schema](#database-schema)  
   - [Administrative Data](#1-administrative-data)  
   - [User and Clinic Information](#2-user-and-clinic-information)  
   - [Appointments and Availability](#3-appointments-and-availability)  
   - [Medicine and Cart Management](#4-medicine-and-cart-management)  
   - [Feedback and Reviews](#5-feedback-and-reviews)  
   - [Medicine Categories and Stock](#6-medicine-categories-and-stock)  
   - [Delivery Management](#7-delivery-management)  
   - [Communication](#8-communication)  
   - [Shops and Locations](#9-shops-and-locations)  
   - [Other Supporting Tables](#10-other-supporting-tables)  
5. [Usage](#usage)  
6. [Screenshots](#screenshots)  
7. [Contributing](#contributing)  
8. [License](#license)  

---

## **Features**

- Online doctor appointment booking.  
- Virtual consultations through secure chat.  
- Digital prescriptions with direct integration to medical shops.  
- Medication delivery via trusted partners.  
- Appointment reminders and easy rescheduling options.  
- Responsive and intuitive user interface.

---

## **Technologies Used**

- **Frontend:** JSP, HTML, CSS  
- **Backend:** Java (Servlets and JSP)  
- **Database:** MySQL (Managed with HeidiSQL)  
- **IDE:** NetBeans  

---

## **Getting Started**

### **Prerequisites**

- NetBeans IDE  
- HeidiSQL  
- MySQL database server  
- Java Development Kit (JDK)  

### **Setup Instructions**

1. Clone the repository:  
   ```bash
   git clone https://github.com/your-repo/medicarmy.git
   ```
2. Open the project in NetBeans.  
3. Configure the database:  
   - Create a new database in HeidiSQL using the provided script.  
4. Update database connection settings:  
   - Navigate to the `dbconfig.java` file (or relevant file).  
   - Update the database URL, username, and password.  
5. Deploy the project on a local server (e.g., Tomcat).  

---

### **1. Administrative Data**

| **Table Name** | **Field Name**     | **Description**                                |
|----------------|--------------------|-----------------------------------------------|
| `tbl_admin`    | `admin_id`         | Primary key, unique identifier for admin.     |
|                | `admin_name`       | Name of the admin.                            |
|                | `admin_contact`    | Contact details of the admin.                 |
|                | `admin_email`      | Email address of the admin.                   |
|                | `admin_password`   | Password for admin authentication.            |

---

### **2. User and Clinic Information**

| **Table Name**  | **Field Name**      | **Description**                                  |
|-----------------|---------------------|-------------------------------------------------|
| `tbl_user`      | `user_id`           | Primary key, unique identifier for users.       |
|                 | `user_name`         | Name of the user.                               |
|                 | `user_email`        | Email of the user.                              |
|                 | `user_password`     | Password for user authentication.               |
|                 | `user_address`      | Address of the user.                            |
|                 | `user_contact`      | Contact details of the user.                    |
|                 | `user_gender`       | Gender of the user.                             |
|                 | `user_dob`          | Date of birth of the user.                      |
|                 | `user_photo`        | Profile picture of the user.                    |
|                 | `place_id`          | Foreign key referencing `tbl_place`.            |

| **Table Name**  | **Field Name**       | **Description**                                 |
|-----------------|----------------------|------------------------------------------------|
| `tbl_clinic`    | `clinic_id`          | Primary key, unique identifier for clinics.    |
|                 | `clinic_name`        | Name of the clinic.                            |
|                 | `clinic_email`       | Email address of the clinic.                   |
|                 | `clinic_address`     | Address of the clinic.                         |
|                 | `clinic_contact`     | Contact details of the clinic.                 |
|                 | `clinic_logo`        | Logo of the clinic.                            |
|                 | `clinic_proof`       | Verification proof document for the clinic.    |
|                 | `type_id`            | Foreign key referencing `tbl_type`.            |
|                 | `clinic_vstatus`     | Verification status of the clinic (0 or 1).    |
|                 | `place_id`           | Foreign key referencing `tbl_place`.           |
|                 | `clinic_password`    | Password for clinic authentication.            |
|                 | `clinic_prooftype`   | Type of proof provided.                        |
|                 | `clinic_regno`       | Registration number of the clinic.             |

---

### **3. Appointments and Availability**

| **Table Name**     | **Field Name**          | **Description**                                      |
|--------------------|-------------------------|-----------------------------------------------------|
| `tbl_appointment`  | `appointment_id`        | Primary key, unique identifier for appointments.    |
|                    | `appointment_date`      | Date of the appointment creation.                  |
|                    | `appointment_fordate`   | Scheduled date of the appointment.                 |
|                    | `availability_id`       | Foreign key referencing `tbl_availability`.         |
|                    | `appointment_token`     | Unique token for the appointment.                  |
|                    | `user_id`               | Foreign key referencing `tbl_user`.                |
|                    | `appointment_status`    | Status of the appointment (e.g., pending, done).   |
|                    | `appointment_amount`    | Total cost of the appointment.                     |
|                    | `deliveryboy_id`        | Foreign key referencing `tbl_deliveryboy`.         |
|                    | `presecription_image`   | Path to uploaded prescription image.               |
|                    | `shop_id`               | Foreign key referencing `tbl_shop`.                |
|                    | `appointment_type`      | Type of appointment (e.g., virtual, in-person).    |

| **Table Name**     | **Field Name**         | **Description**                                    |
|--------------------|------------------------|---------------------------------------------------|
| `tbl_availability` | `availability_id`      | Primary key, unique identifier for availability.  |
|                    | `availability_stime`   | Start time of availability slot.                  |
|                    | `availability_slot`    | Slot identifier.                                  |
|                    | `clinic_id`            | Foreign key referencing `tbl_clinic`.             |
|                    | `availability_etime`   | End time of availability slot.                    |

---

### **4. Medicine and Cart Management**

| **Table Name**    | **Field Name**       | **Description**                                      |
|-------------------|----------------------|-----------------------------------------------------|
| `tbl_medicine`    | `medicine_id`        | Primary key, unique identifier for medicines.       |
|                   | `medicine_name`      | Name of the medicine.                               |
|                   | `medicine_description`| Description of the medicine.                       |
|                   | `medicine_image`     | Path to the medicine image.                         |
|                   | `subcategory_id`     | Foreign key referencing `tbl_subcategory`.          |
|                   | `medicine_rate`      | Price of the medicine.                              |
|                   | `shop_id`            | Foreign key referencing `tbl_shop`.                |

| **Table Name**    | **Field Name**       | **Description**                                      |
|-------------------|----------------------|-----------------------------------------------------|
| `tbl_cart`        | `cart_id`            | Primary key, unique identifier for carts.           |
|                   | `cart_quantity`      | Quantity of items in the cart.                      |
|                   | `cart_status`        | Status of the cart (e.g., active, completed).       |
|                   | `medicine_id`        | Foreign key referencing `tbl_medicine`.             |
|                   | `appointment_id`     | Foreign key referencing `tbl_appointment`.          |

---

### **5. Feedback and Reviews**

| **Table Name**   | **Field Name**     | **Description**                                  |
|------------------|--------------------|-------------------------------------------------|
| `tbl_review`     | `review_id`        | Primary key, unique identifier for reviews.     |
|                  | `user_review`      | Text content of the user’s review.              |
|                  | `user_rating`      | Numerical rating given by the user.             |
|                  | `review_datetime`  | Timestamp of when the review was submitted.     |
|                  | `user_id`          | Foreign key referencing `tbl_user`.             |
|                  | `clinic_id`        | Foreign key referencing `tbl_clinic`.           |

| **Table Name**   | **Field Name**     | **Description**                                  |
|------------------|--------------------|-------------------------------------------------|
| `tbl_complaint`  | `complaint_id`     | Primary key, unique identifier for complaints.  |
|                  | `complaint_title`  | Title of the complaint.                         |
|                  | `complaint_content`| Description of the complaint.                   |
|                  | `complaint_reply`  | Admin response to the complaint.                |
|                  | `complaint_date`   | Date when the complaint was submitted.          |
|                  | `user_id`          | Foreign key referencing `tbl_user`.             |
|                  | `clinic_id`        | Foreign key referencing `tbl_clinic`.           |
|                  | `complaint_status` | Status of the complaint (e.g., pending, resolved).|
|                  | `reply_date`       | Date of the reply to the complaint.             |

---

### **6. Medicine Categories and Stock**

| **Table Name**    | **Field Name**        | **Description**                                      |
|-------------------|-----------------------|-----------------------------------------------------|
| `tbl_category`    | `category_id`         | Primary key, unique identifier for categories.      |
|                   | `category_name`       | Name of the category (e.g., Medicines, Equipment).  |

| **Table Name**    | **Field Name**        | **Description**                                      |
|-------------------|-----------------------|-----------------------------------------------------|
| `tbl_subcategory` | `subcategory_id`      | Primary key, unique identifier for subcategories.   |
|                   | `subcategory_name`    | Name of the subcategory (e.g., Antibiotics).        |
|                   | `category_id`         | Foreign key referencing `tbl_category`.             |

| **Table Name**    | **Field Name**        | **Description**                                      |
|-------------------|-----------------------|-----------------------------------------------------|
| `tbl_stock`       | `stock_id`            | Primary key, unique identifier for stock entries.   |
|                   | `stock_quantity`      | Quantity of items available in stock.               |
|                   | `stock_date`          | Date of stock update.                               |
|                   | `medicine_id`         | Foreign key referencing `tbl_medicine`.             |

---

### **7. Delivery Management**

| **Table Name**        | **Field Name**       | **Description**                                   |
|-----------------------|----------------------|--------------------------------------------------|
| `tbl_deliveryboy`     | `deliveryboy_id`     | Primary key, unique identifier for delivery personnel. |
|                       | `deliveryboy_name`   | Name of the delivery person.                     |
|                       | `deliveryboy_email`  | Email address of the delivery person.            |
|                       | `deliveryboy_address`| Address of the delivery person.                  |
|                       | `deliveryboy_contact`| Contact details of the delivery person.          |
|                       | `deliveryboy_password`| Password for the delivery person.               |
|                       | `shop_id`           | Foreign key referencing `tbl_shop`.              |

---

### **8. Communication**

| **Table Name**     | **Field Name**         | **Description**                                   |
|--------------------|------------------------|--------------------------------------------------|
| `tbl_chat`         | `chat_id`             | Primary key, unique identifier for chat messages.|
|                    | `chat_content`        | Content of the chat message.                     |
|                    | `chat_datetime`       | Timestamp of the message.                        |
|                    | `chat_fromdid`        | Sender doctor ID (if applicable).                |
|                    | `chat_fromuid`        | Sender user ID (if applicable).                  |
|                    | `chat_touid`          | Receiver user ID (if applicable).                |
|                    | `chat_todid`          | Receiver doctor ID (if applicable).              |
|                    | `chat_status`         | Status of the chat message.                      |

| **Table Name**     | **Field Name**         | **Description**                                   |
|--------------------|------------------------|--------------------------------------------------|
| `tbl_chatlist`     | `chatlist_id`         | Unique identifier for chat lists.                |
|                    | `chatlist_content`    | Most recent message in the chat.                 |
|                    | `chatlist_datetime`   | Timestamp of the most recent message.            |
|                    | `chatlist_fromid`     | Sender ID of the last message.                   |
|                    | `chatlist_toid`       | Receiver ID of the last message.                 |
|                    | `chatlist_type`       | Type of chat (e.g., user-to-doctor).             |
|                    | `chatlist_status`     | Status of the chat list (e.g., active/inactive).  |

---

### **9. Shops and Locations**

| **Table Name** | **Field Name**     | **Description**                                   |
|----------------|--------------------|--------------------------------------------------|
| `tbl_shop`     | `shop_id`          | Primary key, unique identifier for shops.        |
|                | `shop_name`        | Name of the shop.                                |
|                | `shop_email`       | Email address of the shop.                       |
|                | `shop_address`     | Address of the shop.                             |
|                | `shop_contact`     | Contact details of the shop.                     |
|                | `shop_logo`        | Logo of the shop.                                |
|                | `shop_proof`       | Verification proof for the shop.                 |
|                | `shop_vstatus`     | Verification status of the shop.                 |
|                | `place_id`         | Foreign key referencing `tbl_place`.             |
|                | `shop_password`    | Password for shop authentication.                |
|                | `shop_regno`       | Registration number of the shop.                 |

| **Table Name** | **Field Name**     | **Description**                                   |
|----------------|--------------------|--------------------------------------------------|
| `tbl_place`    | `place_id`         | Primary key, unique identifier for places.       |
|                | `place_name`       | Name of the place.                               |
|                | `district_id`      | Foreign key referencing `tbl_district`.          |

| **Table Name** | **Field Name**     | **Description**                                   |
|----------------|--------------------|--------------------------------------------------|
| `tbl_district` | `district_id`      | Primary key, unique identifier for districts.    |
|                | `district_name`    | Name of the district.                            |

---

### **10. Other Supporting Tables**

| **Table Name** | **Field Name**     | **Description**                                   |
|----------------|--------------------|--------------------------------------------------|
| `tbl_type`     | `type_id`          | Primary key, unique identifier for clinic types. |
|                | `type_name`        | Name of the type (e.g., General, Specialist).    |

---

## **Usage**

1. Start the server and navigate to:  
   ```  
   http://localhost:8080/medicarmy  
   ```  
2. Register as a new user or log in with existing credentials.  
3. Explore features such as:  
   - Booking doctor appointments.  
   - Accessing virtual consultations.  
   - Managing prescriptions and medication delivery.  

---

## **Screenshots**

(Add screenshots here, showcasing key features like login, dashboard, virtual consultation interface, etc.)

---

## **Contributing**

We welcome contributions to Medicarmy. To contribute:  

1. Fork the repository.  
2. Create a new branch:  
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Commit your changes:  
   ```bash
   git commit -m 'Add your feature'
   ```
4. Push to the branch:  
   ```bash
   git push origin feature/your-feature-name
   ```
5. Open a pull request.  

---

## **License**

This project is licensed under the MIT License. See the `LICENSE` file for details.

--- 
