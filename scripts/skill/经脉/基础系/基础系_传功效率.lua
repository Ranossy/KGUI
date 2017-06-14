------------------------------------------------
-- 文件名    : 经脉具体属性脚本
-- 创建人    : zhangqi 
-- 创建时间  : 2008-07-08
-- 用途(模块): 经脉
-- 经脉类型  : 基础系
-- 经脉名称  : 传功
-- 经脉效果  : 传功
------------------------------------------------

------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/经脉/VerationTable.lua")
Include("scripts/skill/经脉/Venation.lua")

tSkillData =
{
	{TransmitRate = 205,nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 1   
	{TransmitRate = 226,nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 2  
	{TransmitRate = 246,nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 3  
	{TransmitRate = 267,nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 4  
	{TransmitRate = 287,nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 5  
	{TransmitRate = 308,nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 6  
	{TransmitRate = 328,nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 7  
	{TransmitRate = 349,nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 8  
	{TransmitRate = 369,nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 9  
	{TransmitRate = 390,nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 10 
	{TransmitRate = 410,nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 11
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- 魔法属性 -------------------------------------------------

--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		1022,
--		1
--	);
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		1023,
--		1
--	);
	
--    skill.AddAttribute(
--        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
--        ATTRIBUTE_TYPE.TRANSMIT_TRAIN,						
--        200,
--        tSkillData[dwSkillLevel].TransmitRate
--    );
    
    skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,					-- Call 满神京buff ,十层之后,不能接受传功
		"skill/经脉/基础系/基础系_接受传功BUFF.lua",	-- 计算功力，损耗
		0
	);
    skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,					-- Call 功行具buff ,十层之后,不能传功
		"skill/经脉/基础系/基础系_传功效率.lua",
	0
	);
	
	----------------- BUFF相关 -------------------------------------------------
    skill.AddSlowCheckDestBuff(1162, 0,BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

    ----------------- 设置Cool down --------------------------------------------
    -- 公共CD
	--skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
    -- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
    --skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	

   	----------------- 经验升级相关 ---------------------------------------------
   	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
    --skill.dwLevelUpExp	= 0;    				-- 升级经验
    --skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
    --skill.nCostStamina	= 0;									-- 技能消耗的体力
    --skill.nCostItemType	= 0;									-- 技能消耗的物品类型
    --skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID
    
    ----------------- 聚气相关 -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- 技能是否需要聚气
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- 链状技能相关 ---------------------------------------------
    --skill.nChainBranch	= 1;					--链状技能分支数
    --skill.nChainDepth		= 3;					--链状技能层数
    --链状技能的子技能用skill.SetSubsectionSkill()设定
    
    
    ----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius		= 1 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius		= 4 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange		= 256;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径 
    --skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
    ----------------- 时间相关 -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- 吟唱帧数
    --skill.nChannelInterval	= 0; 				-- 通道技间隔时间 
    --skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数 
    --skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
    
    ----------------- 阵法相关 -------------------------------------------------
    --skill.bIsFormationSkill	= false;			-- 是否阵眼技能
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
    --skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）
    
    ----------------- 目标血量需求 ---------------------------------------------
    --skill.nTargetLifePercentMin	= 0;			-- 血量最小值>=
    --skill.nTargetLifePercentMax	= 100;			-- 血量最大值<=
    
    ----------------- 自身血量需求 ---------------------------------------------
    --skill.nSelfLifePercentMin	= 0;				-- 血量最小值>=
    --skill.nSelfLifePercentMax	= 100;				-- 血量最大值<=
    
    ----------------- 打退打断落马相关 -------------------------------------------------
    --skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
    --skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	
	--skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0
	
	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
    return true;
end



-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	
    return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local VenaScene = player.GetScene();
	----20100728 取消传送方获得的20小时下线debuff和4小时在线debuff
--	local BuffOffline = nil
--	local BuffOnline = nil
--	BuffOffline = player.GetBuff(1163,0)	--上下线计时buff 10层1163变为1层1164后不能传功
--	BuffOnline = player.GetBuff(1649,0)		--在线计时buff 10层1649变为1层1650后不能传功
--	if BuffOffline and BuffOffline.nStackNum >= 9 then
--		player.DelGroupBuff(BuffOffline.dwID,BuffOffline.nLevel)
--		player.AddBuff(0,99,1164,1,0)
--	else
--		player.AddBuff(0,99,1163,1,0)
--	end
--	if BuffOnline and BuffOnline.nStackNum >= 9 then
--		player.DelGroupBuff(BuffOnline.dwID,BuffOnline.nLevel)
--		player.AddBuff(0,99,1650,1,0)
--	else
--		player.AddBuff(0,99,1649,1,0)
--	end
	
	local targetplayer = nil
	local eType,nTargetID = player.GetSkillTarget()
	if eType == TARGET.PLAYER then
		targetplayer = GetPlayer(nTargetID)
	end
	if not targetplayer then
		return false;
	end
	if IsPlayer(targetplayer.dwID) then
		if targetplayer.nLevel < 20 then
			player.SendSystemMessage(GetEditorString(2, 8060))
			return false;
		end	
		local nPlayerVPP = GetGongliCount(player)
		local nTargetVPP = GetGongliCount(targetplayer)
		local nLevel = player.GetSkillLevel(1206)
		local nDisVPP = (nPlayerVPP - nTargetVPP)/nTargetVPP
		local nCostVP = 0
		local nReceiveVP = 0
		local nMentorET = 0
		local nApprenticeET = 0
		local nChongGuET = 0
		local nAfkReceiveET = 0
		local nAfkTransET = 0
		local nNewAccBuffCof = 1
		
		local AfkReceiveBuff = targetplayer.GetBuff(2031,1)	--判断是否AFK玩家获得了奖励BUFF
		local AfkTransBuff = player.GetBuff(2031,1)
		local NewAccBuff = targetplayer.GetBuff(2524,1) --判断接受传功者是否为新帐号活动
		
		if AfkReceiveBuff or AfkTransBuff then		--AFK玩家在buff下接受传功获得额外40点，传功获得额外15点
			nAfkReceiveET = 400
			nAfkTransET = 150
		end
		if player.IsMyApprentice(targetplayer.dwID) then
			nMentorET = 100
			nApprenticeET = 50
		end
		if NewAccBuff then--判断接受传功者为新帐号活动,则传功双方收益增加10倍
			nNewAccBuffCof = 10
		end
		
		if nTargetVPP <= 70000 then		--如果被传目标功力小于70000，则增加传功者崇骨奖励
			nChongGuET = 320*nLevel
		end
		if nDisVPP <= 0 then		--传功曲线
			nCostVP = 400 - nMentorET - nChongGuET - nAfkTransET
			if nCostVP < 0 then				---如果传功输出者收益为正，则享受新帐号加成系数
				nCostVP = nNewAccBuffCof * nCostVP
			end
			nReceiveVP = (400 + 320*nLevel + nApprenticeET + nAfkReceiveET) * nNewAccBuffCof
		elseif 	nDisVPP > 0 and nDisVPP < 0.5 then
			nCostVP = math.floor(-nDisVPP * 1100 + 400) - nMentorET - nChongGuET - nAfkTransET
			if nCostVP < 0 then
				nCostVP = nNewAccBuffCof * nCostVP
			end
			nReceiveVP = (400 + 320*nLevel + nApprenticeET + nAfkReceiveET) * nNewAccBuffCof
		elseif nDisVPP >= 0.5 then
			nCostVP = -150 - nMentorET - nChongGuET - nAfkTransET
			if nCostVP < 0 then
				nCostVP = nNewAccBuffCof * nCostVP
			end
			nReceiveVP = (400 + 320*nLevel + nApprenticeET + nAfkReceiveET) * nNewAccBuffCof
		end
--		if nCostVP >= 0 then
--			player.SendSystemMessage(player.szName.."（功力"..nPlayerVPP.."）".."施展传功即将损耗修为 "..nCostVP.."点，"..targetplayer.szName.."（功力"..nTargetVPP.."）".."接受传功即将获得修为"..nReceiveVP.."点！")	
--			targetplayer.SendSystemMessage(player.szName.."（功力"..nPlayerVPP.."）".."施展传功即将损耗修为 "..nCostVP.."点，"..targetplayer.szName.."（功力"..nTargetVPP.."）".."接受传功即将获得修为"..nReceiveVP.."点！")	
--		elseif nCostVP < 0 then
--			player.SendSystemMessage(player.szName.."（功力"..nPlayerVPP.."）".."施展传功即将获得修为 "..-nCostVP.."点，"..targetplayer.szName.."（功力"..nTargetVPP.."）".."接受传功即将获得修为"..nReceiveVP.."点！")	
--			targetplayer.SendSystemMessage(player.szName.."（功力"..nPlayerVPP.."）".."施展传功即将获得修为 "..-nCostVP.."点，"..targetplayer.szName.."（功力"..nTargetVPP.."）".."接受传功即将获得修为"..nReceiveVP.."点！")	
--		end
		if player.nCurrentTrainValue < nCostVP then
			player.SendSystemMessage(player.szName..GetEditorString(2, 8065))
			targetplayer.SendSystemMessage(player.szName..GetEditorString(2, 8065))
			return false;	
		end
		if nReceiveVP > targetplayer.nMaxTrainValue - targetplayer.nCurrentTrainValue then
			player.SendSystemMessage(targetplayer.szName..GetEditorString(2, 8059))
			targetplayer.SendSystemMessage(targetplayer.szName..GetEditorString(2, 8059))
			return false;
		end
		if nCostVP >= 0 then
			player.AddTrain(-nCostVP)
			targetplayer.AddTrain(nReceiveVP)
			player.SendSystemMessage(player.szName..GetEditorString(2, 8051)..nPlayerVPP..GetEditorString(2, 8057)..GetEditorString(2, 8058)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8051)..nTargetVPP..GetEditorString(2, 8057)..GetEditorString(2, 8063)..nReceiveVP..GetEditorString(2, 8050))	
		elseif nCostVP < 0 then
			player.AddTrain(-nCostVP)
			targetplayer.AddTrain(nReceiveVP)
			player.SendSystemMessage(player.szName..GetEditorString(2, 8051)..nPlayerVPP..GetEditorString(2, 8057)..GetEditorString(2, 8056)..-nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8051)..nTargetVPP..GetEditorString(2, 8057)..GetEditorString(2, 8063)..nReceiveVP..GetEditorString(2, 8050))	
		end
--		if nTargetVPP <= 70000 then		--接受者功力小于70000，传功双方尝试冲击奇穴下级俞
--			local nRandFM = Random(10000)
--			local VenaSkill = GetSkill(9,1)
--			if nRandFM >= 1 and nRandFM <= 1000 then	--每次传功有10%几率允许冲击奇穴下级俞
--				local nPlayerRandLevel = RandFreshManVenationEffect(player)
--				local nTargetRandLevel = RandFreshManVenationEffect(targetplayer)
--				local nPlayerXiajiyuLevel = player.GetSkillLevel(9)
--				local nTargetPlayerXiajiyuLevel = targetplayer.GetSkillLevel(9)
--				if nPlayerRandLevel then
--					VenaScene.SendMessage(player.szName.."侠士传功给"..targetplayer.szName.."，真气交融，直贯丹田，成功打通"..VenaSkill.szSkillName.." 第"..nPlayerRandLevel.."重！")
--					if nPlayerRandLevel == 10 then
--						Log(player.szName .. " 成功打通 " .. VenaSkill.szSkillName .. " 第10重。");
--					end
--				else
--					VenaScene.SendMessage(player.szName.."侠士传功给"..targetplayer.szName.."，真气贯入丹田之时忽然逆冲，尝试突破"..VenaSkill.szSkillName.." 第"..nPlayerXiajiyuLevel.."重失败！")
--				end
--				if nTargetRandLevel then
--					VenaScene.SendMessage(targetplayer.szName.."接受"..player.szName.."侠士传功，真气交融，直贯丹田，成功打通"..VenaSkill.szSkillName.." 第"..nTargetRandLevel.."重！")
--					if nTargetRandLevel == 10 then
--						Log(targetplayer.szName .. " 成功打通 " .. VenaSkill.szSkillName .. " 第10重。");
--					end
--				else
--					VenaScene.SendMessage(targetplayer.szName.."接受"..player.szName.."侠士传功，真气贯入丹田之时忽然逆冲，尝试突破"..VenaSkill.szSkillName.." 第"..nTargetPlayerXiajiyuLevel.."重失败！")
--				end
--			end
--		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com