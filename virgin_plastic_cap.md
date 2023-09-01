---
title: Virgin Plastic Cap
numbersections: true
---
This intervention imposes a maximum allowed amount of virgin plastic production. It is used in the "Cap to 2030 Virgin Production" scenario.

\bigskip
<br>
<br>

# Assumptions

- This intervention is assumed to have the maximum virgin plastic mandate go down from 2024 to the end date (2050 by default) linearlly.
- There is some rate $b$ at which a reduction of x pounds in virgin plastic production is replaced by y increased recycling such that $b = \frac{y}{x}$. This is recycling "backfilling" lost virgin plastic production.
- This cap applies to consumption so excludes exported plastic but includes imported plastic.
- There is a delay from when the virgin plastic is banned to the impact on waste which is governed by the lifecycle distributions at the sector-level.

\bigskip
<br>
<br>

# Primary impact
This intervention assumes a maximum virgin plastic amount ($M_{mandate}$) changing over time. This leads to a certain change to consumption:

$\Delta_{consumption} = C_{total} - min(C_{total}, M_{mandate})$

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

## Reduction in waste
The change in consumption is propagated across all waste fates.

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

Here, $\Delta_{import}$ comes from the region in which the intervention is applied.

\bigskip
<br>
<br>

# Interactions
This intervention may interact with others in various ways but the primary mechanisms are through reduced consumption and waste. First, this change is considered prior to consumption-dependent interventions like minimum recycled content as it may change their targets. Second, the waste and, specifically, recycling available for other interventions may be impacted by this intervention. Therefore, this is either evaluated prior to those waste-dependent interventions where goals may be influenced by the waste amounts or this intervention places a constraint alongside the other intervention (if its goal is absolute) with the strictest constraint prevailing such that all lever's goals are met.

\bigskip
<br>
<br>

# Future work
That this cap applies to consumption may be revisited in later iterations.