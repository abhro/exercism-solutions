import java.time.LocalDateTime;

class Gigasecond {

    LocalDateTime moment;

    Gigasecond(java.time.LocalDate moment) {
        this(LocalDateTime.of(moment, java.time.LocalTime.MIN));
    }

    Gigasecond(LocalDateTime moment) {
        this.moment = moment.plus(java.time.Duration.ofSeconds(1_000_000_000));
    }

    LocalDateTime getDateTime() {
        return moment;
    }

}
