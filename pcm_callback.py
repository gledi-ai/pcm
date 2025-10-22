import os
from argparse import ArgumentParser
from uuid import UUID

import httpx

IDP_URL = "https://idp-backend.staging.cardoaiapps.com/api"
USERNAME = "gledis_caushaj"
PASSWORD = os.environ.get("PCM_PASSWORD", "")


def create_parser() -> ArgumentParser:
    parser = ArgumentParser(description="PCM Callback Simulator")

    action_group = parser.add_mutually_exclusive_group(required=True)
    action_group.add_argument(
        "--approve",
        action="store_const",
        const="approve",
        dest="action_type",
        help="Approve the proposal"
    )
    action_group.add_argument(
        "--reject",
        action="store_const",
        const="reject",
        dest="action_type",
        help="Reject the proposal"
    )

    parser.add_argument(
        "proposal_id",
        type=UUID,
        help="The UUID of the proposal to send the callback for",
    )

    return parser
