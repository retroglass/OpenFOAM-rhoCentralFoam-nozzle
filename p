/*--------------------------------*- C++ -*----------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  5.x                                   |
|   \\  /    A nd           | Web:      www.OpenFOAM.org                      |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/
/*   Windows 32 and 64 bit porting by blueCAPE: http://www.bluecape.com.pt   *\
|  Based on Windows porting (2.0.x v4) by Symscape: http://www.symscape.com   |
\*---------------------------------------------------------------------------*/
FoamFile
{
    version     2.0;
    format      ascii;
    class       volScalarField;
    location    "0";
    object      p;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

dimensions      [1 -1 -2 0 0 0 0];

internalField   uniform 101325; //101325

boundaryField
{
    front
    {
        type            wedge;
    }
    back 
    {
        type            wedge;
    }
    inlet
    {
	type		totalPressure; //totalPressure 
	value		uniform 9700000;
	rho		rho;
	psi		thermo:psi;
	p0		uniform 9700000;
	gamma		1.4;
	field		p;
    }
    
    nozzle-wall
    {
        type            zeroGradient;
    }
    
    left-wall
    {
        type            zeroGradient;
    }
    
    horz-outlet
    {
    	
        type            waveTransmissive;
        gamma           1.4;
	field		p;
	phi		phi;
	rho		rho;
	psi		thermo:psi;
        fieldInf        101325;
        value           uniform 101325;
        //lInf		0.01;

       
    }
    
    vert-outlet
    {
        type            waveTransmissive;
        gamma           1.4;
	field		p;
	phi		phi;
	rho		rho;
	psi		thermo:psi;
        fieldInf        101325;
        value           uniform 101325;
        //lInf		0.01;    
    }

}


// ************************************************************************* //
