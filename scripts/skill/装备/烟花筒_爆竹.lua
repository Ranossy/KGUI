---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/烟花筒_爆竹.lua
-- 更新时间:	2015/6/17 15:47:50
-- 更新用户:	zhangyan3
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2013-1-24
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/装备/烟花筒_爆竹.lua",
		0
	);
    
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(4052, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	skill.AddSlowCheckSelfBuff(3203, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	skill.AddSlowCheckDestBuff(10970, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求目标Buff
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
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	skill.SetNormalCoolDown(1, 573);	--技能普通CD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--只检查不走的CD
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
	skill.nPrepareFrames  	= 80;				-- 吟唱帧数
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
	local scene = player.GetScene()
	if not scene then
		return
	end

	if player.dwBackItemIndex ~= 8005 then -- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
		return SKILL_RESULT_CODE.FAILED
	end
	
	local dwMapID = scene.dwMapID
	if scene.nType == MAP_TYPE.DUNGEON or scene.nType == MAP_TYPE.BATTLE_FIELD then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4815), 5)
		return false
	end
	
	if dwMapID == 6 then--扬州
		if (player.nX > 43305 and player.nY > 54703) or (player.nX > 62571 and player.nY > 49799) then 
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4816), 5)
			return false
		end
	end	
	
	if dwMapID == 8 then--洛阳
		if (player.nX > 11328 and player.nX < 25845 and player.nY > 80675) 
			or (player.nX >= 25845 and player.nX < 45595 and player.nY > 68267) then 
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4817), 5)
			return false
		end
	end

	if dwMapID == 15 then--长安
		if (player.nX > 34859 and player.nX < 66897 and player.nY > 87317) then 
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4818), 5)
			return false
		end
	end	
	
	if dwMapID == 108 then--成都
		if (player.nX > 55204 and player.nX < 75576 and player.nY > 58997 and player.nY < 74838) then 
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4819), 5)
			return false
		end
	end
	if dwMapID == 22 then--南屏山
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4820), 5)
		return false
	end	
	if dwMapID == 25 then--浩气盟
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4821), 5)
		return false
	end
	if dwMapID == 27 then--恶人谷
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4822), 5)
		return false
	end
	if dwMapID == 30 then--昆仑
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4823), 5)
		return false
	end		
	local bItemAmount = player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 18625)
	if bItemAmount == 0 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4824), 3)
		return false
	end
	local nTargetType, nTargetID = player.GetTarget()
	if nTargetType == TARGET.NPC then
		return false
	end
	local tPlayer = GetPlayer(nTargetID)
	if not tPlayer then
		return false
	end
	if tPlayer.bFightState == true then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4825), 3)
		return false
	end

	if tPlayer.GetBuff(11638, 1) then -- 郭萌萌直播屏蔽骚扰
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(11, 3288), 3)
		return false
	end
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	
end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID,dwSrcID)
	local tPlayer = GetPlayer(dwCharacterID)
	if not tPlayer then
		return
	end
	if tPlayer.bFightState == true then
		RemoteCallToClient(dwSrcID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4825), 3)
		cPlayer.ClearCDTime(573)
		return
	end
	local cPlayer = GetPlayer(dwSrcID)
	if not cPlayer then
		return
	end
	tCommonBuffID = {1653, 3337, 3838, 4099, 4248, 4359, 4787, 4740, 4993};
	for n = 1, #tCommonBuffID do 
		if tPlayer.GetBuff(tCommonBuffID[n], 0) then
			RemoteCallToClient(dwSrcID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4826), 3)
			cPlayer.ClearCDTime(573)
			return
		end
	end	

	local scene = cPlayer.GetScene()
	if not scene then
		return
	end
	local dwMapID = scene.dwMapID
	if scene.nType == MAP_TYPE.DUNGEON or scene.nType == MAP_TYPE.BATTLE_FIELD then
		RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4815), 5)
		cPlayer.ClearCDTime(573)
		return
	end
	
	if dwMapID == 6 then--扬州
		if (cPlayer.nX > 43305 and cPlayer.nY > 54703) or (cPlayer.nX > 62571 and cPlayer.nY > 49799) then 
			RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4816), 5)
			cPlayer.ClearCDTime(573)
			return
		end
	end	
	
	if dwMapID == 8 then--洛阳
		if (cPlayer.nX > 11328 and cPlayer.nX < 25845 and cPlayer.nY > 80675) 
			or (cPlayer.nX >= 25845 and cPlayer.nX < 45595 and cPlayer.nY > 68267) then 
			RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4817), 5)
			cPlayer.ClearCDTime(573)
			return
		end
	end

	if dwMapID == 15 then--长安
		if (cPlayer.nX > 34859 and cPlayer.nX < 66897 and cPlayer.nY > 87317) then 
			RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4818), 5)
			cPlayer.ClearCDTime(573)
			return
		end
	end	
	
	if dwMapID == 108 then--成都
		if (cPlayer.nX > 55204 and cPlayer.nX < 75576 and cPlayer.nY > 58997 and cPlayer.nY < 74838) then 
			RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4819), 5)
			cPlayer.ClearCDTime(573)
			return
		end
	end
	if dwMapID == 22 then--南屏山
		RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4820), 5)
		return false
	end	
	if dwMapID == 25 then--浩气盟
		RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4821), 5)
		return false
	end
	if dwMapID == 27 then--恶人谷
		RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4822), 5)
			return false
	end
	if dwMapID == 30 then--昆仑
			RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4823), 5)
			return false
	end		
	local bItemAmount = cPlayer.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 18625)
	if bItemAmount == 0 then
		RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4824), 3)
		cPlayer.ClearCDTime(573)
		return
	end
	tPlayer.AddBuff(0,99,5160,1)
	tPlayer.Stop()
	cPlayer.CastSkill(5229, 1, TARGET.PLAYER, tPlayer.dwID)
	tPlayer.DoAction(tPlayer.dwID,12112)
	cPlayer.CostItemInAllPackage(5,18625,1)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com