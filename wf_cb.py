from typing import Literal


def main(waterfall_execution_id: str, action_type: Literal["approve", "reject"]) -> None:
    data = {"action_type": action_type}
