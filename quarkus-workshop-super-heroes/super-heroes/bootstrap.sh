#!/bin/bash -e

# This script bootstraps the Quarkus microservices


echo ">>> Bootstrapping the Villain microservice..."

# tag::adocBootstrapVillain[]
mvn io.quarkus:quarkus-maven-plugin:2.13.0.Final:create \
    -DprojectGroupId=io.quarkus.workshop.super-heroes \
    -DprojectArtifactId=rest-villains \
    -DclassName="io.quarkus.workshop.superheroes.villain.VillainResource" \
    -Dpath="api/villains" \
    -Dextensions="resteasy-reactive-jackson"
# end::adocBootstrapVillain[]


echo ">>> Bootstrapping the Hero microservice..."

# tag::adocBootstrapHero[]
mvn io.quarkus:quarkus-maven-plugin:2.13.0.Final:create \
    -DprojectGroupId=io.quarkus.workshop.super-heroes \
    -DprojectArtifactId=rest-heroes \
    -DclassName="io.quarkus.workshop.superheroes.hero.HeroResource" \
    -Dpath="api/heroes" \
    -Dextensions="resteasy-reactive-jackson,quarkus-hibernate-validator,quarkus-smallrye-openapi,quarkus-hibernate-reactive-panache,quarkus-reactive-pg-client"
# tag::adocBootstrapHero[]


echo ">>> Bootstrapping the Fight microservice..."

# tag::adocBootstrapFight[]
mvn io.quarkus:quarkus-maven-plugin:2.13.0.Final:create \
  -DprojectGroupId=io.quarkus.workshop.super-heroes \
  -DprojectArtifactId=rest-fights \
  -DclassName="io.quarkus.workshop.superheroes.fight.FightResource" \
  -Dpath="api/fights" \
  -Dextensions="jdbc-postgresql,hibernate-orm-panache,hibernate-validator,quarkus-resteasy-reactive-jackson,smallrye-openapi,kafka"
# end::adocBootstrapFight[]


echo ">>> Bootstrapping the Statistics microservice..."

# tag::adocBootstrapStatistics[]
mvn io.quarkus:quarkus-maven-plugin:2.13.0.Final:create \
    -DprojectGroupId=io.quarkus.workshop.super-heroes \
    -DprojectArtifactId=event-statistics \
    -DclassName="io.quarkus.workshop.superheroes.statistics.StatisticResource" \
    -Dpath="api/stats" \
    -Dextensions="kafka, resteasy-reactive-jackson, websockets"
# end::adocBootstrapStatistics[]
