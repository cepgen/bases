# Makefile for library BASES ver 5.1
TARGET=libBases.so

FC=gfortran
CC=gcc
FFLAGS=-O -fallow-argument-mismatch -fPIC
CFLAGS=-lgfortran -lm -shared

OBJ=obj

FSOURCES=$(shell echo src/*.f)
CSOURCES=$(shell echo src/*.c)
FOBJECTS=$(FSOURCES:.f=.o)
COBJECTS=$(CSOURCES:.c=.o)

vpath %.o $(OBJ)

%.o: %.f
	@echo "Building $<"
	@${FC} ${FFLAGS} -c $< -o $@

%.o: %.c
	@echo "Building $<"
	@${CC} ${CFLAGS} -c $< -o $@

all: $(TARGET)
.PHONY: clean

$(TARGET): $(FOBJECTS) $(COBJECTS)
	@echo "Linking $<"
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@

clean:
	@rm -f ${FOBJECTS} ${COBJECTS} ${TARGET}
