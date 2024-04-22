---
title: Min Reuse Rate
numbersections: true
---
This intervention extends the lifecycle duration of products, reducing consumption and waste in the process.

\bigskip
<br>
<br>

# Introduction
This intervention is mechanistic and does not use significant external literature support. Even still, it makes a number of important and often user configurable assumptions.

\medskip
<br>

## Assumptions

- The user provides an estimation of what percent of products in a sector are mandated to become reusable ($\%_{mandate}$).
- Though reuse extends end of life, there is some expected rate at which those products retire ($r$).$.
- Goods which are reused are recycled when they are retired.
- Like through price increase, there is some lost consumption rate ($l$) caused by the intervention though this is assumed to be zero by default.
- There is some marginal percentage increase $x$ in material consumption to support reusable products. See web application for default values.

\medskip
<br>

## External knowledge
This intervention does not use external literature to provide constants or other numbers beyond what is in the model itself.

\bigskip
<br>
<br>

# Primary impact
This intervention assumes a minimum reuse mandate changing over time which serves primarily to reduce consumption as follows.

## Reduction of consumption
Starting with the effect of consumption, the following occurs in repetition longitudinally where $\Delta_{reuse}$ refers to drop in consumption due to reuse but $\Delta_{product}$ refers to increase material usage in products to support reusability:

$C_{sector} = C_{sector} - \Delta_{reuse} + \Delta_{product}$

$C_{sector} = C_{sector} - (C_{sector} * \%_{mandate} * (1 - r) + l * C_{sector} * \%_{mandate}) + (C_{sector} * \%_{mandate} - l * C_{sector} * \%_{mandate}) * x$

$C_{sector} = C_{sector} * (1 - \%_{mandate} * (1 - r) - l * \%_{mandate} + \%_{mandate} * x - l * \%_{mandate} * x)$

$C_{sector} = C_{sector} * (1 + \%_{mandate} * (x + r - 1) - (1 + x) * l * \%_{mandate})$

This has secondary effects on waste and trade as described below.

## Retirement
Of course, these goods do not last forever and some product retirement into recycling is expected:

$W_{recycling} = W_{recycling} + \%_{mandate} * r * C_{sector}$

Note that this causes a change in fate ratios. See discussion about interactions with recycling interventions.

\bigskip
<br>
<br>

# Secondary impact
The decrease in consumption causes a reduction in waste and trade.

\medskip
<br>

## Reduction in waste
The change in consumption is propagated across all waste fates.

$W_{fate} = W_{fate} - \frac{W_{fate}}{W_{total}} * \Delta_{reuse}$

Note that this incurs GHG implications for not just consumption but also waste.

\medskip
<br>

## Reduction in trade
Imports are reduced due to loss in consumption:

$T_{import} = T_{import} - \frac{T_{import}}{C_{total}} * \Delta_{reuse}$

This additional consumption has tertiary effects on exports from other regions.

\bigskip
<br>
<br>

# Tertiary effects
Due to change in imports, the following change is expected across exports from other regions:

$T_{region-export} = T_{region-export} - \frac{T_{region-export}}{T_{total-export}} * \Delta_{import}$

Note that this incurs an effect on GHG in exporter regions.

\bigskip
<br>
<br>

# Discussion
This technical note now turns to interactions and time delays before discussing future work.

\medskip
<br>

## Interactions
One of this intervention's primary mechanisms is influencing consumption. After consumption has been modified by bans, taxes, and caps, this intervention arrives at a mass displacement which has effects across all EOL fates but disproportionately in non-recycling. Therefore, this intervention must be considered prior to recycling constraints.

## Time delays
Note that these impacts happen in the future after the reusable product enters consumption. In other words, these consumption effects are delayed both by policy start of phase in and, to identify the future products displaced, the lifecycle of the products had they not been reusable. In practice, this intervention expects this time displacement of lifecycle duration.

