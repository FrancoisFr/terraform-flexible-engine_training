# terraform-flexible-engine_training
Repo contenant mes différentes tentatives pour prendre en main terraform pour Flexible_Engine


<b>Step 1 : basic-ecs</b>

Première tentative, le but était de créer une instance ecs de base

statut : OK

<b>Step 2 : VPC + ecs</b>

Step 2 : tenter de créer également le VPC et les subnets depuis terraform ( la ou step 1 ne créé qu'une instance ECS dans un VPC déjà existant)

statut : OK

Note: Nécessite d'utiliser les subnet_v1, les v2 ne sont pas du tout compatible avec les vpc_v1 créer (pas de v2 pour cette ressource de ce que j'ai pu voir)

<b>Step 3 : multiples instances</b>

Step 3: créer plusieurs subnet avec une instance par subnet et tagger chaque instance afin qu'on sache qui l'a déployé

statut : OK
