# Wrapper for ItchySats

`ItchySats` is CFD trading on Bitcoin - non-custodial, peer-to-peer, Bitcoin only.

## Dependencies

- [docker](https://docs.docker.com/get-docker)
- [docker-buildx](https://docs.docker.com/buildx/working-with-buildx/)
- [yq](https://mikefarah.gitbook.io/yq)
- [embassy-sdk](https://github.com/Start9Labs/embassy-os/blob/master/backend/install-sdk.sh)
- [make](https://www.gnu.org/software/make/)

## Cloning

```
git clone https://github.com/Start9Labs/itchysats-wrapper.git
git submodule update --init
cd itchysats-wrapper
```

## Building

```
make
```

## Sideload onto your Embassy

SSH into an Embassy device.
`scp` the `.s9pk` to any directory from your local machine.
Run the following command to determine successful install:

```
scp itchysats.s9pk start9@embassy-<id>.local:/embassy-data/package-data/tmp # Copy the S9PK to the external disk
ssh start9@embassy-<id>.local
embassy-cli auth login
embassy-cli package install itchysats.s9pk # Install the sideloaded package
```
