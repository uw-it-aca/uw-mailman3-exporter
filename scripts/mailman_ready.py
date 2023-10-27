#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import requests
import parser
import argparse
import logging


def get_mailman_url():
    parser = argparse.ArgumentParser(description='Mailman3 readiness probe')
    parser.add_argument(
        '-m', '--mailman_address', dest='mailman_address',
        type=str, default="http://localhost:8870",
        help='Mailman3 Core REST API address')
    args = parser.parse_args()

    log_handler = logging.StreamHandler()
    logging.basicConfig(handlers=[log_handler], level=logging.INFO)
    logging.captureWarnings(True)

    return args.mailman_address


if __name__ == '__main__':
    url = get_mailman_url()
    timeout = 5.0
    response = None
    while response is None:
        try:
            logging.info(f"waiting on <{url}>")
            response = requests.get(url, timeout=timeout)
        except requests.exceptions.ConnectTimeout:
            logging.info(f"request time out after {timeout}")
            pass

        logging.info(f"mailman at <{url}> ready: {response}")
