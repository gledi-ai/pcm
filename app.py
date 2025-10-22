import datetime
from os import path
from typing import Any

import uvicorn
from fastapi import FastAPI, Request
from structlog import get_logger

log = get_logger(__name__)

app = FastAPI()

_id_offset = 90_000
_start = datetime.datetime(2025, 6, 18, 14, 0, 0, tzinfo=datetime.UTC)


@app.get("/api/v1/tm/bbc/sig")
def bbc_sig(request: Request) -> dict[str, Any]:
    path = request.scope.get("path")
    log.info("Received borrowing base certificate signature request", path=path)
    return {"path": path}


@app.post("/api/job/")
async def limits_job(request: Request) -> dict[str, Any]:
    path = request.scope.get("path")
    data = await request.json()
    log.info("Received limits job request", path=path, data=data)
    now = datetime.datetime.now(datetime.UTC).timestamp()
    id_ = int(now - _start.timestamp()) + _id_offset
    return {"id": id_}


@app.post("/api/v1/dags/ner_dispatcher_dag/dagRuns")
async def run_de_dag_dispatcher(request: Request) -> dict[str, Any]:
    path = request.scope.get("path")
    data = await request.json()
    log.info("Received DE run dag request", path=path, data=data)
    now = datetime.datetime.now(datetime.UTC).isoformat()
    dag_run_id = f"manual__{now}"
    return {"dag_run_id": dag_run_id}


@app.api_route("/{path:path}", methods=["GET", "POST", "DELETE", "PUT", "PATCH"])
async def server(path: str) -> dict[str, Any]:
    log.info("Received request", path=path)
    return {"result": {"isSuccess": True}}


def main() -> None:
    import logsetup

    logsetup.setuplogging()

    uvicorn.run("app:app", host="127.0.0.1", port=8888, log_level="info", reload=True)


if __name__ == "__main__":
    main()