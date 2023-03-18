<?php
    $title="แบบฟอร์มบันทึกข้อมูลพนักงาน";
    require_once "layout/header.php";
    require_once "db/connect.php";
    require_once "layout/check_admin.php";
    $result=$controller->getresturant();

    if(isset($_POST["submit"])){
        $name=$_POST["name"];
        $sname=$_POST["sname"];
        $email=$_POST["email"];
        $resturant_id=$_POST["resturant_id"];
        $status=$controller->insert($name,$sname,$email,$resturant_id);
        
        if($status){
            $message="บันทึกข้อมูลเรียบร้อยแล้ว!!";
            require_once "layout/success_message.php";
        }else{
            require_once "layout/error_message.php";
        }
    }
?>

    <h1 class = "text-center"><?php echo "แบบฟอร์มบันทึกข้อมูล";?></h1>
    <form method="POST" action="addForm.php">
        <div class ="form-group">
            <label for ="name">ชื่อ</label>
            <input type="text" name="name" class="form-control">
        </div>
        <div class ="form-group">
            <label for ="sname">นามสกุล</label>
            <input type="text" name="sname" class="form-control">
        </div>
        <div class ="form-group">
            <label for ="email">อีเมล์</label>
            <input type="text" name="email" class="form-control">
        </div>
        <div class ="form-group">
            <label for ="resturant">ร้านอาหาร</label>
            <select name="resturant_id" class="form-control">
                <?php while($row=$result->fetch(PDO::FETCH_ASSOC)){?>
                   <option value="<?php echo $row["resturant_id"];?>">
                   <?php echo $row["resturant_name"];?></option>
                <?php } ?>
                
            </select>
        </div>
        <input type="submit" name="submit" value ="บันทึก" class="btn btn-primary my-3">

    </form>
</div>
</body>
</html>