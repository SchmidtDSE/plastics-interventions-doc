---
title: Waste Trade
numbersections: true
---
This intervention allows for changing waste trade by import and export for a region.

\bigskip
<br>
<br>

# Introduction
Manipulated by other interventions and the user, this lever allows the simulation to change the waste imports and exports for a region. In this formulation, exports are considered before imports. In other words, exports are the "primary" impact and imports are the "secondary" impact.

\medskip
<br>

## Assumptions

 - Changes to exports will cause a change to imports of waste elsewhere proportional to the prior size of those imports.
 - Waste imports have the same end of life fate propensities as domestically produced waste.
 - Using net imports for waste is sufficient to represent the changes to both imports and exports.

\medskip
<br>

## External knowledge
This intervention does not use external literature to provide constants or other numbers beyond what is in the model itself.

\bigskip
<br>
<br>

# Primary impact
This intervention starts with considering changes to exports. These have an effect on other region's impoorts:

$T_{region-import} = T_{region-import} + \frac{T_{region-import}}{T_{total-import}} * \Delta_{export}$

In this step, the exports are simply distributed proportionally across the imports of other regions. Note that trade here refers to waste trade not goods trade.

\bigskip
<br>
<br>

# Secondary impact
The change in waste imports in the other regions distributes to waste fates like so:

$W_{fate} = W_{fate} - \frac{W_{fate}}{W_{total}} * \Delta_{region-import}$

This simply distributes new waste assuming the same fate propensities as prior waste. 

\medskip
<br>

## Reduction in waste
The change in exports is propagated across all waste fates in the source.

$W_{fate} = W_{fate} - \frac{W_{fate}}{W_{total}} * \Delta_{region-export}$

\bigskip
<br>
<br>

# Discussion
This technical note now turns to interactions and future work.

\medskip
<br>

## Interactions
This intervention is placed last in the pipeline because other interventions modify this value.

\medskip
<br>

## Future work
Future work may consider if imported waste has the same fate propensities as domestic waste.
