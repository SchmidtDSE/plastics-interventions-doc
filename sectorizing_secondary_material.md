---
title: Sectorizing Secondary Material
date: 2024-02-19
---
**Summary**: In absence of comprehensive data regarding regionalized polymer reuse, this document demonstrates how material flow modeling may incorporate secondary consumption by offering approximated propensities for each sector to consume recycled materials.

<br>
\bigskip

# Introduction
The literature do not yet offer comprehensive region-level data on sector-level recycling propensities. For example, consider that material flow modeling cannot estimate what percent of secondary production supports packaging versus transportation. This data limitation may lead to inaccuracy not just in consumption but waste as one cannot reliably determine the correct lifecycle distribution to apply to that secondary production. Though this stems from a lack of data regarding the application of secondary material, this short document observes that researchers may still have some information regarding the ability for different sectors to incorporate secondary production and proposes a modeling method to estimate recirculation of recycling into sector-level masses. It does this by approximating the propensities for recycling to enter into each regionalized sector.
<br>
\bigskip

# Method
After laying out essential simplifying assumptions, this method considers estimating the secondary polymer masses before turning to secondary sector mass in both a fully domestic and trade context.

## Assumptions
Before considering polymer mass, this study makes the following assumptions:

 - **Assumption 1**: Recycling rate is estimated at the region level.
 - **Assumption 2**: Yield loss is constant across regions, sectors, and polymers.
 - **Assumption 3**: A regional sector's propensity to consume a primary polymer is the same as the propensity for that sector to consume a secondary polymer of the same type. In other words, secondary material can displace any primary material of the same polymer type with mass equivalency after **Assumption 1**'s yield loss.
 - **Assumption 4**: All recycled material is reused except for **Assumption 1**'s uniform yield loss across all regions, sectors, and polymers. In other words, excluding yield loss, material indicated as recycled in the dataset is actually reused. Any waste which was collected as recycling but not actually reused is assumed to be captured in different EOL fates.
 - **Assumption 5**: The propensities for end of life fate and for consumption sector are the same between domestic and traded material.

These are further explored below.

## Fully domestic
This document first considers these calculations in a fully domestic context.

### Polymer mass
Under **Assumptions 1 and 2**, consider the following where $s$ is secondary mass, $e$ is end of life mass, and $l$ is yield loss:

$s_{polymer|region} = e_{recycled|polymer|region} * (1-l)$

$s_{polymer|region} = p_{polymer|recyclable} * p_{recycling|region} * e_{polymer|region} * (1-l)$

$s_{polymer|region} = p_{polymer|recyclable} * p_{recycling|region} * e_{region} * p_{polymer|region} * (1-l)$

This derivation is called **Formula 1**. Note that, for thermosets, $p_{recyclable|polymer}$ would equal zero and $s_{polymer|region}$ also becomes zero.

### Sector mass
This method then needs to determine the secondary mass per sector:

$s_{sector|region} = \Sigma(s_{polymer|region} * p_{sector|polymer|secondary|region})$

This relies on understanding the recycling propensity for a polymer per sector per region but this $p_{sector|polymer|secondary|region}$ is not currently well known. Therefore, **Assumption 3**  states the following:

$p_{sector|polymer|secondary|region} \approx p_{sector|polymer|primary|region} \approx p_{sector|polymer|region}$

This yields the following whose terms are all known:

$s_{sector|region} = \Sigma(s_{polymer|region} * p_{polymer|sector|region})$

Continuing from **Formula 1**:

$s_{sector|region} = \Sigma (p_{polymer|recyclable} * p_{recycling|region} * e_{region} * p_{polymer|region} * (1-l) * p_{polymer|sector|region})$

$s_{sector|region} = (1-l) * e_{region} * p_{recycling|region} * \Sigma (p_{polymer|recyclable} * p_{polymer|region} * p_{polymer|sector|region})$

It is worth highlighting that the summation term determines the probability of mass being any polymer that is recyclable and in the target region / sector. 

$p_{recyclable|sector|region} * p_{sector|region} = \Sigma (p_{polymer|recyclable} * p_{polymer|region} * p_{polymer|sector|region})$

