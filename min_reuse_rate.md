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
- Though reuse extends end of life, there is some expected rate at which those products retire ($r$).
- Goods which are reused are recycled when they are retired.
- Like through price increase, there is some lost consumption rate ($l$) caused by the intervention though this is assumed to be zero by default.
- There is some marginal percentage increase $x$ in material consumption to support reusable products.

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

## Returement
Of course, these goods do not last forever and some product retirement into recycling is expected:

$W_{recycling} = W_{recycling} + \%_{mandate} * r * C_{sector}$

Note that this causes a change in fate ratios.

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

\medskip
<br>

## Future work
This intervention is sensitive to the retirement rate and may require further investigation, especially for non-packaging products.
