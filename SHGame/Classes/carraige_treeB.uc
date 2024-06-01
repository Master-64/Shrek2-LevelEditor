//================================================================================
// carraige_treeB.
//================================================================================

class carraige_treeB extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=MeshEmitter5 class=MeshEmitter
        StaticMesh=StaticMesh'2_Carriage_Hijack_SM.PineTreeQuad'
        RenderTwoSided=true
        StartSizeRange=(X=(Min=0.1,Max=0.1),Y=(Min=0.1,Max=0.1),Z=(Min=0.1,Max=0.15))
        InitialParticlesPerSecond=10000
        LifetimeRange=(Min=40,Max=40)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=-50,Max=-50),Z=(Min=0,Max=0))
    end object
    Emitters(0)=MeshEmitter5
    fTimeSoFar=6242.578
}
