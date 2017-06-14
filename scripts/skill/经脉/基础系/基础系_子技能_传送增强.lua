---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/经脉/基础系/基础系_子技能_传送增强.lua
-- 更新时间:	2016/5/10 16:56:45
-- 更新用户:	kelin-PC
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    : 经脉具体属性脚本
-- 创建人    : zhangqi
-- 创建时间  : 2008-07-08
-- 用途(模块): 经脉
-- 经脉类型  : 基础系
-- 经脉名称  : 传送
-- 经脉效果  : 传送
------------------------------------------------

------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/经脉/基础系/基础系_神行千里地图ID对应表.lua")

tSkillData =
{
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 1
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 2
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 3
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 4
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 5
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 6
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 7
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 8
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 9
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 10
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 11
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 12
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 13
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 14
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 15
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 16
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 17
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 18
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 19
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 20
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 21
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 22
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 23
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 24
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 25
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 26
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 27
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 28
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 29
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 30
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------

	--	skill.AddAttribute(
	--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--		ATTRIBUTE_TYPE.DASH_FORWARD,
	--		32,
	--		80
	--	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/经脉/基础系/基础系_子技能_传送增强.lua",
		0
	);

	----------------- 技能施放Buff需求 ---------------------------------------------

	----------------- BUFF相关 -------------------------------------------------
	skill.AddSlowCheckSelfBuff(10173, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	skill.AddSlowCheckSelfBuff(10174, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	skill.AddSlowCheckSelfBuff(9982, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	--skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	skill.SetNormalCoolDown(1, 244);

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
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 999999 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	skill.nPrepareFrames = 160;				-- 吟唱帧数
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
	if player.GetSkillLevel(81) == 0 or player.GetBuff(9982, 1)	then
		return false
	end

	local scene = player.GetScene();
	if not scene then
		return false
	end
	if player.bFightState and scene.nType == MAP_TYPE.DUNGEON then
		player.SendSystemMessage(GetEditorString(3, 9048))
		return false
	end
	if  scene.nType == MAP_TYPE.BATTLE_FIELD then
		player.SendSystemMessage(GetEditorString(3, 9049))
		return false
	end
	if player.GetBuff(7732, 1) then
		player.SendSystemMessage(GetEditorString(6, 4483))
		return false
	end
	if player.GetBuff(7049, 1) then
		player.SendSystemMessage(GetEditorString(6, 871))
	end
	if player.GetBuff(10826, 1) then
		player.SendSystemMessage(GetEditorString(10, 2028))
		return false
	end
	return nPreResult
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	--获取UI传送过来的cityID，并根据cityID获得mapID
	local nX, nY, nZ = player.GetCoordinateSkillTarget()
	local bResult = true
	local nMapID = tCityIDToMapID[nX]
	local nTargetMapID = nY

	if IsPlayer(dwCharacterID) then
		--获得凌波微步成就
		if not player.IsAchievementAcquired(104) then
			player.AcquireAchievement(104)
		end

		if not tCityIDToMapID[nX] then
			bResult = false
		end
		if player.GetBuff(7732, 1) then
			player.SendSystemMessage(GetEditorString(6, 4483))
			return
		end

		--判断玩家是否开通交通点
		local nNodeID = 0
		if not tMapIDToNodeID[nMapID] then
			bResult = false
		elseif 	tMapIDToNodeID[nMapID] then
			for k, v in pairs(tMapIDToNodeID[nMapID]) do
				if player.IsOpenRouteNode(v) then
					nNodeID = v
				end
			end
		end

		-- 奇宝之争活动处理
		if player.GetBuff(7049, 1) then
			player.DelBuff(7049, 1)
		end

		local tQuestMap = {
			[14765] = 225, --微山书院
			[14766] = 224, --天泣林
			[14767] = 228, --梵空禅院
			[14768] = 227, --阴山圣泉
			[14769] = 229, --引仙水榭
		}
		if player.GetBuff(3219, 10) then
		    for GreatWar_QuestID, _ in pairs(tQuestMap) do
		    	if player.GetQuestIndex(GreatWar_QuestID) then
		    		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "teach_base.finish_teach" )  --关闭锁屏教学
		    	end
	    	end
		end
		local dir, Type = GetMapParams(nTargetMapID)
		if nMapID == 74 then
			if player.dwTongID == 0 then
				player.SendSystemMessage(GetEditorString(3, 7703))
				RemoteCallToClient(player.dwID, "OnSendSystemAnnounce", GetEditorString(3, 7704), "red")
				player.ClearCDTime(244)
				return
			else
				RemoteCallToCenter("OnGetMasterAndMapRequest", player.dwID, player.nZ, "On_Tong_ShenXingChuanSong")
				return
			end
		elseif Type == 1 then
			player.AddBuff(0, 99, 6971, 1, 1)	--6971buff执行传送
			local buff = player.GetBuff(6971, 1)
			buff.nCustomValue = nX
			player.AddBuff(0, 99, 772, 1, 2)
			player.AddBuff(0, 99, 3473, 2, 1)
			player.AddBuff(player.dwID, player.nLevel, 1061, 1)
			player.Jump(true, 0)
			player.AddBuff(player.dwID, player.nLevel, 1401, 1)
			player.AddBuff(0, 99, 7246, 1, 3)
			return
		elseif bResult == true and nNodeID ~= 0 then
			if player.nCamp ~= 1 and nMapID == 25 then	--判断中立玩家和敌对玩家传送到阵营 特殊处理
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 726), 10)
				player.SendSystemMessage(GetEditorString(6, 726))
				player.ClearCDTime(244)
				return
			elseif player.nCamp ~= 2 and nMapID == 27 then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 727), 10)
				player.SendSystemMessage(GetEditorString(6, 727))
				player.ClearCDTime(244)
				return
			elseif player.nCamp == 1 and nX == 274 then	--浩气盟玩家想去南屏山恶人谷据点
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 902), 10)
				player.SendSystemMessage(GetEditorString(6, 902))
				player.ClearCDTime(244)
				return
			elseif player.nCamp == 1 and nX == 276 then	--浩气盟玩家想去昆仑恶人谷据点
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 903), 10)
				player.SendSystemMessage(GetEditorString(6, 903))
				player.ClearCDTime(244)
				return
			elseif player.nCamp == 2 and nX == 273 then	--恶人谷玩家想去南屏山浩气盟据点
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 904), 10)
				player.SendSystemMessage(GetEditorString(6, 904))
				player.ClearCDTime(244)
				return
			elseif player.nCamp == 2 and nX == 275 then	--恶人谷玩家想去昆仑山浩气盟据点
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 905), 10)
				player.SendSystemMessage(GetEditorString(6, 905))
				player.ClearCDTime(244)
				return
			else
				player.AddBuff(0, 99, 11927, 1, 1)	--记录神行目标点
				local buffLog = player.GetBuff(11927, 1)
				player.AddBuff(0, 99, 6971, 1, 1)		--6971buff执行传送
				local buff = player.GetBuff(6971, 1)
				buff.nCustomValue = nX
				buffLog.nCustomValue = nMapID
				player.AddBuff(0, 99, 772, 1, 2)
				player.AddBuff(0, 99, 3473, 2, 1)
				player.AddBuff(player.dwID, player.nLevel, 1061, 1)
				player.Jump(true, 0)
				player.AddBuff(player.dwID, player.nLevel, 1401, 1)
				player.AddBuff(0, 99, 7246, 1, 3)
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com