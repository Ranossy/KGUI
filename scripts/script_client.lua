--本文件用于Client接收Game server发起的远程调用

Include("scripts\\Tree.lh");


--示例代码
function OnTestRespond(x, y)
    Log("OnTestRespond");
    Tree(x);
    Tree(y);	
end

-- 师徒系统 同步师徒数据
function OnSyncMentorData(szType, param)
	local player = GetClientPlayer();
	if not player then
		return
	end
	
	if szType == "ALL" then
		player.nMaxApprenticeNum    = param[1];
		player.nAcquiredMentorValue = param[2];
		player.nLastEvokeMentorTime = param[3];
		player.nEvokeMentorCount    = param[4];
		player.nUsableMentorValue   = param[5];
		player.dwTAEquipsScore      = param[6];
	elseif szType == "ACQUIRED_MVALUE" then
		player.nAcquiredMentorValue = param;
	elseif szType == "LEFT_EVOKE_NUM" then
		player.nEvokeMentorCount = param;
	elseif szType == "MAX_APPRENTICE_NUM" then
		player.nMaxApprenticeNum = param;
	elseif szType == "USABLE_MVALUE" then 
		player.nUsableMentorValue = param;
	elseif szType == "TA_EQUIPS_SCORE" then
		player.dwTAEquipsScore = param;
	end
end

function OnAddPendent(dwItemIndex, nGenTime)
	local player = GetClientPlayer()
	if not player then
		return
	end
	
	player.AddPendent(dwItemIndex, nGenTime)
end

function OnAddColorPendent(dwItemIndex, nColor1, nColor2, nColor3)
	local player = GetClientPlayer()
	if not player then
		return
	end
	
	player.AddColorPendent(dwItemIndex, nColor1, nColor2, nColor3)
end

function OnRemovePendent(dwItemIndex)
	local player = GetClientPlayer();
	if not player then
		return
	end
	
	player.RemovePendent(dwItemIndex)
end

function SetWaistPendentBoxSize(nNewBoxSize)
	local player = GetClientPlayer()
	if not player then
		return
	end
	
	player.SetWaistPendentBoxSize(nNewBoxSize)
end

function SetBackPendentBoxSize(nNewBoxSize)
	local player = GetClientPlayer()
	if not player then
		return
	end
	
	player.SetBackPendentBoxSize(nNewBoxSize)
end

function SetLShoulderPendentBoxSize(nNewBoxSize)
    local player = GetClientPlayer()
    if not player then
        return
    end
    
    player.SetLShoulderBoxSize(nNewBoxSize)
end

function SetRShoulderPendentBoxSize(nNewBoxSize)
    local player = GetClientPlayer()
    if not player then
        return
    end
    
    player.SetRShoulderBoxSize(nNewBoxSize)
end

function SetBackCloakPendentBoxSize(nNewBoxSize)
    local player = GetClientPlayer()
    if not player then
        return
    end
    
    player.SetBackCloakBoxSize(nNewBoxSize)
end

function SetFacePendentBoxSize(nNewBoxSize)
	local player = GetClientPlayer()
	if not player then
		return
	end
	
	player.SetFacePendentBoxSize(nNewBoxSize)
end

function OnAddPendentExistTime(dwItemIndex, nDeltaTime)
	local player = GetClientPlayer()
	if not player then
		return
	end
	
	player.AddPendentLeftExistTime(dwItemIndex, nDeltaTime)
end

function SetTitlePoint(nTitlePoint, nAddTitlePoint)
	local player = GetClientPlayer()
	if not player then
		return
	end
	
	player.nTitlePoint = nTitlePoint
end

function SetRankPoint(nRankPoint)
	local player = GetClientPlayer()
	if not player then
		return
	end
	
	player.nRankPoint = nRankPoint
end

function SetTitleInfo(nTitle, nTitlePoint, nRankPoint)
	local AchievementList = 
	{
		"TITLE_LEVEL1", "TITLE_LEVEL2", "TITLE_LEVEL3", "TITLE_LEVEL4","TITLE_LEVEL5", 
		"TITLE_LEVEL6", "TITLE_LEVEL7", "TITLE_LEVEL8", "TITLE_LEVEL9", "TITLE_LEVEL10",
		"TITLE_LEVEL11", "TITLE_LEVEL12", "TITLE_LEVEL13", "TITLE_LEVEL14"
	}
	 
	local player = GetClientPlayer()
	if not player then
		return
	end
	
	player.nTitle 		= nTitle
	player.nTitlePoint 	= nTitlePoint
	player.nRankPoint 	= nRankPoint
	
	for i = 1,nTitle do
		RemoteCallToServer("OnClientAddAchievement", AchievementList[i])
	end
	
end

function SetEquipIDArray(nMaxEquipPack, nEquipIDArray)
	local player = GetClientPlayer()
	if not player then
		return
	end
	
	for i = 0,nMaxEquipPack - 1 do
		player.SetEquipIDArray(i, nEquipIDArray[i])
	end
end

function SetBankPasswordVerified(bIsVerified)
	local player = GetClientPlayer()
	if not player then
		return
	end
	
	player.bIsBankPasswordVerified = bIsVerified
end

function SetBankPasswordResetTime(nTime)
	local player = GetClientPlayer()
	if not player then
		return
	end
	
	player.nBankPasswordResetEndTime = nTime
end

function SetBankPasswordExist(bExist)
	local player = GetClientPlayer()
	if not player then
		return
	end
	
	player.bBankPasswordExist = bExist
end

function SetBankPasswordQuestionID(nQuestionID)
	local player = GetClientPlayer()
	if not player then
		return
	end
	
	player.nBankPasswordQuestionID = nQuestionID
end

function SyncDisarmState(dwID, bDisarm)
	local player = nil
	if IsPlayer(dwID) then
		player = GetPlayer(dwID)
	end
	
	if not player then
		return
	end
	
	player.SetDisarm(bDisarm)
end

function SyncStealthState(dwID, bStealth)
	local character = nil
	if IsPlayer(dwID) then
		character = GetPlayer(dwID)
	else
		character = GetNpc(dwID)
	end
	
	if not character then
		return
	end
	
	character.Stealth(bStealth)
end

function SyncCounterStealthState(dwID, bCounterStealth)
	local character = nil
	if IsPlayer(dwID) then
		character = GetPlayer(dwID)
	else
		character = GetNpc(dwID)
	end
	
	if not character then
		return
	end
	
	character.CounterStealth(bCounterStealth)
end

-- 外装
function SetCurrentSetID(nSetID)
	local player = GetClientPlayer()	
	if player then
		player.SetCurrentSetID(nSetID)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com