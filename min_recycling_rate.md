---
title: Min Recycling Rate
numbersections: true
---
This intervention redirects waste from other end of life fates to recycling. It is used in the "40% Minimum Recycling Rate" scenario.

\bigskip
<br>
<br>

# Introduction
This intervention is mechanistic and does not use significant external literature support. Even still, it makes a number of important and often user configurable assumptions.

\medskip
<br>

## Assumptions

- There is a displacement rate $d$ which, though user configurable, is non-zero by default and describes how much of virgin plastic production is reduced or displaced by newly available recycled material.
- Displacement rate $d$ may cause consumption to go up as a result of increased recycling: more recycled material is available but it does not fully offset existing production by the same amount, resulting in more plastics goods being made overall.
- This intervention is assumed to have minimum recycling rate go up gradually and linearly from a selectable start date to the configurable end date.
- A lag is expected from when the recycling increases to when that newly recycled material is available for consumption (default of 1 year).
- This intervention mandates a collection rate and not the actual amount of recycled plastics available for consumption.
- There is a change from consumption to waste generation that is not immediate but, instead, governed by sector lifetime distributions.

\medskip
<br>

## External knowledge
This intervention does not use external literature to provide constants or other numbers beyond what is in the model itself.

\bigskip
<br>
<br>

# Primary impact
This intervention assumes a minimum recycling rate mandate ($\%_{mandate}$) changing over time which can be used to define a change in recycling:

$\Delta_{recycling} = W_{recycling} - min(\frac{W_{recycling}}{W_{total}}, \%_{mandate}) * W_{total}$

This delta is then offset for the non-recycling fates like so:

$W_{fate} = W_{fate} - \frac{W_{fate}}{W_{nonrecycling}} * \Delta_{recycling}$

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
Though not fully exhaustive, this intervention interacts with others primarily through recycling rate and consumption. First, other interventions such as recycling investment may cause recycling to be higher than the minimum mandated by this policy. In practice, each intervention creates a minimum recycling rate and the maximum of those minimums is what is ultimately simulated such that all constraints are met. Second, this may influence consumption and that change is considered prior to consumption-dependent targets like minimum recycled content.

\medskip
<br>

## Future work
Further refinement of the assumed displacement rate.
