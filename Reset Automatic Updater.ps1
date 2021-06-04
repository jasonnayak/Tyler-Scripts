Stop-Service -Name "NewWorldUpdaterService";
Get-ChildItem "C:\ProgramData\New World Systems\New World Updater\registry" -Recurse | ForEach { Remove-Item $_.FullName -Force -Recurse };
Get-ChildItem "C:\ProgramData\New World Systems\New World Updater\applications" -Recurse | ForEach { Remove-Item $_.FullName -Force -Recurse };
Get-ChildItem "C:\ProgramData\New World Systems\New World Updater\downloader" -Recurse | ForEach { Remove-Item $_.FullName -Force -Recurse };
Get-ChildItem "C:\ProgramData\New World Systems\New World Updater\MsiCache" -Recurse | ForEach { Remove-Item $_.FullName -Force -Recurse };

$NewWorld = "C:\Program Files (x86)\New World Systems\New World Automatic Updater\NewWorld.Management.Updater.Service.exe.config";

Clear-Content $NewWorld;

$NewWorldConfiguration = @"
<?xml version="1.0"?>
<configuration>
  <configSections>
    <section name="dataConfiguration" type="Microsoft.Practices.EnterpriseLibrary.Data.Configuration.DatabaseSettings, Microsoft.Practices.EnterpriseLibrary.Data, Version=3.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"/>
    <section name="enterpriseLibrary.ConfigurationSource" type="Microsoft.Practices.EnterpriseLibrary.Common.Configuration.ConfigurationSourceSection, Microsoft.Practices.EnterpriseLibrary.Common, Version=3.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"/>
    <section name="UpdaterConfiguration" type="Microsoft.ApplicationBlocks.Updater.Configuration.ApplicationUpdaterSettings, Microsoft.ApplicationBlocks.Updater"/>
    <section name="UpdaterServiceConfiguration" type="NewWorld.Management.Updater.Service.Configuration.UpdaterServiceSettings, NewWorld.Management.Updater.Service"/>
    <section name="loggingConfiguration" type="Microsoft.Practices.EnterpriseLibrary.Logging.Configuration.LoggingSettings, Microsoft.Practices.EnterpriseLibrary.Logging, Version=3.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"/>
  </configSections>
  <loggingConfiguration name="Logging Application Block" tracingEnabled="true" defaultCategory="" logWarningsWhenNoCategoriesMatch="true">
    <listeners>
      <add source="New World Updater service" formatter="Text Formatter" log="Application" machineName="" listenerDataType="Microsoft.Practices.EnterpriseLibrary.Logging.Configuration.FormattedEventLogTraceListenerData, Microsoft.Practices.EnterpriseLibrary.Logging, Version=3.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" traceOutputOptions="None" type="Microsoft.Practices.EnterpriseLibrary.Logging.TraceListeners.FormattedEventLogTraceListener, Microsoft.Practices.EnterpriseLibrary.Logging, Version=3.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" name="EventLogger"/>
      <add fileName="NWSUpdaterService.log" rollSizeKB="1024" timeStampPattern="yyyy-MM-dd" rollFileExistsBehavior="Overwrite" rollInterval="None" formatter="Text Formatter" header="----------------------------------------" footer="----------------------------------------" listenerDataType="Microsoft.Practices.EnterpriseLibrary.Logging.Configuration.RollingFlatFileTraceListenerData, Microsoft.Practices.EnterpriseLibrary.Logging, Version=3.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" traceOutputOptions="None" type="Microsoft.Practices.EnterpriseLibrary.Logging.TraceListeners.RollingFlatFileTraceListener, Microsoft.Practices.EnterpriseLibrary.Logging, Version=3.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" name="RollingFlatFile"/>
    </listeners>
    <formatters>
      <add template="Timestamp: {timestamp}
