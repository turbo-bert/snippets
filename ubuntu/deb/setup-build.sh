#!/bin/bash



export MAINT="Robert Degen <robert_degen@web.de>"
export VERS=0.1
PKG=${1:-python3-venv-turbo-nighlty}
VENV_TARGET=${2:-/py}
VENV_DEPS_TARGET=${3:-flask,requests,xler8,turbocore,paramiko,dcx,SQLAlchemy,pymongo,PyYAML,tabulate,rich,numpy}
WORKDIR=/root/build/$PKG




apt update && apt upgrade -y
apt install -y build-essential devscripts debhelper fakeroot lintian python3 python3-venv python3-pip


rm -fr /root/build/$PKG
mkdir -p /root/build/$PKG

mkdir -p $WORKDIR/debian
mkdir -p $WORKDIR/usr/share/$PKG

echo "$VENV_DEPS_TARGET" | tr ',' '\n' >$WORKDIR/usr/share/$PKG/requirements.txt

cat >$WORKDIR/debian/changelog <<EOF
$PKG ($VERS) unstable; urgency=medium

  * Initial release

 -- $MAINT  $(date -R)

EOF


cat >$WORKDIR/debian/control <<EOF
Source: $PKG
Section: python
Priority: optional
Maintainer: $MAINT
Build-Depends: debhelper-compat (= 13)
Standards-Version: 4.7.0
Rules-Requires-Root: no

Package: $PKG
Architecture: all
Depends: python3-venv
Recommends:
Description:
  Installs a python3 virtualenv at $VENV_TARGET and provides /usr/bin/vp+vpip
EOF

cat >$WORKDIR/debian/rules <<EOF
#!/usr/bin/make -f
export DH_VERBOSE=1
%:
$(printf '\t')dh \$@
EOF
chmod +x "$WORKDIR/debian/rules"

cat > "$WORKDIR/debian/install" <<EOF
debian/vp usr/bin/
debian/vpip usr/bin/
usr/share/$PKG/requirements.txt usr/share/$PKG/
EOF


cat > "$WORKDIR/debian/postrm" <<EOF
#!/bin/sh
set -e

VENV_DIR="$VENV_TARGET"

case "\$1" in
  purge)
    echo "Entferne Virtualenv unter \$VENV_DIR"
    rm -rf "\$VENV_DIR"
    ;;
esac

exit 0
EOF
chmod 755 "$WORKDIR/debian/postrm"


cat > "$WORKDIR/debian/vp" <<EOF
#!/bin/bash

VENV_DIR="$VENV_TARGET"

. \$VENV_DIR/bin/activate && python "\$@"

EOF
chmod 755 "$WORKDIR/debian/vp"

cat > "$WORKDIR/debian/vpip" <<EOF
#!/bin/bash

VENV_DIR="$VENV_TARGET"

. \$VENV_DIR/bin/activate && pip "\$@"

EOF
chmod 755 "$WORKDIR/debian/vp"


cat > "$WORKDIR/debian/postinst" <<EOF
#!/bin/sh
set -e
VENV_DIR="$VENV_TARGET"
REQ_FILE="/usr/share/$PKG/requirements.txt"
PY_BIN="/usr/bin/python3"
log() { echo "python3-venv-myenv: \$*"; }

case "\$1" in
  configure|triggered)
    if [ ! -f "\$VENV_DIR/bin/python" ]; then
      log "Erzeuge Virtualenv unter \$VENV_DIR"
      mkdir -p "\$VENV_DIR"
      "\$PY_BIN" -m venv "\$VENV_DIR"
      "\$VENV_DIR/bin/python" -m pip install --upgrade pip setuptools wheel
    else
      log "Virtualenv existiert bereits – aktualisiere Pip/Werkzeuge"
      "\$VENV_DIR/bin/python" -m pip install --upgrade pip setuptools wheel
    fi

    if [ -f "\$REQ_FILE" ]; then
      log "Installiere Requirements aus \$REQ_FILE"
      "\$VENV_DIR/bin/pip" install -r "\$REQ_FILE"
    fi
    ;;
esac
exit 0
EOF
chmod 755 "$WORKDIR/debian/postinst"


( cd $WORKDIR && debuild -us -uc )

echo $?
sleep 3
