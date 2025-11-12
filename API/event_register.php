<?php
session_start();
include 'connection.php';

$registration_no = isset($_SESSION['registration_no']) ? $_SESSION['registration_no'] : '';
if (empty($registration_no)) {
   header("Location: login.php");
   exit();
}

$connection = getDatabaseConnection();

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['event_code'])) {
   $event_code = trim($_POST['event_code']);
   $reg_no = $registration_no;

   if ($event_code === '') {
      header("Location: ../event.php");
      exit;
   }

   $title = "";
   $sql = "SELECT title FROM all_events WHERE event_code = ?";
   if ($stmt = $connection->prepare($sql)) {
      $stmt->bind_param("s", $event_code);
      $stmt->execute();
      $res = $stmt->get_result();
      if ($row = $res->fetch_assoc()) {
         $title = $row['title'];
      }
      $stmt->close();
   }

    $checkSql = "SELECT 1 FROM registration WHERE event_code = ? AND registration_no = ?";
   if ($checkStmt = $connection->prepare($checkSql)) {
      $checkStmt->bind_param("ss", $event_code, $reg_no);
      $checkStmt->execute();
      $checkStmt->store_result();
      $exists = $checkStmt->num_rows > 0;
      $checkStmt->close();
   } else {
      $exists = false;
   }

   if (!$exists) {
      $insertSql = "INSERT INTO registration (event_code, title, registration_no, created_at) VALUES (?, ?, ?, NOW())";
      if ($insertStmt = $connection->prepare($insertSql)) {
         $insertStmt->bind_param("sss", $event_code, $title, $reg_no);
         $insertStmt->execute();
         $insertStmt->close();
      }
   }

   header("Location: ../event.php");
   exit();
}

$title = "";
if (isset($_GET['event_code'])) {
   $event_code = $_GET['event_code'];
   $sql = "SELECT title FROM all_events WHERE event_code = ?";
   if ($stmt = $connection->prepare($sql)) {
      $stmt->bind_param("s", $event_code);
      $stmt->execute();
      $result = $stmt->get_result();
      if ($row = $result->fetch_assoc()) {
         $title = $row['title'];
      } else {
         $title = "Event Not Found";
      }
      $stmt->close();
   }
} else {
   $event_code = "";
   $title = "";
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
   <link rel="stylesheet" href="../CSS/style.css">
   <link rel="icon" type="image/png" href="https://online.uom.lk/pluginfile.php/1/theme_moove/logo/1761377935/University_of_Moratuwa_logo.png">
   <title>ITUM EM (Registration)</title>
</head>
<body>

   <div class="wrapper">

      <div class="form_container" style="width: 450px;">

         <div class="close_btn">
            <a href="../event.php"><i class="fa-solid fa-xmark"></i></a>
         </div>

         <div class="form_box register" >
            <form method="post">
               <h1>Register to Event</h1>
               <div class="input_box">
                  <p>Event Code</p>
                  <input type="text" name="event_code" value="<?php echo htmlspecialchars($event_code); ?>" readonly>
               </div>
               <div class="input_box">
                  <p>Event Title</p>
                  <input type="text" name="event_title" value="<?= htmlspecialchars($title ?? '') ?>" readonly>
               </div>
               <div class="input_box">
                  <p>Registration No</p>
                  <input type="text" name="registration_no" value="<?= htmlspecialchars($registration_no) ?>" readonly>
               </div>
               <button type="submit" name="register_event" class="btn">Register to Event</button>
            </form>
         </div>

      </div>

   </div>

</body>
</html>
