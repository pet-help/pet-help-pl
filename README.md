# pet-help-pl

## Wymagania
* zainstalowany VirtualBox i Vagrant

## Pierwsze uruchomienie
Kolejno:
* w katalogu z repo uruchomić polecenie `vagrant up` i poczekać, aż maszyna deweloperska się skonfiguruje
* `vagrant ssh` aby dostać się do maszyny
* `cd /vagrant` aby przejść do (synchronizowanego między hostem a guestem) katalogu ze źródłem (można korzystać też z aliasu `cdrails`)
* `bundle `
* `bundle exec rake db:create` (lub korzystając z aliasu `be rake db:create`)
* `bundle exec rake db:migrate` (lub korzystając z aliasu `be rake db:migrate`)
* `be rake db:seed`


## Normalne uruchomienie
* `vagrant up`
* `vagrant ssh` aby dostać się do maszyny
* `cdrails`
* `rails s`

## Używanie
* localhost:3000 - aplikacja
* localhost:1080 - interfejs do testowania wysyłania maili przez aplikację
* localhost:15432 - baza danych PostgreSQL, baza: pet_help_pl_development, user: vagrant, pass: vagrant

## Inne
* `vagrant halt` - wyłączenie maszyny
* `vagrant suspend` - uśpienie maszyny
* `vagrant destroy` - usunięcie maszyny