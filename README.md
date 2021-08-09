
# Racetrack

#### Elixir & Phoenix
```
Elixir 1.11.3 (compiled with Erlang/OTP 23)
Phoenix  1.5.10 
DB: PostGres (username and password should be changed accordingly in dev.exs and mix.exs)
```
#### Installation
  * Install Elixir  https://elixir-lang.org/install.html
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`

#### Tests 
  * Create and migrate your database with `MIX_ENV=test mix ecto.setup`
  * Run Tests with `mix test`
#### Seeding the DB
  * Seed the DB with `mix run priv/repo/seeds.exs`
  * Start Phoenix endpoint with `iex -S mix phx.server`

Now you can visit [`localhost:4000/api/v1/cars/{car_name}?track={track_name}`](http://localhost:4000/api/v1/cars/{car_name}?track={track_name}) from your browser.


## List of Cars & Tracks
**Cars**
```
"subaru_impreza", max_speed: 200
"honda_jazz", max_speed: 100
"mclaren_p90", max_speed: 1000
```
**Tracks**
```
 "daytona", surface: :asphalt
 "thunderhill", surface: :gravel
 "snowland", surface: :snow
```
