# YuBlueOS &nbsp; [![bluebuild build badge](https://github.com/smissaertj/joeri-os/actions/workflows/build.yml/badge.svg)](https://github.com/smissaertj/joeri-os/actions/workflows/build.yml)

Custom Universal Blue bootc image

## ISO

Install `bluebuild` following the instructions [here](https://github.com/blue-build/cli).

1. Generate the ISO
```
# Build an ISO from a remote image:
bluebuild generate-iso --iso-name yublueos.iso image ghcr.io/smissaertj/yublueos

# Build an ISO from a local recipe file:
bluebuild generate-iso --iso-name yublueos.iso recipe recipes/recipe.yml
```

2. Flash the ISO to a USB drive and boot from it, or boot it from a VM.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/smissaertj/yublueos
```
