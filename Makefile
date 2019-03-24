MPICXX = mpicxx
MPICC = mpicc

mpi_hello_world.o:mpi_hello_world.cpp
	$(MPICXX) $< -o $@

mpi_send_and_receive: mpi_send_recv.o mpi_ping_pong.o mpi_send_recv_ring.o
	echo "Building $@"

mpi_send_recv.o:mpi_send_recv.c
	$(MPICC) $< -o $@

mpi_ping_pong.o: mpi_ping_pong.c
	$(MPICC) $< -o $@

mpi_send_recv_ring.o: send_recv_ring.c
	$(MPICC) $< -o $@

clean:
	rm *.o

.PHONY: clean