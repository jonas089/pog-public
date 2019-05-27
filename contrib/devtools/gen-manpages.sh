#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

PIGEOND=${PIGEOND:-$SRCDIR/proofofgamingd}
PIGEONCLI=${PIGEONCLI:-$SRCDIR/proofofgaming-cli}
PIGEONTX=${PIGEONTX:-$SRCDIR/proofofgaming-tx}
PIGEONQT=${PIGEONQT:-$SRCDIR/qt/proofofgaming-qt}

[ ! -x $PIGEOND ] && echo "$PIGEOND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
POGVER=($($PIGEONCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for proofofgamingd if --version-string is not set,
# but has different outcomes for proofofgaming-qt and proofofgaming-cli.
echo "[COPYRIGHT]" > footer.h2m
$PIGEOND --version | sed -n '1!p' >> footer.h2m

for cmd in $PIGEOND $PIGEONCLI $PIGEONTX $PIGEONQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${POGVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${POGVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
