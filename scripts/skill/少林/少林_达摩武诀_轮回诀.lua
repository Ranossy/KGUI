---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/少林_达摩武诀_轮回诀.lua
-- 更新时间:	2015/9/28 20:06:29
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nReviveLife = 100, nReviveMana = 100},
	{nReviveLife = 100, nReviveMana = 100},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = 2

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.REVIVE,
		tSkillData[dwSkillLevel].nReviveLife, --复活后生命
		tSkillData[dwSkillLevel].nReviveMana		--复活后内力
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/少林/少林_达摩武诀_轮回诀.lua",
		0
	);

	--skill.BindBuff(1,1111,1);
	skill.BindBuff(2, 772, 2);

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);	--公共CD
	skill.SetNormalCoolDown(1, 37);
	skill.SetCheckCoolDown(1, 444);
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	skill.nCostMana = 0;

	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 10 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 256; 									--施放角度

	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒

	skill.nBulletVelocity = 0;										--子弹速度,点/帧

	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
if nPreResult == SKILL_RESULT_CODE.SUCCESS then
	player.DelBuff(9298, 1)
end
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	-- if skill.dwLevel == 2 then
	-- player.AcquireAchievement(58)
	-- end
	-- if player.IsAchievementAcquired(55) and player.IsAchievementAcquired(56) and player.IsAchievementAcquired(57) and player.IsAchievementAcquired(58) and player.IsAchievementAcquired(59) and player.IsAchievementAcquired(60) then
	-- player.AcquireAchievement(71)
	-- end
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local level = player.GetSkillLevel(259)
	--player.AddBuff(0,99,3469,level)
	player.AddBuff(0, 99, 3861, 1)	--2秒无敌
	player.AddBuff(0, 99, 4009, 1)
	if player.GetSkillLevel(5907) == 1 then
		player.CastSkill(6148, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com