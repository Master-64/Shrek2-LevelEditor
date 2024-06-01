// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MBenchmarker extends MInfo
	Config(MPak);


var() bool b60FPS;
var float fTime, fBadTime;
var array<float> fFrameRates, fAverageFrameRates;
var float fBestFrameRate, fWorstFrameRate;
var int iBadFPSCounter;


event PostBeginPlay()
{
	local MBenchmarker BM;
	local int i;
	
	super.PostBeginPlay();
	
	foreach DynamicActors(class'MBenchmarker', BM)
	{
		i++;
		
		if(i > 1)
		{
			Warn("MBenchmarker -- Deleting a duplicate MBenchmarker");
			
			Destroy();
			
			return;
		}
	}
	
	Log(class'MVersion'.default.ModName @ class'MVersion'.default.Version @ "-- This level is running Master's Benchmarker, made by Master_64");
}

function LogTestResults() // Logs all test results
{
	local int i;
	local float F;
	local array<float> Fs;
	local array<string> sLogs;
	
	for(i = 0; i < fAverageFrameRates.Length; i++)
	{
		F += fAverageFrameRates[i];
	}
	
	F = F / float(fAverageFrameRates.Length);
	
	Fs[0] = F;
	Fs[1] = fBestFrameRate;
	Fs[2] = fWorstFrameRate;
	
	if(iBadFPSCounter > 0)
	{
		Fs[3] = ((float(fAverageFrameRates.Length - iBadFPSCounter) / float(fAverageFrameRates.Length)) * 100.0);
	}
	else
	{
		Fs[3] = 100.0;
	}
	
	Fs[4] = float(iBadFPSCounter);
	
	sLogs[0] = "----------------------------------------------------------------------------------------------------";
	sLogs[1] = "";
	sLogs[2] = "Benchmark Test Results:";
	sLogs[3] = "";
	sLogs[4] = "Average FPS:" @ GetRatingFromResult(0, Fs[0]);
	sLogs[5] = "Peak FPS:" @ GetRatingFromResult(1, Fs[1]);
	sLogs[6] = "Worst FPS:" @ GetRatingFromResult(2, Fs[2]);
	sLogs[7] = "FPS Stability Rating:" @ GetRatingFromResult(3, Fs[3]);
	sLogs[8] = "Bad FPS Counter:" @ GetRatingFromResult(4, Fs[4]);
	sLogs[9] = "";
	sLogs[10] = "----------------------------------------------------------------------------------------------------";
	
	U.CLog(sLogs, "MBenchmarkerLogs.log");
	
	EraseAllData();
}

function EraseAllData() // Erases all data so that the benchmark can be run again in the future
{
	fTime = 0.0;
	fBadTime = 0.0;
	fFrameRates.Remove(0, fFrameRates.Length);
	fAverageFrameRates.Remove(0, fAverageFrameRates.Length);
	fBestFrameRate = 0.0;
	fWorstFrameRate = U.GetMaxFloat();
	iBadFPSCounter = 0;
}

function string GetRatingFromResult(int I, float F) // Returns a final rating from a result of the benchmark
{
	local float fComparison;
	local string sFinalRating;
	
	fComparison = 59.8;
	
	if(!b60FPS)
	{
		fComparison *= 2.0;
	}
	
	switch(Clamp(I, 0, 4))
	{
		case 0:
		case 1:
			if(F >= fComparison)
			{
				sFinalRating = "Optimized! :D";
			}
			else if(F >= fComparison * 0.96)
			{
				sFinalRating = "Very Good";
			}
			else if(F >= fComparison * 0.91)
			{
				sFinalRating = "Good";
			}
			else if(F >= fComparison * 0.82)
			{
				sFinalRating = "Meh";
			}
			else if(F >= fComparison * 0.64)
			{
				sFinalRating = "Bad";
			}
			else
			{
				sFinalRating = "Awful :(";
			}
			
			sFinalRating = sFinalRating $ "," @ string(F) @ "(" $ string(fComparison) $ ")";
			
			break;
		case 2:
			if(F >= fComparison / 2.0)
			{
				sFinalRating = "Optimized! :D";
			}
			else if(F >= fComparison / 4.0)
			{
				sFinalRating = "Very Good";
			}
			else if(F >= fComparison / 8.0)
			{
				sFinalRating = "Good";
			}
			else if(F >= fComparison / 16.0)
			{
				sFinalRating = "Meh";
			}
			else if(F >= fComparison / 32.0)
			{
				sFinalRating = "Bad";
			}
			else
			{
				sFinalRating = "Awful :(";
			}
			
			sFinalRating = sFinalRating $ "," @ string(F) @ "(" $ string(fComparison / 2.0) $ ")";
			
			break;
		case 3:
			if(F >= 97.5)
			{
				sFinalRating = "Optimized! :D";
			}
			else if(F >= 94.0)
			{
				sFinalRating = "Very Good";
			}
			else if(F >= 91.0)
			{
				sFinalRating = "Good";
			}
			else if(F >= 83.0)
			{
				sFinalRating = "Meh";
			}
			else if(F >= 64.0)
			{
				sFinalRating = "Bad";
			}
			else
			{
				sFinalRating = "Awful :(";
			}
			
			sFinalRating = sFinalRating $ "," @ string(F) $ "%" @ "(97.50%)";
			
			break;
		case 4:
			if(F <= 3.0)
			{
				sFinalRating = "Optimized! :D";
			}
			else if(F <= 6.0)
			{
				sFinalRating = "Very Good";
			}
			else if(F <= 9.0)
			{
				sFinalRating = "Good";
			}
			else if(F <= 15.0)
			{
				sFinalRating = "Meh";
			}
			else if(F <= 30.0)
			{
				sFinalRating = "Bad";
			}
			else
			{
				sFinalRating = "Awful :(";
			}
			
			sFinalRating = sFinalRating $ "," @ string(int(F)) @ "(3)";
			
			break;
	}
	
	return sFinalRating;
}

