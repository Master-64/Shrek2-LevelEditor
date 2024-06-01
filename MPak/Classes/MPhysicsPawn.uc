// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MPhysicsPawn extends MPawn
	Config(MPak);


var() bool bCanBePickedUpWhileBouncing, bDestroyWhenFallOutOfWorld, bAutoRotateWhileBouncing, bDealDamageToPawns, bScaleDamageWithVelocity, bTakeKnockback, bAllowBumpForBounce, bAllowBumpFromAbove, bUseBounceLivesSystem, bStickToSurfaces, bCanTouchActors, bDoNotStayOnTopOfPawns;
var() array<Sound> BounceSounds, DestroySounds;
var() float fMinimumVelocitySpeedToPlaySound, fBounceDropoffMultiplier, fBounceSoundRadius, fAutoRotatePitchDirection, fAutoRotateRollDirection, fAutoRotateRate, fDamageAmount, fMinimumVelocitySpeedToDamagePawn, fVelocityDamageMultiplier, fMinimumVelocitySpeedToBump, fBumpBounceVelocityMultiplier, fBumpBounceHelpBoostMultiplier, fReBumpDelay;
var() int iBounceLives;
var() class<Emitter> AmbientEmitterClass, BounceEmitterClass, DestroyEmitterClass;
var() vector vAmbientEmitterOffset, vBounceEmitterOffset, vDestroyEmitterOffset;
var Emitter AmbientEmitter, BounceEmitter, DestroyEmitter;
var byte iJustLanded;
var vector vLandedBounceVelocity, vSafeLocation;
var Actor LandedActor, InstigatingActor;
var rotator rSafeRotation, rOriginalRotation;
var float fNoBumpTimer;


event PreBeginPlay()
{
	super.PreBeginPlay();
	
	rOriginalRotation = Rotation;
	
	bAcceptsProjectors = !bActorShadows;
}

event PostBeginPlay()
{
	super.PostBeginPlay();
	
	InitEmitterType(true, 'Ambient');
}

event HitWall(vector HitNormal, Actor Wall)
{
	U.MFancySetLocation(self, Location);
	
	Velocity *= FClamp(fBounceDropoffMultiplier, -0.999999, 0.999999);
	Velocity = MirrorVectorByNormal(Velocity, HitNormal);
	
	OnBounce(Wall);
}

event Bump(Actor Other)
{
	local float fBumpBounceHelpBoost;
	
	if(Physics == PHYS_Falling && (!bAllowBumpForBounce || (bAllowBumpForBounce && CanBump() && VSize(Velocity) >= fMinimumVelocitySpeedToBump)))
	{
		U.MFancySetLocation(self, Location);
		
		Velocity *= FClamp(fBounceDropoffMultiplier, -0.999999, 0.999999);
		Velocity = MirrorVectorByNormal(Velocity, Normal(Location - Other.Location));
		
		OnBounce(Other);
	}
	else if(bAllowBumpForBounce && CanBump() && Physics == PHYS_Walking && VSize(Other.Velocity) >= fMinimumVelocitySpeedToBump && (bAllowBumpFromAbove || !bAllowBumpFromAbove && Other.Location.Z - Other.CollisionHeight / 2.0 <= Location.Z))
	{
		SetPhysics(PHYS_Falling);
		
		if(Abs(Velocity.Z) <= 10.0)
		{
			if(PhysicsVolume.Gravity.Z > 0.0)
			{
				fBumpBounceHelpBoost = -100.0 * fBumpBounceHelpBoostMultiplier;
			}
			else
			{
				fBumpBounceHelpBoost = 100.0 * fBumpBounceHelpBoostMultiplier;
			}
		}
		
		if(fBumpBounceHelpBoost != 0.0 && (!bAllowBumpFromAbove || (bAllowBumpFromAbove && Other.Location.Z - Other.CollisionHeight / 2.0 <= Location.Z)))
		{
			// Any actor can be sunk into the ground by a maximum of 2.65 units, so it's safe to move it up slightly before bouncing it
			U.MFancySetLocation(self, Location + Vect(0.0, 0.0, 6.625));
		}
		
		Velocity = Other.Velocity;
		Velocity.Z = fBumpBounceHelpBoost;
		Velocity *= FClamp(fBounceDropoffMultiplier, -0.999999, 0.999999);
		Velocity.X *= -1.0;
		Velocity.Y *= -1.0;
		Velocity = MirrorVectorByNormal(Velocity, Normal(Location - Other.Location));
		Velocity *= 2.0 * fBumpBounceVelocityMultiplier;
		
		OnBounce(Other, true);
	}
	
	if(bCanTouchActors)
	{
		Other.Touch(self);
	}
}

event Landed(vector HitNormal)
{
	if(iJustLanded == 0)
	{
		iJustLanded = 2;
		
		vLandedBounceVelocity = Velocity;
		vLandedBounceVelocity *= FClamp(fBounceDropoffMultiplier, -0.999999, 0.999999);
		vLandedBounceVelocity = MirrorVectorByNormal(vLandedBounceVelocity, HitNormal);
	}
}

