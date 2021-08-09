# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
alias Racetrack.Cars.{Car, Track}
alias Racetrack.Repo

Repo.insert!(%Car{slug: "subaru_impreza", max_speed: 200})
Repo.insert!(%Car{slug: "honda_jazz", max_speed: 100})
Repo.insert!(%Car{slug: "mclaren_p90", max_speed: 1000})
Repo.insert!(%Track{name: "daytona", surface: :asphalt})
Repo.insert!(%Track{name: "thunderhill", surface: :gravel})
Repo.insert!(%Track{name: "snowland", surface: :snow})
