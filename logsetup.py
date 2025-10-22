import logging
import os
import sys

import orjson
import structlog
from structlog.contextvars import merge_contextvars
from structlog.dev import ConsoleRenderer, set_exc_info
from structlog.processors import (
    CallsiteParameter,
    CallsiteParameterAdder,
    EventRenamer,
    JSONRenderer,
    StackInfoRenderer,
    TimeStamper,
    add_log_level,
    dict_tracebacks,
)


def setuplogging() -> None:
    shared_processors = [
        merge_contextvars,
        add_log_level,
        StackInfoRenderer(),
        set_exc_info,
        CallsiteParameterAdder([CallsiteParameter.MODULE, CallsiteParameter.LINENO]),
    ]

    logger_factory = None
    if sys.stderr.isatty():
        processors = shared_processors + [TimeStamper(fmt="%Y-%m-%d %H:%M:%S", utc=False), ConsoleRenderer()]
    else:
        processors = shared_processors + [
            TimeStamper(fmt="iso", utc=True),
            EventRenamer("msg"),  # rename "event" key to "msg"
            dict_tracebacks,
            JSONRenderer(serializer=orjson.dumps),
        ]
        # Note that orjson generates bytes not strings
        logger_factory=structlog.BytesLoggerFactory()  # for outputting JSON to console
        # logger_factory=structlog.BytesLoggerFactory(file=open("output.log", "ab")) # for outputting JSON to file

    log_level_raw = os.environ.get("LOG_LEVEL", "INFO").upper()
    log_level = logging.getLevelName(log_level_raw)
    if isinstance(log_level, str):
        raise ValueError(f"Invalid log level: {log_level_raw}")

    structlog.configure(
        cache_logger_on_first_use=True,
        wrapper_class=structlog.make_filtering_bound_logger(log_level),
        processors=processors,
        logger_factory=logger_factory,
    )