function float GetAvgFPSFromDTArray(array<float> FTs) // Returns with the average framerate the game ran across the array
{
	local int i;
	local float F;
	
	for(i = 0; i < FTs.Length; i++)
	{
		F += FTs[i];
	}
	
	return F / float(FTs.Length);
}

function Trigger(Actor Other, Pawn EventInstigator)
{
	EraseAllData();
	
	Log("MBenchmarker -- Running benchmark now! Accounting for 60 FPS cap:" @ U.BoolToString(b60FPS));
	
	GotoState('Benchmark');
}

event Timer()
{
	if(Level.LevelAction == LEVACT_None)
	{
		SetTimer(0.0, false);
		
		GotoState('WaitASecond');
	}
}

state WaitASecond // Pauses the benchmarker from ticking, which is primarily used to stop benchmarking temporarily during a save
{
	function Trigger(Actor Other, Pawn EventInstigator)
	{
		Log("MBenchmarker -- Concluding benchmark. Test ran for" @ string(fAverageFrameRates.Length) @ "seconds. Logging test results...");
		
		LogTestResults();
		
		GotoState('');
	}
	
	Begin:
	
	Sleep(1.0);
	
	GotoState('Benchmark');
}

state Benchmark // Actively runs a performance benchmark on the game, until this info is triggered
{
	event PreSaveGame()
	{
		SetTimer(0.1, true);
		
		GotoState('');
	}
	
	event Tick(float DeltaTime)
	{
		local float F, fCurrentFPS;
		
		fTime += DeltaTime;
		
		fCurrentFPS = 1.0 / DeltaTime;
		
		if((!b60FPS && fCurrentFPS < 90.0) || (b60FPS && fCurrentFPS < 56.0))
		{
			fBadTime += DeltaTime;
		}
		
		fFrameRates.Insert(fFrameRates.Length, 1);
		fFrameRates[fFrameRates.Length - 1] = fCurrentFPS;
		
		if(fBestFrameRate < fCurrentFPS)
		{
			fBestFrameRate = fCurrentFPS;
		}
		
		if(fWorstFrameRate > fCurrentFPS)
		{
			fWorstFrameRate = fCurrentFPS;
		}
		
		if(fTime >= 1.0)
		{
			if(fBadTime > 0.066668)
			{
				iBadFPSCounter++;
			}
			
			fTime = 0.0;
			fBadTime = 0.0;
			
			F = GetAvgFPSFromDTArray(fFrameRates);
			
			fAverageFrameRates.Insert(fAverageFrameRates.Length, 1);
			fAverageFrameRates[fAverageFrameRates.Length - 1] = F;
			
			fFrameRates.Remove(0, fFrameRates.Length);
		}
	}
	
	function Trigger(Actor Other, Pawn EventInstigator)
	{
		Log("MBenchmarker -- Concluding benchmark. Test ran for" @ string(fAverageFrameRates.Length) @ "seconds. Logging test results...");
		
		LogTestResults();
		
		GotoState('');
	}
}


defaultproperties
{
	b60FPS=true
	fWorstFrameRate=2147483647.0;
}