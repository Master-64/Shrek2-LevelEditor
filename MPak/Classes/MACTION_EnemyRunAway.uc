// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_EnemyRunAway extends MScriptedAction
	Config(MPak);


var(Action) bool bBanditsRunAway, bPeasantsRunAway, bElvesRunAway, bKnightsRunAway, bBatsFlyAway;


function bool InitActionFor(ScriptedController C)
{
	local Bandit B;
	local Peasant P;
	local Elf E;
	local Knight K;
	local MilkKnight MK;
	local MongoKnight MNK;
	local Bat BT;
	
	if(bBanditsRunAway)
	{
		foreach C.DynamicActors(class'Bandit', B)
		{
			CombatController(B.Controller).GotoState('ReturnHome');
		}
	}
	
	if(bPeasantsRunAway)
	{
		foreach C.DynamicActors(class'Peasant', P)
		{
			CombatController(P.Controller).GotoState('ReturnHome');
		}
	}
	
	if(bElvesRunAway)
	{
		foreach C.DynamicActors(class'Elf', E)
		{
			CombatController(E.Controller).GotoState('ReturnHome');
		}
	}
	
	if(bKnightsRunAway)
	{
		foreach C.DynamicActors(class'Knight', K)
		{
			CombatController(K.Controller).GotoState('ReturnHome');
		}
		
		foreach C.DynamicActors(class'MilkKnight', MK)
		{
			ShEnemyController(MK.Controller).GotoState('ReturnToSpawn');
		}
		
		foreach C.DynamicActors(class'MongoKnight', MNK)
		{
			ShEnemyController(MNK.Controller).GotoState('ReturnToSpawn');
		}
	}
	
	if(bBatsFlyAway)
	{
		foreach C.DynamicActors(class'Bat', BT)
		{
			BatController(BT.Controller).GotoState('FlyToHome');
		}
	}
	
	return false;
}

function string GetActionString()
{
	return ActionString @ "-- Making enemies run away";
}


defaultproperties
{
	bBanditsRunAway=true
	bPeasantsRunAway=true
	bElvesRunAway=true
	bKnightsRunAway=true
	bBatsFlyAway=true
	ActionString="Enemy Run Away"
}