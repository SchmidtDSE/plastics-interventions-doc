---
title: Packaging Consumption Tax
numbersections: true
---
Used in the scenario "Packaging Consumption Tax" on the first tab, this intervention reduces consumption only in the packaging sector based on a conversion from size of tax to expected reduction in consumption.

\bigskip
<br>
<br>

# Introduction
In addition to making assumptions within the modeling, this intervention relies on information external to the model in order to convert from size of tax to expected reduction.

\medskip
<br>

## Assumptions

- The change in consumption to the change in waste generation is subject to lifecycle distribution delays.
- The only change in consumption due to this intervention will be in the packaging space.
- Decreases in consumption of plastic packaging will not cause appreciable increases in the consumption of other non-packaging plastic goods.
- The behavior response to a tax on plastic packaging in general will be similar to the behavior response seen in a tax on plastic bags.
- The tax rate $t$ will be different in different regions as will a fit model parameter $m$.
- The tax rate $t$ is expressed as USD per article in all regions.

\medskip
<br>

## External knowledge
TODO (Nivedita / Elijah): Details on where the data come from.

\bigskip
<br>
<br>

# Primary impact
This intervention assumes a change in packaging only:

$C_{packaging} = C_{packaging} - \Delta_{packaging}$

This delta is found through the following formula:

$\Delta_{packaging} = \frac{\sqrt{t * m}}{s}$

This formula includes a mixture of parameters given by external literature and user configuration. Note that $\Delta_{packaging}$ requires propagation across waste and imports as described below.

\medskip
<br>

## Non-linearity
Though few data points are available, observed data typically show that, as taxes get higher, each marginal cent added to the tax yields diminishing reductions in consumption. This may be because some situations or products are harder to displace than others. To account for this observation, a square root is used in the formula.

\medskip
<br>

## Fitting
The "middle" tax rate for each region is paired with an observed decrease in consumption. To fit a conversion factor $m$, this ratio of percent decrease in consumption over tax is scaled linearly to 50% decrease in consumption, a value typically well "within sample" for each region. This is used to derive scaling factor $m$ used above:

$m = (\frac{0.5 * s}{\sqrt{t_m}})^2$

Here, $t_m$ is that linearly scaled tax rate at which a 50% reduction is expected. Note that there are very few data points per region and this isn't a proper regression but instead serves to capture that some regions have different price sensitivity than others.

\medskip
<br>

## Scaling
The largest percent reduction in consumption within a region is typically 80 to 90% and there's a question of how to treat predictions above this level where predictions are both out of sample in terms of behavior change in addition to being out of sample in terms of impacted products. This intervention allows the user to apply a scaling factor (defaults to 1 or no effect) which serves to further diminish the rate at which consumption is reduced above the 50% level.

\bigskip
<br>
<br>

# Secondary impact
The reduction in polystrene $\Delta_{packaging}$ is distributed proportionally across waste within the region:

$W_{fate} = W_{fate} - \frac{W_{fate}}{W_{total}} * \Delta_{packaging}$

This change in waste is subject to lifecycle distribution delays though, in this case, only a single sector is impacted. Note that imports also change as a result of reduced consumption:

$T_{import} = T_{import} - \frac{T_{import}}{C_{total}} * \Delta_{packaging}$

Here $C$ is all input plastics (consumption) including domestic production and imports.

\bigskip
<br>
<br>

# Tertiary effects
As imports have changed, exports from other countries will reduce as well:

$T_{region-export} = T_{region-export} - \frac{T_{region-export}}{T_{total-export}} * \Delta_{import}$

Note that $\Delta_{import}$ comes from the region in which the intervention was introduced.

\bigskip
<br>
<br>

# Discussion
This technical note now turns to performance as well as interactions and future work.

\medskip
<br>

## Performance
The tool's tab 1 presents levels of taxation where moderate  results in an approximately 50% reduction in consumption. 

\medskip
<br>

## Interactions
This intervention may interact with others in multiple ways but the primary mechanisms are consumption and waste. First, this lever's reductions are visible in production and consumption-dependent interventions like minimum recycled content. For example, a cap on virgin production can use this lever as "credit" towards its goal before further reducing plastic generation to meet its target. Second, this impacts waste like the amount of recyclable material available for interventions such as minimum recycled content. To that end, the reduction in available recycled material is visible for waste-dependent interventions including caps on different waste streams.

In practice, this intervention places a constraint on production of plastics alongside the constraints considered by other interventions and the "strictest" constraint is the one that is ultimately reported. The same holds true for waste generation impact such that another intervention may "supersede" this lever if the materials being reduced by this intervention do not allow that other lever to achieve its goals.

Of course, some bans also target specific subsets of packaging such as polystyrene. This intervention assumes that the removal of a polymer does not overall change the behavior response to a tax on the remaining packaging products. Future work may reconsider this stance with more detailed information.

\medskip
<br>

## Future work
 - A different version of this intervention could look at price sensitivity curves for specific products and simulate at the product level instead of the sector level.
 - An actual regression could be performed if additional data points on behavior response to bans becomes available for each region.
 - A more appropriate scaling factor or $\Delta_{packaging}$ altogether could be derived from additional behavioral economics study or empirical human trials.