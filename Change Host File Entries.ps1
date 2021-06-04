$file = "$env:windir\System32\drivers\etc\hosts";
Clear-Content $file;
"192.3.0.11 SRV-TNW-AMQ" | Add-Content -PassThru $file;
"192.3.0.11 SRV-TNW-AMQ.LAWTONOK.GOV" | Add-Content -PassThru $file;
"192.3.0.13 SRV-TNW-GIS" | Add-Content -PassThru $file;
"192.3.0.13 SRV-TNW-GIS.LAWTONOK.GOV" | Add-Content -PassThru $file;
"192.3.0.12 SRV-TNW-MSS" | Add-Content -PassThru $file;
"192.3.0.12 SRV-TNW-MSS.LAWTONOK.GOV" | Add-Content -PassThru $file;
ipconfig /flushdns