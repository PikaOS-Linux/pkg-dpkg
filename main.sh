# Clone Upstream
#git clone https://git.dpkg.org/git/dpkg/dpkg.git -b 1.21.21
rm -rf ./dpkg/debian
cp -rvf ./debian ./dpkg/
cd ./dpkg

#for i in ../patches/*.patch; do patch -Np1 -i $i ;done

#LOGNAME=root dh_make --createorig -y -l -p dpkg_1.21.21ubuntu99

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
