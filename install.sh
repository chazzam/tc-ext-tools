#!/bin/sh

############################################################################
#                                                                          #
#             install.sh: Installs tc-ext-tools to your system             #
#                                                                          #
############################################################################

#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#  Copyright (c) 2011 Sercan Arslan <arslanserc@gmail.com>
#

if [ `id -u` = 0 ]; then
     echo "Do not run me as root!"
     exit 1
fi

if [ ! -e .config ]; then
  echo "You need to create a user configuration file!"
  echo "See INSTALL for details."
  exit 1
else
  . .config
fi

[ -z "$DESTDIR" ] && DESTDIR="$HOME/.local"

echo "-----------------------------------------------"
echo "tc-ext-tools will be installed into the destination directory $DESTDIR"
echo "Please specify the variable DESTDIR if you want tc-ext-tools to be installed elsewhere"
echo "-----------------------------------------------"

BINDIR="$DESTDIR/bin"
SYSCONFDIR="$DESTDIR/etc"
DATADIR="$DESTDIR/share"

[ -d "$BINDIR" ] || install -m 755 -d "$BINDIR"

install -m 755 tools/* "$BINDIR"

install -D -m 644 common/config "$SYSCONFDIR/tet.conf"
install -D -m 644 common/build "$DATADIR/tet/build.sample"
install -D -m 755 common/functions "$DATADIR/tet/functions.sh"
install -D -m 755 common/tet-functions "$SYSCONFDIR/init.d/tet-functions"

sudo ln -sf "$SYSCONFDIR/init.d/tet-functions" /etc/init.d/tet-functions

# source tc-ext-tools shell environment functions in user's ashrc
if ! grep tet-functions ~/.ashrc >/dev/null; then
  echo "Applying changes to shell environment"
  echo "You need to relogin or reboot your computer for changes to take effect"
  echo ". /etc/init.d/tet-functions" >> ~/.ashrc
fi

# add /etc/init.d/tet-functions to backup list
if ! grep tet-functions /opt/.filetool.lst >/dev/null; then
  echo "Adjusting backup list for persistency"
  echo "etc/init.d/tet-functions" >> /opt/.filetool.lst
fi

install -D -m 644 .config "$HOME/.config/tet.conf"

