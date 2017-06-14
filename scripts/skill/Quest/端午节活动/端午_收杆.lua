---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/端午节活动/端午_收杆.lua
-- 更新时间:	2015/6/16 11:57:49
-- 更新用户:	zhengfeng4
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
Include("scripts/Map/节日端午/include/端午_钓鱼头文件.lh")
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
		"skill/Quest/端午节活动/端午_收杆.lua",
		0
	);
	--  	skill.AddAttribute(
	--  		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	-- 		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
	-- 		4787,
	-- 		1
	-- 		);
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
	skill.SetNormalCoolDown(1, 562);	--技能普通CD
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
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- 技能施放的最大距离

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
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)

end

-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local buff = player.GetBuff(SHANGGOUBUFF, 1)
	if buff then
		player.DoAction(dwCharacterID, SHOUGAN_ACT)
		if player.GetBuff(YUERBUFF_NQ, 1) then
			player.SetTimer(16 * 2, "scripts/skill/Quest/端午节活动/端午_收杆.lua", YUERBUFF_NQ, 1)--有收获
		elseif player.GetBuff(YUERBUFF_GYBC, 1) then
			player.SetTimer(16 * 2, "scripts/skill/Quest/端午节活动/端午_收杆.lua", YUERBUFF_GYBC, 1)--有收获
		elseif player.GetBuff(YUERBUFF, 1) then
			player.SetTimer(16 * 2, "scripts/skill/Quest/端午节活动/端午_收杆.lua", YUERBUFF, 1)--有收获
		end
		player.DelBuff(SHANGGOUBUFF, 1)
		return
	end
	local buff2 = player.GetBuff(CHUIDIAOBUFF, 1)
	if buff2 then
		player.DelBuff(CHUIDIAOBUFF, 1)
		player.DoAction(dwCharacterID, NO_FISH_ACT)
		return
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	-- nParam1 端午节钓鱼活动鱼饵buffID
	--print("端午_收杆.lua  OnTimer")
	local buff = player.GetBuff(DIAOYUBUFF, 1)
	if not buff then
		return
	end

	local nAwardIndex = 23616
	if player.GetBuff(YUERBUFF, 1) and not player.GetBuff(JIUMI, 1) then -- 没有酒米buff的蚯蚓钓鱼掉落
		--print("tFishRate")
		nAwardIndex = GetAward(tFishRate)
	elseif player.GetBuff(YUERBUFF, 1) and player.GetBuff(JIUMI, 1) then -- 有酒米buff的蚯蚓钓鱼掉落
		--print("tFishRateForJiumi")
		nAwardIndex = GetAward(tFishRateForJiumi)
	elseif player.GetBuff(YUERBUFF_NQ, 1) then  -- 泥鳅钓鱼
		--print("tFishRateForNiQiu")
		nAwardIndex = GetAward(tFishRateForNiQiu)
	elseif player.GetBuff(YUERBUFF_GYBC, 1) then -- 狗尾巴草钓鱼
		--print("tFishRateForGYBC")
		nAwardIndex = GetAward(tFishRateForGYBC)
	end
	local nQuestID = 7314
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	local nQuestPhase = player.GetQuestPhase(nQuestID)
	if nQuestIndex and nQuestPhase == 1 then
		FinishQuestValue(player, nQuestID, 2, 1)
		if player.CanAddItem(ITEM_TABLE_TYPE.OTHER, 23626, 1) == ITEM_RESULT_CODE.SUCCESS then
			player.AddItem(ITEM_TABLE_TYPE.OTHER, 23626, 1)
		else
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 4686), 4)
		end
	end
	local nQuestID = 13895
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	local nQuestPhase = player.GetQuestPhase(nQuestID)
	if nQuestIndex and nQuestPhase == 1 then
		if player.CanAddItem(ITEM_TABLE_TYPE.OTHER, 23624, 1) == ITEM_RESULT_CODE.SUCCESS then
			player.AddItem(ITEM_TABLE_TYPE.OTHER, 23624, 1)
		else
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 4687), 4)
		end
	end
	if GetSpecialAward(player) then
		if player.CanAddItem(5, 23602, 1) == ITEM_RESULT_CODE.SUCCESS then
			player.AddItem(ITEM_TABLE_TYPE.OTHER, 23602, 1)
		else
			SendSystemMail(GetEditorString(7, 4649), player.szName, GetEditorString(7, 4650), GetEditorString(7, 4719), 0, {{5, 23602, 1, 0}})		
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 4652), 1)
		end
	else
		if player.CanAddItem(5, nAwardIndex, 1) == ITEM_RESULT_CODE.SUCCESS then
			player.AddItem(ITEM_TABLE_TYPE.OTHER, nAwardIndex, 1)
		else
			SendSystemMail(GetEditorString(7, 4649), player.szName, GetEditorString(7, 4650), GetEditorString(7, 4719), 0, {{5, nAwardIndex, 1, 0}})		
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 4652), 1)
		end
		local scene = player.GetScene()
		if scene then
			if player.GetMapID() == 159 then
				local npcZK = scene.GetNpcByNickName("duanwu_ChanChuZK")
				if npcZK then
					npcZK.SetCustomInteger4(5, npcZK.GetCustomInteger4(5) + 1)
				end
			end
		end
	end

	if Random(10000) < 300 then
		if CreatSanZhiXiaoEYu(player) then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4330), 4)
			if not player.IsAchievementAcquired(4581) then
				player.AddAchievementCount(4581, 1)
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com