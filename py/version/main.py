def tryversion(pkg):
    import importlib.metadata
    try:
        res = pkg + '-' + importlib.metadata.version(pkg)
    except:
        res = pkg + '-dev'
    return res
