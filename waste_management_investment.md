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

- This intervention is assumed to have landfill rate go up gradually and linearly from 2024 to the end date (2050 by default).
- Capital expenditure is amortized over 50 years.
- The expanded waste management capacity will be used for all waste types of which only a fraction is plastic ($\%_{plastic}$).
- The addition of new waste management infrastructure will not redirect other end of life plastic fates to landfill except mismanaged.

\medskip
<br>

## External knowledge
TODO (Nivedita / Elijah): Details on where the data come from.

\bigskip
<br>
<br>

# Primary impact
This intervention assumes an change in the landfill ($m_{increase}$) changing over time:

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