PythonAnywhere est un service qui permet de faire tourner des programmes en Python sur des serveurs "dans le cloud". Nous allons l'utiliser pour héberger notre site, en direct et sur Internet.

Nous allons donc mettre le blog que nous sommes en train de construire sur PythonAnywhere. Pour commencer, créez un compte « Débutant » (beginner) sur PythonAnywhere (le niveau gratuit est très bien, vous n’avez pas besoin d’une carte de crédit).

* [www.pythonanywhere.com](https://www.pythonanywhere.com/)

![La page de login de PythonAnywhere contenant un bouton pour créer le compte gratuit pour 'Débutant'](../deploy/images/pythonanywhere_beginner_account_button.png)

> **Note** Lorsque vous choisissez votre nom d'utilisateur, gardez à l'esprit que l'URL de votre blog prendra la forme `nomutilisateur.pythonanywhere.com`, alors choisissez un pseudonyme ou un nom adapté pour votre blog. Mémorisez votre mot de passe (ajoutez-le à votre gestionnaire de mot de passe, si vous en utilisez un).

## Création d’un jeton API pour PythonAnywhere

C'est quelque chose que vous n'aurez à faire qu'une seule fois. Lorsque vous serez inscrit à PythonAnywhere, vous vous retrouverez sur votre tableau de bord. Trouvez le lien en haut à droit de votre page "Compte":

![Lien du compte en haut à droite sur la page](../deploy/images/pythonanywhere_account.png)

sélectionnez l'onglet nommé "API token", et cliquez sur le bouton "Créer un nouveau jeton API".

![L'onglet API sur la page Compte](../deploy/images/pythonanywhere_create_api_token.png)