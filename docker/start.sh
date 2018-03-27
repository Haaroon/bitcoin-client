if ! [ -n $1 ] ; then
        echo "Please provide directory for blockchain data files."
fi

docker stop zcash
docker rm zcash
cp docker/zcash.conf $1
docker run -d --name zcash \
	-p 127.0.0.1:8331:8331 \
	-v $1:/root/.zcash \
	-it zcash
# HOST-PORT:CONTAINER-PORT
