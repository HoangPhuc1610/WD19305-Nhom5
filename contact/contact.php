<?php include "views/layouts/header.php"?>
<?php 
$cont =  $_POST["Message"]??"";
$sub =   $_POST["Subject"]??"";
$email =   $_POST["Email"]??"";
$name =  $_POST["Name"]??"";
if(empty($cont)||empty($sub)||empty($email)||empty($name)){
   echo "Please";
}else{
    gmail($cont, $sub,$email, $name);
    echo "Thành công";
}
?>
<!-- Contact Start -->
<div class="container-fluid">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Liên hệ chúng tôi</span></h2>
        <div class="row px-xl-5">
            <div class="col-lg-7 mb-5">
                <div class="contact-form bg-light p-30">
                    <div id="success"></div>
                    <form name="sentMessage" id="contactForm" novalidate="novalidate">
                        <div class="control-group">
                            <input type="text" class="form-control" id="Name" placeholder="Tên của bạn"
                                required="required" data-validation-required-message="Vui lòng nhập tên" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                            <input type="email" class="form-control" id="Email" placeholder="Nhập Email"
                                required="required" data-validation-required-message="Vui lòng nhập email" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                            <input type="text" class="form-control" id="Subject" placeholder="Tiêu đề"
                                required="required" data-validation-required-message="Vui lòng nhập tiêu đề" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                            <textarea class="form-control" rows="8" id="Message" placeholder="Nội dung"
                                required="required"
                                data-validation-required-message="Vui lòng nhập nội dung"></textarea>
                            <p class="help-block text-danger"></p>
                        </div>
                        <div>
                            <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">Gửi</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-5 mb-5">
                <div class="bg-light p-30 mb-30">
                <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d27126.703768157127!2d106.61146743728206!3d10.827546948227296!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1732358840973!5m2!1svi!2s" width="440" height="400" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
                <div class="bg-light p-30 mb-3">
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Ấp Bàu Bông, xã Phước An</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>novashop12@gmail.com</p>
                    <p class="mb-2"><i class="fa fa-phone-alt text-primary mr-3"></i>+0794346995</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->
    <?php include('views/layouts/footer.php')?>