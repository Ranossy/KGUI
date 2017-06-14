-----------------------------------------------
-- 文件名    :  Venation.lua
-- 创建人    :  Wangtao	
-- 创建时间  :  2008-03-24
-- 用途(模块):  经脉系统
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  无
-- 技能效果  :  打通经脉的脚本
------------------------------------------------
------------------------------------------------
--修改人     ： 陈翰林
--修改内容   ： 增加了经脉的等级需求，基础系经脉的成功率，单个经脉单级的成功率
------------------------------------------------

Include("scripts/skill/经脉/VerationTable.lua")
Include("scripts/Include/PlayerCustomValueName.lh")

RandVerationDifficult =	--这里是环通各重数打通几率,骰子最小值和最大值表
{
	{nRandMin = 1   , nRandMax = 19  ,  nRandVerationLevel = 1   },		-- Level 1
	{nRandMin = 20  , nRandMax = 37  , nRandVerationLevel = 2   },		-- Level 2
	{nRandMin = 38  , nRandMax = 54  , nRandVerationLevel = 3   },		-- Level 3
	{nRandMin = 55  , nRandMax = 67  , nRandVerationLevel = 4   },		-- Level 4
	{nRandMin = 68  , nRandMax = 79  , nRandVerationLevel = 5   },		-- Level 5
	{nRandMin = 80  , nRandMax = 89  , nRandVerationLevel = 6   },		-- Level 6
	{nRandMin = 90  , nRandMax = 94  , nRandVerationLevel = 7   },		-- Level 7
	{nRandMin = 95  , nRandMax = 97  , nRandVerationLevel = 8   },		-- Level 8
	{nRandMin = 98  , nRandMax = 99  , nRandVerationLevel = 9   },		-- Level 9
	{nRandMin = 100 , nRandMax = 100 , nRandVerationLevel = 10	},		-- Level 10	 
};	
	

local nPlasterBuffId = 1741;
local nMaxEffectCount = 10;
PERCENT_BASE = 1024


function OpenVenation(player, nVenationID)
    local bResult  = false;
    local bRetCode = false;
    
    bRetCode = CanOpenVenation(player, nVenationID);
    if bRetCode == false then
        return false;
    end
    
    bRetCode = RandVenationEffect(player, nVenationID);
    if bRetCode then
        return true;
    end
    
    bRetCode = LearnVenation(player, nVenationID);
    if bRetCode then
        OpenSuccessed(player, nVenationID);
        bResult = true;
    else
        OpenFailed(player, nVenationID);
        bResult = false;
    end
    
    return bResult;
end;

function RandVenationEffect(player, nVenationID)
    local EffectInfo = VenationEffect[nVenationID];
    
    if EffectInfo == nil then
  --      Log("Not  RandVenation")
        return false
    end
    
    local nOldSkillLevel = player.GetSkillLevel(nVenationID)
    if nOldSkillLevel >= 10 then
        return true
    end
    
    if nOldSkillLevel == 0 then
        for i, EffectRequirement in pairs(EffectInfo.Requirement) do
            local nSkillLevel = player.GetSkillLevel(EffectRequirement);
            
            if nSkillLevel < EffectInfo.RequirementLevel[i] then
                return false;
            end
        end
    end
    
    local nCostTrain = VenationCost[nVenationID][nOldSkillLevel + 1];    
    if nCostTrain == nil then
        return false;
    end
    
    nCostTrain = GetActualCostTrain(player, nCostTrain);
    
    if player.nCurrentTrainValue < nCostTrain then
        return false;                       -- 修为不够扣了。失败
    end
    local bRetCode = CostTrain(player, nCostTrain, true, true, nVenationID, nRandLevel); --增加点的奇穴ID，和点以后的等级作奇穴护航处理
    if bRetCode == false then
        return false;
    end
        
    player.LearnSkillLevel(nVenationID, nOldSkillLevel + 1, false);

    
    --local VenaScene = player.GetScene();
    local nVenaSkillLevel = player.GetSkillLevel(nVenationID)
    local VenaSkill = GetSkill(nVenationID,1)
    --这里地图通告 奇穴打通情况
    --if nVenaSkillLevel > 0 then
    --    VenaScene.SendMessage("机缘巧合，"..player.szName.."成功打通 "..VenaSkill.szSkillName.." 第"..nVenaSkillLevel.."重！")
    --end
    --
    if nVenaSkillLevel == 10 then
        Log(player.szName .. GetEditorString(2, 8044) .. VenaSkill.szSkillName .. GetEditorString(2, 8049));
    end
    
    return true;
