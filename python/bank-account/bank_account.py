# -*- coding: utf-8 -*-
from threading import Lock

class BankAccount:
    def __init__(self):
        self._balance = 0
        self._closed = True
        self._lock = Lock()

    def _guard_closed_account(self):
        "Disallow operations on closed accounts"
        if self._closed:
            raise ValueError('Cannot operate on closed account')

    def get_balance(self):
        "Return withdrawable."
        self._guard_closed_account()
        return self._balance

    def open(self):
        "Turn on deposit and withdrawal permissions"
        if not self._closed:
            raise ValueError('Bank account already open')
        self._closed = False

    def deposit(self, amount):
        "Deposit `amount` and add to bank account balance"
        self._guard_closed_account()
        if amount < 0:
            raise ValueError('Illegal to deposit negative amount')
        with self._lock:
            self._balance += amount

    def withdraw(self, amount):
        "Withdraw `amount` and dock from back account"
        self._guard_closed_account()
        if amount < 0:
            raise ValueError('Illegal to withdraw negative amount')
        if amount > self._balance:
            raise ValueError('Account not suitable for loans')
        with self._lock:
            self._balance -= amount

    def close(self):
        "Turn off deposit and withdrawal permissions"
        self._guard_closed_account()
        self._closed = True
        self._balance = 0
