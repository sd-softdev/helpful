<#
$PSVersionTable

Get-Alias => Übersetzungsliste von cmd Befehlen zu PowerShell

Get-Service | Select-Object -Property Name, Status => Ausgabe von 'Get-Service' wird an das nächste cmdlet weitergegeben und dort weiterverarbeitet
Get-Service | Measure-Object => 'Measure-Object' Gibt eine Tabelle über die übergebenden Objekte aus

Get-Service | Where-Object { $_.Status -eq 'Stopped' } => Filter die Ausgabe
Get-Service | where -Property Status -eq 'Stopped' => Alternative zu 'Get-Service | Where-Object { $_.Status -eq 'Stopped' }'
Get-Service | Where-Object { $_.Status -eq 'Stopped' } | Measure-Object | Select-Object -ExpandProperty Count => Verkettung von Befehlen
Get-Service | Where-Object { $_.Status -eq 'Stopped' } | Sort-Object Name -unique => 'Sort-Object Name -Unique' Sortiert die Objekte nach dem Property 'Name' und mache eine unique liste daraus

# Good2Know
## Allgemein
- Rückgabewerte sind immer Objekte bzw. Listen von Objekten
##Erlauben vom ausführen der skripte
- Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
- Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine
##About
- Get-Help about_<module/function-name>

##Variablen
- Impliziete Typedeklaration
- $varname = 123 => die variable ist int 123
- $allServices = Get-Service => liste aller service objekten

## Where-Object
- Bei, z.B. 'Where-Object { $_.Status -eq 'Stopped' }' ist die Variable '$_' das Objectproperty in der Pipe; '-eq' steht für equal (Vergleichsoperator)
- Alternativ 'Where-Object -Property Name -Like 'asd*'

##Listen/Array
- $array = '1', '2' => Array of Object
- $list = New-Object -TypeName System.Collections.ArrayList => echtes List object

## Hashtable/Dictonary
- $dd = @{'a'='foor'; 'b'='bar'}

##Scripts
###parameter
param([
    [Parameter(Mandatory = $true)] => $varname1 ist pflicht
    [string]$varname1,
    [int32]$varname2
)
###if
alle operatoren: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.1

if($ -eq 'a'){
}else{
}

###Foreach
foreach($item in @(1,5,9,15)){
$item.GetType()
if($item -eq 5){break;}
}

##Modules
- Get-Module => Zeigt geladene Module
- Get-Module -ListAvailable => zeigt alle auf dem System verfügbaren Module
- Import-Module <Modulname> => import das modul
- Get-Command -Module <Modulname> => Listet alle verfügabren Kommandos dieses Moduls

##klassen
class Benutzer {
    [int32]§ID
    [string]$Name
    [DateTime]$Datum
}
#>

cd C:\Users\Daniel\Projekte\user-auth\server