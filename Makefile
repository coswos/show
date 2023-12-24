check:
	ruff check .
	black --check .

fix:
	isort .
	ruff --fix .
	black .

run:
	python src/manage.py runserver 0.0.0.0:8000

mkmig:
	python src/manage.py makemigrations
	python src/manage.py migrate

make up:
	docker run -it --rm -p 8000:8000 -v .:/app django-project bash
