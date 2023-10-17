---
title: Recycling Investment
numbersections: true
bibliography: sources.bib
---
This intervention increases the recycling rate by increasing capacity for collection, sorting, and processing. It is used by the "X Billion USD for Plastic Recycling" scenario.

\bigskip
<br>
<br>

# Introduction
This intervention relies on information about capital and operating expense to recycle a certain mass of plastics.

\medskip
<br>

## Assumptions

- There is a displacement rate $d$ which, though user configurable, is non-zero by default and describes how much of virgin plastic production is reduced or displaced by newly available recycled material.
- Displacement rate $d$ may cause consumption to go up as a result of increased recycling: more recycled material is available but it does not fully offset existing production by the same amount, resulting in more plastics goods being made overall.
- This intervention is assumed to have recycling rate go up gradually and linearly from a selectable start date to the configurable end date.
- A lag is expected from when the recycling increases to when that newly recycled material is available for consumption (default of 1 year).
- There is a change from consumption to waste generation that is not immediate but, instead, governed by sector lifetime distributions.
- Capital expenditure is amortized over 50 years.
- All new recycling capacity introduced will be used for plastics.
- If the capacity is built for recycling, it will be used by the public.
- Expenses are different in each region.
- There are known region specific observed values for mass of plastic waste recycled ($m_{recycling}$) and both the operating cost ($r_{opex}$) and capital expenditure ($r_{capex}$).

\medskip
<br>

## External knowledge
This uses materials describing capital and operating expenditures for recycling facilities [@lau2020].

\bigskip
<br>
<br>

# Primary impact
This intervention assumes a recycling increase ($m_{increase}$) changing over time:

$\Delta_{recycling} = min(m_{increase}, W_{non-recycling})$

This is applied to recycling:

$W_{recycling} = W_{recycling} + \Delta_{recycling}$

This delta is then offset for the non-recycling fates like so:

$W_{fate} = W_{fate} - \frac{W_{fate}}{W_{nonrecycling}} * \Delta_{recycling}$

Note that investment is a mix of capital and operating expense:

$r_{annual} = r_{annual-opex} + \frac{r_{capex}}{50}$

This intervention assumes a potential change in the incineration ($m_{increase}$) over time based on an investment $I$:

$m_{increase} = I * \frac{m_{recycling}}{r_{annual}}$

See secondary effects for change to consumption.

\bigskip
<br>
<br>

# Secondary impact
Due to displacement rate, there is actually _new_ consumption to account for the part not displaced:

$C_{sector} = C_{sector} + \frac{C_{sector}}{C_{total}} * \Delta_{recycling} * (1 - d)$

This additional consumption has tertiary effects on waste.

\bigskip
<br>
<br>

# Tertiary effects
There are tertiary effects on both waste and trade.

\medskip
<br>

## Trade
New virgin plastics has an impact on imports like so:

$T_{import} = T_{import} - \frac{T_{import}}{C_{total}} * (1 - d) * \Delta_{recycling}$

This change in imports has an additional downstream effect on other region's exports:

$T_{region-export} = T_{region-export} - \frac{T_{region-export}}{T_{total-export}} * \Delta_{import}$

Note that $\Delta_{import}$ comes from the region in which the intervention was introduced.

\medskip
<br>

## Waste
The increase in consumption has downstream effects on waste as follows:

$W_{fate} = W_{fate} - \frac{W_{fate}}{W_{total}} * \Delta_{recycling} * (1 - d)$

This is time delayed based on the sector lifetime distributions of change in the consumption.

\medskip
<br>

## Waste trade
Note that one of the end of life fates impacted is waste trade and other regions experience secondary effects in the simulation (see waste trade interventions).

\bigskip
<br>
<br>

# Discussion
This technical note now turns to interactions and future work.

\medskip
<br>

## Interactions
Though not fully exhaustive, this intervention interacts with others primarily through recycling rate and consumption. First, other interventions such as minimum recycling rate may cause recycling to be higher than achieved by this policy alone. In practice, each intervention creates a minimum recycling rate and the maximum of those minimums is what is ultimately simulated such that all constraints are met. Second, this may influence consumption and that change is considered prior to consumption-dependent targets like minimum recycled content. For example, minimum recycled content may further increase recycling rates to meet consumption needs.

\medskip
<br>

## Future work
Further refinement of the assumed displacement rate.

\bigskip
<br>
<br>

# Works Cited