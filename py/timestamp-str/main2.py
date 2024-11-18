def hotspec_seconds(src:str) -> int:
    res = 0
    
    # (s)econds
    if src.endswith("s"):
        res = int(src[:-1])
        return res

    # (m)inutes
    if src.endswith("m"):
        res = int(src[:-1])*60
        return res

    # (h)ours
    if src.endswith("m"):
        res = int(src[:-1])*3600
        return res

    # (d)ays
    if src.endswith("d"):
        res = int(src[:-1])*3600*24
        return res

    # (w)eeks
    if src.endswith("w"):
        res = int(src[:-1])*3600*24*7
        return res

    res = int(src)
    return res
