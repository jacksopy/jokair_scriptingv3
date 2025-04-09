echo "en recherche d'update"
mv database ../
mv lookup.sh ../
cd .. 
rm -r -f jokair_scriptingv3
git clone https://github.com/jacksopy/jokair_scriptingv3
cd jokair_scriptingv3
rmdir database 
rm lookup.sh
cd ..
mv database jokair_scriptingv3
mv lookup.sh jokair_scriptingv3
chmod +x req.sh
./req.sh
echo "update terminé"
