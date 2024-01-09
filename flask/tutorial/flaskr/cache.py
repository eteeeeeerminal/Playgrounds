from flask_caching import Cache

cache = Cache()

def init_app(app):
    cache.init_app(app)

def delete_cache():
    print(cache.cache._cache.keys())
    print(cache.delete('view//'))