## Candidate products
The intervention so far applies to all products in a sector but not all goods may be made reusable like in medical applications. Therefore, in practice, the web application also exposes a parameter for percent of goods which are candidates to be made reusable.

## Other interventions
Note that reuse is often complemented by other interventions such as expanded recycling infrastructure and collection mandates to ensure reused goods can be recycled at their delayed end of life. In practice, the modeling team sometimes refers to a reuse plus recycling scenario which has multiple paths. For example, see [related multi-policy scenario](https://global-plastics-tool.org/?chinaAdditivesEmissionsConversion=1036&chinaAdditivesEmissionsProduction=2200&chinaHDPEEmissionsConversion=1123&chinaHDPEEmissionsProduction=1949&chinaIncinerationCost=150&chinaIncinerationEmissions=1324&chinaIncinerationPlasticPercent=12&chinaLandfillCost=170&chinaLandfillEmissions=89&chinaLandfillPlasticPercent=12&chinaLLDPEEmissionsConversion=1088&chinaLLDPEEmissionsProduction=1962&chinaMismanagedEmissions=0&chinaOtherThermoplasticsEmissionsConversion=1036&chinaOtherThermoplasticsEmissionsProduction=2837&chinaOtherThermosetsEmissionsConversion=1036&chinaOtherThermosetsEmissionsProduction=2837&chinaPercentAgricultureAdditives=0&chinaPercentConstructionAdditives=1.68&chinaPercentElectronicAdditives=1.87&chinaPercentHouseholdLeisureSportsAdditives=1.41&chinaPercentOtherAdditives=0&chinaPercentPackagingAdditives=0.31&chinaPercentPS=1.3&chinaPercentSingleUse=48&chinaPercentTextileAdditives=0&chinaPercentTransportationAdditives=1.93&chinaPETEmissionsConversion=805&chinaPETEmissionsProduction=3332&chinaPPAEmissionsConversion=2700&chinaPPAEmissionsProduction=3625&chinaPPEmissionsConversion=1366&chinaPPEmissionsProduction=1983&chinaPSEmissionsConversion=1240&chinaPSEmissionsProduction=3517&chinaPUREmissionsConversion=2700&chinaPUREmissionsProduction=4900&chinaPVCEmissionsConversion=593&chinaPVCEmissionsProduction=2066&chinaRecyclingCost=815&chinaRecyclingEmissions=906&chinaTaxMultiplier=0.09&chinaTaxPower=1.14&consumptionAgricultureLifecycle=2&consumptionConstructionLifecycle=35&consumptionElectronicLifecycle=8&consumptionHouseholdLeisureSportsLifecycle=3&consumptionOtherLifecycle=5&consumptionPackagingLifecycle=0.5&consumptionTextileLifecycle=5&consumptionTransportationLifecycle=13&emissionPercentProductImporter=100&emissionPercentWasteExporter=100&endYearGradual=2040&endYearImmediate=2030&eu30AdditivesEmissionsConversion=1036&eu30AdditivesEmissionsProduction=2200&eu30HDPEEmissionsConversion=1123&eu30HDPEEmissionsProduction=1949&eu30IncinerationCost=290&eu30IncinerationEmissions=1324&eu30IncinerationPlasticPercent=11.5&eu30LandfillCost=80&eu30LandfillEmissions=89&eu30LandfillPlasticPercent=11.5&eu30LLDPEEmissionsConversion=1088&eu30LLDPEEmissionsProduction=1962&eu30MismanagedEmissions=0&eu30OtherThermoplasticsEmissionsConversion=1036&eu30OtherThermoplasticsEmissionsProduction=2837&eu30OtherThermosetsEmissionsConversion=1036&eu30OtherThermosetsEmissionsProduction=2837&eu30PercentAgricultureAdditives=0&eu30PercentConstructionAdditives=1.68&eu30PercentElectronicAdditives=1.87&eu30PercentHouseholdLeisureSportsAdditives=1.41&eu30PercentOtherAdditives=0&eu30PercentPackagingAdditives=0.31&eu30PercentPS=2.2&eu30PercentSingleUse=31&eu30PercentTextileAdditives=0&eu30PercentTransportationAdditives=1.93&eu30PETEmissionsConversion=805&eu30PETEmissionsProduction=3332&eu30PPAEmissionsConversion=2700&eu30PPAEmissionsProduction=3625&eu30PPEmissionsConversion=1366&eu30PPEmissionsProduction=1983&eu30PSEmissionsConversion=1240&eu30PSEmissionsProduction=3517&eu30PUREmissionsConversion=2700&eu30PUREmissionsProduction=4900&eu30PVCEmissionsConversion=593&eu30PVCEmissionsProduction=2066&eu30RecyclingCost=1105&eu30RecyclingEmissions=906&eu30TaxMultiplier=0.56&eu30TaxPower=0.12&exhaustedPercentRecycled=100&naftaAdditivesEmissionsConversion=1036&naftaAdditivesEmissionsProduction=2200&naftaHDPEEmissionsConversion=1123&naftaHDPEEmissionsProduction=1949&naftaIncinerationCost=220&naftaIncinerationEmissions=1324&naftaIncinerationPlasticPercent=12&naftaLandfillCost=190&naftaLandfillEmissions=89&naftaLandfillPlasticPercent=12&naftaLLDPEEmissionsConversion=1088&naftaLLDPEEmissionsProduction=1962&naftaMismanagedEmissions=0&naftaOtherThermoplasticsEmissionsConversion=1036&naftaOtherThermoplasticsEmissionsProduction=2837&naftaOtherThermosetsEmissionsConversion=1036&naftaOtherThermosetsEmissionsProduction=2837&naftaPercentAgricultureAdditives=0&naftaPercentConstructionAdditives=1.68&naftaPercentElectronicAdditives=1.87&naftaPercentHouseholdLeisureSportsAdditives=1.41&naftaPercentOtherAdditives=0&naftaPercentPackagingAdditives=0.31&naftaPercentPS=1.7&naftaPercentSingleUse=46&naftaPercentTextileAdditives=0&naftaPercentTransportationAdditives=1.93&naftaPETEmissionsConversion=805&naftaPETEmissionsProduction=3332&naftaPPAEmissionsConversion=2700&naftaPPAEmissionsProduction=3625&naftaPPEmissionsConversion=1366&naftaPPEmissionsProduction=1983&naftaPSEmissionsConversion=1240&naftaPSEmissionsProduction=3517&naftaPUREmissionsConversion=2700&naftaPUREmissionsProduction=4900&naftaPVCEmissionsConversion=593&naftaPVCEmissionsProduction=2066&naftaRecyclingCost=960&naftaRecyclingEmissions=906&naftaTaxMultiplier=0.12&naftaTaxPower=0.83&percentReusableCandidate=50&recyclingContentLostConsumption=0&recyclingDelay=1&recyclingDisplacementRate=50&recyclingLostBackfillRate=50&reusableAddedMaterial=150&reuseLostConsumption=0&rowAdditivesEmissionsConversion=1036&rowAdditivesEmissionsProduction=2200&rowHDPEEmissionsConversion=1123&rowHDPEEmissionsProduction=1949&rowIncinerationCost=100&rowIncinerationEmissions=1324&rowIncinerationPlasticPercent=12&rowLandfillCost=220&rowLandfillEmissions=89&rowLandfillPlasticPercent=12&rowLLDPEEmissionsConversion=1088&rowLLDPEEmissionsProduction=1962&rowMismanagedEmissions=0&rowOtherThermoplasticsEmissionsConversion=1036&rowOtherThermoplasticsEmissionsProduction=2837&rowOtherThermosetsEmissionsConversion=1036&rowOtherThermosetsEmissionsProduction=2837&rowPercentAgricultureAdditives=0&rowPercentConstructionAdditives=1.68&rowPercentElectronicAdditives=1.87&rowPercentHouseholdLeisureSportsAdditives=1.41&rowPercentOtherAdditives=0&rowPercentPackagingAdditives=0.31&rowPercentPS=1.7&rowPercentSingleUse=48&rowPercentTextileAdditives=0&rowPercentTransportationAdditives=1.93&rowPETEmissionsConversion=805&rowPETEmissionsProduction=3332&rowPPAEmissionsConversion=2700&rowPPAEmissionsProduction=3625&rowPPEmissionsConversion=1366&rowPPEmissionsProduction=1983&rowPSEmissionsConversion=1240&rowPSEmissionsProduction=3517&rowPUREmissionsConversion=2700&rowPUREmissionsProduction=4900&rowPVCEmissionsConversion=593&rowPVCEmissionsProduction=2066&rowRecyclingCost=530&rowRecyclingEmissions=906&rowTaxMultiplier=0.12&rowTaxPower=0.83&startYear=2025&chinaAdditivesPercentReduction=0&eu30AdditivesPercentReduction=0&naftaAdditivesPercentReduction=0&rowAdditivesPercentReduction=0&chinaReuseExhaustion=10&chinaYieldLoss=20&eu30ReuseExhaustion=10&eu30YieldLoss=20&naftaReuseExhaustion=10&naftaYieldLoss=20&rowReuseExhaustion=10&rowYieldLoss=20&chinaPercentReduceProblematicPackaging=0&chinaPercentReducePs=0&eu30PercentReduceProblematicPackaging=0&eu30PercentReducePs=0&naftaPercentReduceProblematicPackaging=0&naftaPercentReducePs=0&rowPercentReduceProblematicPackaging=0&rowPercentReducePs=0&chinaVirginPlasticCap=300&eu30VirginPlasticCap=300&naftaVirginPlasticCap=300&rowVirginPlasticCap=300&chinaPackagingTax=0&eu30PackagingTax=0&naftaPackagingTax=0&rowPackagingTax=0&chinaLandfillInvestment=0&eu30LandfillInvestment=0&naftaLandfillInvestment=0&rowLandfillInvestment=0&chinaIncinerationInvestment=0&eu30IncinerationInvestment=0&naftaIncinerationInvestment=0&rowIncinerationInvestment=0&chinaRecyclingInvestment=25&eu30RecyclingInvestment=25&naftaRecyclingInvestment=25&rowRecyclingInvestment=25&chinaMaximumMismanagedRate=100&eu30MaximumMismanagedRate=100&naftaMaximumMismanagedRate=100&rowMaximumMismanagedRate=100&chinaMinimumRecyclingRate=40&eu30MinimumRecyclingRate=40&naftaMinimumRecyclingRate=40&rowMinimumRecyclingRate=40&chinaMinimumReuseAll=60&eu30MinimumReuseAll=60&naftaMinimumReuseAll=60&rowMinimumReuseAll=60&chinaMinimumReusePackaging=0&eu30MinimumReusePackaging=0&naftaMinimumReusePackaging=0&rowMinimumReusePackaging=0&chinaMinimumRecycledContent=0&eu30MinimumRecycledContent=0&naftaMinimumRecycledContent=0&rowMinimumRecycledContent=0&chinaWasteTradeReduction=0&eu30WasteTradeReduction=0&naftaWasteTradeReduction=0&rowWasteTradeReduction=0&chinaDeltaWasteExport=0&eu30DeltaWasteExport=0&naftaDeltaWasteExport=0&prototype=0&rowDeltaWasteExport=0&chinaDeltaWasteImport=0&eu30DeltaWasteImport=0&naftaDeltaWasteImport=0&rowDeltaWasteImport=0&chinaMinGHGReduction=0&eu30MinGHGReduction=0&naftaMinGHGReduction=0&rowMinGHGReduction=0).

## Future work
This intervention is sensitive to the retirement rate and marignal added material usage, both of which may require further investigation, especially for non-packaging products.

\medskip
<br>
