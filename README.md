# FRENCH
# New-MVCWithSLN
Un script PowerShell pour générer un projet ASP.NET Core MVC avec authentification B2C et créer un fichier de solution associé.

## Description
Ce script PowerShell simplifie la création d'un projet MVC avec authentification B2C en générant le projet, en créant un fichier de solution (.sln) et en offrant la possibilité d'ouvrir la solution dans Visual Studio.

## Comment l'utiliser

1. Clonez ce dépôt :
   ```sh
   git clone https://github.com/Jeremy-Huleux/functionNewMVCB2CWithSLN.git
   ```
2. Ouvrez votre profil PowerShell en exécutant la commande suivante dans PowerShell :

    ```sh
    notepad $PROFILE
    ```

3. Ajoutez la ligne suivante pour charger la fonction New-MVCWithSLN à partir du dossier où vous avez cloné le dépôt :

    ```sh
    . "<chemin_vers_le_dossier_cloné>\New-MVCWithSLN.ps1"
    ```

Assurez-vous de remplacer <chemin_vers_le_dossier_cloné> par le chemin réel vers le dossier où se trouve le script New-MVCWithSLN.ps1.

4. Enregistrez et fermez votre profil PowerShell.

5. Pour charger la fonction dans votre session PowerShell actuelle, exécutez la commande suivante :

    ```sh
    . $PROFILE
    ```

Vous êtes maintenant prêt à utiliser la fonction New-MVCWithSLN pour créer des projets MVC avec authentification B2C de manière plus rapide et pratique.

## Exemple d'utilisation

Vous pouvez utiliser la fonction en spécifiant le nom du projet et, éventuellement (optionnal), le nom du fichier de solution à créer, ainsi que l'option pour ouvrir Visual Studio. Voici un exemple :

    ```
    New-MVCWithSLN -name "NomDuProjet" -solutionName "NomDuFichierSolution" -openVisualStudio
    ```

# ENGLISH
# New-MVCWithSLN
A PowerShell script to generate an ASP.NET Core MVC project with B2C authentication and create an associated solution file.

## Description
This PowerShell script simplifies the creation of an MVC project with B2C authentication by generating the project, creating a solution file (.sln), and providing the option to open the solution in Visual Studio.

## How to Use

1. Clone this repository:
   ```sh
   git clone https://github.com/Jeremy-Huleux/functionNewMVCB2CWithSLN.git
   ```

2. Open your PowerShell profile by running the following command in PowerShell:
    ```sh
    notepad $PROFILE
    ```

3. Add the following line to load the New-MVCWithSLN function from the directory where you cloned the repository:

   ```powershell
   . "<path_to_cloned_directory>\New-MVCWithSLN.ps1"
   ```
   Make sure to replace `<path_to_cloned_directory>` with the actual path to the directory where the New-MVCWithSLN.ps1 script is located.

4. Save and close your PowerShell profile.

5. To load the function into your current PowerShell session, run the following command:

    ```sh
    . $PROFILE
    ```

You are now ready to use the New-MVCWithSLN function to create MVC projects with B2C authentication more quickly and conveniently.

## Example of Use

You can use the function by specifying the project name and optionally the solution file name to create, as well as the option to open Visual Studio. Here is an example:

    ```
    New-MVCWithSLN -name "ProjectName" -solutionName "SolutionFileName" -openVisualStudio
    ```

If you need further assistance or have any more requests, feel free to let me know!
