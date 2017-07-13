<?php

include('core/config.php');
session_destroy();
header("location: ".$config['baseurl']."/login.php");