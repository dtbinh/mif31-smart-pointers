BIN=bin
EXEC=main

all: ${EXEC}

main: ${BIN}/main.o ${BIN}/ref-counter.o
	g++ -g -Wall -ansi -pedantic $^ -o $@

${BIN}/main.o: main.cpp smart-pointer.hpp
	g++ -g -c -Wall -ansi -pedantic $< -o $@

${BIN}/ref-counter.o: ref-counter.cpp
	g++ -g -c -Wall -ansi -pedantic $< -o $@

clean:
	\rm -f ${BIN}/*.o ${EXEC}

veryclean: clean
	\rm -f ${BIN}/*.out

docu: doc/Doxyfile
	doxygen doc/Doxyfile
