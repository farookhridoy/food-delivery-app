
## Food Delivery App


## Prerequisite 
- php 8.1
- composer
- docker
- windows subsystem or ubuntu 
- git clone https://github.com/gmfaruk/food-delivery-app.git
- git to subsystem/ubuntu terminal
- Configure sail alias : alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
- sail up
- export data from abc_db.sql in root folder or just run sail artisan migration
- sail artisan db:seed
- 
## Run host and service
- http://localhost:8001/ :: for run phpmyadmin
- http://localhost:80 :: for run the localhost application
## API Documentation
link: https://lively-station-201031.postman.co/workspace/LaraSoft~637fec29-1686-46e3-ae27-dbe4ad99ff70/collection/8846677-5249108c-dc4d-4e30-9228-07b8d8d95299?action=share&creator=8846677


## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
