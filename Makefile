.PHONY: lock
lock: poetry
	poetry lock

# This version should match the base of the snap.
# core24 uses poetry-1.8. Later versions of poetry use a different lockfile format
# which is incompatible with older versions, leading to build failures in snapcraft.
.PHONY: poetry
poetry:
	pip install --upgrade pip
	pip install poetry~=1.8
