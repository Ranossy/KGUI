---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_羽林枪法_破风.lua
-- 更新时间:	2017/5/11 14:32:06
-- 更新用户:	chenchen6-pc
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_羽林枪法_破风.lua
-- 创建人    :  张奇
-- 创建时间  :  2008-02-26 16:14
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  羽林枪法
-- 技能名称  :  破风
-- 技能效果  :  给予目标一个流血效果，
--在铁牢律状态下,该技能带有破甲效果,并附带大量仇恨。

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--附加仇恨暂定和技能伤害相等
tSkillData =
{
	{nCostMana = 14, nDotID = 661, nDotLevel = 1, nThreat = 265   }, -- Level 1
	{nCostMana = 22, nDotID = 661, nDotLevel = 2, nThreat = 325   }, -- Level 2
	{nCostMana = 29, nDotID = 661, nDotLevel = 3, nThreat = 385   }, -- Level 3
	{nCostMana = 40, nDotID = 661, nDotLevel = 4, nThreat = 445   }, -- Level 4
	{nCostMana = 49, nDotID = 661, nDotLevel = 5, nThreat = 505   }, -- Level 5
	{nCostMana = 57, nDotID = 661, nDotLevel = 6, nThreat = 565   }, -- Level 6
	{nCostMana = 65, nDotID = 661, nDotLevel = 7, nThreat = 625  }, -- Level 7
	{nCostMana = 73, nDotID = 661, nDotLevel = 8, nThreat = 685  }, -- Level 8
	{nCostMana = 81, nDotID = 661, nDotLevel = 9, nThreat = 745  }, -- Level 9
	{nCostMana = 90, nDotID = 661, nDotLevel = 10, nThreat = 805  }, -- Level 10
	{nCostMana = 90, nDotID = 661, nDotLevel = 11, nThreat = 865  }, -- Level 11
	{nCostMana = 90, nDotID = 661, nDotLevel = 12, nThreat = 925   }, -- Level 12
	{nCostMana = 90, nDotID = 661, nDotLevel = 13, nThreat = 985   }, -- Level 13
	{nCostMana = 90, nDotID = 661, nDotLevel = 14, nThreat = 1045   }, -- Level 14
	{nCostMana = 90, nDotID = 661, nDotLevel = 15, nThreat = 1105   }, -- Level 15
	{nCostMana = 90, nDotID = 661, nDotLevel = 16, nThreat = 1165   }, -- Level 16
	{nCostMana = 90, nDotID = 661, nDotLevel = 17, nThreat = 1225   }, -- Level 17
	{nCostMana = 90, nDotID = 661, nDotLevel = 18, nThreat = 1285  }, -- Level 18
	{nCostMana = 90, nDotID = 661, nDotLevel = 19, nThreat = 1345  }, -- Level 19
	{nCostMana = 90, nDotID = 661, nDotLevel = 20, nThreat = 1405  }, -- Level 20
	{nCostMana = 90, nDotID = 661, nDotLevel = 21, nThreat = 1465  }, -- Level 21
	{nCostMana = 90, nDotID = 661, nDotLevel = 22, nThreat = 1525  }, -- Level 22
	{nCostMana = 90, nDotID = 661, nDotLevel = 23, nThreat = 1585  }, -- Level 23
	{nCostMana = 90, nDotID = 661, nDotLevel = 24, nThreat = 1645  }, -- Level 24
	{nCostMana = 90, nDotID = 661, nDotLevel = 25, nThreat = 1705  }, -- Level 25
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

	skill.BindBuff(1, 3442, dwSkillLevel)  --流血
	--skill.BindBuff(2, 661, dwSkillLevel)  --减防

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/天策_技能事件_灭命中后刷新破风挂DOT3目标.lua", -- 属性值1
		0														-- 属性值2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/90级奇穴/附魔_破风破甲效果.lua", -- 属性值1
		0														-- 属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/90级奇穴/附魔_破风附带减灭CD的子技能.lua", -- 属性值1
		0														-- 属性值2
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 92);
	skill.SetCheckCoolDown(1, 444)

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 5 then
		skill.nCostManaBasePercent = 167 * 0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 10 then
		skill.nCostManaBasePercent = 167 * 0.4;
	elseif dwSkillLevel <= 15 then
		skill.nCostManaBasePercent = 167 * 0.6;
	elseif dwSkillLevel <= 20 then
		skill.nCostManaBasePercent = 167 * 0.8;
	else
		skill.nCostManaBasePercent = 167;
	end
	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nWeaponDamagePercent = 0;
	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256

	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 100;
	elseif dwSkillLevel < 25 then
		skill.nChannelInterval = 100 + (dwSkillLevel - 9) * 10
	else
		skill.nChannelInterval = 346;     -- 通道技间隔时间
	end
	skill.nBulletVelocity = 0;										--子弹速度,点/帧

	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(39)
	end
	-- if player.IsAchievementAcquired(36) and player.IsAchievementAcquired(37) and player.IsAchievementAcquired(38) and player.IsAchievementAcquired(39) and player.IsAchievementAcquired(40) and player.IsAchievementAcquired(41) then
	-- player.AcquireAchievement(68)
	-- end
end

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local target
	if IsPlayer(dwCharacterID) then
		return
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	local sLevel = player.GetSkillLevel(401)
	local kID = player.GetKungfuMount().dwSkillID
	if kID ~= nil then
		if kID == 10062 then
		end
	end
	--target.ModifyThreat(dwSkillSrcID, 30 * sLevel)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com