docker build --file=eelaazmi_host-1 --tag=eelaazmi_host .
echo "Alpine image is built"\

docker build --file=eelaazmi_router-1 --tag=eelaazmi_router .
echo "Router FFS image is build"