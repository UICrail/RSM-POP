#!/usr/bin/env bash
#
# Merge the declarations that Eddy/Graphol cannot emit (e.g. pop:aboutProperty
# typed as an owl:AnnotationProperty) into the exported ontology.
#
# Run this AFTER every export of pop.ttl from Eddy/Graphol, then commit the
# result. The merge is idempotent: re-running it on an already-merged file
# leaves it unchanged.
#
# Requires the OBO ROBOT tool (https://robot.obolibrary.org/) and a Java
# runtime. NOTE: the command name "robot" collides with "Robot Framework"
# (a Python test tool). If your `robot` is Robot Framework, install OBO ROBOT
# and point this script at it via the ROBOT environment variable, e.g.:
#
#   ROBOT=/path/to/robot ./scripts/merge-annotations.sh
#   ROBOT="java -jar /path/to/robot.jar" ./scripts/merge-annotations.sh
#
set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../ontology/src" && pwd)"
ONTOLOGY="${SRC_DIR}/pop.ttl"
PATCH="${SRC_DIR}/pop-annotations.ttl"
TMP="${ONTOLOGY}.tmp.ttl"

# Respect an explicit ROBOT override; otherwise default to the PATH `robot`.
if [ -n "${ROBOT:-}" ]; then
  ROBOT_EXPLICIT=1
else
  ROBOT_EXPLICIT=0
  ROBOT="robot"
fi

# If ROBOT was not set explicitly and the PATH `robot` is not OBO ROBOT
# (e.g. it is Robot Framework, or missing), fall back to a locally installed
# robot.jar if one is present.
DEFAULT_JAR="${HOME}/.local/share/robot/robot.jar"
if [ "${ROBOT_EXPLICIT}" -eq 0 ]; then
  path_version="$(${ROBOT} --version 2>&1 || true)"
  if ! printf '%s' "${path_version}" | grep -qi "ROBOT version"; then
    if [ -f "${DEFAULT_JAR}" ]; then
      ROBOT="java -jar ${DEFAULT_JAR}"
    fi
  fi
fi

# Verify we are talking to OBO ROBOT and not Robot Framework.
version_output="$(${ROBOT} --version 2>&1 || true)"
if printf '%s' "${version_output}" | grep -qi "Robot Framework"; then
  echo "error: '${ROBOT}' is Robot Framework, not the OBO ROBOT ontology tool." >&2
  echo "       Install OBO ROBOT (https://robot.obolibrary.org/) and set ROBOT, e.g.:" >&2
  echo "       ROBOT=\"java -jar /path/to/robot.jar\" $0" >&2
  exit 1
fi
if ! printf '%s' "${version_output}" | grep -qi "ROBOT"; then
  echo "error: could not find the OBO ROBOT tool (tried '${ROBOT}')." >&2
  echo "       See https://robot.obolibrary.org/ ; then set ROBOT if needed." >&2
  exit 1
fi

${ROBOT} merge \
  --input "${ONTOLOGY}" \
  --input "${PATCH}" \
  --output "${TMP}"

mv "${TMP}" "${ONTOLOGY}"

echo "Merged $(basename "${PATCH}") into $(basename "${ONTOLOGY}")."
