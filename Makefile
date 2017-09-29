.PHONY: v3-jessie
v3-jessie:
	docker build -f v3/jessie/Dockerfile -t blitzagency/python-web:3-jessie v3/jessie

.PHONY: v3
v3:
	docker build -f v3/Dockerfile -t blitzagency/python-web:3 v3/

.PHONY: v3-geo
v3-geo:
	docker build -f v3/geo/Dockerfile -t blitzagency/python-web:3-geo v3/geo

.PHONY: v2
v2:
	docker build -f v2/Dockerfile -t blitzagency/python-web:2 v2/

.PHONY: v2-geo
v2-geo:
	docker build -f v2/geo/Dockerfile -t blitzagency/python-web:2-geo v2/geo

