# [gospl](https://github.com/Geodels/gospl) Docker Container

## Notes
- The [erosionpasta](https://github.com/hersfeldtn/erosionpasta/tree/main/gospl) Jupyter notebook is available at `/notebooks` inside the container. 
- Juptyer is running on port 8888. 
- Upload your input file(s) to `/notebook/inputs`. You may create a bind mount to this directory.
- Example Docker run command: `docker run -d --rm --name gospl -v ./myInputs:/notebook/inputs -p 8888 git.fern.garden/fern/gospl:latest`

## Acknowledgements
- https://worldbuildingpasta.blogspot.com/2023/03/an-apple-pie-from-scratch-part-viic.html
- https://github.com/hersfeldtn/erosionpasta
- https://github.com/Geodels/gospl
- https://github.com/Geodels/gospl-container
- https://packages.debian.org/trixie/python3-meshplex
