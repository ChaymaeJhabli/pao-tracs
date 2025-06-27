$server = "localhost"
$port = 4000

$tcpConnection = New-Object System.Net.Sockets.TcpClient($server, $Port)
$tcpStream = $tcpConnection.GetStream()
$reader = New-Object System.IO.StreamReader($tcpStream)
$writer = New-Object System.IO.StreamWriter($tcpStream)
$writer.AutoFlush = $true

$buffer = new-object System.Byte[] 1024
$encoding = new-object System.Text.AsciiEncoding 

function reverse
{
      Param(
        [string]$str
      )
      $sb = New-Object System.Text.StringBuilder($str.Length)
      write-verbose $sb.Capacity
  
      for ($i = ($str.Length - 1); $i -ge 4; $i--)
      {
        [void]$sb.Append($str.Chars($i))
      }
 
      return $sb.ToString()
}

while ($tcpConnection.Connected)
{
    [string]$chaine = $reader.readline()
    Write-Host $chaine
        
    if ($chaine.StartsWith("FCSC"))
    {
        write-host "FOUND :)"
        write-host $chaine -ForegroundColor Green
        break
    }
        
    if ($chaine.startswith(">"))
    {    
        $verlan = reverse($chaine)
        $command = $verlan+"`n"
        write-host $command
        $writer.Write($command)
        $writer.Flush()
    }
}

$reader.Close()
$writer.Close()
$tcpConnection.Close()