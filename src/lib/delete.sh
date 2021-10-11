#!/bin/bash

# doil is a tool that creates and manages multiple docker container
# with ILIAS and comes with several tools to help manage everything.
# It is able to download ILIAS and other ILIAS related software
# like cate.
#
# Copyright (C) 2020 - 2021 Laura Herzog (laura.herzog@concepts-and-training.de)
# Permission to copy and modify is granted under the AGPL license
#
# Contribute: https://github.com/conceptsandtraining/ilias-tool-doil
#
#                    .-.
#                   / /
#                  / |
#    |\     ._ ,-""  `.
#    | |,,_/  7        ;
#  `;=     ,=(     ,  /
#   |`q  q  ` |    \_,|
#  .=; <> _ ; /  ,/'/ |
# ';|\,j_ \;=\ ,/   `-'
#     `--'_|\  )
#    ,' | /  ;'
#   (,,/ (,,/      Thanks to Concepts and Training for supporting doil
#
# Last revised 2021-02-08

# set the instance to work with
CAD=$(pwd)
INSTANCE=$1
  
LINKNAME="${HOME}/.doil/$INSTANCE"
if [ -h "${LINKNAME}" ]
then
  NOW=$(date +'%d.%m.%Y %I:%M:%S')
  echo "[$NOW] Deleting instance"

  # set machine inactive
  cd $LINKNAME
  docker-compose down
  cd $CAD

  # remove directory
  the_path=$(realpath $LINKNAME)
  sudo rm -rf $the_path

  # remove link
  rm -f "${HOME}/.doil/$INSTANCE"

  # remove entry from the hosts
  sudo sed -i "/${INSTANCE}.local$/d" /etc/hosts

  NOW=$(date +'%d.%m.%Y %I:%M:%S')
  echo "[$NOW] Instance deleted"
else
  echo -e "\033[1mERROR:\033[0m"
  echo -e "\tInstance not found!"
  echo -e "\tuse \033[1mdoil instances\033[0m to see current installed instances"
fi