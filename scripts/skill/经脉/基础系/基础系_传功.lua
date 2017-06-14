------------------------------------------------
-- 文件名    : 经脉具体属性脚本
-- 创建人    : zhangqi
-- 创建时间  : 2008-07-08
-- 用途(模块): 经脉
-- 经脉类型  : 基础系
-- 经脉名称  : 传功
-- 经脉效果  : 传功
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/经脉/VerationTable.lua")
Include("scripts/skill/经脉/Venation.lua")
Include("scripts/Map/好友系统/include/FriendPraise_data.lua")
Include("scripts/Map/世界奇遇/奇经恩仇录/include/data.lua")
Include("scripts/Map/师徒系统/include/未满级大侠之路.lua")
tSkillData =
{
	{TransmitRate = 226, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{TransmitRate = 246, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{TransmitRate = 267, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{TransmitRate = 287, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{TransmitRate = 308, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{TransmitRate = 328, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{TransmitRate = 349, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{TransmitRate = 369, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{TransmitRate = 390, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{TransmitRate = 410, nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/经脉/基础系/基础系_传功.lua",
		0
	);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- Call 满神京buff ,十层之后,不能接受传功
		"skill/经脉/基础系/基础系_接受传功BUFF.lua", -- 计算功力，损耗
		0
	);
	--]]
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckDestBuff(1162, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
--	skill.AddSlowCheckSelfBuff(11077, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--霸刀大刀旋转
	----------------- BUFF相关 -------------------------------------------------

	--skill.BindBuff(1, 1162, 1);		-- -- Call 满神京buff 目标有此buff则不能接受传功
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	skill.SetNormalCoolDown(1, 376);
	skill.SetNormalCoolDown(2, 503);	--明教1秒GCD
	skill.SetCheckCoolDown(1, 444)
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
	skill.nMinRadius = 1 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	skill.nPrepareFrames = 1920;				-- 吟唱帧数
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
--[[function CanCast(player, nPreResult, SkillTarget)    --判断玩家的状态，以判断是否可以发出技能
	if nPreResult ~= SKILL_RESULT_CODE.SUCCESS then
		return nPreResult
	end
	if not SkillTarget then
		return SKILL_RESULT_CODE.INVALID_TARGET
	end

	if SkillTarget.GetTargetType() ~= TARGET.PLAYER then
		return SKILL_RESULT_CODE.INVALID_TARGET
	end

	local targetplayer = SkillTarget.GetPlayer()
	if not targetplayer then
		return SKILL_RESULT_CODE.INVALID_TARGET
	end

	if targetplayer.nLevel < 20 then
		player.SendSystemMessage("传功失败，只能传功给20级以上的人物！")
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
	if player.IsMyApprentice(targetplayer.dwID) then
		player.SendSystemMessage("师徒传功，师父"..player.szName.."将获得修为奖励100点，徒弟"..targetplayer.szName.."将获得修为奖励50点！")
		targetplayer.SendSystemMessage("师徒传功，师父"..player.szName.."将获得修为奖励100点，徒弟"..targetplayer.szName.."将获得修为奖励50点！")
	end
	if nCostVP >= 0 then
		player.SendSystemMessage(player.szName.."（功力"..nPlayerVPP.."）".."施展传功即将损耗修为 "..nCostVP.."点，"..targetplayer.szName.."（功力"..nTargetVPP.."）".."接受传功即将获得修为"..nReceiveVP.."点！")
		targetplayer.SendSystemMessage(player.szName.."（功力"..nPlayerVPP.."）".."施展传功即将损耗修为 "..nCostVP.."点，"..targetplayer.szName.."（功力"..nTargetVPP.."）".."接受传功即将获得修为"..nReceiveVP.."点！")
	elseif nCostVP < 0 then
		player.SendSystemMessage(player.szName.."（功力"..nPlayerVPP.."）".."施展传功即将获得修为 "..-nCostVP.."点，"..targetplayer.szName.."（功力"..nTargetVPP.."）".."接受传功即将获得修为"..nReceiveVP.."点！")
		targetplayer.SendSystemMessage(player.szName.."（功力"..nPlayerVPP.."）".."施展传功即将获得修为 "..-nCostVP.."点，"..targetplayer.szName.."（功力"..nTargetVPP.."）".."接受传功即将获得修为"..nReceiveVP.."点！")
	end
	if player.nCurrentTrainValue < nCostVP then
		player.SendSystemMessage(player.szName.."修为不足，传功失败！")
		targetplayer.SendSystemMessage(player.szName.."修为不足，传功失败！")
		return SKILL_RESULT_CODE.FAILED;
	end
	if nReceiveVP > targetplayer.nMaxTrainValue - targetplayer.nCurrentTrainValue then
		player.SendSystemMessage(targetplayer.szName.."气海不足，传功失败！")
		targetplayer.SendSystemMessage(targetplayer.szName.."气海不足，传功失败！")
		return SKILL_RESULT_CODE.FAILED;
	end
	if -nCostVP >0 and -nCostVP > player.nMaxTrainValue - player.nCurrentTrainValue then
		player.SendSystemMessage("自身气海不足，无法获得全部修为！")
	end

	if player.GetBuff(1263,1) == nil then
		player.AddBuff(player.dwID, player.nLevel,1387,1,0);  --传功表现buff
	end
	if  player.GetBuff(1263,1) == nil then	--增加经脉畅行debuff
		player.AddBuff(player.dwID, player.nLevel,1263,1,0);
	end
	return SKILL_RESULT_CODE.SUCCESS;
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
			player.SendSystemMessage("传功失败，只能传功给20级以上的人物！")
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
			player.SendSystemMessage(player.szName.."修为不足，传功失败！")
			targetplayer.SendSystemMessage(player.szName.."修为不足，传功失败！")
			return false;
		end
		if nReceiveVP > targetplayer.nMaxTrainValue - targetplayer.nCurrentTrainValue then
			player.SendSystemMessage(targetplayer.szName.."气海不足，传功失败！")
			targetplayer.SendSystemMessage(targetplayer.szName.."气海不足，传功失败！")
			return false;
		end
		if nCostVP >= 0 then
			player.AddTrain(-nCostVP)
			targetplayer.AddTrain(nReceiveVP)
			player.SendSystemMessage(player.szName.."（功力"..nPlayerVPP.."）".."施展传功损耗修为 "..nCostVP.."点，"..targetplayer.szName.."（功力"..nTargetVPP.."）".."接受传功获得修为"..nReceiveVP.."点！")
		elseif nCostVP < 0 then
			player.AddTrain(-nCostVP)
			targetplayer.AddTrain(nReceiveVP)
			player.SendSystemMessage(player.szName.."（功力"..nPlayerVPP.."）".."施展传功获得修为 "..-nCostVP.."点，"..targetplayer.szName.."（功力"..nTargetVPP.."）".."接受传功获得修为"..nReceiveVP.."点！")
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
	player.AddAchievementCount(128, 1)	--增加传功成就计数
end--]]

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
function CanCast(player, nPreResult, SkillTarget)    --判断玩家的状态，以判断是否可以发出技能
	if nPreResult ~= SKILL_RESULT_CODE.SUCCESS then
		return nPreResult
	end
	--local tList = player.GetPartyMemberList()
--	local eTargetType, dwID = player.GetTarget()
	local targetplayer = SkillTarget.GetPlayer() --徒弟
	--[[
	if eTargetType == TARGET.PLAYER then
		
		if tList then
			for i = 1, #tList do
				if dwID == tList[i] and  player.dwID ~= dwID then
					return SKILL_RESULT_CODE.SUCCESS;
				end
			end
		if not targetplayer.IsParty(player.dwID, dwID)
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", "目标不是自己的队友", 4)
			return SKILL_RESULT_CODE.FAILED;
		else
		end
			
		if not IsParty(player.dwID, targetplayer.dwID) then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", "目标不是自己的队友", 4)
			return SKILL_RESULT_CODE.FAILED;
		end
	end
	--]]

	-- 判断徒弟和师父是否组队
	if not IsParty(player.dwID, targetplayer.dwID) then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 362), 4)
		return SKILL_RESULT_CODE.FAILED;
	end
	
	if not SkillTarget then
		return SKILL_RESULT_CODE.INVALID_TARGET
	end

	if SkillTarget.GetTargetType() ~= TARGET.PLAYER then
		return SKILL_RESULT_CODE.INVALID_TARGET
	end

	--local targetplayer = SkillTarget.GetPlayer()
	if not targetplayer then
		return SKILL_RESULT_CODE.INVALID_TARGET
	end

	if targetplayer.nLevel < 20 then
		player.SendSystemMessage(GetEditorString(2, 8060))
		return SKILL_RESULT_CODE.FAILED;
	end

	local nCostVP = 3000
	local nReceiveVP = 10000
	local ApprenticeET = 1000
	local tLevelUpData = GetLevelUpData(targetplayer.nRoleType, targetplayer.nLevel)

	--if targetplayer.IsMyMentor(player.dwID) or player.IsMyDirectApprentice(targetplayer.dwID) then
	--	nCostVP = 10000
	--	nReceiveVP = 10000
	--else
	--	nReceiveVP = 10000
	--end

	if not tLevelUpData then
		return false
	end

	if player.nCurrentTrainValue < nCostVP then
		player.SendSystemMessage(player.szName ..GetEditorString(2, 8065))
		targetplayer.SendSystemMessage(player.szName ..GetEditorString(2, 8065))
		return SKILL_RESULT_CODE.FAILED;
	end
	if nReceiveVP > targetplayer.nMaxTrainValue - targetplayer.nCurrentTrainValue then
		player.SendSystemMessage(targetplayer.szName ..GetEditorString(2, 8059))
		targetplayer.SendSystemMessage(targetplayer.szName ..GetEditorString(2, 8059))
		return SKILL_RESULT_CODE.FAILED;
	end
	if targetplayer.IsMyMentor(player.dwID) or player.IsMyDirectApprentice(targetplayer.dwID) then
		local sMsg = GetEditorString(6, 7677).. targetplayer.szName .. GetEditorString(6, 7678).. nReceiveVP ..GetEditorString(2, 8050)
		local sMsg1 = player.szName..GetEditorString(2, 8064)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8055)..nReceiveVP..GetEditorString(2, 8050);
		if  targetplayer.nLevel < targetplayer.nMaxLevel then
			local nAddExp = math.floor(tLevelUpData.Experience * 80 / 100);
			if nAddExp > 400000 then	--剑胆琴心版本，传功获得经验封顶为40W。
				nAddExp = 400000
			end

			local nTime = GetCurrentTime()
			local nStartTime = DateToTime(2015, 10, 26, 7, 0, 0)
			local nEndTime = DateToTime(2015, 11, 23, 7, 0, 0)
			if nTime > nEndTime or nTime < nStartTime or targetplayer.nLevel < 90 then
				sMsg = GetEditorString(6, 7677).. targetplayer.szName .. GetEditorString(6, 7678).. nReceiveVP ..GetEditorString(6, 7688) .. nAddExp .. GetEditorString(2, 8050)
				sMsg1 = player.szName..GetEditorString(2, 8064)..nCostVP..GetEditorString(2, 8054) ..targetplayer.szName .. GetEditorString(2, 8055) .. nReceiveVP .. GetEditorString(9, 885) .. nAddExp .. GetEditorString(2, 8050)
			elseif targetplayer.nLevel >= 90 then
				player.SendSystemMessage(GetEditorString(8, 5158))
				targetplayer.SendSystemMessage(GetEditorString(8, 5158))
			end
			player.SendSystemMessage(sMsg)
			targetplayer.SendSystemMessage(sMsg)
			player.SendSystemMessage(sMsg1)
			targetplayer.SendSystemMessage(sMsg1)
		else
			player.SendSystemMessage(player.szName..GetEditorString(2, 8064)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8055)..nReceiveVP..GetEditorString(2, 8050))
			targetplayer.SendSystemMessage(player.szName..GetEditorString(2, 8064)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8055)..nReceiveVP..GetEditorString(2, 8050))
		end
	end
	
	if player.GetBuff(1263, 1) == nil then
		player.AddBuff(player.dwID, player.nLevel, 1387, 1, 0);  --传功表现buff
	end
	if  player.GetBuff(1263, 1) == nil then	--增加经脉畅行debuff
		player.AddBuff(player.dwID, player.nLevel, 1263, 1, 0);
		local buff = player.GetBuff(1263, 1)
		if buff then
			buff.nCustomValue = targetplayer.dwID
		end
		
		if 	tMasterAndDiscipleQuest.IsMyMentor(targetplayer, player) and targetplayer.GetQuestPhase(16687) == 1  and targetplayer.GetKungfuMount() then
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QixueTeachBy.Open", 119000, targetplayer.GetKungfuMount().dwSkillID, false) -- 师
			RemoteCallToClient(targetplayer.dwID, "CallUIGlobalFunction", "QixueTeachBy.Open", 119000, targetplayer.GetKungfuMount().dwSkillID, true) -- 徒弟
		end
	end

		
	return SKILL_RESULT_CODE.SUCCESS;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwPlayerID)
	local player = GetPlayer(dwCharacterID)
	local VenaScene = player.GetScene();
	local targetplayer = nil
	local eType, nTargetID = player.GetSkillTarget()
	if eType == TARGET.PLAYER then
		targetplayer = GetPlayer(nTargetID)
	end
	if not targetplayer then
		return false
	end
	if IsPlayer(nTargetID) then
		if targetplayer.nLevel < 20 then
			player.SendSystemMessage(GetEditorString(2, 8060))
			return SKILL_RESULT_CODE.FAILED;
		end
	end
	local nCostVP = 3000
	local nReceiveVP = 10000
	local tLevelUpData = GetLevelUpData(targetplayer.nRoleType, targetplayer.nLevel)
--	local ApprenticeET = 7000

	--if targetplayer.IsMyMentor(player.dwID) or player.IsMyDirectApprentice(targetplayer.dwID)then
	--	nCostVP = 10000
	--	nReceiveVP = 10000
	--else
	--	nReceiveVP = 10000
	--end

	if player.nCurrentTrainValue < nCostVP then
		player.SendSystemMessage(player.szName..GetEditorString(2, 8065))
		targetplayer.SendSystemMessage(player.szName..GetEditorString(2, 8065))
		player.ClearCDTime(376)
		return SKILL_RESULT_CODE.FAILED;
	end

	if nReceiveVP > targetplayer.nMaxTrainValue - targetplayer.nCurrentTrainValue then
		player.SendSystemMessage(targetplayer.szName..GetEditorString(2, 8059))
		targetplayer.SendSystemMessage(targetplayer.szName..GetEditorString(2, 8059))
		player.ClearCDTime(376)
		return SKILL_RESULT_CODE.FAILED;
	end

	if not tLevelUpData then
		player.ClearCDTime(376)
		return false
	end
	if targetplayer.IsMyMentor(player.dwID) or player.IsMyDirectApprentice(targetplayer.dwID) then
		local cacheMentor = GetMentorCache()
		if  targetplayer.nLevel < targetplayer.nMaxLevel then
			local nAddExp = math.floor(tLevelUpData.Experience * 80 / 100);
			if nAddExp > 400000 then	--剑胆琴心版本，传功获得经验封顶为40W。
				nAddExp = 400000
			end
			--local nTime = GetCurrentTime()
			--local nStartTime = DateToTime(2015, 10, 26, 7, 0, 0)
			--local nEndTime = DateToTime(2015, 11, 23, 7, 0, 0)
			--if nTime > nEndTime or nTime < nStartTime or targetplayer.nLevel < 90 then
			
			targetplayer.AddExp(nAddExp);
			player.SendSystemMessage(player.szName..GetEditorString(2, 8058)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8063)..nReceiveVP..GetEditorString(9, 885) ..  nAddExp .. GetEditorString(2, 8050))	
			targetplayer.SendSystemMessage(player.szName..GetEditorString(2, 8058)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8063)..nReceiveVP..GetEditorString(9, 885) ..  nAddExp .. GetEditorString(2, 8050))
			--elseif targetplayer.nLevel >= 90 then
			--player.SendSystemMessage("为确保“冲级大赛”活动的公平性，10月26-11月23日期间，师父给90级以上徒弟传功将不再额外增加阅历值。")
			--targetplayer.SendSystemMessage("为确保“冲级大赛”活动的公平性，10月26-11月23日期间，师父给90级以上徒弟传功将不再额外增加阅历值。")
			--	end
			if targetplayer.IsMyMentor(player.dwID) then
				cacheMentor.AddMentorValue(dwCharacterID, targetplayer.dwID, 15)--加师徒值
				player.SendSystemMessage(GetEditorString(7, 2958))
			end
		else
			player.SendSystemMessage(player.szName..GetEditorString(2, 8058)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8063)..nReceiveVP..GetEditorString(2, 8050))	
			targetplayer.SendSystemMessage(player.szName..GetEditorString(2, 8058)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8063)..nReceiveVP..GetEditorString(2, 8050))
		end
		if targetplayer.GetQuestPhase(16687) ~= 1 then -- 奇穴
			OpenPraiseOfOneMaster(targetplayer, player); --好师父点赞界面
		end

		local nQuestIdx = targetplayer.GetQuestIndex(16681)
		if nQuestIdx and targetplayer.GetQuestPhase(16681) == 1 then
			targetplayer.SetQuestValue(nQuestIdx, 0, 1)
		end
		nQuestIdx = targetplayer.GetQuestIndex(16686) --传功三次
		if nQuestIdx and targetplayer.GetQuestPhase(16686) == 1 then
			local nQuestValue = targetplayer.GetQuestValue(nQuestIdx, 0)
			if nQuestValue <=2 then 
				targetplayer.SetQuestValue(nQuestIdx, 0, nQuestValue + 1)
			end
		end
		
		nQuestIdx = targetplayer.GetQuestIndex(16687) -- 点奇穴
		if nQuestIdx and targetplayer.GetQuestPhase(16687) == 1 then
			tMasterAndDiscipleQuest.SetQiXu(targetplayer) -- 设奇穴
			targetplayer.SetQuestValue(nQuestIdx, 0, 1)
		end
	else
		player.SendSystemMessage(player.szName..GetEditorString(2, 8058)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8063)..nReceiveVP..GetEditorString(2, 8050))	
		targetplayer.SendSystemMessage(player.szName..GetEditorString(2, 8058)..nCostVP..GetEditorString(2, 8054)..targetplayer.szName..GetEditorString(2, 8063)..nReceiveVP..GetEditorString(2, 8050))		
	end
	player.AddTrain(-nCostVP)
	targetplayer.AddTrain(nReceiveVP)
	targetplayer.AddBuff(0,99,1162,1,0)
	player.AddAchievementCount(128, 1)	--增加传功成就计数
	player.AddFellowshipAttraction(targetplayer.dwID, 20)	--好感度
	Adventure_ChuanGong.TryStartAdventure(player)--传功完成时尝试开启奇遇
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com