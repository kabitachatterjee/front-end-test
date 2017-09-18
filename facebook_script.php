<?php

/* Using Facebook Graph API and access token we make a GET request for specific fields*/
$request = new FacebookRequest(
  $session,
  'GET',
  '/me',
  array(
    'fields' => 'id,name,email,languages,devices,birthday,education,favorite_athletes'
  )
);

$response = $request->execute();
$graphObject = $response->getGraphObject();
/* handle the result or response */

$id = $graphObject->getProperty('id');
$name = $graphObject->getProperty('name');
$email = $graphObject->getProperty('email');
$languages = $graphObject->getProperty('languages');
$devices = $graphObject->getProperty('devices');
$birthday = $graphObject->getProperty('birthday');
$education = $graphObject->getProperty('education');
$fav_athlts = $graphObject->getProperty('favorite_athletes');

echo "user_id is ". $id;
echo "name is ". $name;
echo "email is ". $email;
echo "languages are ". $languages;
echo "devices used are ". $devices;
echo "birthday on ". $birthday;
echo "education is ". $education;
echo "favorite athletes are ". $fav_athlts;

?>
