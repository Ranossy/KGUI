---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/坐忘经_坐望无我.lua
-- 更新时间:	2017/3/18 21:10:49
-- 更新用户:	XIAXIANBO1
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  坐忘经_坐望无我.lua
-- 创建人    :  kingbeyond
-- 创建时间  :  2007-12-11
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  外功
-- 武功套路  :  坐忘经
-- 技能名称  :  坐望无我
-- 技能效果  :  在一定时间内将受到的伤害以内气抵御。
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nBuffID = 134, nBuffLevel = 1, nCostMana = 52}, --level 1
	{nBuffID = 134, nBuffLevel = 2, nCostMana = 82}, --level 2
	{nBuffID = 134, nBuffLevel = 3, nCostMana = 136}, --level 3
	{nBuffID = 134, nBuffLevel = 4, nCostMana = 173}, --level 4
	{nBuffID = 134, nBuffLevel = 5, nCostMana = 209}, --level 5
	{nBuffID = 134, nBuffLevel = 6, nCostMana = 246}, --level 6
	{nBuffID = 134, nBuffLevel = 7, nCostMana = 282}, --level 7
	{nBuffID = 134, nBuffLevel = 8, nCostMana = 282}, --level 8
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	--QC伤害吸收普通
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- 魔法属性
		134, -- 属性值1
		dwSkillLevel															-- 属性值2
	);

	--QC伤害吸收加强
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- 魔法属性
		6090, -- 属性值1
		dwSkillLevel															-- 属性值2
	);
	--JC伤害吸收普通
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- 魔法属性
		8867, -- 属性值1
		dwSkillLevel															-- 属性值2
	);
	--JC伤害吸收加强
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- 魔法属性
		8868, -- 属性值1
		dwSkillLevel															-- 属性值2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/纯阳/90级奇穴/坐忘无我带减伤.lua", -- 属性值1
		0														-- 属性值2
	);
	--skill.BindBuff(1, 134, dwSkillLevel)
	--skill.BindBuff(2, 2983, 2)
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);	--公共CD
	skill.SetNormalCoolDown(1, 163);	--公共CD
	skill.SetCheckCoolDown(1, 444);
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 0.5 * (1 + dwSkillLevel / 8) * 18;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 4 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 256; 									--施放角度

	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒

	skill.nBulletVelocity = 0;										--子弹速度,点/帧

	skill.nBreakRate = 1024;									--被打断的概率,默认1024表示一定被打断

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--删掉坐忘期间减伤buff
	player.DelBuff(2983, 1)
	player.DelBuff(2983, 2)
	if player.GetSkillLevel(6467) == 1  then
		player.AddBuff(dwCharacterID, player.nLevel, 6403, 1, 1)
	end

	if player.GetSkillLevel(14830) == 1 then
		player.CastSkill(14988, 1)	--回复5格气
		player.AddBuff(player.dwID, player.nLevel, 11815, 1)
	end

	if player.GetSkillLevel(14994) == 1 then
		if player.GetOTActionState() == 1 then
			player.AddBuff(player.dwID, player.nLevel, 8620, 1)
		else
			player.AddBuff(player.dwID, player.nLevel, 9962, 1)
			player.AddBuff(player.dwID, player.nLevel, 10078, 1)
		end
	end

	if player.GetSkillLevel(5813) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 10066, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com