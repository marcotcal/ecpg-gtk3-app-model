# Copyright 2021 Trainraider
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

SHELL ?= /bin/sh

#app info
VERSION    ?= 0.0.1
TARGET     ?= ecpg_model
NAME       ?= ECPG GTK Model
#APP_ID can start with a website or email in reverse url format
APP_ID     ?= pt.qvaliz.ecpg_model.$(TARGET)
#APP_PREFIX is APP_ID converted to a path.
APP_PREFIX ?= $(shell echo $(APP_ID) | sed 's:\.:/:g;s:^:/:g')
COPYRIGHT  ?= Copyright (C) 2021
AUTHOR     ?= Marco Túlio Castro 
COMMENT    ?= GTK+ 3.0 template Application
CATEGORIES ?= Utility;ComputerScience;GNOME;GTK,PostgreSQL;

# for use on connection string  
DATABASE_SERVER ?= localhost
DATABASE_NAME ?= postgres
DATABASE_USER ?= marcotc

# Customize below to fit your system

# Install paths
PREFIX ?= /usr

#Project directory
PD = $(shell pwd)

#Build/Source paths
SRC     ?= $(PD)/source
BLD     ?= $(PD)/build
DATA    ?= $(SRC)/data

#Files
BIN       ?= $(BLD)/bin/$(TARGET)
OBJ       ?= $(BLD)/main.o $(BLD)/actions.o $(BLD)/database.o $(BLD)/user_interface.o $(BLD)/version.o $(BLD)/data.o \
             $(BLD)/fields.o $(BLD)/dbutils.o
GLADE     ?= $(DATA)/window_main.glade
RESOURCES ?= $(DATA)/icon.svg $(DATA)/window_main.glade
DESKTOP   ?= $(BLD)/$(TARGET).desktop

#Dependencies
PKG_CONFIG ?= pkg-config
PG_CONFIG ?= pg_config

INCS = `$(PKG_CONFIG) --cflags gtk+-3.0` \
       -I`$(PG_CONFIG) --includedir`
#      `$(PKG_CONFIG) --cflags next_library`

LIBS = `$(PKG_CONFIG) --libs gtk+-3.0` \
       -L`$(PG_CONFIG) --libdir` -lpq -lecpg 
#      `$(PKG_CONFIG) --libs next_library`

#Optional flags
CFLAGS         ?= -march=native -pipe
RELEASE_CFLAGS  = -O0 -g -flto
RELEASE_LDFLAGS = -flto
DEBUG_CPPFLAGS  = -DDEBUG
DEBUG_CFLAGS    = -O0 -ggdb -Wpedantic -Wall -Wextra -fsanitize=address -fsanitize=undefined -fstack-protector-strong
DEBUG_LDFLAGS   = -fsanitize=address -fsanitize=leak -fsanitize=undefined

#Required flags
CPPFLAGS += -DVERSION=\"$(VERSION)\" -DNAME=\""$(NAME)"\" -DAPP_ID=\"$(APP_ID)\" -DAPP_PREFIX=\"$(APP_PREFIX)\" -DAUTHOR=\""$(AUTHOR)"\" -DCOPYRIGHT="\"$(COPYRIGHT)\"" -DTARGET=\"$(TARGET)\" -DDATABASE_NAME=\""$(DATABASE_NAME)"\" -DDATABASE_SERVER=\""$(DATABASE_SERVER)"\" -DDATABASE_USER=\""$(DATABASE_USER)"\" 
CFLAGS   += $(INCS) -I$(BLD)
LDFLAGS  += $(LIBS) -rdynamic
