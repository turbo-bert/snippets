import configparser

p = configparser.ConfigParser()
p.read("filename")
for s in p.sections():
    logging.info("Table [%s] detected" % s)
    for k, v in p.items(s):
        logging.info("%s=%s" % (k, v))
