# Cahier des charges

## Étudiants
- Raemy Mathis
- Guibert Loïc

## Introduction
Ce document définit les caractéristiques et les fonctionnalités à implémenter pour la réalisation d'une application *Flutter*. Cette application est réalisée dans le cadre d'un projet pour le cours de *AdMoApp* et dispose par conséquent de contraintes définies à l'avance.

## Contraintes
L'application doit être **context-aware**, c'est-à-dire qu'elle doit adapter son comportement selon des données contextuelles. L'utilisation d'un capteur embarqué dans l'appareil est également obligatoire. L'application doit être une application mobile développée avec le Framework *Flutter* qui utilise le langage *Dart*.

## Temps à disposition
Pour la réalisation du projet, on dispose d'environ 24 périodes en classe et 50 périodes de travail personnel en dehors de ces périodes.

## Milestones
• Formation du groupe et choix du sujet – Semaine 1
• Descriptif du projet (mini cahier des charges) – À remettre avant le cours de la semaine 2
• Validation du projet – semaine 3 (en classe)
• Présentation du projet (avec démo) – Semaines 14-15
• Livraison d’un prototype fonctionnel et rédaction d’un rapport (~15-20 pages) - À rendre le lundi avant la dernière séance

## Fonctionnalités
L'application devra permettre de scanner des *QR-codes* par le biais de l'appareil photo de l'appareil mobile. Avant de proposer à l'utilisateur ou l'utilisatrice d'ouvrir le lien ou la donnée correspondante, l'application ira vérifier sur un site d'analyse de virus nommé [*Virus Total*](https://www.virustotal.com/). Ce service propose une *API*, qui sera utilisée dans ce but. Une fois l'analyse obtenue, un résumé des informations liées au contenu scanné sera affiché, à côté d'un bouton permettant d'ouvrir ledit contenu. Un historique des scans passés sera aussi accessible.

## Activités
- Mise en place de l'application *Flutter*
- Intégration de la caméra
- Lecture de *QR-code*
- Analyse de l'API utilisée
- Implémentation de l'API
- Implémentation des interfaces visuelles
- Stockage des scans
- Réalisation des tests

## Planification
- Semaine 2: Rédaction du cahier des charges
- Semaine 3: Validation du projet + Initialisation de l'application
- Semaine 4: Recherche de librairie pour scanner le QR code
- Semaine 5: L'application est capable de scanner un QR code et de récupérer la donnée
- Semaine 6: Lecture de la doc et test de l'API *VirusTotal*
- Semaine 7: L'application est capable de lancer des requêtes sur l'API
- Semaine 8: Les données de la requête sont interprétées et affichées à l'utilisateur
- Semaine 9: l'utilisateur peut accéder à l'historique des QR codes
- Semaine 10: Lors du clic, l'utilisateur est redirigé vers l'URL
- Semaine 11: Tests utilisateurs
- Semaine 12: Rapport + finition des interfaces
- Semaine 13: Rapport
- Semaine 14: Rendu
