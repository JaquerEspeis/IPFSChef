

cat << EOF > first.m3u8
#EXTM3U
#EXT-X-VERSION:3
#EXT-X-MEDIA-SEQUENCE:0
#EXT-X-ALLOW-CACHE:NO
#EXT-X-TARGETDURATION:13
EOF

while true; do
 if [ -f stream/*.ts ] && [ -f stream/oldstyle.m3u8 ]; then
   IFS=' ' read -r -a array <<< $(ipfs add *.ts)
   IPFSHASH=${array[1]}
   TS=${array[2]}
   tail -n 2 oldstyle.m3u8 | perl -p -e "s/^\d+\.ts/http:\/\/localhost:8080\/ipfs\/$IPFSHASH/g" >> stream/first.m3u8
   rm *.ts
   echo "TS agregado"
 fi
done

