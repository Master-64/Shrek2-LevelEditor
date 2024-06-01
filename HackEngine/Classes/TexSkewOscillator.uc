//================================================================================
// TexSkewOscillator.
//================================================================================

class TexSkewOscillator extends TexModifier
    editinlinenew
    collapsecategories
    hidecategories(Object,Material);

cpptext
{
	// UTexModifier interface
	virtual FMatrix* GetMatrix(FLOAT TimeSeconds);
}

var() float UOscillationRate;
var() float UOscillationPhase;
var() float UOscillationAmplitude;
var Matrix M;

defaultproperties
{
    UOscillationRate=1
    UOscillationAmplitude=0.1
}