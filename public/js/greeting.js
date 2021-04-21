var thehours = new Date().getHours();
var themessage;
var morning = ('Good morning.');
var afternoon = ('Good afternoon.');
var evening = ('Good evening.');
var night = ('Good night.');

if (thehours >= 3 && thehours < 11) {
    themessage = morning;
} else if (thehours >= 11 && thehours < 17) {
    themessage = afternoon;
} else if (thehours >= 17 && thehours < 24) {
    themessage = evening;
} else {
    themessage = night;
}

$('.greet').append(". ").append(themessage);