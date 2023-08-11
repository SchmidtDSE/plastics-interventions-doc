---
title: Min Recycling Rate
numbersections: true
---
This intervention redirects waste from other end of life fates to recycling. It is used in the "40% Minimum Recycling Rate" scenario.

\bigskip
<br>
<br>

# Assumptions

- There is a displacement rate $d$ which describes how much of virgin plastic production is reduced or displaced by newly available recycled material. Note that this may cause consumption to go up as a result of increased recycling.
- This intervention is assumed to have minimum recycling rate go up from 2024 to the end date (2050 by default).
- A lag is expected from change in waste to change in consumption and production (default of 3 years).

\bigskip
<br>
<br>

# Primary impact
This intervention assumes a minimum recycling rate mandate ($\%_{mandate}$) changing over time which can be used to define a change in recycling:

$\Delta_{recycling} = W_{recycling} - min(\frac{W_{recycling}}{w_{total}}, \%_{mandate}) * W_{total}$

This delta is then offset for the non-recycling fates like so:

$W_{fate} = W_{fate} - \frac{W_{fate}}{W_{nonrecycling}} * \Delta_{recycling}$

See secondary effects for change to consumption.

\bigskip
<br>
<br>

# Secondary impact
There is a decrease in consumption according to the displacement rate as well as an increase in production.

\medskip
<br>

## Decrease consumption
The change to consumption is as follows:

$C_{sector} = C_{sector} - \frac{C_{sector}}{C_{total}} * \Delta_{recycling} * d$

This has effects on trade as well as described in tertiary effects.

\medskip
<br>

## Increase consumption
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

## Displaced plastics impact on trade
New recycling which does displace virgin plastics has an impact on imports like so:

$P_{import} = P_{import} - \frac{P_{import}}{P_{total}} * d * \Delta_{recycling}$

This change in imports has an additional downstream effect on other region's exports:

$P_{region-export} = P_{region-export} - \frac{P_{region-export}}{P_{total-export}} * \Delta_{import}$

\medskip
<br>

## Non-displaced plastics
The increase in consumption has downstream effects on waste as follows:

$W_{fate} = W_{fate} - \frac{W_{fate}}{W_{total}} * \Delta_{recycling} * (1 - d)$

\bigskip
<br>
<br>

# Future work
Further refinement of the assumed displacement rate.