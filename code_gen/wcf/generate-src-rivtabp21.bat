    @REM ---------------------------------------------------------------------------------
    @REM Generates c# WCF service contracts (interface), client proxies and wcf config
    @REM file for the WSDLs + XML Schemas of the service domain, using .Net WCF tool svcuti.exe
    @REM ---------------------------------------------------------------------------------
    @REM Licensed to the Apache Software Foundation (ASF) under one
    @REM or more contributor license agreements. See the NOTICE file
    @REM distributed with this work for additional information
    @REM regarding copyright ownership. Inera AB licenses this file
    @REM to you under the Apache License, Version 2.0 (the
    @REM "License"); you may not use this file except in compliance
    @REM with the License. You may obtain a copy of the License at
    @REM
    @REM http://www.apache.org/licenses/LICENSE-2.0
    @REM Unless required by applicable law or agreed to in writing,
    @REM software distributed under the License is distributed on an
    @REM "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    @REM KIND, either express or implied. See the License for the
    @REM specific language governing permissions and limitations
    @REM under the License.
    @REM ---------------------------------------------------------------------------------
CD ..

SET SCHEMADIR=..\schemas

SET W0=%SCHEMADIR%\interactions/RegisterTransactionInteraction/RegisterTransactionInteraction_3.0_RIVTABP21.wsdl
SET X0=%SCHEMADIR%\interactions/RegisterTransactionInteraction\*.xsd

SET W1=%SCHEMADIR%\interactions/UpdateTransactionInteraction/UpdateTransactionInteraction_3.0_RIVTABP21.wsdl
SET X1=%SCHEMADIR%\interactions/UpdateTransactionInteraction\*.xsd

SET W2=%SCHEMADIR%\interactions/DeleteTransactionInteraction/DeleteTransactionInteraction_3.0_RIVTABP21.wsdl
SET X2=%SCHEMADIR%\interactions/DeleteTransactionInteraction\*.xsd

SET W3=%SCHEMADIR%\interactions/DeleteCardInteraction/DeleteCardInteraction_3.0_RIVTABP21.wsdl
SET X3=%SCHEMADIR%\interactions/DeleteCardInteraction\*.xsd

SET W4=%SCHEMADIR%\interactions/RegisterCardInteraction/RegisterCardInteraction_3.0_RIVTABP21.wsdl
SET X4=%SCHEMADIR%\interactions/RegisterCardInteraction\*.xsd

SET W5=%SCHEMADIR%\interactions/UpdateCardInteraction/UpdateCardInteraction_3.0_RIVTABP21.wsdl
SET X5=%SCHEMADIR%\interactions/UpdateCardInteraction\*.xsd

SET W6=%SCHEMADIR%\interactions/RegisterOptInInteraction/RegisterOptInInteraction_3.0_RIVTABP21.wsdl
SET X6=%SCHEMADIR%\interactions/RegisterOptInInteraction\*.xsd

SET W7=%SCHEMADIR%\interactions/UpdateReadConsentInteraction/UpdateReadConsentInteraction_3.0_RIVTABP21.wsdl
SET X7=%SCHEMADIR%\interactions/UpdateReadConsentInteraction\*.xsd

SET W8=%SCHEMADIR%\interactions/RegisterOptOutInteraction/RegisterOptOutInteraction_3.0_RIVTABP21.wsdl
SET X8=%SCHEMADIR%\interactions/RegisterOptOutInteraction\*.xsd

SET W9=%SCHEMADIR%\interactions/GroupPersonInteraction/GroupPersonInteraction_3.0_RIVTABP21.wsdl
SET X9=%SCHEMADIR%\interactions/GroupPersonInteraction\*.xsd

SET W10=%SCHEMADIR%\interactions/UngroupPersonInteraction/UngroupPersonInteraction_3.0_RIVTABP21.wsdl
SET X10=%SCHEMADIR%\interactions/UngroupPersonInteraction\*.xsd

SET W11=%SCHEMADIR%\interactions/OrderNewCardInteraction/OrderNewCardInteraction_3.0_RIVTABP21.wsdl
SET X11=%SCHEMADIR%\interactions/OrderNewCardInteraction\*.xsd

SET W12=%SCHEMADIR%\interactions/GetCardForPersonInteraction/GetCardForPersonInteraction_3.0_RIVTABP21.wsdl
SET X12=%SCHEMADIR%\interactions/GetCardForPersonInteraction\*.xsd

SET W13=%SCHEMADIR%\interactions/GetExtendedCardForPersonInteraction/GetExtendedCardForPersonInteraction_3.0_RIVTABP21.wsdl
SET X13=%SCHEMADIR%\interactions/GetExtendedCardForPersonInteraction\*.xsd

SET W14=%SCHEMADIR%\interactions/GetExtendedCardsForPersonInteraction/GetExtendedCardsForPersonInteraction_3.0_RIVTABP21.wsdl
SET X14=%SCHEMADIR%\interactions/GetExtendedCardsForPersonInteraction\*.xsd

SET W15=%SCHEMADIR%\interactions/GetGroupForPersonInteraction/GetGroupForPersonInteraction_3.0_RIVTABP21.wsdl
SET X15=%SCHEMADIR%\interactions/GetGroupForPersonInteraction\*.xsd

SET XCORE=%SCHEMADIR%\core_components\*.xsd

SET SCHEMAS=%XCORE% %W0% %X0% %W1% %X1% %W2% %X2% %W3% %X3% %W4% %X4% %W5% %X5% %W6% %X6% %W7% %X7% %W8% %X8% %W9% %X9% %W10% %X10% %W11% %X11% %W12% %X12% %W13% %X13% %W14% %X14% %W15% %X15% %N1%

SET OUTFILE=/out:wcf\generated-src\efrikort_v3\eFrikortInteractions.cs
SET APPCONFIG=/config:wcf\generated-src\efrikort_v3\app.config
SET NAMESPACE=/namespace:*,Riv.Cgi.Healthcare.Efrikort.Schemas.v3
SET SVCUTIL="svcutil.exe"
%SVCUTIL% /language:cs %OUTFILE% %APPCONFIG% %NAMESPACE% %SCHEMAS%

ECHO Adding #pragma warning disable 1591 to %OUTFILE%
ECHO #pragma warning disable 1591 > %OUTFILE%.tmp
TYPE %OUTFILE% >> %OUTFILE%.tmp
MOVE /Y %OUTFILE%.tmp %OUTFILE%

CD wcf
ECHO Generating Service contract .Net Binding interfaces and classes for cgi.healthcare.efrikort Release 3
ECHO I DotNetprojektet ska du ta lagga till referens till System.ServiceModel
