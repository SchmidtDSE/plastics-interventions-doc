---
title: Incineration Investment
numbersections: true
---
This intervention increases incineration through capacity for collection and processing. It is used by the "X Billion USD for Waste Management" scenario.

\bigskip
<br>
<br>

# Introduction
This intervention relies on information about capital and operating expense to incinerate a certain mass of waste.

\medskip
<br>

## Assumptions

- This intervention is assumed to have incineration rate go up gradually and linearly from a selectable start date to the configurable end date.
- Capital expenditure is amortized over 50 years.
- The expanded capacity will be used for all waste types of which only a fraction is plastic ($\%_{plastic}$).
- The addition of new infrastructure will redirect landfill and mismanaged to incineration.
- There are known region specific observed values for mass of waste incinerated ($m_{incinerated}$) and both the operating cost ($c_{opex}$) and capital expenditure ($c_{capex}$).

\medskip
<br>

## External knowledge
This uses materials describing capital and operating expenditures for incineration facilities [@lau2020].

\bigskip
<br>
<br>

# Primary impact
Investment is a mix of capital and operating expense:

$c_{annual} = c_{annual-opex} + \frac{c_{capex}}{50}$

This intervention assumes a potential change in the incineration ($m_{increase}$) over time based on an investment $I$:

$m_{increase} = I * \frac{m_{incinerated}}{c_{annual}}$

With this potential change defined:

$\Delta_{incineration} = min(m_{increase} * \%_{plastic}, W_{mismanaged} + W_{landfill})$

This is then applied to the overall incineration rate:

$W_{incineration} = W_{incineration} + \Delta_{incineration}$

See secondary effects for change to mismanaged and landfill.

\bigskip
<br>
<br>

# Secondary impact
This intervention assumes that the newly incinerated material would have otherwise been mismanaged or sent to landfill. Starting with mismanaged:

$W_{mismanaged} = W_{mismanaged} - \Delta_{incineration} * \frac{W_{mismanaged}}{W_{mismanaged} + W_{landfill}}$

Next, for landfill:

$W_{landfill} = W_{landfill} - \Delta_{incineration} * \frac{W_{landfill}}{W_{mismanaged} + W_{landfill}}$

There are no further assumed effects.

\bigskip
<br>
<br>

# Discussion
Future work includes additional investigation into how additional incineration capacity impacts other end of life plastic fates. Note that this intervention reflects an implicit belief that incineration is a preferred outcome to landfill. To that end, users may choose to direct investment only to landfill through the second tab if they disagree with this perspective.

\bigskip
<br>
<br>

# Works Cited