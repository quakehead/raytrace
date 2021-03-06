

CC = g++

CFLAGS = -Wall -O3 # -g # -g #-pg
# -pg for gprof

LDFLAGS = 

HANDIN_FILES = 

TAR = raytrace.tgz


all: raytrace

raytrace:	raytrace.o image.o util.o
		$(CC) $(CFLAGS) $^ -o $@ 

raytrace_debug:	raytrace_debug.o image.o util.o
		$(CC) $^ -o $@ $(CFLAGS)

raytrace-mid2:	raytrace-mid2.o image.o util.o
		$(CC) $^ -o $@ $(CFLAGS)

terrain:	terrain.o image.o util.o gnoise.o
		$(CC) $^ -o $@ $(CFLAGS)

test_intersect:	test_intersect.o util.o
		$(CC) $(CFLAGS) $^ -o $@ 


%.o: %.cpp $(wildcard %.h)
		$(CC) $(CFLAGS) $< -c


handin:
		tar -czf ../$(TAR) ../raytrace
		scp ../$(TAR) unix3:~/Desktop
		ssh unix3 "handin zwood csc473p5 Desktop/$(TAR)"

upload: tar
		scp ../$(TAR) unix3:~/Desktop

tar:
		tar -czf ../$(TAR) ../raytrace
