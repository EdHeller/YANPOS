cd os
as --32 ./boot.s -o ./boot.o
ld -melf_i386 --oformat=binary ./boot.o -o ./boot.bin

cp -f ./boot.bin ../zip/boot.bin
#clean up the object files
#rm -rf *.o
cd ..

<<startwebserver
cd zip 
zip -0 -r ../test.jsdos .* *  -x '*..*'
sleep 1.5
cd ..
cp -f ./test.jsdos ./os-node/_site/bundle.jsdos
sleep 1.5
rm -f ./test.jsdos



cd os-node
#nix-shell --command "cd os-node"
npm run start
sleep 1.5
cd ..
#odd quirk help /all breaks.
startwebserver


dosbox -conf /home/runner/YANPOS/dosboxconfigure.conf

#-soundhw pcspk
#qemu-system-x86_64 -drive format=raw,file=boot.bin 
#-audiodev pa,id=sn0 -machine pcspk-audiodev=sn0

#build the node directory structure first
#expects /node and /node/public

#run emcc to compile main.cpp to test.o
#emcc main.cpp -o test.html
#copy the generated files into the static server directory
#cp -f ./test.html ./node/public/test.html
#cp -f ./test.js ./node/public/test.js
#cp -f ./test.wasm ./node/public/test.wasm
#remove the files
#rm -f ./test.html ./test.js ./test.wasm
#start the server
#node 'node/index.js'