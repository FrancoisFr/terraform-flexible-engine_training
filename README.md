# terraform-flexible-engine_training
Repo contenant mes différentes tentatives pour prendre en main terraform pour Flexible_Engine


<b>Step 1 : basic-ecs</b>

Première tentative, le but était de créer une instance ecs de base

Statut : OK

<b>Step 2 : VPC + ecs</b>

Step 2 : tenter de créer également le VPC et les subnets depuis terraform ( la ou step 1 ne créé qu'une instance ECS dans un VPC déjà existant)

Statut : OK

Note: Nécessite d'utiliser les subnet_v1, les v2 ne sont pas du tout compatible avec les vpc_v1 créer (pas de v2 pour cette ressource de ce que j'ai pu voir)

<b>Step 3 : multiples instances</b>

Step 3: créer plusieurs subnet avec une instance par subnet et tagger chaque instance afin qu'on sache qui l'a déployé

Statut : OK

<b>Step 4 : NAT Gateway + Routing</b>

Step 4 : Créer une NAT gateway pour le VPC avec DNAT et SNAT pour permettre le traffic + un groupe de sécurité avec les règles du trafic

Statut : Ok

<b>Step 5 : Auto-scaling</b>

Step 5 : Mettre en place de l'auto-scaling d'instance + policy et alarme afin de gérer le scale up et scale down du groupe

Statut : OK

<b>Step 6 : Cloud Container Engine</b>

Step 6 : Mettre en place un cluster avec CCE.

Statut : A faire
