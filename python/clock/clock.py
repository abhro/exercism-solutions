# -*- coding: utf-8 -*-

class Clock:
    def __init__(self, hour: int, minute: int, second: int = 0):
        self.hour = hour
        self.minute = minute
        self.second = second

        if self.minute >= 60 or self.minute < 0:
            hours_to_add, self.minute = divmod(self.minute, 60)
            self.hour += hours_to_add

        if self.hour >= 24 or self.hour < 0:
            self.hour %= 24

    def __str__(self):
        return '%02i:%02i' % (self.hour, self.minute)

    def __eq__(self, other: 'Clock'):
        return self.hour == other.hour and self.minute == other.minute

    def add(self, other: int):
        "Return a Clock with `other` more minutes than self."
        return Clock(self.hour, self.minute + other)
