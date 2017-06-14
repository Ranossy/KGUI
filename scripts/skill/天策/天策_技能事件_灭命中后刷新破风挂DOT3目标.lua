---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_技能事件_灭命中后刷新破风挂DOT3目标.lua
-- 更新时间:	2015/6/15 15:31:20
-- 更新用户:	XIAXIANBO
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
	{nCostMana = 14, nDotID = 661, nDotLevel = 1, nThreat = 259   }, -- Level 1
	{nCostMana = 22, nDotID = 661, nDotLevel = 2, nThreat = 389   }, -- Level 2
	{nCostMana = 29, nDotID = 661, nDotLevel = 3, nThreat = 518   }, -- Level 3
	{nCostMana = 40, nDotID = 661, nDotLevel = 4, nThreat = 648   }, -- Level 4
	{nCostMana = 49, nDotID = 661, nDotLevel = 5, nThreat = 778   }, -- Level 5
	{nCostMana = 57, nDotID = 661, nDotLevel = 6, nThreat = 907   }, -- Level 6
	{nCostMana = 65, nDotID = 661, nDotLevel = 7, nThreat = 1037  }, -- Level 7
	{nCostMana = 73, nDotID = 661, nDotLevel = 8, nThreat = 1166  }, -- Level 8
	{nCostMana = 81, nDotID = 661, nDotLevel = 9, nThreat = 1296  }, -- Level 9
	{nCostMana = 90, nDotID = 661, nDotLevel = 10, nThreat = 1426  }, -- Level 10
	{nCostMana = 90, nDotID = 661, nDotLevel = 11, nThreat = 1705  }, -- Level 11
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	skill.AddSlowCheckDestBuff(8003, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求目标Buff
	--skill.AddSlowCheckDestOwnBuff(3442, 0,BUFF_COMPARE_FLAG.GREATER , 0, BUFF_COMPARE_FLAG.GREATER);
	--skill.AddSlowCheckDestOwnBuff(3442, 1, BUFF_COMPARE_FLAG.EQUAL, dwSkillLevel, BUFF_COMPARE_FLAG.EQUAL);
	--skill.AddSlowCheckDestOwnBuff(661,0,BUFF_COMPARE_FLAG.GREATER , dwSkillLevel, BUFF_COMPARE_FLAG.EQUAL);
	skill.BindBuff(1, 3442, dwSkillLevel)  --流血
	--skill.BindBuff(2, 661, dwSkillLevel)  --减防
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/90级奇穴/附魔_破风破甲效果.lua", -- 属性值1
		0														-- 属性值2
		);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/90级奇穴/破风添加易伤效果.lua", -- 属性值1
		0														-- 属性值2
	);
	--施放 子技能 在铁牢律状态下,带有破甲效果,附带大量仇恨
--[[	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		407,
		dwSkillLevel
	);--]]
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--公共CD1秒
	--skill.SetNormalCoolDown(1, 92);
	--skill.SetCheckCoolDown(1, 444)

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
--skill.nCostManaBasePercent = 0.5*(1+dwSkillLevel/11)*93;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nWeaponDamagePercent = 0;
	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度,全角256
	skill.nAreaRadius = 6 * LENGTH_BASE*1.1;
	--skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
	skill.nChannelInterval = 346*1.1;
	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧
	skill.nTargetCountLimit = 3;
	--skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断

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

end
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end

	if not target then
		return
	end

	local lv = player.GetSkillLevel(401)
	--破风AOE效果
	if player.GetSkillLevel(6523) == 1 and lv ~= 0 then
		--player.CastSkill(6521, lv)
		target.AddBuff(0, 99, 8003, 1)
		player.CastSkillXYZ(6521, lv, target.nX, target.nY, target.nZ)
		target.DelBuff(8003, 1)
	end
	
	--破风易伤
	if player.IsSkillRecipeActive(2005, 1) then
		if player.IsSkillRecipeActive(375, 1) then
			player.CastSkill(8139, 2)
		else
			player.CastSkill(8139, 1)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com