event Tick(float DeltaTime)
{
	// Hack to make pawn bounce off the ground since it's not supported
	if(iJustLanded == 2)
	{
		LandedActor = Base;
		
		if(Abs(Velocity.Z) > 50.0)
		{
			// Hack to make pawn properly bounce of another pawn
			if(LandedActor.IsA('Pawn'))
			{
				vLandedBounceVelocity.Z *= 4.0 * FClamp(fBounceDropoffMultiplier, -0.999999, 0.999999);
				vLandedBounceVelocity.Z *= -1.0;
			}
			
			Velocity = vLandedBounceVelocity;
			
			U.MFancySetLocation(self, Location);
			
			SetPhysics(PHYS_Falling);
			
			OnBounce(LandedActor);
			
			iJustLanded = Max(iJustLanded - 1, 0);
		}
		else
		{
			iJustLanded = 0;
		}
	}
	else if(iJustLanded == 1)
	{
		iJustLanded = Max(iJustLanded - 1, 0);
	}
	
	if(bAutoRotateWhileBouncing && Physics == PHYS_Falling)
	{
		U.MFancySetLocation(self, Location);
		
		if(VSize(Velocity) > 350.0)
		{
			U.FancySetRotation(self, U.Rota(AddTo16BitInt(Rotation.Pitch, VSize(Velocity) * (fAutoRotateRate * 2.0) * FClamp(fAutoRotatePitchDirection, -1.0, 1.0)), Rotation.Yaw, AddTo16BitInt(Rotation.Roll, VSize(Velocity) * (fAutoRotateRate * 2.0) * FClamp(fAutoRotateRollDirection, -1.0, 1.0))));
		}
		else
		{
			U.FancySetRotation(self, U.Rota(Lerp(DeltaTime * (fAutoRotateRate * 4.0), Rotation.Pitch, rSafeRotation.Pitch), Lerp(DeltaTime * (fAutoRotateRate * 4.0), Rotation.Yaw, rSafeRotation.Yaw), Lerp(DeltaTime * (fAutoRotateRate * 4.0), Rotation.Roll, rSafeRotation.Roll)));
		}
		
		U.MFancySetLocation(self, Location);
	}
	
	bCanBePickedUp = (Physics == PHYS_Walking && Owner == none) || bCanBePickedUpWhileBouncing;
	
	if(bCanBePickedUp)
	{
		if(rSafeRotation.Pitch != rOriginalRotation.Pitch || rSafeRotation.Roll != rOriginalRotation.Roll)
		{
			SetRotation(U.Rota(rOriginalRotation.Pitch, Rotation.Yaw, rOriginalRotation.Roll));
		}
		else
		{
			SetRotation(U.Rota(rSafeRotation.Pitch, Rotation.Yaw, rSafeRotation.Roll));
		}
		
		if(InstigatingActor != none)
		{
			InstigatingActor = none;
		}
		
		Velocity = Vect(0.0, 0.0, 0.0);
	}
	else if(InstigatingActor == none && Owner != none)
	{
		InstigatingActor = Owner;
	}
	
	if(Owner == none && Physics == PHYS_Walking)
	{
		vSafeLocation = Location;
		rSafeRotation = Rotation;
	}
	
	// If we don't check whether the pawn is being held, we'll have duplicate shadows
	if(bActorShadows)
	{
		if(Owner == none)
		{
			KWAddShadow();
		}
		else
		{
			KWRemoveShadow();
		}
	}
	
	if(bDoNotStayOnTopOfPawns && Owner == none && Base != none && Base.IsA('Pawn') && iJustLanded <= 0)
	{
		Velocity = Normal(Location - Base.Location);
		
		U.MFancySetLocation(self, Location);
		
		SetPhysics(PHYS_Falling);
		
		Velocity *= 250.0;
		
		OnBounce(LandedActor);
	}
	
	fNoBumpTimer = FMax(fNoBumpTimer - DeltaTime, 0.0);
}

function int AddTo16BitInt(int I1, int I2) // Adds to the 16-bit integer I1 by the amount I2 (w/ overflowing)
{
	I1 += I2;
	
	if(I1 > 65535)
	{
		I1 = I1 % 65536;
	}
	
	return I1;
}

