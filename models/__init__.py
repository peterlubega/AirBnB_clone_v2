#!/usr/bin/python3
"""Instantiates a storage object.

This script checks the environmental variable 'HBNB_TYPE_STORAGE':
- If set to 'db', instantiates a database storage engine (DBStorage).
- Otherwise, instantiates a file storage engine (FileStorage).
"""

from os import getenv

# Check the value of the environmental variable 'HBNB_TYPE_STORAGE'
if getenv("HBNB_TYPE_STORAGE") == "db":
    # Import the necessary module for database storage
    from models.engine.db_storage import DBStorage
    # Instantiate a database storage engine
    storage = DBStorage()
else:
    # Import the necessary module for file storage
    from models.engine.file_storage import FileStorage
    # Instantiate a file storage engine
    storage = FileStorage()

# Reload the storage engine
storage.reload()
