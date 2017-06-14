---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/苍云小物件_召唤帐篷.lua
-- 更新时间:	2014/12/1 16:03:17
-- 更新用户:	zhangtianhui1
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  王洋
-- 创建时间	:  2007-12-11
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/装备/苍云小物件_召唤帐篷.lua",
		0
	);

	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(1, 536);
	skill.SetCheckCoolDown(1, 681);	--只检查不走的CD
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
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
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
	if player.dwBackItemIndex ~= 13139 then -- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
		return false
	end

	if player.dwModelID ~= 0 then -- 检查是不是换装了
		return false
	end

	if not (player.nMoveState == MOVE_STATE.ON_STAND) then
		return false
	end
	if player.bFightState then
		return false
	end

	if player.bOnHorse then
		return false
	end

	return nPreResult;
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
	if not CustomFunction.CheckPlayerForRepresentApply(player) then
		return
	end

	if player.dwBackItemIndex ~= 13139 then -- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
		return
	end

	for i = 1, 100 do
		player.DelGroupBuff(409, i)--剑舞删除
	end

	local scene = player.GetScene()

	--------------------------下面是移植过来的老的召唤流程--------------------------
	if player.nMoveState == MOVE_STATE.ON_DEATH then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(0, 1399), 4)
		player.SendSystemMessage(GetEditorString(0, 112))
		return
	end

	if not CustomFunction.CheckMapForRepresentApply(scene) then
		player.SendSystemMessage(GetEditorString(6, 1299))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 1315), 4)
		return
	end

	local dwMapID = scene.dwMapID

	--内城屏蔽召唤
	if dwMapID == 172 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 441), 3)
		return
	end

	if dwMapID == 6 then--扬州
		if (player.nX > 43305 and player.nY > 54703) or (player.nX > 62571 and player.nY > 49799) then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 442), 5)
			return
		end
	end

	if dwMapID == 8 then--洛阳
		if (player.nX > 11328 and player.nX < 25845 and player.nY > 80675)
			or (player.nX >= 25845 and player.nX < 45595 and player.nY > 68267) then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 443), 5)
			return
		end
	end

	if dwMapID == 15 then--长安
		if (player.nX > 34859 and player.nX < 66897 and player.nY > 87317) then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 444), 5)
			return
		end
	end

	if dwMapID == 108 then--成都
		if (player.nX > 55204 and player.nX < 75576 and player.nY > 58997 and player.nY < 74838) then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 445), 5)
			return
		end
	end

	local buff_keren = player.GetBuff(8667, 1)
	if buff_keren then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 434), 4)
		return
	end

	local buff_zhuren = player.GetBuff(8638, 1)
	if buff_zhuren then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 435), 4)
		player.SetDynamicSkillGroup(187)
		return
	end

	local NPCszName = scene.GetNpcByNickName("Cangyun" .. player.dwID)
	if not NPCszName then
		player.AddBuff(0, 99, 8640, 1, 10) --监控
		local scene = player.GetScene()
		scene.CreateNpc(41160, player.nX + 70, player.nY + 70, player.nZ, 0, 16 * 2, "Cangyun_JS_1_" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY - 70, player.nZ, 0, 16 * 2, "Cangyun_JS_2_" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY + 70, player.nZ, 0, 16 * 2, "Cangyun_JS_3_" .. player.dwID)
		scene.CreateNpc(41160, player.nX + 70, player.nY - 70, player.nZ, 0, 16 * 2, "Cangyun_JS_4_" .. player.dwID)
		player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/装备/苍云小物件_召唤帐篷.lua", 0, 0)
	else
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 424), 4)
		return
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	local scene = player.GetScene()
	if not scene then
		return
	end
	if nParam1 == 0 then
		local szName1 = "Cangyun_JS_1_" .. player.dwID
		local szName2 = "Cangyun_JS_2_" .. player.dwID
		local szName3 = "Cangyun_JS_3_" .. player.dwID
		local szName4 = "Cangyun_JS_4_" .. player.dwID
		local npc1 = scene.GetNpcByNickName(szName1)
		local npc2 = scene.GetNpcByNickName(szName2)
		local npc3 = scene.GetNpcByNickName(szName3)
		local npc4 = scene.GetNpcByNickName(szName4)
		if npc1 and npc2 and npc3 and npc4 then
			local tZ_yutou = {
				npc1.nZ,
				npc2.nZ,
				npc3.nZ,
				npc4.nZ,
				player.nZ,
			}
			table.sort(tZ_yutou)
			local nNum = math.abs(tZ_yutou[5] - tZ_yutou[1])
			if nNum >= 150 then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 425), 4)
				player.DelBuff(8640, 1) --监控
				player.DelBuff(8638, 1)--东道主
				return
			else
				player.SelectPendent(EQUIPMENT_SUB.BACK_EXTEND, 0)
				scene.CreateNpc(41072, player.nX, player.nY, player.nZ, player.nFaceDirection, 60 * 60 * GLOBAL.GAME_FPS, "Cangyun" .. player.dwID)
				scene.CreateNpc(37857, player.nX, player.nY, player.nZ, 72, 60 * 60 * GLOBAL.GAME_FPS, "jilushuju" .. player.dwID)
				local npcX = scene.GetNpcByNickName("Cangyun" .. player.dwID)
				if npcX then
					npcX.SetCustomUnsigned4(0, player.dwID)
					npcX.SetCustomInteger1(4, 1)
				end
				local npcY = scene.GetNpcByNickName("jilushuju" .. player.dwID)
				if npcY then
					npcY.SetCustomUnsigned4(0, player.dwID)
				end
				local npcTouming = scene.GetNpcByNickName("touming" .. player.dwID)
				if not npcTouming then
					npcTouming = scene.CreateNpc(37857, player.nX, player.nY, player.nZ, 1, 60 * 60 * GLOBAL.GAME_FPS, "touming" ..player.dwID, player.dwID)
					npcTouming.SetCustomUnsigned4(0, player.dwID)
				end
				player.Stop()
				player.AddBuff(0, 99, 8640, 1, 900) --监控
				player.SetDynamicSkillGroup(187)
				player.SetTimer(0.7 * GLOBAL.GAME_FPS, "scripts/skill/装备/苍云小物件_召唤帐篷.lua", nParam1 + 1, 0)
				return
			end
		end
	end
	if nParam1 == 1 then
		player.PlaySfx(1087, 0, 0, 0)
		player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/装备/苍云小物件_召唤帐篷.lua", nParam1 + 1, 0)
		return
	end
	if nParam1 >= 2 then
		if nParam1 == 2 then
			player.AddBuff(0, 99, 8638, 1, 900)--东道主
			player.DoAction(0, 10107)
			player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/装备/苍云小物件_召唤帐篷.lua", nParam1 + 1, 0)
			return
		end
		local buff1 = player.GetBuff(8640, 1)--监控
		if not buff1 then
			player.DelBuff(8638, 1)--东道主
			player.SetDynamicSkillGroup(0)
			player.DoAction(0, 10107)
			player.Jump(true, 0)
			return
		end

		local buff2 = player.GetBuff(8638, 1)--主人
		if not buff2 then
			player.DelBuff(8640, 1)--监控
			player.SetDynamicSkillGroup(0)
			player.DoAction(0, 10107)
			player.Jump(true, 0)
			return
		end
		local szZHANGPENG = "Cangyun" .. player.dwID
		local npc = scene.GetNpcByNickName(szZHANGPENG)
		if npc then
			npc.SetDisappearFrames(3 * 16, false)
		else
			player.DelBuff(8640, 1)--监控
			player.DelBuff(8638, 1)--东道主
			player.DelBuff(8667, 1)--客人
			player.SetDynamicSkillGroup(0)
			player.DoAction(0, 10107)
			player.Jump(true, 0)
			return
		end

		if buff2.nCustomValue ~= 0 then
			local p_keren = GetPlayer(buff2.nCustomValue)
			if not p_keren then
				buff2.nCustomValue = 0
			else
				local buff_ke = p_keren.GetBuff(8640, 1)--检查监控标记位
				if not buff_ke then
					buff2.nCustomValue = 0
				else
					if buff_ke.nCustomValue ~= player.dwID then
						buff2.nCustomValue = 0
					end
				end
			end
		end
		player.SetDynamicSkillGroup(187)
		player.SetTimer(1 * GLOBAL.GAME_FPS, "scripts/skill/装备/苍云小物件_召唤帐篷.lua", nParam1 + 1, 0)
		return
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com