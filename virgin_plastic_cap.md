---
title: Virgin Plastic Cap
numbersections: true
---
This intervention imposes a maximum allowed amount of virgin plastic production. It is used in the "Cap to 2030 Virgin Production" scenario.

<br>
<br>

# Assumptions

- This intervention is assumed to have the maximum virgin plastic mandate go down from 2024 to the end date (2050 by default).
- There is some rate $b$ at which a reduction of x pounds in virgin plastic production is replaced by y increased recycling such that $b = \frac{y}{x}$.
- This cap applies to consumption so excludes exported plastic but includes imported plastic.

<br>
<br>

# Primary impact
This intervention assumes a maximum virgin plastic amount ($M_{mandate}$) changing over time. This leads to a certain change to consumption:

$\Delta_{consumption} = C_{total} - min(C_{total}, M_{mandate})$

The change is distributed across consumption sectors like so:

$C_{sector} = C_{sector} - \frac{C_{sector}}{C_{total}} * \Delta_{consumption}$

This has secondary effects in waste and imports.

<br>
<br>

# Secondary impact
The decrease in consumption causes a reduction in waste and trade.

<br>

## Reduction in waste
The change in consumption is propagated across all waste fates.

$W_{fate} = W_{fate} - \frac{W_{fate}}{W_{total}} * \Delta_{consumption}$

<br>

## Reduction in trade
Imports are reduced due to loss in consumption:

$P_{import} = P_{import} - \frac{P_{import}}{P_{total}} * \Delta_{consumption}$

This additional consumption has tertiary effects on exports from other regions.

<br>
<br>

# Tertiary effects
Due to change in imports, the following change is expected across exports from other regions:

$P_{region-export} = P_{region-export} - \frac{P_{region-export}}{P_{total-export}} * \Delta_{import}$

<br>
<br>

# Future work
That this cap applies to consumption may be revisited in later iterations.