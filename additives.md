---
title: Reduce Additives
numbersections: true
---
Used in the scenario "Reduce Additives" on the first tab, this intervention reduces material and operates by simply subtracting consumption and sending that delta "onwards" to waste and trade.

\bigskip
<br>
<br>

# Introduction
This intervention is mechanistic and does not use significant external literature support. Even still, it makes a number of important and often user configurable assumptions.

\medskip
<br>

## Assumptions

- There is a known percent of plastic products which are additives ($\%_{additives}$).
- The reduction is linear from a selectable start date to configurable end date.
- The change in consumption to the change in waste generation is subject to lifecycle distribution delays.
- The lifecycle duration for additives is the same as the larger sector in which those additives are introduced to those sector's products. 

\medskip
<br>

## External knowledge
This intervention does not use external literature to provide constants or other numbers beyond what is in the model itself though it uses some polymer-level data available from the underlying business as usual model.

\bigskip
<br>
<br>

# Primary impact
This intervention assumes an input percent reduction in consumption. The change to packaging becomes the following:

$C = C - \Delta_{additives}$
$C = C - C * \%_{additives} * \%_{additives-reduction}$

Note that $\Delta_{additives}$ requires propagation across waste and imports.

\bigskip
<br>
<br>

# Secondary impact
The reduction $\Delta_{additives}$ is distributed proportionally across waste within the region:

$W_{fate} = W_{fate} - \frac{W_{fate}}{W_{total}} * \Delta_{additives}$

This change in waste is subject to lifecycle distribution delays. Note that imports also change as a result of reduced consumption:

$T_{import} = T_{import} - \frac{T_{import}}{C_{total}} * \Delta_{additives}$

Here $C$ is all input plastics (consumption) including domestic production and imports.

\bigskip
<br>
<br>

# Tertiary effects
As imports have changed, exports from other countries will reduce as well:

$T_{region-export} = T_{region-export} - \frac{T_{region-export}}{T_{total-export}} * \Delta_{import}$

Note that $\Delta_{import}$ comes from the region in which the intervention was introduced. Furthermore, one of the end of life fates impacted is waste trade and other regions experience secondary effects in the simulation (see waste trade interventions).

\bigskip
<br>
<br>

# Discussion
This technical note now turns to interactions and future work.

\medskip
<br>

## Interactions
This intervention may interact with others in multiple ways but the primary mechanisms are consumption and waste. First, this lever's reductions are visible in production and consumption-dependent interventions like minimum recycled content. For example, a cap on virgin production can use this lever as "credit" towards its goal before further reducing plastic generation to meet its target. Second, this impacts waste like the amount of recyclable material available for interventions such as minimum recycled content. To that end, the reduction in available recycled material is visible for waste-dependent interventions including caps on different waste streams.

In practice, this intervention places a constraint on production of plastics alongside the constraints considered by other interventions and the "strictest" constraint is the one that is ultimately reported. The same holds true for waste generation impact such that another intervention may "supersede" this lever if the materials being reduced by this intervention do not allow that other lever to achieve its goals.

\medskip
<br>

## Future work

This current implementation does not consider that reducing some additives may reduce certain products such that the volume overall reduced is larger than the additives themselves. That said, in pracitce, this may be counter-balanced by finding alternatives beyond the banned additives such that this effect is not seen.