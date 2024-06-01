//================================================================================
// carraige_treeA.
//================================================================================

class carraige_treeA extends Shrk2_Env_FX;

defaultproperties
{
    Begin Object name=MeshEmitter3 class=MeshEmitter
        StaticMesh=StaticMesh'2_Carriage_Hijack_SM.PineTreeQuad'
        RenderTwoSided=true
        MaxParticles=12
        StartSizeRange=(X=(Min=0.1,Max=0.1),Y=(Min=0.1,Max=0.1),Z=(Min=0.1,Max=0.15))
        InitialParticlesPerSecond=5000
        LifetimeRange=(Min=20,Max=20)
        StartVelocityRange=(X=(Min=0,Max=0),Y=(Min=-100,Max=-100),Z=(Min=0,Max=0))
    end object
    Emitters(0)=MeshEmitter3
    fTimeSoFar=6141.369
}
