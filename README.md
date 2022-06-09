<h1 align="center">LavenderSpa</h1>
<p align="center"><img src="https://user-images.githubusercontent.com/100422107/172813979-18d19d19-fc43-470e-b05c-97502c797902.png" width="200" heigth="100"></p>
<h2 align="center"><a href="https://lavenderspa.herokuapp.com">Source</a></h2>

## Description

The project is a website. The search for spa services is available to any unauthorized user.

After registration/authorization the administrator is given the opportunity:
* register masters
* add spa procedures 
* manage orders and reviews

After registration/authorization clients are provided with the ability to:
* order spa treatments
* cancel them
* provide feedback

After registration/authorization the master is given the opportunity to view orders

## Demo 
### For Admins
Admin login link: https://lavenderspa.herokuapp.com/admin

**Login**: admin@example.com, **password**: password

<p align="center"><img src="https://user-images.githubusercontent.com/100422107/172832833-1f0b492f-171d-41bc-929f-9ec677619ef3.png" width="600" heigth="400"></p>

To view all users, go to https://lavenderspa.herokuapp.com/admin/users

<p align="center"><img src="https://user-images.githubusercontent.com/100422107/172834909-d9ca49f9-166f-4a8c-8815-54337f8885a7.png" width="600" heigth="400"></p>

To view all services, go to https://lavenderspa.herokuapp.com/admin/services

<p align="center"><img src="https://user-images.githubusercontent.com/100422107/172836055-b2830d9f-7bff-4072-895d-c76e76643c49.png" width="600" heigth="400"></p>

To view all orders, go to https://lavenderspa.herokuapp.com/admin/orders

After completing the spa procedure, the administrator needs to set the status of the order to **Complete**, so that the user can leave feedback.

<p align="center"><img src="https://user-images.githubusercontent.com/100422107/172838624-89f98b77-73a2-40ec-9ecd-986b149b02ff.png" width="600" heigth="400"></p>

To view all reviews, go to https://lavenderspa.herokuapp.com/admin/reviews

<p align="center"><img src="https://user-images.githubusercontent.com/100422107/172837699-d21d19d6-9238-4c6d-ae23-9df434f00bd7.png" width="600" heigth="400"></p>

To make the review available for viewing by users, set it to **Unblock** status.

### For Clients

For registration/authorization go to https://lavenderspa.herokuapp.com/users/sign_up or https://lavenderspa.herokuapp.com/users/sign_in

<p align="center">
  <img src="https://user-images.githubusercontent.com/100422107/172839608-c517a2fa-3bbb-4817-b359-0920981b9c2b.png" width="400" heigth="250">
  <img src="https://user-images.githubusercontent.com/100422107/172840010-3c499ec2-30de-4688-b7e1-479f97e153dd.png" width="460" heigth="250">
</p>

To view all services, go to https://lavenderspa.herokuapp.com/services

<p align="center"><img src="https://user-images.githubusercontent.com/100422107/172845613-1bc03615-48f3-4cdd-b3ae-e3806b1dc369.png" width="600" heigth="400"></p>

 For orders spa procedure click on the **Order**
 
<p align="center"><img src="https://user-images.githubusercontent.com/100422107/172845922-11ff80f9-8dbb-486f-b848-291cf7fbd9d1.png" width="600" heigth="400"></p>
<p align="center"><img src="https://user-images.githubusercontent.com/100422107/172846096-a75fe840-2343-4176-980c-e87e9819fb42.png" width="300" heigth="200"></p>

To view all orders, go to https://lavenderspa.herokuapp.com/orders

<p align="center"><img src="https://user-images.githubusercontent.com/100422107/172840809-adc67c9e-e948-47c9-b39d-c8502bfdea39.png" width="600" heigth="400"></p>

If the order status is **Draft**, the client can cancel the order on the order page.

<p align="center"><img src="https://user-images.githubusercontent.com/100422107/172844888-240c0061-fdaa-49d8-8a2a-77d8e608fe6c.png" width="300" heigth="200"></p>

If the order status is **Complete**, the client can cancel the order on the order page.

<p align="center"><img src="https://user-images.githubusercontent.com/100422107/172841839-d09bc5db-8102-4740-b7ec-00d1753ae41a.png" width="600" heigth="400"></p>

### For Masters
Masters can also login and view your orders.

## Getting started
1. Download Zip and extract it in this new folder

![Untitled](https://user-images.githubusercontent.com/100422107/172830009-a8984493-ccca-4d9f-961b-93a2cc5a72a7.png)
2. run command in new folder
```
rails s
```