Therefore:

$s_{sector|region} = (1-l) * e_{region} * p_{recycling|region} * p_{recyclable|sector|region} * p_{sector|region}$


This derivation is referred to as **Formula 2**. 

### Regionalized sector recycling
This method continues with further consideration of $p_{recyclable|sector|region}$. This becomes:

$p_{recyclable|sector|region} = \Sigma (p_{polymer|recyclable} * p_{polymer|sector|region})$

This continues **Formula 2**:

$s_{sector|region} = (1-l) * e_{region} * p_{recycling|region} * \Sigma (p_{polymer|recyclable} * p_{polymer|sector|region}) * p_{sector|region}$

This is referred to as **Formula 3** and is further discussed below.

### Constraints
Note that, in practice, this operation happens with some limitations. First, a **Constraint 1** requires a delay ($d$) from reaching end of life to recirculating which is addressed by assuming that:

$s_{sector|region|available}(y+d) = s_{sector|region}(y)$

Additionally, this analysis uses an **Assumption 4** which expects all recycled material to be reused after yield loss. This gives rise to a **Constraint 2** extending from mass balance where all recycling must be used after yield loss. This results in a modified Formula 3 called **Formula 4**:

$s_{sector|region|balance} = \frac{s_{sector|region}}{\Sigma s_{sector|region}} * e_{region} * p_{recycling|region} * (1 - l)$

## Trade
As regions may trade both waste and goods, which secondary consumption should be expected for exported waste?  For waste using **Assumption 5**:

$e_{region} = e_{region|domestic} - e_{region|exports} + e_{region|imports}$

Continuing to consumption using **Assumption 5**:

 - The consumption from waste imports are not added to the region of import but instead attributed to a global trade in secondary consumption.
 - That global trade in secondary consumption is apportioned to importers relative to the size of their overall net production imports.

This consumption post-trade is formalized as follows where $i$ is imports and $p_{export|region}$ is the production export propensity:

$s_{sector|region|post-trade} = s_{sector|region} * (1 - p_{export|region}) + s_{sector|global} * \frac{i_{region}}{i} * \Sigma (p_{export|region} * s_{sector|region})$

Note that, in practice, this would use $s_{sector|region|balance}$ to satisfy **Constraint 2**.

## Circularity
Note that this document so far describes the determination of secondary consumption from primary waste but this process may repeat as recycled materials may recirculate again. This requires code to iteratively evaluate for these masses as it changes $e_{region}$ and  $p_{sector|region}$ per year. Therefore, iteration would involve repeating this process but, instead of using primary waste as input, it uses secondary waste from the prior iteration.

Put formally, consider the following where $w$ is a function that determines new waste across sectors given a year using lifecycle distributions:

- If first iteration: $e_{region}(iter, year) = e_{region}(year)$
- If subsequent iterations: $e_{region}(iter, year) = w(s_{sector|region|post-trade}(iter-1), year)$

This becomes an iterative estimation and the number of iterations required depends on an acceptance criteria regarding the max percent error allowed. Note that the ceiling of this error comes from the case of a 100% recycling rate across all regions. Therefore, consider the following:

$error < (1 - l)^{n_{iterations}}$

Note that, at 20% yield loss, 99.9% accuracy is achieved after roughly 30 additional iterations:

$error < (1 - 0.2)^{30 + 1}$

$error < 0.00099$

Different yield loss rates would require adjustment of these parameters.
<br>
\bigskip

# Discussion
This discussion further considers the conceptual meaning of the derivation, limitations, and implications for implementation.

## Conceptual meaning
This **Formula 3** conceptually states that, after yield loss, the amount of recycled material in a region goes into each sector proportional to the mass of that sector which can use recyclable polymers. In other words, recycled materials are distributed proportionally to the ability for a sector within a region to receive recyclable materials. Given **Assumption 4**, this method offers a **Formula 4** which ensures all recycled material is actually used in consumption.

