echo "Starting..."
mkdir ClientCreator
cd ClientCreator

echo "Downloading dependencies..."
wget https://raw.githubusercontent.com/Geigerkind/TCPPClientDownloader/master/ClientDownloader.sh
wget https://github.com/Geigerkind/TCPPClientDownloader/raw/master/WoWRegeneration.exe
wget https://github.com/Geigerkind/TCPPClientDownloader/raw/master/connection_patcher
wget https://github.com/Geigerkind/TCPPClientDownloader/raw/master/WTF.zip
unzip WTF.zip
rm WTF.zip

echo "Downloading client..."
bash ClientDownloader.sh
rm ClientDownloader.sh

mv connection_patcher wow434
mv WoWRegeneration.exe wow434
mv WTF wow434

cd wow434
wine WoWRegeneration.exe
mv WoW-15595/Data .
rm -rf WoW-15595
rm WoWRegeneration.exe

echo "Patching clients..."
chmod +x ./connection_patcher
./connection_patcher Wow.exe
./connection_patcher Wow-64.exe
mv Wow_Patched.exe Wow.exe
mv Battle.net_Patched.dll Battle.net.dll
mv Wow-64_Patched.exe Wow-64.exe
mv Battle.net-64_Patched.dll Battle.net-64.dll

mkdir -p ~/.wine/drive_c/ProgramData/Blizzard\ Entertainment/Battle.net/Cache/
cp -rf AuthModules/* ~/.wine/drive_c/ProgramData/Blizzard\ Entertainment/Battle.net/Cache/
cp -rf AuthModules_64/* ~/.wine/drive_c/ProgramData/Blizzard\ Entertainment/Battle.net/Cache/
rm -rf AuthModules
rm -rf AuthModules_64
rm connection_patcher

echo "Cleaning up..."
cd ../../
mv ClientCreator/wow434 .
rm -r ClientCreator

echo "Done!"

