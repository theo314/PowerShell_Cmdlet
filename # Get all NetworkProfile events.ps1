# Get all NetworkProfile events
$events = Get-WinEvent -LogName System | Where-Object {$_.ProviderName -eq "NetworkProfile"}

# Process events and build the report
$report = @()
foreach ($event in $events) {
    # Convert the event to XML
    $xml = [xml]$event.ToXml()

    # Extract the necessary info
    $timestamp = $event.TimeCreated
    $id = $event.Id
    $message = $xml.Event.EventData.Data | Out-String

    # Add to the report
    $report += "Timestamp: $timestamp`r`nEvent ID: $id`r`nMessage: $message`r`n`r`n"
}

# Save report to a text file
$report | Out-File -FilePath "C:\Users\theor\OneDrive\Documents\PowerShell\Network Log\NetworkLog.txt"""

# Open the report in Notepad
notepad.exe ""C:\Users\theor\OneDrive\Documents\PowerShell\Network Log\NetworkLog.txt""
