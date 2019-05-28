#!/bin/bash

LOCUST="/usr/local/bin/locust"
LOCUS_OPTS="-f /locust/tasks.py --host=$TARGET_HOST"
LOCUST_MODE=${LOCUST_MODE:-standalone}

if [[ "$LOCUST_MODE" = "master" ]]; then
    # LOCUS_OPTS="$LOCUS_OPTS --master --no-web -c $CLIENTS -r $HATCH_RATE --run-time $RUN_TIME --expect-slaves $SLAVES_COUNT --csv results"
    LOCUS_OPTS="$LOCUS_OPTS --master --expect-slaves $SLAVES_COUNT --csv /locust/stats/results"
elif [[ "$LOCUST_MODE" = "worker" ]]; then
    LOCUS_OPTS="$LOCUS_OPTS --slave --master-host=$LOCUST_MASTER"
fi

echo "Starting... $LOCUST $LOCUS_OPTS"

$LOCUST $LOCUS_OPTS