#!/bin/sh
echo 'USAGE: sh ./scripts/setup_projects.sh'
echo 'Note that this script HAS TO BE INVOKED from the dotfiles root directory, not from within scripts!'

echo "\n"
echo 'Switching to parent directory, in which the ScienceDb projects will be installed.'
cd ..

echo 'Setting up "ScienceDbBackend"'
git clone https://github.com/ScienceDb/ScienceDbBackend.git ./ScienceDbBackend
cd ./ScienceDbBackend 
docker build -t science_db_backend .
cd ..

echo 'Setting up "ScienceDbGui"'
git clone https://github.com/ScienceDb/ScienceDbGui.git ./ScienceDbGui
cd ./ScienceDbGui
docker build -t science_db_gui .
cd ..

echo 'Setting up "admin_gui_gen"'
git clone https://github.com/ScienceDb/admin_gui_gen.git ./admin_gui_gen
cd ./admin_gui_gen
npm install --save
npm install -g .
cd ..

echo 'Setting up "express_route_gen_js"'
git clone https://github.com/ScienceDb/express_route_gen_js.git ./express_route_gen_js
cd ./express_route_gen_js
npm install --save
npm install -g .
cd ..

echo 'DONE'
