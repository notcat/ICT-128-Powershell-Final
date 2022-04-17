# By Damon Ellenton

# Import AD
Import-Module ActiveDirectory

# Grab the path to the CSV File
$path_to_csv = Read-Host "What is the path to your csv file?" 

Write-Host $path_to_csv

if ($path_to_csv -eq "") { $path_to_csv = "C:/Users/Administrator/Desktop/RauDZ Staff List2.csv" }

Write-Host "Reading $path_to_csv ..."

$csv = Import-Csv -Path $path_to_csv

# Loop through each row in the CSV
foreach ($row in $csv) {
    $_path = $null
    $_titles = $null

    $_firstname = $row | Select-Object -ExpandProperty "First Name"
    $_lastname = $row | Select-Object -ExpandProperty "Last Name"
    $_emp_id = $row | Select-Object -ExpandProperty "Employee ID"
    # $_department = $row | Select-Object -ExpandProperty "Department"
    $_subdepartment = $row | Select-Object -ExpandProperty "Subdepartment"
    $_title = $row | Select-Object -ExpandProperty "Title"
    ## TEMPORTARRYYYYY
    #$_path = $row | Select-Object -ExpandProperty "path"
    
    $_path = "INVALID: $_subdepartment $_title"
    # Write-Host $_subdepartment $_title

    # ==== IT ====
    if ( $_subdepartment -eq "IT" -and $_title -eq "Senior Network Administrator" ) {
        $_path = "OU=IT Administrators,OU=IT Support,OU=raudz,DC=int,DC=raudz,DC=com"
        Write-Host "IT"
    }
    if ( $_subdepartment -eq "IT" -and $_title -eq "Junior Network Administrator" ) {
        $_path = "OU=IT Administrators,OU=IT Support,OU=raudz,DC=int,DC=raudz,DC=com"
        Write-Host "IT"
    }
    if ( $_subdepartment -eq "IT" -and $_title -eq "Technician" ) {
        $_path = "OU=IT Support Staff,OU=IT Support,OU=raudz,DC=int,DC=raudz,DC=com"
        Write-Host "IT"
    }

    # ==== HR ====
    if ( $_subdepartment -eq "HR" ) {
        $_titles = @("Recruiter", "HR Assistant")
        if ($_titles -contains $_title) {
            $_path = "OU=Human Resources,OU=General Staff,OU=raudz,DC=int,DC=raudz,DC=com"
            Write-Host "HR"
        }
        else {
            Write-Host = "MISSING! $_title"
        }
    }

    # ==== General Staff ====
    if ( $_subdepartment -eq "Administration") {
        $_titles = @("Receptionist", "Admin Assistant")
        if ($_titles -contains $_title) {
            $_path = "OU=General Staff, OU=raudz, DC=int, DC=raudz, DC=com"
            Write-Host "General Support"
        }
    }

    # ==== Executives Staff ====
    if ( $_subdepartment -eq "Executives") {
        $_titles = @("Co-Owner and CEO", "Co-Owner and CFO", "Chef de Cuisine", "Pastry Chef", "Restaurant Manager", "CIO", "VP - Human Resources", "VP - Finance", "VP - Marketing and PR")
        if ($_titles -contains $_title) {
            $_path = "OU=Executive Staff, OU=raudz, DC=int, DC=raudz, DC=com"
            Write-Host "Executives Staff $_title"
        }
        else {
            Write-Host = "MISSING! $_title"
        }
    }
        
    
    # ==== Front of House ====
    if ( $_subdepartment -eq "Front of House") {
        $_titles = @("Hostess", "Bartender", "Server", "Busser", "Bar-Back", "Host")
        if ($_titles -contains $_title) {
            $_path = "OU=Front of House Staff, OU=General Staff, OU=raudz, DC=int, DC=raudz, DC=com"
            Write-Host "Front of house"
        }
        else {
            Write-Host = "MISSING! $_title"
        }
    }
    
    # ==== Back of House ====
    if ( $_subdepartment -eq "Back of House") {
        $_titles = @("Sous Chef", "Line Cook", "Warewasher")
        if ($_titles -contains $_title) {
            $_path = "OU=Back of House Staff, OU=General Staff, OU=raudz, DC=int, DC=raudz, DC=com"
            Write-Host "Back of house"
        }
        else {
            Write-Host = "MISSING! $_title"
        }
    }

    Write-Host $_path


    New-ADUser -Name "$_firstname $_lastname" `
        -GivenName "$_firstname" `
        -Surname "$_lastname" `
        -EmployeeNumber "$_emp_id" `
        -Title "$_title" `
        -Department "$_subdepartment" `
        -SamAccountName "$_emp_id" `
        -AccountPassword (ConvertTo-SecureString "RaudzEmpl0y33" -AsPlainText -Force)`
        -Path "$_path" `
        -ChangePasswordAtLogon $true `
        -Enabled $true
}