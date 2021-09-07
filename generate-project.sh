#!/bin/sh

# ##################################################
# Maven WebApp Project Generator
version="1.0.0"
#
# HISTORY:
#
# * 20/09/07 - v1.0.0  - First Creation
#
# ##################################################

# https://mvnrepository.com/artifact/de.rieckpil.archetypes/jakartaee8
# https://mvnrepository.com/artifact/de.rieckpil.archetypes/javaee8

GROUP_ID="$1"
ARTIFACT_ID="$2"

function mainScript() {
mvn archetype:generate \
  -DarchetypeGroupId=de.rieckpil.archetypes \
  -DarchetypeArtifactId=jakartaee8 \
  -DarchetypeVersion=1.1.2 \
  -DinteractiveMode=false \
  -DgroupId=${GROUP_ID} \
  -DartifactId=${ARTIFACT_ID} \
  -Dversion=1.0.0-SNAPSHOT \
  -Dpackage=${GROUP_ID} \
  --batch-mode \
  --update-snapshots 
}

function usage() {
  cat <<EOF 1>&2
$(basename ${0}) is a tool for ...
Usage:
  $(basename ${0}) [GROUP_ID] [ARTIFACT_ID]
Options:
  --version, -v     print $(basename ${0}) ${version}
  --help, -h        print help
EOF
}

# Create .gitignore
cat << EOF > .gitignore
maven/${ARTIFACT_ID}/target/
EOF

# Check Arguments
if [ $# -ne 2 ]; then
  usage
  exit 1
fi

if [ ! -d ./maven ]; then
  mkdir maven
fi

cd maven
mainScript