end;

function LearnVenation(player, nVenationID)
    local nCostTrain        = 0;
    local nVenationLevel    = 0;
    local bSuccessLearn     = false;
    local nRandom           = 0;
    local nSuccessCof       = 0;
    local nLossTrain        = 0;
    local nLossTrainSkillLevel  = 0; 
    local nReduceCostSkillLevel = 0;  

    nVenationLevel = player.GetSkillLevel(nVenationID) + 1;
    
    nCostTrain = VenationCost[nVenationID][nVenationLevel]; -- 取得需要消耗的修为
    
    if nCostTrain == nil then               -- 该等级技能不存在。失败
        return false;
    end
    
    nCostTrain = GetActualCostTrain(player, nCostTrain);
    
    if player.nCurrentTrainValue < nCostTrain then
        return false;                       -- 修为不够扣了。失败
    end
    
    nSuccessCof = VenationDifficult[nVenationID][nVenationLevel];
    
    if VenationType[nVenationID] == PHYSICS_VENATION then
        nSuccessCof = nSuccessCof + player.nPhysicsVenationCof;
    elseif VenationType[nVenationID] == MAGIC_VENATION then
        nSuccessCof = nSuccessCof + player.nMagicVenationCof;
    elseif VenationType[nVenationID] == ASSIST_VENATION then
        nSuccessCof = nSuccessCof + player.nAssistVenationCof;
    elseif VenationType[nVenationID] == BASE_VENATION then
        nSuccessCof = nSuccessCof + player.nBaseVenationCof;
    end
    
    if nSuccessCof > PERCENT_BASE then
        nSuccessCof = PERCENT_BASE;
    end
	
    bSuccessLearn = player.IsVenationSuccess(nVenationID, nVenationLevel, nSuccessCof);
    ----20100729移除冲穴失败成就完成接口
--	if not bSuccessLearn then				--冲穴失败成就判断
--    	player.AddAchievementCount(106,1)		--冲穴失败1次获得成就
--    end
    
    local bRetCode = CostTrain(player, nCostTrain, false, bSuccessLearn);
    if bRetCode == false then
        return false;
    end
		
    if bSuccessLearn then
        local skill = GetSkill(nVenationID, 1);
        if not skill then
            return false;
        end
        
        local nBelongKungfuLevel = player.GetSkillLevel(skill.dwBelongKungfu);
        if nBelongKungfuLevel == 0 then
            player.LearnSkill(skill.dwBelongKungfu);
        end
    
        player.LearnSkill(nVenationID, true);  -- 学习该被动技能
    end
    return bSuccessLearn;
end;

function CostTrain(player, nCostTrain, bVenationEffect, bSuccessed, nVenationID, nRandLevel) --增加点的奇穴ID，和点以后的等级作奇穴护航处理
    local bRetCode = false;
    
    if bSuccessed  then
    	bRetCode = player.AddTrain(-nCostTrain);

    	if bRetCode and not bVenationEffect then
    	    player.nUsedTrainValue = player.nUsedTrainValue + nCostTrain;  --计算丹田修为。
    	    
    	    if player.nUsedTrainValue >=5000 and not player.IsAchievementAcquired(99) then	--增加成就完成判断 丹田容量达到某点
				player.AcquireAchievement(99)
    	    elseif 
    	    player.nUsedTrainValue >= 10000 and not player.IsAchievementAcquired(100) then
				player.AcquireAchievement(100)
			elseif
			player.nUsedTrainValue >= 20000 and not player.IsAchievementAcquired(101) then
				player.AcquireAchievement(101)
			elseif
    	    player.nUsedTrainValue >= 50000 and not player.IsAchievementAcquired(102) then
				player.AcquireAchievement(102)
			elseif
    	    player.nUsedTrainValue >= 98000 and not player.IsAchievementAcquired(103) then
				player.AcquireAchievement(103)
			end
			
    	end
    else
    	local nReturn = GetRestoreTrain(player, nCostTrain)
    	bRetCode = player.AddTrain(nReturn - nCostTrain)
    end
    
    return bRetCode;
end

function OpenSuccessed(player, nVenationID)
end

function OpenFailed(player, nVenationID)
end

