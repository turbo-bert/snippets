import sys

print(sys.platform) # ^linux | win32 | darwin

IS_MACOS = "DARWIN" in sys.platform.upper()
IS_WIN = "WIN32" in sys.platform.upper()
IS_LINUX = "LINUX" in sys.platform.upper()
