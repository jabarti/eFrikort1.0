
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
	CD ..\..
	
	SET SCHEMADIR=schemas
	
	SET W0=%SCHEMADIR%\interactions\administration\DeleteCardInteraction\DeleteCardInteraction_1.0_RIVTABP21.wsdl
SET X0=%SCHEMADIR%\interactions\administration\DeleteCardInteraction\*.xsd

SET W1=%SCHEMADIR%\interactions\administration\DeleteTransactionInteraction\DeleteTransactionInteraction_1.0_RIVTABP21.wsdl
SET X1=%SCHEMADIR%\interactions\administration\DeleteTransactionInteraction\*.xsd

SET W2=%SCHEMADIR%\interactions\administration\FinishAccountInteraction\FinishAccountInteraction_1.0_RIVTABP21.wsdl
SET X2=%SCHEMADIR%\interactions\administration\FinishAccountInteraction\*.xsd

SET W3=%SCHEMADIR%\interactions\administration\GroupPersonInteraction\GroupPersonInteraction_1.0_RIVTABP21.wsdl
SET X3=%SCHEMADIR%\interactions\administration\GroupPersonInteraction\*.xsd

SET W4=%SCHEMADIR%\interactions\administration\OrderNewCardInteraction\OrderNewCardInteraction_1.0_RIVTABP21.wsdl
SET X4=%SCHEMADIR%\interactions\administration\OrderNewCardInteraction\*.xsd

SET W5=%SCHEMADIR%\interactions\administration\RegisterCardInteraction\RegisterCardInteraction_1.0_RIVTABP21.wsdl
SET X5=%SCHEMADIR%\interactions\administration\RegisterCardInteraction\*.xsd

SET W6=%SCHEMADIR%\interactions\administration\RegisterTransactionInteraction\RegisterTransactionInteraction_1.0_RIVTABP21.wsdl
SET X6=%SCHEMADIR%\interactions\administration\RegisterTransactionInteraction\*.xsd

SET W7=%SCHEMADIR%\interactions\administration\UngroupPersonInteraction\UngroupPersonInteraction_1.0_RIVTABP21.wsdl
SET X7=%SCHEMADIR%\interactions\administration\UngroupPersonInteraction\*.xsd

SET W8=%SCHEMADIR%\interactions\administration\UpdateCardInteraction\UpdateCardInteraction_1.0_RIVTABP21.wsdl
SET X8=%SCHEMADIR%\interactions\administration\UpdateCardInteraction\*.xsd

SET W9=%SCHEMADIR%\interactions\administration\UpdateTransactionInteraction\UpdateTransactionInteraction_1.0_RIVTABP21.wsdl
SET X9=%SCHEMADIR%\interactions\administration\UpdateTransactionInteraction\*.xsd

SET W10=%SCHEMADIR%\interactions\querying\GetCardForPersonInteraction\GetCardForPersonInteraction_1.0_RIVTABP21.wsdl
SET X10=%SCHEMADIR%\interactions\querying\GetCardForPersonInteraction\*.xsd

SET W11=%SCHEMADIR%\interactions\querying\GetExtendedCardForPersonInteraction\GetExtendedCardForPersonInteraction_1.0_RIVTABP21.wsdl
SET X11=%SCHEMADIR%\interactions\querying\GetExtendedCardForPersonInteraction\*.xsd

SET W12=%SCHEMADIR%\interactions\querying\GetGroupForPersonInteraction\GetGroupForPersonInteraction_1.0_RIVTABP21.wsdl
SET X12=%SCHEMADIR%\interactions\querying\GetGroupForPersonInteraction\*.xsd

SET XCORE=%SCHEMADIR%\core_components\*.xsd

SET SCHEMAS=%XCORE% %W0% %X0% %W1% %X1% %W2% %X2% %W3% %X3% %W4% %X4% %W5% %X5% %W6% %X6% %W7% %X7% %W8% %X8% %W9% %X9% %W10% %X10% %W11% %X11% %W12% %X12% 

SET OUTFILE=code_gen\wcf\generated-src\Cgi.healthcare.efrikortInteractions.cs
SET APPCONFIG=/config:code_gen\wcf\generated-src\app.config
SET NAMESPACE=/namespace:*,Riv.Cgi.healthcare.efrikort.Schemas.v1
SET SVCUTIL="svcutil.exe"
%SVCUTIL% /language:cs /syncOnly /out:%OUTFILE% %APPCONFIG% %NAMESPACE% %SCHEMAS%

ECHO Adding #pragma warning disable 1591 to %OUTFILE%
ECHO #pragma warning disable 1591 > %OUTFILE%.tmp
TYPE %OUTFILE% >> %OUTFILE%.tmp
MOVE /Y %OUTFILE%.tmp %OUTFILE%

CD code_gen\wcf
ECHO Generating Service contract .Net Binding interfaces and classes for cgi.healthcare.efrikort Release 1
ECHO I DotNetprojektet ska du ta lagga till referens till System.ServiceModel