function InitEmitterType(bool B, name N) // Initializes an emitter type, or despawns it
{
	local Actor A;
	
	switch(N)
	{
		case 'Ambient':
			if(AmbientEmitter != none)
			{
				AmbientEmitter.Destroy();
			}
			
			if(B)
			{
				if(AmbientEmitterClass != none)
				{
					U.MFancySpawn(AmbientEmitterClass, (Location + PrePivot) + vAmbientEmitterOffset,, A);
					AmbientEmitter = Emitter(A);
					AmbientEmitter.SetOwner(self);
					AmbientEmitter.SetPhysics(PHYS_Trailer);
				}
			}
			
			break;
		case 'Bounce':
			if(BounceEmitter != none)
			{
				BounceEmitter.Destroy();
			}
			
			if(B)
			{
				if(BounceEmitterClass != none)
				{
					U.MFancySpawn(BounceEmitterClass, (Location + PrePivot) + vBounceEmitterOffset,, A);
					BounceEmitter = Emitter(A);
					BounceEmitter.SetOwner(self);
					BounceEmitter.SetPhysics(PHYS_Trailer);
				}
			}
			
			break;
		case 'Destroy':
			if(DestroyEmitter != none)
			{
				DestroyEmitter.Destroy();
			}
			
			if(B)
			{
				if(DestroyEmitterClass != none)
				{
					U.MFancySpawn(DestroyEmitterClass, (Location + PrePivot) + vDestroyEmitterOffset,, A);
					DestroyEmitter = Emitter(A);
					DestroyEmitter.SetPhysics(PHYS_Trailer);
				}
			}
			
			break;
		default:
			break;
	}
}

event FellOutOfWorld(eKillZType KillType)
{
	if(Owner != none)
	{
		if(Owner.IsA('KWPawn'))
		{
			KWPawn(Owner).DropCarryingActor();
		}
	}
	
	if(bDestroyWhenFallOutOfWorld)
	{
		Destroy();
		
		return;
	}
	
	U.MFancySetLocation(self, vSafeLocation);
	U.FancySetRotation(self, rSafeRotation);
}

event Destroyed()
{
	if(DestroyEmitterClass != none)
	{
		InitEmitterType(true, 'Destroy');
	}
	
	if(DestroySounds.Length != 0)
	{
		U.PlayASound3D(self,, DestroySounds[Rand(DestroySounds.Length)]);
	}
	
	InitEmitterType(false, 'Ambient');
}

function bool CanBump() // Returns true if a pawn can bump this pawn. Only used when bAllowBumpForBounce=true
{
	return fNoBumpTimer <= 0.0;
}

function OnBounce(Actor Other, optional bool bDoNotTakeDamage)
{
	fNoBumpTimer = fReBumpDelay;
	
	InitEmitterType(true, 'Bounce');
	
	if(InstigatingActor == none)
	{
		InstigatingActor = Other;
	}
	
	if(Other != none)
	{
		if(!bDoNotTakeDamage && bDealDamageToPawns && Other != InstigatingActor && VSize(Velocity) > fMinimumVelocitySpeedToDamagePawn && Other.IsA('Pawn'))
		{
			if(!bScaleDamageWithVelocity)
			{
				U.AddHealth(Pawn(Other), -fDamageAmount, !bTakeKnockback);
			}
			else
			{
				U.AddHealth(Pawn(Other), -((VSize(Velocity) / 25.0) * fVelocityDamageMultiplier), !bTakeKnockback);
			}
		}
	}
	
	if(bUseBounceLivesSystem)
	{
		if(iBounceLives == 0)
		{
			OutOfLives();
			
			return;
		}
		
		iBounceLives = Max(iBounceLives - 1, 0);
	}
	
	if(VSize(Velocity) > fMinimumVelocitySpeedToPlaySound && BounceSounds.Length != 0)
	{
		U.PlayASound3D(self,, BounceSounds[Rand(BounceSounds.Length)], Abs(Velocity.Z) / 100.0, fBounceSoundRadius);
	}
	
	if(bStickToSurfaces && Other != InstigatingActor)
	{
		SetPhysics(PHYS_Walking);
	}
}

function OutOfLives()
{
	Destroy();
}

function JumpOffPawn();


defaultproperties
{
	fMinimumVelocitySpeedToPlaySound=50.0
	bAutoRotateWhileBouncing=true
	fAutoRotatePitchDirection=1.0
	fAutoRotateRollDirection=1.0
	fAutoRotateRate=1.0
	fBounceDropoffMultiplier=0.5
	fBounceSoundRadius=64.0
	iBounceLives=1
	fDamageAmount=15.0
	fMinimumVelocitySpeedToDamagePawn=150.0
	bScaleDamageWithVelocity=true
	fVelocityDamageMultiplier=1.0
	bTakeKnockback=true
	bDoNotStayOnTopOfPawns=true
	fMinimumVelocitySpeedToBump=150.0
	bAllowBumpForBounce=true
	fReBumpDelay=0.2
	fBumpBounceVelocityMultiplier=1.0
	fBumpBounceHelpBoostMultiplier=1.0
	DrawType=DT_StaticMesh
	bUseCylinderCollision=false
	CollisionRadius=40.0
	CollisionHeight=40.0
	bCanBeBaseForPawns=true
	bActorShadows=true
	bCanBePickedUp=true
	bBounce=true
	bTakesDamage=false
}