Source: {title}
Message: {message}
Category: {category}
Severity: {severity}
Thread: ({win32ThreadId}) {threadName}" type="Microsoft.Practices.EnterpriseLibrary.Logging.Formatters.TextFormatter, Microsoft.Practices.EnterpriseLibrary.Logging, Version=3.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" name="Text Formatter"/>
    </formatters>
    <specialSources>
      <allEvents switchValue="All" name="All Events">
        <listeners>
          <add name="RollingFlatFile"/>
        </listeners>
      </allEvents>
      <notProcessed switchValue="All" name="Unprocessed Category"/>
      <errors switchValue="All" name="Logging Errors &amp; Warnings"/>
    </specialSources>
  </loggingConfiguration>
  <enterpriseLibrary.ConfigurationSource selectedSource="System Configuration Source">
    <sources>
      <add name="System Configuration Source" type="Microsoft.Practices.EnterpriseLibrary.Common.Configuration.SystemConfigurationSource, Microsoft.Practices.EnterpriseLibrary.Common, Version=3.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"/>
    </sources>
  </enterpriseLibrary.ConfigurationSource>
  <UpdaterServiceConfiguration checkForUpdatesOnStartup="true" checkForUpdatesInterval="01:00:00" useNetworkMonitorService="true">
    <applications>
      <add id="Police Client" manifestUri="http://SRV-TNW-MSS/MobileUpdates/Police Client/Update.xml" location="C:\Program Files (x86)\New World Systems\Aegis Mobile\"/>
      <add id="OK0160100" manifestUri="http://SRV-TNW-MSS/MobileUpdates/OK0160100/Update.xml" location="C:\Program Files (x86)\New World Systems\Aegis Mobile\"/>
    <add id="MOBILE GIS DATA" manifestUri="http://srv-tnw-gis.lawtonok.gov/NwsUpdaterStores/Prod/GIS/Mobile/GisUpdateManifest.xml" location="."/><add id="GIS Components x86" manifestUri="http://srv-tnw-gis.lawtonok.gov/NwsUpdaterStores/GISComponentsx86/GisComponentsX86.Manifest.xml" location="."/><add id="NWPS novaPDF COM x64" manifestUri="http://srv-tnw-mss.lawtonok.gov/MobileUpdates/NWPSnovaPDF/novaPDF8COMx64.Manifest.xml" location="."/><add id="NWPS novaPDF COM x86" manifestUri="http://srv-tnw-mss.lawtonok.gov/MobileUpdates/NWPSnovaPDF/novaPDF8COMx86.Manifest.xml" location="."/><add id="NWPS novaPDF Printer Driver x64" manifestUri="http://srv-tnw-mss.lawtonok.gov/MobileUpdates/NWPSnovaPDF/novaPDF8PrinterDriverx64.Manifest.xml" location="."/><add id="NWPS novaPDF SDK x64" manifestUri="http://srv-tnw-mss.lawtonok.gov/MobileUpdates/NWPSnovaPDF/novaPDF8SDKx64.Manifest.xml" location="."/><add id="Microsoft Report Viewer" manifestUri="http://srv-tnw-mss.lawtonok.gov/MobileUpdates/Microsoft ReportViewer/MicrosoftReportViewer.x64.Manifest.xml" location="."/></applications>
  </UpdaterServiceConfiguration>
  <UpdaterConfiguration defaultDownloader="BITS" applicationId="." manifestUri="." basePath="New World Systems\New World Updater\">
    <downloaders>
      <add name="BITS" type="Microsoft.ApplicationBlocks.Updater.Downloaders.BitsDownloader, Microsoft.ApplicationBlocks.Updater.Downloaders" authenticationScheme="BG_AUTH_SCHEME_NTLM" targetServerType="BG_AUTH_TARGET_SERVER"/>
    </downloaders>
  </UpdaterConfiguration>
  <system.runtime.remoting>
    <application name="UpdaterService">
      <service>
        <wellknown type="NewWorld.Management.Updater.Service.UpdateService, NewWorld.Management.Updater.Service" objectUri="UpdateService" mode="SingleCall"/>
      </service>
      <channels>
        <channel ref="ipc" portName="NewWorldUpdaterService" authorizedGroup="Everyone" exclusiveAddressUse="false"/>
      </channels>
    </application>
  </system.runtime.remoting>
  <system.serviceModel>
    <bindings>
      <netNamedPipeBinding>
        <binding name="NetNamedPipeBinding_INetworkMonitorService">
          <security mode="None"/>
        </binding>
      </netNamedPipeBinding>
    </bindings>
    <client>
      <endpoint address="net.pipe://localhost/NewWorld/NetworkMonitor" binding="netNamedPipeBinding" bindingConfiguration="NetNamedPipeBinding_INetworkMonitorService" contract="NetworkMonitorService.INetworkMonitorService" name="NetNamedPipeBinding_INetworkMonitorService"/>
    </client>
  </system.serviceModel>
</configuration>
"@ | Add-Content -PassThru $NewWorld;
Start-Service -Name "NewWorldUpdaterService"