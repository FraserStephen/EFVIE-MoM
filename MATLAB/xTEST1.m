% clc;
% clear all;
% close all;

%geomN = "cube6";
%geomN = "cube78";
geomN = "cube173";

ruleN = "eps10";
waveN = "PlaneXinYpol";
obspN = "xycircular181";

    dataN = "Data/";
    %geomN = "sphere52r1";
    %ruleN = "eps2";
    %waveN = "PlaneZinYpol";
    %obspN = "xycircular361";

    ruleF = " " + dataN + ruleN + ".emrule";
    waveF = " " + dataN + waveN + ".incwave";
    obspF = " " + dataN + obspN + ".obsangle";

    unvmF = " " + dataN + geomN + ".unv";
    meshF = " " + dataN + geomN + ".tetramesh";
    faceF = " " + dataN + geomN + ".tetraface";
    propF = " " + dataN + geomN + ".emprops";
    tetqF = " " + dataN + geomN + ".tetraquad";
    triqF = " " + dataN + geomN + ".triquad";
    rhsvF = " " + dataN + geomN + ".rhs";
    mommF = " " + dataN + geomN + ".mommatrix";
    coefF = " " + dataN + geomN + ".coef";
    rsltF = " " + dataN + geomN + ".rcsresult";

    system( "MakeMesh.exe" + unvmF + meshF );
    system( "MakeFace.exe" + meshF + faceF );
    system( "Electrify.exe" + meshF + ruleF + propF );
    system( "MakeQuad.exe" + meshF + faceF + tetqF + triqF );
    system( "MakeRHS.exe" + meshF + faceF + tetqF + waveF + rhsvF );
    system( "MakeMoM.exe" + meshF + faceF + tetqF + triqF + propF + waveF + mommF );
    system( "SolveMoM.exe" + mommF + rhsvF + coefF );
    system( "ObserveRCS.exe" + meshF + faceF + tetqF + propF + waveF + coefF + obspF + rsltF );

%ObserveRCS( geom, ruleN, waveN, obspN );
rcs = ReadRcsResult( geomN );

figure();
polarplot( linspace(0,2*pi,181), rcs )