# oneapi-pure

Only install icc,ifort,intel mpi... and remove large static libraray file.

## Usage:

1. Docker hub : 
```
docker pull wangrzqi/oneapi-pure:latest
```

2. Build yourself:
```
docker build -t oneapi-pure:0.1 .
```
3. Run：
```
docker run -itd oneapi-pure:0.1 bash
```

Warning: `Docker` MPI support unfriendly, it is recommended to use `Singularity` or `Charlie cloud` container.
