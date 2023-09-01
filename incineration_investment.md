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

- This intervention is assumed to have incineration rate go up gradually and linearly from 2024 to the end date (2050 by default).
- Capital expenditure is amortized over 50 years.
- The expanded capacity will be used for all waste types of which only a fraction is plastic ($\%_{plastic}$).
- The addition of new infrastructure will redirect landfill and mismanaged to incineration.

\medskip
<br>

## External knowledge
TODO (Nivedita / Elijah): Details on where the data come from.

\bigskip
<br>
<br>

# Primary impact
This intervention assumes an change in the incineration ($m_{increase}$) changing over time:

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