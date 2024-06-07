
#Creation de la fonction New-MVCWithSLN permettant de générer un projet MVC avec authentification B2C
#ainsi que le fichier de solution associé
#Exemple d'utilisation :
#New-MVCWithSLN -projectName "ProjetFilRouge" -solutionName "ProjetFilRouge"(optionnel) -openVisualStudio(optionnel)

<#
.SYNOPSIS
Génère un projet MVC avec authentification B2C et crée un fichier de solution.

.DESCRIPTION
Cette fonction permet de générer un projet MVC avec authentification B2C, d'ajouter le projet à un fichier de solution et, en option, d'ouvrir la solution dans Visual Studio.

.PARAMETER name
Le nom du projet à générer.

.PARAMETER solutionName
Le nom du fichier de solution à créer. (Optionnel)

.SWITCH openVisualStudio
Spécifie si Visual Studio doit être ouvert avec la solution générée.

.EXAMPLE
New-MVCWithSLN -name "ProjetFilRouge" -solutionName "ProjetFilRouge" -openVisualStudio
Génère un projet MVC avec authentification B2C, crée un fichier de solution nommé "ProjetFilRouge.sln" et ouvre la solution dans Visual Studio.

#>
function New-MVCWithSLN {
    
    [CmdletBinding()]

    param(
        [string]$name,
        [string]$solutionName,
        [switch]$openVisualStudio
    )
    #Empeche l'execution de la fonction si le HELP est appelé 
    if($pname -eq "--help"){
        Get-Help New-MVCWithSLN -Detailed
        return
    }
    if($pname -eq "--h"){
        Get-Help New-MVCWithSLN -Detailed
        return
    }
    if($pname -eq "-h"){
        Get-Help New-MVCWithSLN -Detailed
        return
    }
    if($pname -eq "-help"){
        Get-Help New-MVCWithSLN -Detailed
        return
    }
    # Vérifier si le paramètre name est spécifié
    if (-not $name) {
        Write-Error "Le paramètre name est obligatoire. Utilisez --help pour obtenir de l'aide."
        return
    }
    if($solutionName){
        # Vérifier si le nom du fichier de solution est valide
        if ($solutionName -notmatch '^[a-zA-Z0-9_\-]+$') {
            Write-Error "Le nom du fichier de solution ne doit contenir que des lettres, des chiffres, des tirets et des traits de soulignement."
            return
        }
    }
    # Vérifier si le nom du projet est valide
    if($name -notmatch '^[a-zA-Z0-9_\-]+$') {
        Write-Error "Le nom du projet ne doit contenir que des lettres, des chiffres, des tirets et des traits de soulignement."
        return
    }
    # Vérifier si un fichier de solution avec le nom spécifié existe déjà
    if($name -and (Test-Path "$solutionName.sln")) {
        Write-Error "Un fichier de solution avec le nom $solutionName.sln existe déjà dans le répertoire actuel."
        return
    }
    # Vérifier si un dossier avec le nom du projet existe déjà
    if(Test-Path $name) {
        Write-Error "Un dossier avec le nom $name existe déjà dans le répertoire actuel."
        return
    }
    # Générer le projet MVC avec authentification B2C si le nom du projet est spécifié
    if($name){
        # Générer le projet MVC avec authentification B2C
        dotnet new mvc --name $name --auth IndividualB2C
        
        # Aller dans le dossier du projet généré
        Set-Location $name
        # Enregistrer la solution dans un fichier .sln avec le nom spécifié ou par défaut le nom du projet
        if($solutionName){
            dotnet new sln -n $solutionName
            dotnet sln $solutionName".sln" add $name".csproj"
            
        } else {
            dotnet new sln -n $name
            dotnet sln $name".sln" add $name".csproj"
        }
        # Ouvrir Visual Studio avec le fichier de solution généré si l'option est activée
        if ($openVisualStudio) {
            $solutionFile = Get-Item .\*.sln
            if (-not $solutionFile) {
                $solutionFile = Get-ChildItem -Filter *.sln -Recurse | Select-Object -First 1
            }
            if ($solutionFile) {
                devenv.exe $solutionFile
            } else {
                Write-Host "Aucun fichier .sln trouvé dans le répertoire actuel ou ses sous-repertoires."
                Write-Host "Lancement de Visual Studio sans solution..."
                devenv.exe
            }
        }
    }
}