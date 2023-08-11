---
title: Min Recycled Content
numbersections: true
---
This intervention redirects waste from other end of life fates to recycling. It is used in the "40% Minimum Recycled Content" scenario.

\bigskip
<br>
<br>

# Assumptions

- There is a displacement rate $l$ which describes at what rate consumption goes down due to price increase caused by increased minimum recycled material where this is the rate at which required recycled material needed to meet the mandate is actually recycled. 
- $l$ is set to zero by default meaning that there is no loss in consumption.
- This intervention is assumed to have the minimum recycled content mandate go up from 2024 to the end date (2050 by default).
- A lag is expected from change in waste to change in consumption and production (default of 3 years).

\bigskip
<br>
<br>

# Primary impact
This intervention assumes a minimum recycled content mandate ($\%_{mandate}$) changing over time which can be used to define the required amount of recycled material needed:

$W_{recycling-need} = C_{total} * \%_{mandate}$

The change in recycling needed becomes:

$\Delta_{recycling} = max(W_{recycling-need} - W_{recycling}, 0)$

This delta then either reduces consumption or redirects waste from other fates to recycling. Note that the tool limits $\Delta_{recycling}$ to $[0, W_{nonrecycling}]$.

\medskip
<br>

## Reduce consumption 
Though $l$ is set to zero by default, consumption is reduced as follows:

$C_{sector} = C_{sector} - \frac{C_{sector}}{C_{total}} * \Delta_{recycling} * l$

This has secondary effects on waste and trade as described below.

\medskip
<br>

## Redirect waste
Waste is redirected from other fates to support the need for more recycled materials.

$W_{fate} = W_{fate} - \frac{W_{fate}}{W_{nonrecycling}} * \Delta_{recycling} * (1 - l)$

In the default cause, $1 - l$ equals one.

\bigskip
<br>
<br>

# Secondary impact
The decrease in consumption causes a reduction in waste and trade.

\medskip
<br>

## Reduction in waste
The change in consumption is propagated across all waste fates.

$W_{fate} = W_{fate} - \frac{W_{fate}}{W_{total}} * \Delta_{recycling} * l$

By default, with $l = 0$, no change is actually made in this step.

\medskip
<br>

## Reduction in trade
Imports are reduced due to loss in consumption:

$P_{import} = P_{import} - \frac{P_{import}}{P_{total}} * \Delta_{recycling} * l$

This additional consumption has tertiary effects on exports from other regions.

\bigskip
<br>
<br>

# Tertiary effects
Due to change in imports, the following change is expected across exports from other regions:

$P_{region-export} = P_{region-export} - \frac{P_{region-export}}{P_{total-export}} * \Delta_{import}$

Note that, if $l = 0$ like in the default case, this has no effect.

\bigskip
<br>
<br>

# Future work
Further conversation about the appropriate default $l$.