---
title: Virgin Plastic Cap
numbersections: true
---
This intervention imposes a maximum allowed amount of virgin plastic production. It is used in the "Cap to 2025 Virgin Production" scenario.

\bigskip
<br>
<br>

# Introduction
This intervention is mechanistic and does not use significant external literature support. Even still, it makes a number of important and often user configurable assumptions.

\medskip
<br>

## Assumptions

- This intervention is assumed to have the maximum virgin plastic mandate go down from a selectable start date to the configurable end date linearlly.
- This cap applies to consumption so excludes exported plastic but includes imported plastic.
- There is a delay from when the virgin plastic is banned to the impact on waste which is governed by the lifecycle distributions at the sector-level.
- There is a rate at which lost virgin production is backfilled by increased recycling ($b$).
- There is a yield loss rate ($l$) for conversion of end of life recycling into secondary production.

\medskip
<br>

## External knowledge
This intervention does not use external literature to provide constants or other numbers beyond what is in the model itself.

\bigskip
<br>
<br>

# Primary impact
This intervention assumes a maximum virgin plastic amount ($M_{mandate}$) changing over time. This leads to a requirement for a change in primary production:

$\Delta_{required} = P_{primary} - min(P_{primary}, M_{mandate})$

The intervention first tries to increase recycling to compensate up until a configurable backfill rate ($b$):

$\Delta_{secondary} = min(W_{non-recycling} * l, \Delta_{required} * b)$

This reflects into production:

$P_{secondary} = P_{secondary} + \Delta_{secondary}$

In practice, the simulation takes time delays between end of life and production into account. Anyway, in the event that not enough recycling is available, consumption sees a change:

$\Delta_{consumption} = \Delta_{required} - \Delta_{secondary}$

The change is distributed across consumption sectors like so:

$C_{sector} = C_{sector} - \frac{C_{sector}}{C_{total}} * \Delta_{consumption}$

This has secondary effects in waste and imports.

\bigskip
<br>
<br>

# Secondary impact
The decrease in consumption causes a reduction in waste and trade.

\medskip
<br>

## Change in waste
First, the change in recycling cannibalizes other waste fates. Starting with recycling itself:

$W_{recycling} = W_{recycling} + \frac{\Delta_{secondary}}{l}$

Then, updating the others:

$W_{fate} = \frac{W_{fate}}{W_{non-recycling}} * \frac{\Delta_{secondary}}{l}$

Next, the change in consumption is propagated across all waste fates.

$W_{fate} = W_{fate} - \frac{W_{fate}}{W_{total}} * \Delta_{consumption}$

This impact is time delayed based on the distribution of the change to consumption across sectors.

\medskip
<br>

## Reduction in trade
Imports are reduced due to loss in consumption:

$T_{import} = T_{import} - \frac{T_{import}}{C_{total}} * \Delta_{consumption}$

This additional consumption has tertiary effects on exports from other regions.

\bigskip
<br>
<br>

# Tertiary effects
Due to change in imports, the following change is expected across exports from other regions:

$T_{region-export} = T_{region-export} - \frac{T_{region-export}}{T_{total-export}} * \Delta_{import}$

Here, $\Delta_{import}$ comes from the region in which the intervention is applied. Finally, note that one of the end of life fates impacted is waste trade and other regions experience secondary effects in the simulation (see waste trade interventions).

\bigskip
<br>
<br>

# Discussion
This technical note now turns to interactions and future work.

\medskip
<br>

## Interactions
This intervention may interact with others in various ways but the primary mechanisms are through reduced consumption and waste. First, this change is considered prior to consumption-dependent interventions like minimum recycled content as it may change their targets. Second, the waste and, specifically, recycling available for other interventions may be impacted by this intervention. Therefore, this is either evaluated prior to those waste-dependent interventions where goals may be influenced by the waste amounts or this intervention places a constraint alongside the other intervention (if its goal is absolute) with the strictest constraint prevailing such that all lever's goals are met.

\medskip
<br>

## Future work
That this cap applies to consumption may be revisited in later iterations.