## Limitations
This document highlights future work regarding its four assumptions:

 - **Assumption 1** could be relaxed by sectorizing $p_{recycling|region}$, requiring additional data collection but further improving model accuracy.
 - **Assumptions 2 and 4** assume a constant yield loss but this could be relaxed by removing $l$ and adjusting $p_{polymer|recyclable}$, a value which could also be regionalized.
 - **Assumption 3** could be relaxed if recycling propensities become available per polymer by region, removing the approximation used above.
 - **Assumption 5**: Could be relaxed by assuming a sector-level version of $p_{export|region}$.

This study does not currently have access to data required to take these steps, leaving that step for future work.

## Implementation
Observe that some terms are held constant through time by sector and region:

$c_{sector|region} = (1-l) * \Sigma (p_{polymer|recyclable} * p_{polymer|sector|region})$

Implementation could choose to precompute these values, further simplifying **Formula 3** as follows:

$s_{sector|region} = e_{region} * p_{recycling|region} * p_{sector|region} * c_{sector|region}$

This **Formula 5** may speed implementation. Using a yield loss of 20% ($l = 0.2$), the following reference values are provided for convenience:

| Sector                 | Region | Ratio        | RatioWithLoss |
|------------------------|--------|--------------|---------------|
| Agriculture            | China  | 0.9122807018 | 0.7298245614  |
| Agriculture            | EU30   | 0.875        | 0.7           |
| Agriculture            | NAFTA  | 0.8571428571 | 0.6857142857  |
| Agriculture            | RoW    | 0.90625      | 0.725         |
| Construction           | China  | 0.8472222222 | 0.6777777778  |
| Construction           | EU30   | 0.8325123153 | 0.6660098522  |
| Construction           | NAFTA  | 0.7808988764 | 0.6247191011  |
| Construction           | RoW    | 0.82         | 0.656         |
| Electronic             | China  | 0.8387096774 | 0.6709677419  |
| Electronic             | EU30   | 0.8225806452 | 0.6580645161  |
| Electronic             | NAFTA  | 0.8888888889 | 0.7111111111  |
| Electronic             | RoW    | 0.8461538462 | 0.6769230769  |
| HouseholdLeisureSports | China  | 0.4188034188 | 0.335042735   |
| HouseholdLeisureSports | EU30   | 0.603960396  | 0.4831683168  |
| HouseholdLeisureSports | NAFTA  | 0.8268398268 | 0.6614718615  |
| HouseholdLeisureSports | RoW    | 0.6733333333 | 0.5386666667  |
| Other                  | China  | 0.4666666667 | 0.3733333333  |
| Other                  | EU30   | 0.6330275229 | 0.5064220183  |
| Other                  | NAFTA  | 0.5070422535 | 0.4056338028  |
| Other                  | RoW    | 0.5529411765 | 0.4423529412  |
| Packaging              | China  | 0.9854227405 | 0.7883381924  |
| Packaging              | EU30   | 0.9876237624 | 0.7900990099  |
| Packaging              | NAFTA  | 0.9821428571 | 0.7857142857  |
| Packaging              | RoW    | 0.9842105263 | 0.7873684211  |
| Textile                | China  | 1            | 0.8           |
| Textile                | EU30   | 1            | 0.8           |
| Textile                | NAFTA  | 1            | 0.8           |
| Textile                | RoW    | 1            | 0.8           |
| Transporation          | China  | 0.8          | 0.64          |
| Transporation          | EU30   | 0.7931034483 | 0.6344827586  |
| Transporation          | NAFTA  | 0.6933333333 | 0.5546666667  |
| Transporation          | RoW    | 0.7631578947 | 0.6105263158  |

All that said, the remaining terms do change from year to year and programming may consider them displaced by some delay $d$ as previously discussed.

<br>
\bigskip

# Conclusion
This document calls for additional data regarding polymer reuse at the regional sector level where that lack of detailed comprehensive data on the regional consumption of secondary polymers presents challenges to material flow modeling. However, the nature of policy making may require the expediency of an approximated approach lest data become delayed beyond a realistic timeline needed for collective action. Therefore, leveraging knowledge about polymer ratios and recyclability, this document offers a method for tracking those recirculated materials in absence of those detailed observational data. This enables a more holistic understanding of secondary reuse and, despite reasonable approximations made by this method, the resulting projections still likely support timely practical policy decision making.
