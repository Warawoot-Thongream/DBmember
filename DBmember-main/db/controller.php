<?php
class Controller{
    private $db;

    function __construct($con){
        $this->db=$con;
    }

    function getresturant(){
        try{
            $sql = "SELECT * FROM resturant";
            $result=$this->db->query($sql);
            return $result;
        }catch(PDOException $e){
            echo $e->getMessage();
            return false;
        }
    }

    function getmember(){
        try{
            $sql = "SELECT * FROM member a INNER JOIN resturant b ON a.resturant_id = b.resturant_id ORDER By a.emp_id";
            $result=$this->db->query($sql);
            return $result;
        }catch(PDOException $e){
            echo $e->getMessage();
            return false;
        }  
    }
    
    function insert($name,$sname,$email,$resturant_id){
        try{
            $sql="INSERT INTO member(name,sname,email,resturant_id) VALUES (:name,:sname,:email,:resturant_id)";
            $stmt=$this->db->prepare($sql);
            $stmt->bindParam(":name",$name);
            $stmt->bindParam(":sname",$sname);
            $stmt->bindParam(":email",$email);
            $stmt->bindParam(":resturant_id",$resturant_id);   
            $stmt->execute();
            return true;
        }catch(PDOException $e){
            echo $e->getMessage();
            return false;
        }

    }
    function delete($id){
        try{
            $sql="DELETE FROM member WHERE emp_id=:id ";
            $stmt=$this->db->prepare($sql);
            $stmt->bindParam(":id",$id);
            $stmt->execute();
            return true;
        }catch(PDOException $e){
            echo $e->getMessage();
            return false;
        }
    }
    function getmemberDetail($id){
        try{
            $sql="SELECT * FROM member a 
            INNER JOIN resturant b
            ON a.resturant_id = b.resturant_id WHERE emp_id =:id";
            $stmt=$this->db->prepare($sql);
            $stmt->bindParam(":id",$id);
            $stmt->execute();
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return $result;
        }catch(PDOException $e){
            echo $e->getMessage();
            return false;
        }
    }
    function update($fname,$sname,$email,$resturant_id,$emp_id){
        try{
            $sql="UPDATE member 
            SET name=:name, sname=:sname, email=:email, resturant_id=:resturant_id 
            WHERE emp_id = :emp_id";
            $stmt=$this->db->prepare($sql);
            $stmt->bindParam(":name",$fname);
            $stmt->bindParam(":sname",$sname);
            $stmt->bindParam(":email",$email);
            $stmt->bindParam(":resturant_id",$resturant_id);
            $stmt->bindParam(":emp_id",$emp_id);
            $stmt->execute();
            return true;
        }catch(PDOException $e){
            echo $e->getMessage();
            return false;
        }
    }
}

?>