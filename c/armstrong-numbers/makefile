LIBS = -lm
CFLAGS  = -std=c99 -g -Wall -Wextra -pedantic -Werror -Wmissing-declarations
CFLAGS += -DUNITY_SUPPORT_64
ASANFLAGS  = -fsanitize=address -fno-common -fno-omit-frame-pointer

test: tests.out
	./tests.out

memcheck: test/*.c src/*.c src/*.h
	@echo Compiling $@
	@$(CC) $(ASANFLAGS) $(CFLAGS) src/*.c test/vendor/unity.c test/*.c -o memcheck.out $(LIBS)
	@./memcheck.out
	@echo "Memory check passed"

clean:
	rm -rf *.o *.out *.out.dSYM

tests.out: test/*.c src/*.c src/*.h
	@echo Compiling $@
	$(CC) $(CFLAGS) src/*.c test/vendor/unity.c test/*.c -o tests.out $(LIBS)
