/// @description FormationPosition(length) Retrieve formation position adjustments
/// @param length Length of the formation rows
function FormationPosition(length)
{
	//Single unit in the follow group
	if formationSize == 1
	{
		//Determine x and y coordinates depending on the follow target orientation
		switch followTarget.dir
		{
			case "N":
				xAdj = 0;
				yAdj = oUnitControl.cellSize * oUnitControl.unitSeparation;
				break;
			case "S":
				xAdj = 0;
				yAdj = -oUnitControl.cellSize * oUnitControl.unitSeparation;
				break;
			case "E":
				xAdj = -oUnitControl.cellSize * oUnitControl.unitSeparation;
				yAdj = 0;
				break;
			case "W":
				xAdj = oUnitControl.cellSize * oUnitControl.unitSeparation;
				yAdj = 0;
				break;
		}
	}
	//Multiple units in the follow group
	else
	{
		//Determine the unit's row number
		var rn = ceil(formationPosition/length);
		//Determine if there are enough units for at least one full row
		var rl = min(length, formationSize);
		//Determine x and y coordinates depending on the follow target orientation
		switch followTarget.dir
		{
			case "N":
				yAdj = (oUnitControl.cellSize * rn) * oUnitControl.unitSeparation;

				xAdj = (rn * (rl * oUnitControl.cellSize) 
					    - (oUnitControl.cellSize * formationPosition) - oUnitControl.cellSize) 
					    * oUnitControl.unitSeparation;
				break;
			case "S":
				yAdj = -((oUnitControl.cellSize * rn) * oUnitControl.unitSeparation);

				xAdj = (rn * (rl * oUnitControl.cellSize) 
					    - (oUnitControl.cellSize * formationPosition) - oUnitControl.cellSize) 
					    * oUnitControl.unitSeparation;
				break;
			case "E":
				xAdj = -((oUnitControl.cellSize * rn) * oUnitControl.unitSeparation);

				yAdj = (rn * (rl * oUnitControl.cellSize) 
					    - (oUnitControl.cellSize * formationPosition) - oUnitControl.cellSize) 
					    * oUnitControl.unitSeparation;
				break;
			case "W":
				xAdj = (oUnitControl.cellSize * rn) * oUnitControl.unitSeparation;

				yAdj = (rn * (rl * oUnitControl.cellSize) 
					    - (oUnitControl.cellSize * formationPosition) - oUnitControl.cellSize) 
					    * oUnitControl.unitSeparation;
				break;
		}
	}
}