# Credit to Pratik's answer, https://stackoverflow.com/questions/2706064/compile-all-c-files-in-a-directory-into-separate-programs
SRCS = $(wildcard *.c)

PROGS = $(patsubst %.c,%,$(SRCS))

# Need to activate above macro if decrypt.c 
LIBS = -D OPENSSL -lcrypto

all: $(PROGS)

# Added additional nostartfiles, and g flag to get rid of linker error
%: %.c
	$(CC) $(CFLAGS) -o $@ $< $(if $(filter $@,decrypt), $(LIBS),) -nostartfiles -g
clean: 
	rm -f $(PROGS)
