---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/剑器浑脱_邻里曲.lua
-- 更新时间:	2015/9/16 0:36:01
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  七秀_剑器浑脱_邻里曲.lua
-- 创建人    :  吴娟
-- 创建时间  :  2008-8-25
-- 用途(模块):  武功技能
-- 武功门派  :  七秀
-- 武功类型  :  外功
-- 武功套路  :  剑器浑脱
-- 技能名称  :  邻里曲
-- 技能效果  :  瞬发（能在战斗中使用）
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	--skill.AddAttribute(
	--     ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--     ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,
	--    117,		--技能ID雷霆震怒
	--    0
	--);
	--[[  skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
        ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,
        115,		--技能ID奕射九日
        0
    );--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/七秀/剑器浑脱_邻里曲.lua",
		0
	);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,
		119, --技能ID天地
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,
		114, --技能ID鹊踏枝
		0
		);
	--]]
	--skill.AddAttribute(
	--    ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--    ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,
	--    110,		--技能ID满堂势
	--    0
	--);

	--skill.AddAttribute(
	--    ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--    ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,
	--    113,		--技能ID心鼓弦
	--    0
	--);

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);	--公共CD1.5秒
	skill.SetNormalCoolDown(1, 112);	--自身CD10分钟
	skill.SetCheckCoolDown(1, 444)
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= 61;
	skill.nCostManaBasePercent = 354;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 20 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 256; 									--施放角度

	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒

	skill.nBulletVelocity = 0;										--子弹速度,点/帧

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

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	player.ClearCDTime(114)	--重置鹊踏的CD
	player.ClearCDTime(119)	--重置天地的CD

	ModityCDToUI(player, 550, 0, 0)
	ModityCDToUI(player, 557, 0, 0)
	ModityCDToUI(player, 574, 0, 0)
	ModityCDToUI(player, 544, 0, 0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com