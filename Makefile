install:
	mkdir -p -m 777 web/uploads
	composer install
	npm install
	bower install
	bin/console assets:install
	gulp build
	bin/console doctrine:schema:drop --force
	bin/console doctrine:schema:create
	bin/console doctrine:fixtures:load -n
	bin/console cache:clear

update:
	composer install
	npm install
	bower install
	bin/console assets:install
	gulp build
	bin/console doctrine:schema:update --force
	bin/console doctrine:fixtures:load
	bin/console cache:clear

dev:
	bin/console assets:install --symlink
	gulp watch & app/console server:run
