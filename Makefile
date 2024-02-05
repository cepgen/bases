# Makefile for library BASES ver 5.1
FC=gfortran
FFLAGS=-O -fallow-argument-mismatch
CC=gcc
CFLAGS=-lgfortran -lm

FSOURCES=$(shell echo *.f)
CSOURCES=$(shell echo *.c)
FOBJECTS=$(FSOURCES:.f=.o)
COBJECTS=$(CSOURCES:.c=.o)

TARGET=libBases.so

obj := obj

vpath %.o $(obj)

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
	@rm -f ${FOBJECTS}
	@rm -f ${COBJECTS}
