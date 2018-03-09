

## Add Oauth2 client

The following step consists in adding a new OAuth2 client. The documentation is not very clear on that point, [the following code can be injected in a command to create new client](https://github.com/FriendsOfSymfony/FOSOAuthServerBundle/blob/master/Resources/doc/index.md#creating-a-client). In our case, we need
only one client, so I add the client manually with a simple SQL query :

```sql
INSERT INTO `oauth2_clients` VALUES (NULL, '3bcbxd9e24g0gk4swg0kwgcwg4o8k8g4g888kwc44gcc0gwwk4', 'a:0:{}', '4ok2x70rlfokc8g0wws8c8kwcokw80k44sg48goc0ok4w0so0k', 'a:1:{i:0;s:8:"password";}');
```
## Create admin user

We are going to use the command `fos:user:create`, provided by `FOSUserBundle` :

```shell
$ php app/console fos:user:create
Please choose a username:admin
Please choose an email:admin@example.com
Please choose a password:admin
Created user admin
```


## Check OAuth2 is working

**NOTE** : the following commands make use of the [HTTPie library](https://github.com/jakubroztocil/httpie). Make sure it is installed on your system before using it.

**NOTE 2** : the following commands assume you are [running Symfony with the built-in HTTP server](http://symfony.com/doc/current/quick_tour/the_big_picture.html#running-symfony).
Adapt to fit your configuration.


```shell
$ http GET http://localhost:8000/app_dev.php/links
HTTP/1.1 401 Unauthorized
Cache-Control: no-store, private
Connection: close
Content-Type: application/json
...

{
    "error": "access_denied",
    "error_description": "OAuth2 authentication required"
}
```

We are not welcome here :(

We should now request an Access Token using the client and the user we created earlier. Notice the `client_id` parameter is a concatenation of the
client id, an underscore and the client randomId :

```shell
$ http POST http://localhost:8000/app_dev.php/oauth/v2/token \
    grant_type=password \
    client_id=1_3bcbxd9e24g0gk4swg0kwgcwg4o8k8g4g888kwc44gcc0gwwk4 \
    client_secret=4ok2x70rlfokc8g0wws8c8kwcokw80k44sg48goc0ok4w0so0k \
    username=admin \
    password=admin
HTTP/1.1 200 OK
Cache-Control: no-store, private
Connection: close
Content-Type: application/json
...

{
    "access_token": "MDFjZGI1MTg4MTk3YmEwOWJmMzA4NmRiMTgxNTM0ZDc1MGI3NDgzYjIwNmI3NGQ0NGE0YTQ5YTVhNmNlNDZhZQ",
    "expires_in": 3600,
    "refresh_token": "ZjYyOWY5Yzg3MTg0MDU4NWJhYzIwZWI4MDQzZTg4NWJjYzEyNzAwODUwYmQ4NjlhMDE3OGY4ZDk4N2U5OGU2Ng",
    "scope": null,
    "token_type": "bearer"
}
```
We can use the Acces Token we've just been given to authenticate on the next request :

```shell
$ http GET http://ledzep.dev:8000/app_dev.php/links \
    "Authorization:Bearer MDFjZGI1MTg4MTk3YmEwOWJmMzA4NmRiMTgxNTM0ZDc1MGI3NDgzYjIwNmI3NGQ0NGE0YTQ5YTVhNmNlNDZhZQ"
HTTP/1.1 200 OK
Cache-Control: no-cache
Connection: close
Content-Type: application/json
...

{
    "hello": "world"
}
```

## User information

### Get current authenticated user

```php
<?php

use use Symfony\Component\Security\Core\Exception\AccessDeniedException;

// ...
class DemoController extends FOSRestController
{
    // ...
    public function getDemosAction()
    {
        $user = $this->get('security.context')->getToken()->getUser();

        //...
        // Do something with the fully authenticated user.
        // ...
    }
    // ...
}
```

### Check user grants

```php
<?php

use use Symfony\Component\Security\Core\Exception\AccessDeniedException;

// ...
class DemoController extends FOSRestController
{
    // ...
    public function getDemosAction()
    {
        if ($this->get('security.context')->isGranted('ROLE_JCVD') === FALSE) {
            throw new AccessDeniedException();
        }

        // ...
    }
    // ...
}
```
