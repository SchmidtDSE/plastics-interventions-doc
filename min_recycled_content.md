---
title: Min Recycled Content
numbersections: true
---
This intervention redirects waste from other end of life fates to recycling. It does this in order to meet a minimum amount of plastic coming from recycling when making new products. It is used in the "40% Minimum Recycled Content" scenario.

\bigskip
<br>
<br>

# Introduction
This intervention is mechanistic and does not use significant external literature support. Even still, it makes a number of important and often user configurable assumptions.

\medskip
<br>

## Assumptions

- There is some amount of material lost called "yield loss" or $l$ when recycling such that some material that is recycling waste is not available for the creation of new products.
- Yield loss $l$ is 20% by default but is user configurable.
- There is a displacement rate $d$ which describes at what rate consumption goes down, allowing the simulation to meet this mandate by reduced consumption instead of increasing recycling. This may, for example, reflect shifting to other non-plastic materials.
- Though user configurable, $d$ is set to zero by default meaning that there is no loss in consumption.
- This intervention is assumed to have the minimum recycled content mandate go up gradually and linearlly from a selectable start date to a configurable end date.
- A lag is expected from waste to recycled plastic ready to be consumed again (default of 1 year).
- The change in waste stream is expected to have a delay based on lifecycle distributions as described in other supplemental documentation.

\medskip
<br>

## External knowledge
This intervention does not use external literature to provide constants or other numbers beyond what is in the model itself.

\bigskip
<br>
<br>

# Primary impact
This intervention assumes a minimum recycled content mandate ($\%_{mandate}$) changing over time which can be used to define the required amount of recycled material needed:

$W_{recycling-need} = \frac{C_{total} * \%_{mandate}}{1 - l}$

The change in recycling needed becomes:

$\Delta_{recycling} = max(W_{recycling-need} - W_{recycling}, 0)$

This delta then either reduces consumption or redirects waste from other fates to recycling. Note that the tool limits $\Delta_{recycling}$ to $[0, W_{nonrecycling}]$.

\medskip
<br>

## Reduce consumption 
Though $d$ is set to zero by default, consumption is reduced as follows:

$C_{sector} = C_{sector} - \frac{C_{sector}}{C_{total}} * \Delta_{recycling} * d$

This has secondary effects on waste and trade as described below.

\medskip
<br>

## Redirect waste
Waste is redirected from other fates to support the need for more recycled materials.

$W_{fate} = W_{fate} - \frac{W_{fate}}{W_{nonrecycling}} * \Delta_{recycling} * (1 - d)$

In the default cause, $1 - d$ equals one.

\bigskip
<br>
<br>

# Secondary impact
The decrease in consumption causes a reduction in waste and trade.

\medskip
<br>

## Reduction in waste
The change in consumption is propagated across all waste fates.

$W_{fate} = W_{fate} - \frac{W_{fate}}{W_{total}} * \Delta_{recycling} * d$

By default, with $d = 0$, no change is actually made in this step. However, this change in waste is subject to a delay governed by the lifecycle distributions seen in the change to consumption.

\medskip
<br>

## Reduction in trade
Imports are reduced due to loss in consumption:

$T_{import} = T_{import} - \frac{T_{import}}{C_{total}} * \Delta_{recycling} * d$

This additional consumption has tertiary effects on exports from other regions. By default, with $d = 0$, no change is actually made in this step.

\bigskip
<br>
<br>

# Tertiary effects
Due to change in imports, the following change is expected across exports from other regions:

$T_{region-export} = T_{region-export} - \frac{T_{region-export}}{T_{total-export}} * \Delta_{import}$

Note that both that 1) this has no effect if $d = 0$ like in the default case and 2) $\Delta_{import}$ comes from the region in which the intervention was introduced. Furthermore, one of the end of life fates impacted is waste trade and other regions experience secondary effects in the simulation (see waste trade interventions).

\bigskip
<br>
<br>

# Discussion
This technical note now turns to interactions and future work.

\medskip
<br>

## Interactions
This intervention interacts with other policy levers laterally within the same year and it also interacts with itself and others longitudinally through time. This section non-exhaustively explores those interactions.

### Other intervention interactions
One of this intervention's primary mechanisms is influencing recycling rates. After consumption has been modified by bans, taxes, and caps, this intervention arrives at a minimum amount of recycled material required to support consumption while maintaining the minimum recycled content goal. However, other interventions such as the recycling investment lever and the minimum recycling rate lever also arrive at their own minimum recycling rate.

$W_{recycling} = max(W_{min-recycling})$

These levers all effectively independently create a "constraint" such that the highest minimum recycling rate constraint is what is simulated. In other words, recycling will not drop because of these interventions but one recycling intervention may supersede another with a higher mandate such that all constraints are met.

### Time interactions
This policy interacts with itself and others both forwards and backwards in time. First, it changes future distributions of waste based on the lifecycle distribution of the sectors impacted, represented as a delay to the start / end date of impact for when waste numbers are updated in the simulation when evaluating a year. Second, it also raises previous recycling rates in order to support current production, changing historic recycling due to the delay in recycled materials moving from waste to production. In other words, it both influences future distributions across end of life fates and, in order to source recycled material, also changes distirbutions across past end of life distributions. Like with interaction with other interventions, this acts effectively as a constraint so the intervention with the most strict constraint will prevail.

See policy start / end date lever documentation for further discussion of managing timeseries effects and the lifecycle lever documentation for calculation of lifecycle delays.

\medskip
<br>

## Future work
Further conversation about the appropriate default $l$ and $d$.