<?php

/*
 * This controls the creation of passwords from the application. MD5 is 
 * well known as 'exposed' to dictionary attacks. To avoid this we need to 
 * add a salt to the hashing. This changes randomly the recorded hash.
 * 
 * To add even more security I'm also applying this salt to the already MD5'd 
 * input for password provided from the front end using Crypto.js
 * 
 */

class Hash {

    public static function create($algorithm, $password, $salt) {
        
        $context = hash_init($algorithm, HASH_HMAC, $salt);
        hash_update($context, $password);
        
        return hash_final($context);
    }

}
