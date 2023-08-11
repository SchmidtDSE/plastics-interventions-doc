---
title: Reduce Polystyrene
numbersections: true
---
This intervention reduces material is used in the scenario "Ban Polystyrene Packaging" and operates by simply reducing consumption in packaging and sending that on-wards to waste and trade.

\bigskip
<br>
<br>

# Assumptions

- There is a known percent of polystyrene used in packaging ($\%_{packaging-PS}$).
- The reduction is linear from 2024 to configurable end date (default of 2050).

\bigskip
<br>
<br>

# Primary impact
This intervention assumes an input percent reduction in polystyrene consumption and has access to the percent of packaging that uses that polymer (~3.4%) by mass. The change to packaging becomes the following:

$C_{packaging} = C_{packaging} - \Delta_{PS}$
$C_{packaging} = C_{packaging} - (C_{packaging} * \%_{packaging-PS} * \%_{PS-reduction})$

Note that $\Delta_{PS}$ requires propagation across waste and imports.

\bigskip
<br>
<br>

# Secondary impact
The reduction in polystrene $\Delta_{PS}$ is distributed proportionally across waste within the region:

$W_{fate} = W_{fate} - \frac{W_{fate}}{W_{total}} * \Delta_{PS}$

Note that imports also change as a result of reduced consumption:

$P_{import} = P_{import} - \frac{P_{import}}{P_{total}} * \Delta_{PS}$

Here $P$ is all input plastics including domestic production and imports.

\bigskip
<br>
<br>

# Tertiary effects
As imports have changed, exports from other countries will reduce as well:

$P_{region-export} = P_{region-export} - \frac{P_{region-export}}{P_{total-export}} * \Delta_{import}$

Note that $\Delta_{import}$ comes from the region in which the intervention was introduced.

\bigskip
<br>
<br>

# Future work

 - The labeling of this intervention is being adjusted to refer to polystyrene not expanded polystyrene.
 - Right now, all interventions assume the global average of 3.4% by mass for packaging is polystyrene but this may be adjusted to be region-specific.