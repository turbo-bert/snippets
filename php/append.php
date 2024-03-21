<?php


file_put_contents("testappend.txt", "blabal\nblabla\n", FILE_APPEND|LOCK_EX);