function ResetVenation(player)
    local bRetCode = false;
    local nCostMoney = CalcResetCost(player);
    local nReviveTrain = player.nUsedTrainValue;
    local nResetDiscountTrain = GetResetDiscount(player,nReviveTrain);

	if not player.IsMoneyEnough(0, 0, nCostMoney) then
		return false;
	end

    player.nUsedTrainValue = 0;
    bRetCode = player.AddTrainNoLimit(nResetDiscountTrain);
    if not bRetCode then
        player.nUsedTrainValue = nReviveTrain;
        return false;
    end
    
    for nVectionID, _v in pairs(VenationDifficult) do
        local SkillLevel = player.GetSkillLevel(nVectionID);
        
        if not IsVenationEffect(nVectionID) then        
            if SkillLevel > 0 then
                player.ForgetSkill(nVectionID);
            end
        end
    end

    player.CostMoney(0, 0, nCostMoney);

	if not player.IsAchievementAcquired(718) then
		player.AcquireAchievement(718)
	end

    return true;
end

function ResetVenationEffect(player)
    local bRetCode = false;
    local nCostMoney = CalcEffectResetCost(player);
    local nReviveTrain = 0;
	for k, v in pairs(tVenationEffectID) do
		nReviveTrain = nReviveTrain + (tZhuanhuan[player.GetSkillLevel(v)] or 0)
	end

	if not player.IsMoneyEnough(0, 0, nCostMoney) then
		return false;
	end

	for k, v in pairs(tVenationEffectID) do
			if player.GetSkillLevel(v)> 0 then
				player.ForgetSkill(v)
			end
	end

    bRetCode = player.AddTrainNoLimit(nReviveTrain);
    if not bRetCode then
				Log(GetEditorString(2, 8045)..player.szName.." ID: "..player.dwID..GetEditorString(2, 8046)..nReviveTrain..GetEditorString(2, 3571))
        return false;
    end
    
    player.CostMoney(0, 0, nCostMoney);

    return true;
end

function IsVenationEffect(nVenationID)
    for nEffectID, _v in pairs(VenationEffect) do
        if nEffectID == nVenationID then
            return true;
        end
    end
    
    return false;
end

function ResetVenationOld(player)
    local bRetCode = false;
    local nReviveTrain = player.nUsedTrainValue;

    player.nUsedTrainValue = 0;
    bRetCode = player.AddTrainNoLimit(nReviveTrain);
    if not bRetCode then
        player.nUsedTrainValue = nReviveTrain;
        return false;
    end
    
    for nVectionID, _v in pairs(VenationDifficultOld) do
        local SkillLevel = player.GetSkillLevel(nVectionID);
        
        if not IsVenationEffectOld(nVectionID) then        
            if SkillLevel > 0 then
                player.ForgetSkill(nVectionID);
            end
        end
    end

    return true;
end

function ResetVenationXiajiyu(player)		--洗掉下极俞并返还相应修为
    local bRetCode = false;
		local XiajiyuSkillLevel = player.GetSkillLevel(9);
		if XiajiyuSkillLevel == 0 then
			return false;
		end
	
		local nReviveTrain = tZhuanhuan[XiajiyuSkillLevel];
		
    bRetCode = player.AddTrainNoLimit(nReviveTrain);
    if not bRetCode then
        return false;
    end
    
		if XiajiyuSkillLevel > 0 then
				player.ForgetSkill(9);
				player.SendSystemMessage(GetEditorString(2, 8048)..XiajiyuSkillLevel..GetEditorString(2, 8047)..nReviveTrain..GetEditorString(1, 734))
		end

    return true;
end



function IsVenationEffectOld(nVenationID)
    for nEffectID, _v in pairs(VenationEffectOld) do
        if nEffectID == nVenationID then
            return true;
        end
    end
    
    return false;
end

function RandFreshManVenationEffect(player)		--新人传功获得奇穴奖励
	local nRandLevel = 1
	local nRandValue = Random(100)	--骰子投1-100点
	local nQixueLevel = player.GetSkillLevel(9)

	for i = 1, nMaxEffectCount do
		if nRandValue >= RandVerationDifficult[i].nRandMin and nRandValue <= RandVerationDifficult[i].nRandMax then
			nRandLevel = RandVerationDifficult[i].nRandVerationLevel;
		end
	end
	if player.nLevel < 70 and nRandLevel  == 10 then	--未到70的人物无法打通10重，最高至9重
		nRandLevel = 9;
	end
	if nRandLevel > nQixueLevel then
		if nQixueLevel >0 then
			player.ForgetSkill(9)
		end
		for i = 1, nRandLevel, 1 do
			player.LearnSkill(9, false);
		end
		return nRandLevel;
	else
		return false;
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com