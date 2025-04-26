<%--
  Created by IntelliJ IDEA.
  User: airm2
  Date: 13/12/2024
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Add Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        .form-container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }
        .form-container input, .form-container button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .form-container button {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Add New Product</h2>
    <form action="addProduct" method="post" enctype="multipart/form-data">
        <label for="id">Product ID:</label>
        <input type="text" id="id" name="id" required>

        <label for="name">Product Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="price">Price:</label>
        <input type="number" id="price" name="price" step="0.01" required>

        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" required>

        <label for="image">Image:</label>
        <input type="file" id="image" name="image" accept="image/*" required>

        <button type="submit">Add Product</button>
    </form>
</div>

</body>
</html>
