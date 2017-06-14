---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/长安内城_轻锤.lua
-- 更新时间:	2013/8/30 9:59:27
-- 更新用户:	zhouyixiao1
-- 脚本说明:	
----------------------------------------------------------------------<

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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/Quest/长安内城_轻锤.lua", -- 属性值1
		0														-- 属性值2
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
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
	--skill.SetPublicCoolDown(590);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	skill.SetNormalCoolDown(1, 636);	--技能普通CD
	skill.SetCheckCoolDown(1, 637)	
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--只检查不走的CD
	-- 公共CD
	--skill.SetPublicCoolDown(590);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(1, 607);	--技能普通CD
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
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	--skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nMinPrepareFrames  	= -1;				-- 急速效果最小吟唱帧数：默认是-1，吟唱不受急速影响。大于等于0则受急速影响，最小读条时间为填的值
	--skill.nChannelInterval = 17; 				-- 通道技间隔时间
	--skill.nMinChannelInterval = 1; 				-- 急速效果最小通道技间隔时间：默认是-1，通道不受急速影响。大于等于0则受急速影响，最通道间隔时间为填的值
	--skill.nChannelFrame = 153;	 			-- 通道技持续时间，单位帧数
	--skill.nMinChannelFrame = 1;	 			-- 通道技持续时间，单位帧数 
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
	--skill.nBeatBackRate = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	--skill.nBrokenRate = 0 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	
	--skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0
	
	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
	--skill.nWeaponDamagePercent = 0; -- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	--skill.nWeaponDamagePercent = 0; -- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
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

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.AddBuff(0, 99, 6678, 1, 1)
	local scene = player.GetScene()
	local tZuoBiao = {
		[172] = {106375, 46558, 1051776}, 
	}
	if player then
		local nQuestIndex = player.GetQuestIndex(11535)
		local nvalue = player.GetQuestValue(nQuestIndex, 5)
		local nQuestIndex1 = player.GetQuestIndex(11798)
		local nvalue1 = player.GetQuestValue(nQuestIndex1, 5)
		if nvalue ~= 1 and nvalue1 ~= 1 then
			player.CastSkill(8105, 1)
			if nQuestIndex then
				player.SetQuestValue(nQuestIndex, 5, 1) --避免玩家ESC后无限创建NPC
			end
			if nQuestIndex1 then
				player.SetQuestValue(nQuestIndex1, 5, 1) --避免玩家ESC后无限创建NPC
			end
		else
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(5, 8481), 8)
			return
		end
	else
		return
	end
	local nNum = Random(10000)
	local tList = player.GetPartyMemberList()
	local tjueseList = 0
	if tList then --判断队伍内的情况
		tjueseList = {
			tList[1],
			tList[2],
			tList[3],
			tList[4],
			tList[5],
		}
	end
	for i = 1, #tjueseList do
		local jueseID = tjueseList[i]
		if jueseID then
			local Member = GetPlayer(jueseID)
			if Member then --遍历队伍内的所有成员均在距离范围内才放剑
				local buff2 = Member.GetBuff(6679, 1)
				local buff3 = Member.GetBuff(6789, 1)
				local jieshu = 0
				if buff3 then
					jieshu = buff3.nCustomValue
				end
				local bQuestIndex = Member.GetQuestIndex(11535)
				local valueJs = Member.GetQuestValue(bQuestIndex, 0) --结束时的任务变量
				local bQuestIndex1 = Member.GetQuestIndex(11798)
				local valueJs1 = Member.GetQuestValue(bQuestIndex1, 0) --结束时的任务变量
				if buff2 then
					if valueJs >= 9 or jieshu >= 9 then
						scene.CreateNpc(26608, tZuoBiao[scene.dwMapID][1], tZuoBiao[scene.dwMapID][2], tZuoBiao[scene.dwMapID][3], 191, 20 * GLOBAL.GAME_FPS, Member.dwID .. "wancheng", Member.dwID)
					else
						if nNum >= 5000 then
							local shuzhi2 = buff2.nCustomValue + 1
							local NPCjian2 = scene.CreateNpc(26547, tZuoBiao[scene.dwMapID][1], tZuoBiao[scene.dwMapID][2], tZuoBiao[scene.dwMapID][3], 191, 20 * GLOBAL.GAME_FPS, Member.dwID .. "jianshen2" .. shuzhi2, Member.dwID)
							buff2.nCustomValue = shuzhi2
						else
							local buff2 = Member.GetBuff(6679, 1)
							if buff2 then
								local shuzhi2 = buff2.nCustomValue + 1
								local NPCjian = scene.CreateNpc(25785, tZuoBiao[scene.dwMapID][1], tZuoBiao[scene.dwMapID][2], tZuoBiao[scene.dwMapID][3], 191, 20 * GLOBAL.GAME_FPS, Member.dwID .. "jianshen" .. shuzhi2, Member.dwID)
								buff2.nCustomValue = shuzhi2
								Member.AddBuff(0, 99, 6477, 1, 120)
								local  buffhuang = Member.GetBuff(6477, 1) 
								buffhuang.nCustomValue = shuzhi2
							end
						end
					end	
					if valueJs1 >= 9 or jieshu >= 9 then
						scene.CreateNpc(26608, tZuoBiao[scene.dwMapID][1], tZuoBiao[scene.dwMapID][2], tZuoBiao[scene.dwMapID][3], 191, 20 * GLOBAL.GAME_FPS, Member.dwID .. "wancheng", Member.dwID)
					else
						if nNum >= 5000 then
							local shuzhi2 = buff2.nCustomValue + 1
							local NPCjian2 = scene.CreateNpc(26547, tZuoBiao[scene.dwMapID][1], tZuoBiao[scene.dwMapID][2], tZuoBiao[scene.dwMapID][3], 191, 20 * GLOBAL.GAME_FPS, Member.dwID .. "jianshen2" .. shuzhi2, Member.dwID)
							buff2.nCustomValue = shuzhi2
						else
							local buff2 = Member.GetBuff(6679, 1)
							if buff2 then
								local shuzhi2 = buff2.nCustomValue + 1
								local NPCjian = scene.CreateNpc(25785, tZuoBiao[scene.dwMapID][1], tZuoBiao[scene.dwMapID][2], tZuoBiao[scene.dwMapID][3], 191, 20 * GLOBAL.GAME_FPS, Member.dwID .. "jianshen" .. shuzhi2, Member.dwID)
								buff2.nCustomValue = shuzhi2
								Member.AddBuff(0, 99, 6477, 1, 120)
								local  buffhuang = Member.GetBuff(6477, 1) 
								buffhuang.nCustomValue = shuzhi2
							end
						end
					end		
					
				end
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com