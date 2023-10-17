---
title: Waste Management Investment
numbersections: true
---
This intervention decreases the mismanaged waste rate by increasing capacity for landfill. It is used by the "X Billion USD for Waste Management" scenario.

\bigskip
<br>
<br>

# Introduction
This intervention relies on information about capital and operating expense to landfill a certain mass of waste.

\medskip
<br>

## Assumptions

- This intervention is assumed to have landfill rate go up gradually and linearly from a selectable start date to the configurable end date.
- Capital expenditure is amortized over 50 years.
- The expanded waste management capacity will be used for all waste types of which only a fraction is plastic ($\%_{plastic}$).
- The addition of new waste management infrastructure will not redirect other end of life plastic fates to landfill except mismanaged.
- There are known region specific observed values for mass of waste landfilled ($m_{landfill}$) and both the operating cost ($r_{opex}$) and capital expenditure ($r_{capex}$).

\medskip
<br>

## External knowledge
This uses materials describing capital and operating expenditures for landfill [@lau2020].

\bigskip
<br>
<br>

# Primary impact
Investment is a mix of capital and operating expense:

$r_{annual} = r_{annual-opex} + \frac{r_{capex}}{50}$

This intervention assumes a potential change in the incineration ($m_{increase}$) over time based on an investment $I$:

$m_{increase} = I * \frac{m_{landfill}}{r_{annual}}$

With this potential change defined:

$\Delta_{landfill} = min(m_{increase} * \%_{plastic}, W_{mismanaged})$

This is then applied to the overall landfill rate:

$W_{landfill} = W_{landfill} + \Delta_{landfill}$

See secondary effects for change to mismanaged.

\bigskip
<br>
<br>

# Secondary impact
This intervention assumes that the new landfill would have otherwise been mismanaged.

$W_{mismanaged} = W_{mismanaged} - \Delta_{landfill}$

There are no further assumed effects.

\bigskip
<br>
<br>

# Discussion
Future work includes additional investigation into if increased landfill capacity impacts fates other than mismanaged.

\bigskip
<br>
<br>

# Works Cited