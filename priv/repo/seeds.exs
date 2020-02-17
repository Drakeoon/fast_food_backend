# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FastFoodBackend.Repo.insert!(%FastFoodBackend.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Code.require_file("seeds/database_seeder.exs", __DIR__)

alias FastFoodBackend.DatabaseSeeder

DatabaseSeeder.clean_database()

Enum.each(0..9, fn _ -> DatabaseSeeder.insert_product() end)
