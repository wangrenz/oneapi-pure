# oneapi-pure

Only install icc,ifort,intel mpi... and remove large static libraray file.

## Usage:

1. Docker hub : 
```
docker pull wangrzqi/oneapi-pure:latest
```

2. Build yourself:
```
curl -O https://raw.githubusercontent.com/wangrenz/oneapi-pure/main/Dockerfile
docker build -t oneapi-pure:0.1 .
```
3. Run：
```
docker run -itd oneapi-pure:0.1 bash
```
If run MPI code, need increase share memory size, as follow command:
```
docker run -it  --shm-size=50gb --cap-add=sys_nice --security-opt seccomp=unconfined  wangrzqi/oneapi-pure bash
```
Result:
```
root@c8e8a14497a9:~# df -Th
Filesystem              Type     Size  Used Avail Use% Mounted on
shm                     tmpfs     50G     0   50G   0% /dev/shm
```
Then:
```
mpirun -np 2 -genv I_MPI_FABRICS=shm ./a.out
```

Attention: `Docker` MPI support unfriendly of distributed operating system, it is recommended to use `Singularity` or `Charlie cloud` container.

References:
https://software.intel.com/content/www/us/en/develop/documentation/mpi-developer-guide-linux/top/troubleshooting/problem-mpi-limitation-for-docker.html
