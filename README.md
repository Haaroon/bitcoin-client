# ZCash Docker container

A Docker container running ZCash as a service and exposing the REST API.

## Prerequisites

Install [Docker][docker], e.g. on Debian/Ubuntu based systems

    sudo apt install docker.io

## Configuration

- Rename `docker/zcash.conf.backup` to `docker/zcash.conf`
- Change the username and password
- Configure `rpcallowip=...` to allow the client/daemon to accept
RPC connections outside the localhost and set an RPC username (`rpcuser`)
and password (`rpcpassword`).
- Make sure your config file includes the following line:
    txindex=1
- Modify `docker/zcash.conf` according to your environment
(see [doc][zcash-conf]).


## Usage

Building the docker container (latest tagged GitHub version of ZCash):

    ./docker/build.sh

Starting the container:

    ./docker/start.sh DATA_DIR

Attaching to the container:

    ./docker/attach.sh

Showing the Zcash log file:

    ./docker/show_log.sh


# Exposed JSON RPC PORT

By default this program will expose the RPC port `8331` of the ZCash node to the local machine running docker.

Example of interaction using Pythons `python-bitcoinrpc` is below

    from bitcoinrpc.authproxy import AuthServiceProxy, JSONRPCException
    rpcuser="MyUserName"
    rpcpassword="MyPassword"
    rpcport=8331
    rpc_connection = AuthServiceProxy("http://%s:%s@127.0.0.1:%i/" % (rpcuser, rpcpassword, port))
    rpc_connection.getinfo()


[docker]: https://www.docker.com/
[zcash-conf]: https://github.com/zcash/zcash/blob/master/contrib/debian/examples/zcash.conf
