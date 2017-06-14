---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/长安内城_放置机关.lua
-- 更新时间:	2013/8/27 13:57:51
-- 更新用户:	zhouyixiao1
-- 脚本说明:	
----------------------------------------------------------------------<

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
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 10
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- 魔法属性 -------------------------------------------------

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/Quest/长安内城_放置机关.lua", -- 属性值1
		0														-- 属性值2
	);
    
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(6649, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(6494, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff   

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级
	
	-----------------技能渐变相关-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --技能伤害渐变百分比，1024为100%，正数为增加，负数为减少。注意此参数只能在渐变类型的AOE中使用！
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --对第一个搜索到的目标施放子技能。注意此参数只能在渐变类型的AOE中使用！
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --对第二个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --对第三个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --对第四个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --对第五个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --对第六个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --对第七个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --对第八个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --对第九个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --对第十个搜索到的目标施放子技能。
	
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	--skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	skill.SetNormalCoolDown(1, 635);	--技能普通CD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--只检查不走的CD
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;
	
	----------------- 技能是否可在吟唱中施放 -------------------------------------------------
	--skill.bIgnorePrepareState = true	--技能是否可在吟唱中施放，吟唱、通道、蓄力技不能填true
	
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
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius		= 20 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange		= 128;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nMinPrepareFrames  	= -1;				-- 急速效果最小吟唱帧数：默认是-1，吟唱不受急速影响。大于等于0则受急速影响，最小读条时间为填的值
	--skill.nChannelInterval	= 0; 				-- 通道技间隔时间
	--skill.nMinChannelInterval	= -1; 				-- 急速效果最小通道技间隔时间：默认是-1，通道不受急速影响。大于等于0则受急速影响，最通道间隔时间为填的值
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数
	--skill.nMinChannelFrame	= -1; 				-- 通常配合急速最小间隔时间使用。使得通道技能整体加速。如果这个填-1，间隔不是-1，高急速可以多1跳
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
	skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then
		local nTargetType, dwTargetID = player.GetTarget()
		local npc = GetNpc(dwTargetID)
		local scene = player.GetScene()
		local nQuestID = 11538
		local nQuestIndex = player.GetQuestIndex(nQuestID)
		local nQuestPhase = player.GetQuestPhase(nQuestID)
		local nQuestID1 = 11801
		local nQuestIndex1 = player.GetQuestIndex(nQuestID1)
		local nQuestPhase1 = player.GetQuestPhase(nQuestID1)
		local NPClangya = scene.GetNpcByNickName("SSDJ_langya" .. player.dwID)
		local NPCbiaoji1 = scene.GetNpcByNickName("DSbiaoji1" .. player.dwID)
		local NPCbiaoji2 = scene.GetNpcByNickName("DSbiaoji2" .. player.dwID)
		local Value = player.GetQuestValue(nQuestIndex, 1)
		local Value1 = player.GetQuestValue(nQuestIndex1, 1)
		if nQuestIndex and nQuestPhase == 1 then
			if Value ~= 1 then
				if NPClangya then
					local dwPlayerID = NPClangya.GetCustomUnsigned4(0)
					if GetDistanceSq(player.nX, player.nY, player.nZ, 111818, 118050, 1157376) <= 256 ^ 2 then  --第一个节点往左走
						local NPCdusha = scene.CreateNpc(26347, 111833, 118051, 1157376, 128, 960, "dusha1" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 1)  --1往左走2往右走
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 0 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --记录玩家放置机关的情况。到结尾处为2 那必然成功，若小于2，说明他路上放置少于需求次数	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 110984, 117016, 1158272) <= 256 ^ 2 then --第一个节点往右走
						local NPCdusha = scene.CreateNpc(26347, 110984, 117016, 1158272, 63, 960, "dusha2" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 2)  ----1往左走2往右走
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 0 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --记录玩家放置机关的情况。到结尾处为2 那必然成功，若小于2，说明他路上放置少于需求次数	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 114259, 118066, 1157376) <= 256 ^ 2 then--左节点往左走
						local NPCdusha = scene.CreateNpc(26347, 114259, 118066, 1157376, 63, 960, "dusha1" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 1)  --额外碎片给予标记，1为坐标2为右边
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 1 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --记录玩家放置机关的情况。到结尾处为2 那必然成功，若小于2，说明他路上放置少于需求次数	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 113308, 117220, 1157376) <= 256 ^ 2 then--左节点往右走
						local NPCdusha = scene.CreateNpc(26347, 113308, 117220, 1157376, 63, 960, "dusha2" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 2)  --额外碎片给予标记，1为坐标2为右边
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 1 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --记录玩家放置机关的情况。到结尾处为2 那必然成功，若小于2，说明他路上放置少于需求次数	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 112147, 115710, 1157376) <= 256 ^ 2 then --右节点往左走
						local NPCdusha = scene.CreateNpc(26347, 112147, 115710, 1157376, 63, 960, "dusha1" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 1)  --额外碎片给予标记，1为坐标2为右边
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 1 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --记录玩家放置机关的情况。到结尾处为2 那必然成功，若小于2，说明他路上放置少于需求次数	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 111703, 114974, 1157824) <= 256 ^ 2 then --右节点往右走
						local NPCdusha = scene.CreateNpc(26347, 111703, 114974, 1157824, 63, 960, "dusha1" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 2)  --额外碎片给予标记，1为坐标2为右边
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 1 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --记录玩家放置机关的情况。到结尾处为2 那必然成功，若小于2，说明他路上放置少于需求次数	
							end
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					else
						player.SetTimer(4, "scripts/skill/Quest/长安内城_放置机关.lua", 0, 0)	
						--	player.ClearCDTime(635) --处理意外点击后的CD重置
						
					end		
				else
					player.SetTimer(4, "scripts/skill/Quest/长安内城_放置机关.lua", 0, 0)	
				end
			end
		end
		if nQuestIndex1 and nQuestPhase1 == 1 then
			if Value1 ~= 1 then
				if NPClangya then
					local dwPlayerID = NPClangya.GetCustomUnsigned4(0)
					if GetDistanceSq(player.nX, player.nY, player.nZ, 111818, 118050, 1157376) <= 256 ^ 2 then  --第一个节点往左走
						local NPCdusha = scene.CreateNpc(26347, 111833, 118051, 1157376, 128, 960, "dusha1" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 1)  --1往左走2往右走
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 0 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --记录玩家放置机关的情况。到结尾处为2 那必然成功，若小于2，说明他路上放置少于需求次数	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 110984, 117016, 1158272) <= 256 ^ 2 then --第一个节点往右走
						local NPCdusha = scene.CreateNpc(26347, 110984, 117016, 1158272, 63, 960, "dusha2" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 2)  ----1往左走2往右走
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 0 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --记录玩家放置机关的情况。到结尾处为2 那必然成功，若小于2，说明他路上放置少于需求次数	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 114259, 118066, 1157376) <= 256 ^ 2 then--左节点往左走
						local NPCdusha = scene.CreateNpc(26347, 114259, 118066, 1157376, 63, 960, "dusha1" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 1)  --额外碎片给予标记，1为坐标2为右边
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 1 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --记录玩家放置机关的情况。到结尾处为2 那必然成功，若小于2，说明他路上放置少于需求次数	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 113308, 117220, 1157376) <= 256 ^ 2 then--左节点往右走
						local NPCdusha = scene.CreateNpc(26347, 113308, 117220, 1157376, 63, 960, "dusha2" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 2)  --额外碎片给予标记，1为坐标2为右边
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 1 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --记录玩家放置机关的情况。到结尾处为2 那必然成功，若小于2，说明他路上放置少于需求次数	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 112147, 115710, 1157376) <= 256 ^ 2 then --右节点往左走
						local NPCdusha = scene.CreateNpc(26347, 112147, 115710, 1157376, 63, 960, "dusha1" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 1)  --额外碎片给予标记，1为坐标2为右边
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 1 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --记录玩家放置机关的情况。到结尾处为2 那必然成功，若小于2，说明他路上放置少于需求次数	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 111703, 114974, 1157824) <= 256 ^ 2 then --右节点往右走
						local NPCdusha = scene.CreateNpc(26347, 111703, 114974, 1157824, 63, 960, "dusha1" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 2)  --额外碎片给予标记，1为坐标2为右边
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 1 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --记录玩家放置机关的情况。到结尾处为2 那必然成功，若小于2，说明他路上放置少于需求次数	
							end
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					else
						player.SetTimer(4, "scripts/skill/Quest/长安内城_放置机关.lua", 0, 0)	
						--	player.ClearCDTime(635) --处理意外点击后的CD重置
						
					end		
				else
					player.SetTimer(4, "scripts/skill/Quest/长安内城_放置机关.lua", 0, 0)	
				end
			end
		end
	end
	return nPreResult;
end
function OnTimer(player, nParam1, nParam2)
	player.ClearCDTime(635) --处理意外点击后的CD重置
	RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 8702), 8)
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	
end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com