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

mpi_dynamic_recv: mpi_dynam_check_status.o mpi_dynam_probe.o

mpi_dynam_check_status.o: mpi_dynam_check_status.c
	$(MPICC) $< -o $@

mpi_dynam_probe.o: mpi_probe.c
	$(MPICC) $< -o $@

mpi_p2p: mpi_random_walker.o

mpi_random_walker.o: mpi_random_walk.cpp
	$(MPICXX) $< -o $@


clean:
	rm *.o

.PHONY: clean
