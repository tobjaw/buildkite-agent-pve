#!/bin/sh

# Agent directory on host
AGENT_DIR="/opt/buildkite-agent"

docker run -d --rm \
  -v "/var/run/docker.sock:/var/run/docker.sock" \
  -v "${AGENT_DIR}/hooks:/buildkite/hooks:ro" \
  -v "${AGENT_DIR}/secrets:/buildkite/secrets:ro" \
  -v "${AGENT_DIR}/agent.cfg:/buildkite/agent.cfg:ro" \
  -e "BUILDKITE_AGENT_CONFIG=/buildkite/agent.cfg" \
  --name "buildkite-agent" \
  buildkite/agent:3
